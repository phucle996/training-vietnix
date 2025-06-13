# Training ngày 5 tại vietnix

## 1. Cập nhật các package trên VPS
Trước khi bắt đầu cài đặt, cần cập nhật tất cả các package hiện có lên phiên bản mới nhất và sửa các lỗi gói có thể xảy ra.
```bash
apt update && apt upgrade -y && apt --fix-broken install -y
sudo apt install software-properties-common -y
```

## 2. Cài đặt PHP 7.4-FPM để chạy WordPress
Để chạy WordPress, cần cài PHP 7.4 và các module cần thiết:
```bash
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install php7.4-fpm -y
sudo apt install php7.4-cli php7.4-common php7.4-mysql php7.4-xml php7.4-mbstring php7.4-curl php7.4-zip php7.4-bcmath -y
```

## 3. Cài đặt MariaDB
  MariaDB là một hệ quản trị cơ sở dữ liệu phổ biến dùng cùng WordPress.
```bash
sudo apt install mariadb-server -y
```

## 4. Thiết lập bảo mật MariaDB
  Chạy lệnh sau để cấu hình bảo mật, ví dụ đặt mật khẩu root, xóa user ẩn, vô hiệu hoá đăng nhập root từ xa:
```bash
sudo mysql_secure_installation
```

## 5. Truy cập MariaDB để tạo user và database

```bash
sudo mariadb
```
sau đó 
```bash
CREATE DATABASE myappdb;
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';
GRANT ALL PRIVILEGES ON myappdb.* TO 'myuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

## 6. Cài đặt phpMyAdmin

```bash
sudo apt install phpmyadmin -y
```

## 7. Cài đặt Nginx làm reverse proxy

```bash
sudo apt install nginx -y
```

## 8. Cấu hình Nginx trỏ proxy về các site local

Tạo các file cấu hình server trong `/etc/nginx/sites-available/` và dùng `proxy_pass` để chuyển tiếp tới các site chạy local trên các port khác nhau.

---

## 9. Khởi động lại dịch vụ

```bash
sudo systemctl restart php7.4-fpm
sudo systemctl restart mariadb
sudo systemctl restart nginx
```
