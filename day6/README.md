# 📘 Training Ngày 1 - Tuần 2

## ✅ Cấu hình Firewall trên Windows

### Allow Port và Allow IP trên Windows Firewall

1. Mở **Start menu**, tìm kiếm: `firewall`

 Chọn **Windows Defender Firewall with Advanced Security**

   <p align="center">
  <img src="/day6/images/pic2.png" alt="" width="400"/>
</p>

3. Ở panel trái, chọn **Inbound Rules → New Rule**

  <p align="center">
  <img src="/day6/images/pic3.png" alt="" width="400"/>
</p>

4. Chọn **Port → Next**

  <p align="center">
  <img src="/day6/images/pic4.png" alt="" width="400"/>
</p>

5. Chọn **TCP**, nhập port: `80, 443` → Next

  <p align="center">
  <img src="/day6/images/pic5.png" alt="" width="400"/>
</p>

6. Chọn **Allow the connection** → Next

  <p align="center">
  <img src="/day6/images/pic6.png" alt="" width="400"/>
</p>
7. Chọn các profile áp dụng (**Domain, Private, Public**) → Next

  <p align="center">
  <img src="/day6/images/pic7.png" alt="" width="400"/>
</p>

8. Đặt tên rule: `"allow http and https"` → Finish

  <p align="center">
  <img src="/day6/images/pic8.png" alt="" width="400"/>
</p>

9. Làm tương tự với outbound rule
   
   <p align="center">
  <img src="/day6/images/pic9.png" alt="" width="400"/>
</p>

---

### Block Port và Block IP trên Windows Firewall

1. Trong **Inbound Rules** → chọn **New Rule**
2. Chọn **Port** → Next
3. Chọn **TCP**, chọn **All local ports** → Next
4. Chọn **Block the connection** → Next
5. Chọn profile áp dụng → Next
6. Đặt tên rule: `"block all port"` → Finish

---

### Chỉ cho phép IP cụ thể truy cập port

1. Trong **Inbound Rules** → chọn rule muốn giới hạn
2. Click phải → **Properties**
3. Vào tab **Scope**
4. Ở phần **Remote IP address**, chọn:
   - **These IP addresses**
   - Thêm địa chỉ IP bạn muốn cho phép
5. OK để lưu

---

## 🖥️ Cài đặt và cấu hình Webserver IIS

- Cài đặt các thành phần sau:
  - IIS (thông qua Server Manager)
  - PHP 8.2 (Thread Safe - TS)
  - MySQL driver: `pdo_sqlsrv`, `sqlsrv`
  - SQL Server 2016 (link dưới)

### 1. Cài WordPress mặc định trên IIS + SQL Server

1. Tải PHP 8.2 TS từ
2. Giải nén vào `C:\php` và cấu hình `php.ini`
3. Cài các extension:
   - `pdo_sqlsrv.dll`
   - `sqlsrv.dll`
4. Cài SQL Server 2016
5. Tạo database và user cho WordPress
6. Giải nén source WordPress vào `C:\inetpub\wwwroot\wordpress`
7. Cấu hình site trên IIS
8. Sử dụng virtual domain cho trang web
9. Truy cập `http://wp.phuc.vietnix.tech` để cài đặt

---

### 2. Cài đặt SSL cho WordPress trên IIS

- Dùng SSL từ zero ssl đã tạo từ hôm trước :
  - Lên trang https://www.sslshopper.com/ssl-converter.html
  - import các file public, private, ca_bundle vào để tạo file
- Gắn SSL vào IIS qua mục **Bindings → HTTPS**

---

## 🗃️ SQL Server 2016

- Link tải: [https://software.vietnix.tech/datastore/sources/SQL_Server/sql2016/](https://software.vietnix.tech/datastore/sources/SQL_Server/sql2016/)
