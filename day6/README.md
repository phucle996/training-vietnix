# Training ngày 1 tuần 2 

## Thực hiện allow port, allow ip trên window fw

Search "firewall" trong start rồi vào Windows Firewall with Advanced Security

Chọn Inbound Rules → New Rule

Chọn Port → Next

Chọn TCP → nhập port 80 và 443

Chọn Allow the connection → Next

Chọn profile áp dụng (Domain, Private, Public) → Next

Đặt tên rule "allow http and https" → Finish


## Thực hiện block port, block ip trên window fw

Chọn Inbound Rules → New Rule

Chọn Port → Next

Chọn TCP → all

Chọn Allow the connection → Next

Chọn profile áp dụng (Domain, Private, Public) → Next

Đặt tên rule "block all port" → Finish

- Thực hiện giới hạn port, giới hạn ip trên window fw chỉ cho phép ip chỉ định truy cập

- Thực hành cài đặt 

- Webserver IIS, trên Webserver IIS

  + Cài đặt website wordpress mặc định + mysql

  + Cài đặt SSL

- SQL Server: 2016 
Link download: https://software.vietnix.tech/datastore/sources/SQL_Server/sql2016/
