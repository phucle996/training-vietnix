# 🚀 Training ngày 5 tại Vietnix

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
  <img src="/day5/images/php7.4.png" alt="php7.4" width="500"/>
</p>
👍 PHP 7.4 đã sẵn sàng để chạy WordPress

### ⚙️ PHP 8.2 để chạy Laravel

```bash
# Cài đặt PHP 8.2 và PHP-FPM
sudo apt install php8.2-fpm -y
```
<p align="center">
  <img src="/day5/images/php8.2.png" alt="php8.2" width="500"/>
</p>
👍 PHP 8.2 đã sẵn sàng để chạy Laravel

### 🔒 Cấu hình `open_basedir` cho PHP 8.2

Thêm dòng sau vào **cuối file** `/etc/php/8.2/fpm/pool.d/www.conf` để giới hạn đường dẫn mà PHP có thể truy cập:

```ini
php_admin_value[open_basedir] = /var/www/laravel:/usr/share/phpmyadmin:/usr/share/php:/tmp/
```

Sau đó restart PHP-FPM:

```bash
sudo systemctl restart php8.2-fpm
```

---

## 🐬 3. Cài đặt MariaDB

### 📦 Cài đặt MariaDB

```bash
sudo apt install mariadb-server -y
```
<p align="center">
  <img src="/day5/images/mariadb.png" alt="mariadb" width="500"/>
</p>

### 🌍 Cấu hình cho phép truy cập MariaDB từ xa

Mở file cấu hình:

```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

Tìm dòng:

```ini
bind-address = 127.0.0.1
```

Đổi thành:

```ini
bind-address = 0.0.0.0
```

Sau đó:

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

Sau đó chạy:

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

## 🌐 7. Cài đặt Apache làm web server

```bash
sudo apt install apache2 -y
```
<p align="center">
  <img src="/day5/images/apache.png" alt="" width="500"/>
</p>
Cấu hình VirtualHost cho phpMyAdmin, WordPress và Laravel (file config trong folder apache)

Kích hoạt site:

```bash
sudo a2ensite phpmyadmin.conf
sudo a2ensite wordpress.conf
sudo a2ensite laravel.conf
sudo systemctl restart apache2
```

Tải mã nguồn lên từng thư mục tương ứng.

🔧 Cấu hình phpMyAdmin:

```bash
sudo nano /etc/apache2/apache2.conf
# Thêm dòng sau:
Include /etc/phpmyadmin/apache.conf
```

🔗 Tạo symbolic link:

```bash
sudo ln -s /usr/share/phpmyadmin /var/www/wordpress/phpmyadmin
```

📦 Cấu hình Laravel:
Sửa `app/Providers/AppServiceProvider.php`, trong hàm `boot()` thêm:

```php
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    URL::forceScheme('https');
}
```

🧹 Xoá cache:

```bash
php artisan config:clear
php artisan route:clear
php artisan view:clear
```

## 🌐 8. Cài đặt Nginx làm reverse proxy

```bash
sudo apt install nginx -y
```
<p align="center">
  <img src="/day5/images/nginx.png" alt="" width="500"/>
</p>

## 🔁 9. Cấu hình Nginx

Tạo các file trong `/etc/nginx/sites-available/`, dùng `proxy_pass` để chuyển tiếp tới Apache local. (file config trong folder nginx)

Cấu hình SSL termination với ZeroSSL.

🧪 Kiểm tra cấu hình:

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

## 🧱 12. Cấu hình mặc định cho domain/IP lạ

### 🅰️ Apache:

Tạo VirtualHost `/etc/apache2/sites-available/000-default.conf` trỏ về `/var/www/default`

```bash
mkdir -p /var/www/default
echo "Default page" > /var/www/default/index.html
```

### 🅽 Nginx:

Tạo cấu hình server mặc định trong `sites-available/default`  
