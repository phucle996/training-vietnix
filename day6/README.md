# 📘 Training Ngày 1 - Tuần 2

## ✅ Cấu hình Firewall trên Windows

### Allow Port và Allow IP trên Windows Firewall

1. Mở **Start menu**, tìm kiếm: `firewall`

 Chọn **Windows Defender Firewall with Advanced Security**

   <p align="center">
  <img src="/day6/images/pic2.png" alt="" width="400"/>
</p>

3. Ở panel trái, chọn **Inbound Rules → New Rule**
   Chọn **Port → Next**
   
  <p align="center">
  <img src="/day6/images/pic3.png" alt="" width="400"/>
</p>

5. Chọn **TCP**, nhập port: `80, 443` → Next

  <p align="center">
  <img src="/day6/images/pic4.png" alt="" width="400"/>
</p>

6. Chọn **Allow the connection** → Next

  <p align="center">
  <img src="/day6/images/pic5.png" alt="" width="400"/>
</p>
7. Chọn các profile áp dụng (**Domain, Private, Public**) → Next

  <p align="center">
  <img src="/day6/images/pic6.png" alt="" width="400"/>
</p>

8. Đặt tên rule: `"allow http and https"` → Finish

  <p align="center">
  <img src="/day6/images/pic7.png" alt="" width="400"/>
</p>

9. Làm tương tự với outbound rule
   
   <p align="center">
  <img src="/day6/images/pic8.png" alt="" width="400"/>
</p>

---

### Block Port và Block IP trên Windows Firewall

- Trong **Inbound Rules** → chọn **New Rule**
- Chọn **Port** → Next
- Chọn **TCP**, chọn **All local ports** → Next
  
     <p align="center">
  <img src="/day6/images/pic80.png" alt="" width="400"/>
</p>

- Chọn **Block the connection** → Next
- Chọn profile áp dụng → Next
- Đặt tên rule: `"block all port"` → Finish

---

### Chỉ cho phép IP cụ thể truy cập port

- tạo rule allow port bình thường rồi tiếp đó config phần scope , chọn these ip thay vì any ip
     <p align="center">
  <img src="/day6/images/pic88.png" alt="" width="400"/>
</p>
---

## 🖥️ Cài đặt và cấu hình Webserver IIS

- Cài đặt các thành phần sau:
  - IIS (thông qua Server Manager)
  
       <p align="center">
  <img src="/day6/images/pic00.png" alt="" width="400"/>
</p>

  - PHP 8.2 (Thread Safe - TS) được giải nén vào thư mục C:\php\8.2

    <p align="center">
  <img src="/day6/images/pic01.png" alt="" width="400"/>
</p>
    
  - tải và giải nén 2 file `pdo_sqlsrv`, `sqlsrv` vào thư mục chứa extension của php
    
     <p align="center">
  <img src="/day6/images/pic02.png" alt="" width="400"/>
</p>
    
  - SQL Server 2016 (link dưới)
    
     <p align="center">
  <img src="/day6/images/pic03.png" alt="" width="400"/>
</p>

### 1. Cài WordPress mặc định trên IIS + SQL Server

- Cấu hình các tham số trong file `php.ini`

```bash

; Đường dẫn extension
extension_dir = "ext"

; Bật các extension cần thiết
extension=mysqli
extension=pdo_mysql
extension=curl
extension=mbstring
extension=openssl
extension=xml
extension=zip
extension=gd
extension=intl
extension=soap
extension=fileinfo
extension=exif
extension=pdo_sqlsrv
extension=sqlsrv

; Cấu hình timezone
; (Giúp tránh lỗi cảnh báo liên quan đến ngày giờ)
date.timezone = Asia/Ho_Chi_Minh

; Giới hạn upload và hiệu suất
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 300
memory_limit = 256M

; Hiển thị lỗi (chỉ nên bật khi phát triển)
display_errors = On
error_reporting = E_ALL

; Nếu là môi trường production:
;display_errors = Off
;log_errors = On
```

- Tạo database và user cho WordPress
  ```bash
  db : wordpress
  user : wordpress_admin
  pass : Phuc27012004
  role : owner
  ```
- Giải nén source WordPress vào `C:\inetpub\wwwroot\wordpress` (wordpress của projectnami)
- Cấu hình site trên IIS
      <p align="center">
  <img src="/day6/images/pic90.png" alt="" width="400"/>
</p>
 
- Sử dụng virtual domain trong file hosts để vào trong web 
      <p align="center">
  <img src="/day6/images/pic95.png" alt="" width="400"/>
</p>

---

### 2. Cài đặt SSL cho WordPress trên IIS

- Dùng SSL từ zero ssl đã tạo từ hôm trước :
  - Lên trang https://www.sslshopper.com/ssl-converter.html
        <p align="center">
  <img src="/day6/images/pic96.png" alt="" width="400"/>
</p>

  - import các file public, private, ca_bundle vào để tạo file
        <p align="center">
  <img src="/day6/images/pic97.png" alt="" width="400"/>
</p>

- Gắn SSL vào IIS qua mục **Bindings → HTTPS**
        <p align="center">
  <img src="/day6/images/pic98.png" alt="" width="400"/>
</p>
---

## 🗃️ SQL Server 2016

- Link tải: [https://software.vietnix.tech/datastore/sources/SQL_Server/sql2016/](https://software.vietnix.tech/datastore/sources/SQL_Server/sql2016/)
