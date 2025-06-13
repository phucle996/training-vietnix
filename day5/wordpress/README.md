# Training ngày 5 tại vietnix

## 1. Cập nhật các package trên VPS
Trước khi bắt đầu cài đặt, cần cập nhật tất cả các package hiện có lên phiên bản mới nhất và sửa các lỗi gói có thể xảy ra.
```bash
apt update && apt upgrade -y && apt --fix-broken install -y
sudo apt install software-properties-common -y
```

## 2. Cài đặt PHP-FPM
Để chạy WordPress, cần cài PHP 7.4 và các module cần thiết:
```bash
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php7.4-fpm -y
sudo apt install php7.4-cli php7.4-common php7.4-mysql php7.4-xml php7.4-mbstring php7.4-curl php7.4-zip php7.4-bcmath -y
```
Cài thêm php 8.2 để chạy laravel 

sudo apt install php8.2-fpm

Thêm dòng php_admin_value[open_basedir] = /var/www/laravel:/usr/share/phpmyadmin:/usr/share/php:/tmp/ vào cuối file /etc/php/8.2/fpm/pool.d/www.conf

## 3. Cài đặt MariaDB
  MariaDB là một hệ quản trị cơ sở dữ liệu phổ biến dùng cùng WordPress.
```bash
sudo apt install mariadb-server -y
```
cấu hình để chạy remote từ xa

đưa giá trị của bind-address trong file /etc/mysql/mysql.conf.d/mysqld.cnf về 0.0.0.0 thay vì 127.0.0.1


## 4. Thiết lập MariaDB
  
```bash
sudo mysql_secure_installation
```

Chạy lệnh trên để thiết lập root password 

```bash
Switch to unix_socket authentication [Y/n] 
Enabled successfully!
Reloading privilege tables..
 ... Success!

Change the root password? [Y/n] y
New password: 
Re-enter new password: 
Password updated successfully!
Reloading privilege tables..
 ... Success!

Remove anonymous users? [Y/n] n
 ... skipping.

Disallow root login remotely? [Y/n] y
 ... Success!

Remove test database and access to it? [Y/n] n
 ... skipping.

Reload privilege tables now? [Y/n] y
 ... Success!

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
```

## 5. Truy cập MariaDB để tạo user và database

```bash
sudo mariadb
```
sau đó tạo databse và user rồi cấp quyền cho user 
```bash
# database for wordpress 
CREATE DATABASE wordpress;
CREATE USER 'wordpress_admin'@'%' IDENTIFIED BY '27012004';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_admin'@'%';

# database for laravel
CREATE DATABASE laravel;
CREATE USER 'laravel_admin'@'%' IDENTIFIED BY '27012004';
GRANT ALL PRIVILEGES ON laravel.* TO 'laravel_admin'@'%';

FLUSH PRIVILEGES;
EXIT;
```

## 6. Cài đặt phpMyAdmin

```bash
sudo apt install phpmyadmin -y
```
## 7. Cài đặt Apache làm web server 

```bash
sudo apt install apache2 -y
```
Thiết lập VirtualHost cho phpmyadmin, wordpress và laravel
( file đi kèm )

kích hoạt 3 site 

sudo a2ensite phpmyadmin.conf
sudo a2ensite wordpress.conf
sudo a2ensite laravel.conf

sudo systemctl restart apache2

up src code lên từng thư mục tương ứng 

cấu hình phpmyadmin:
  mở file /etc/apache2/apache2.conf và thêm dòng Include /etc/phpmyadmin/apache.conf

tạo symbolic link vào thư mục web chính
sudo ln -s /usr/share/phpmyadmin /var/www/wordpress/phpmyadmin

Cấu hình laravel
Sửa file app/Providers/AppServiceProvider.php trong thư mục mã nguồn của laravel 
thêm đoạn mã này vào trong public function boot(){} để laravel chạy theo giao thức của reverse proxy 

if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
            URL::forceScheme('https');
        }
Clear cache của Laravel

php artisan config:clear
php artisan route:clear
php artisan view:clear

## 7. Cài đặt Nginx làm reverse proxy

```bash
sudo apt install nginx -y
```

## 8. Cấu hình Nginx trỏ proxy về các site local

Tạo các file cấu hình server trong `/etc/nginx/sites-available/` và dùng `proxy_pass` để chuyển tiếp tới các site chạy local trên các port khác nhau.

(file config trong thư mục nginx)

Thiết lập ssl termination với zero ssl 

---
sudo nginx -t để kiểm tra syntax file config của nginx
## 9. Khởi động lại dịch vụ

```bash
sudo systemctl restart apache2
sudo systemctl restart nginx
```
## 10. Mở firewall (UFW) cho các port
Mở port cho http, https, mysql , ssh

sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 3306/tcp
sudo ufw allow 22/tcp
sudo ufw reload

Default vhost cho các domain/IP lạ
➤ Apache:
Tạo một VirtualHost mặc định /etc/apache2/sites-available/000-default.conf

Tạo file mặc định:
mkdir -p /var/www/default
echo "Default page" > /var/www/default/index.html

Tạo file cấu hình nginx
