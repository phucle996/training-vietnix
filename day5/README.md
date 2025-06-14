# 🚀 Training ngày 5 tại Vietnix

### Mô hình này kết hợp apache và nginx để áp dụng 2 ưu điểm của 2 webserver, cụ thể:
  - Nginx có hiệu năng cao nhờ kiến trúc even-driven
  - Nginx có thể xử lý file tĩnh trong khi apache sẽ xử lí PHP -> giảm tải cho Apache 
  - Trong trường hợp cần scale ứng dụng theo chiều ngang thì có thể phát triển nginx thành Loadbalancer
  -> Vì vậy Nginx sẽ đứng trước Apache để làm reverse proxy

  ### SSL
  - zero ssl cho kết nối https từ client tới reverse proxy
  - Chứng chỉ tự kí cho các kết nối https từ Nginx tới Apache

<p align="center">
  <img src="/day5/images/erd.png" alt="" width="800"/>
</p>


## 🧰 1. Cập nhật các package trên VPS

Trước khi bắt đầu cài đặt, cần cập nhật tất cả các package hiện có lên phiên bản mới nhất và sửa các lỗi gói có thể xảy ra.

```bash
apt update && apt upgrade -y && apt --fix-broken install -y
sudo apt install software-properties-common -y
```

## 🐘 2. Cài đặt PHP-FPM

### 🐘 PHP 7.4 để chạy WordPress

```bash
# Thêm repository hỗ trợ PHP từ Ondřej Surý
sudo add-apt-repository ppa:ondrej/php -y

# Cập nhật danh sách gói
sudo apt update

# Cài đặt PHP 7.4 và PHP-FPM
sudo apt install php7.4-fpm -y

# Cài đặt các module PHP cần thiết cho WordPress
sudo apt install php7.4-cli php7.4-common php7.4-mysql php7.4-xml php7.4-mbstring php7.4-curl php7.4-zip php7.4-bcmath -y
```

<p align="center">
  <img src="/day5/images/php7.4.png" alt="" width="500"/>
</p>

### ⚙️ PHP 8.2 để chạy Laravel

```bash
# Cài đặt PHP 8.2 và PHP-FPM
sudo apt install php8.2-fpm -y
```

<p align="center">
  <img src="/day5/images/php8.2.png" alt="" width="500"/>
</p>

### 🔒 Cấu hình `open_basedir` cho PHP 8.2

Thêm dòng sau vào **cuối file** `/etc/php/8.2/fpm/pool.d/www.conf`:

```ini
php_admin_value[open_basedir] = /var/www/laravel:/usr/share/phpmyadmin:/usr/share/php:/tmp/
```

Khởi động lại PHP-FPM:

```bash
sudo systemctl restart php8.2-fpm
```

---

## 🐬 3. Cài đặt MariaDB

### 🌍 Cài đặt MariaDB

```bash
sudo apt install mariadb-server -y
```
<p align="center">
  <img src="/day5/images/mariadb.png" alt="" width="500"/>
</p>

### 🌐 Cấu hình cho phép truy cập MariaDB từ xa

Mở file:

```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

Tìm:

```ini
bind-address = 127.0.0.1
```

Thay:

```ini
bind-address = 0.0.0.0
```

Khởi động lại:

```bash
sudo systemctl restart mariadb
```

## 🔐 Thiết lập bảo mật MariaDB

```bash
sudo mysql_secure_installation
```

Làm theo hướng dẫn để đổi mật khẩu root, chặn truy cập từ xa cho root, reload bảng quyền...

## 🛠️ 5. Tạo user và database

```bash
sudo mariadb
```

```sql
-- WordPress
CREATE DATABASE wordpress;
CREATE USER 'wordpress_admin'@'%' IDENTIFIED BY '27012004';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_admin'@'%';

-- Laravel
CREATE DATABASE laravel;
CREATE USER 'laravel_admin'@'%' IDENTIFIED BY '27012004';
GRANT ALL PRIVILEGES ON laravel.* TO 'laravel_admin'@'%';

FLUSH PRIVILEGES;
EXIT;
```

<p align="center">
  <img src="/day5/images/database.png" alt="" width="500"/>
</p>

## 🧮 6. Cài đặt phpMyAdmin

```bash
sudo apt install phpmyadmin -y
```

## 🌐 7. Chạy webserver Apache

```bash
sudo apt install apache2 -y
```

### Tạo SSL tự ký (Dùng trong kết nối nội bộ từ nginx tới apache )

```bash
# Tạo thư mục lưu chứng chỉ SSL cho Apache
mkdir /etc/ssl/apache2

# Tạo private key cho Certificate Authority (CA)
openssl genrsa -out myCA.key 2048

# Tạo chứng chỉ CA tự ký (self-signed), có hiệu lực trong 10 năm (3650 ngày)
openssl req -x509 -new -nodes -key myCA.key -sha256 -days 3650 -out myCA.crt \
  -subj "/C=VN/ST=HN/L=/O=Phuc/CN=PhucCA"

# Tạo file cấu hình cho việc cấp chứng chỉ SSL cho Apache
cat <<EOF > apache.cnf
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no

[req_distinguished_name]
CN = 127.0.0.1

[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
IP.1 = 127.0.0.1
EOF

# Tạo private key cho Apache
openssl genrsa -out apache.key 2048

# Tạo certificate signing request (CSR) từ khóa apache.key, dùng cấu hình trong apache.cnf
openssl req -new -key apache.key -out apache.csr -config apache.cnf

# Dùng CA đã tạo để ký CSR, tạo ra chứng chỉ SSL cho Apache, hiệu lực 1 năm (365 ngày)
openssl x509 -req -in apache.csr -CA myCA.crt -CAkey myCA.key -CAcreateserial \
  -out apache.crt -days 365 -sha256 -extensions v3_req -extfile apache.cnf
```

## Cấu hình VirtualHost cho phpMyAdmin, WordPress, Laravel ( file conf trong folder apache)

```bash
sudo a2ensite phpmyadmin.conf
sudo a2ensite wordpress.conf
sudo a2ensite laravel.conf
sudo systemctl restart apache2
```

Tải mã nguồn lên thư mục tương ứng.

### Cấu hình phpMyAdmin:

```bash
sudo nano /etc/apache2/apache2.conf
Include /etc/phpmyadmin/apache.conf
```

Tạo symbolic link:

```bash
sudo ln -s /usr/share/phpmyadmin /var/www/wordpress/phpmyadmin
```

### Cấu hình Laravel:

```bash
php artisan config:clear
php artisan route:clear
php artisan view:clear
```

## 🌐 8. Cài đặt Nginx làm reverse proxy

```bash
sudo apt install nginx -y
```

## 🔁 9. Cấu hình Nginx

Tạo các file trong `/etc/nginx/sites-available/`, dùng `proxy_pass` chuyển tiếp tới Apache local.( file conf trong folder nginx)

Cấu hình SSL termination với ZeroSSL.

Kiểm tra cấu hình:

```bash
sudo nginx -t
```

## 🔄 10. Khởi động lại dịch vụ

```bash
sudo systemctl restart apache2
sudo systemctl restart nginx
```

## 🔓 11. Mở firewall (UFW) cho các port

```bash
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 3306/tcp
sudo ufw allow 22/tcp
sudo ufw reload
```

## 🧱️ 12. Cấu hình mặc định cho domain/IP lạ

### 🅰️ Apache:

Tạo VirtualHost `/etc/apache2/sites-available/000-default.conf` trỏ về `/var/www/default`

```bash
mkdir -p /var/www/default
echo "Default page" > /var/www/default/index.html
```

### 🄽 Nginx:

Tạo cấu hình server mặc định trong `sites-available/default`
