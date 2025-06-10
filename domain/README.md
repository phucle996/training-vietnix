# training-vietnix-day2

## ❓ Domain là gì?

**✅ Domain** là **địa chỉ dễ nhớ** dùng để truy cập website, thay vì phải nhớ một địa chỉ IP phức tạp.

---

## ❓ Các trạng thái của domain

Domain có thể có các trạng thái sau:

* **Available**: Có thể đăng ký.
* **Registered**: Đã có người đăng ký.
* **Expired**: Domain đã hết hạn.
* **Redemption Period**: Thời gian cho phép chủ sở hữu gia hạn lại domain đã hết hạn.
* **Pending Delete**: Domain sắp bị xóa khỏi hệ thống và sẽ trở lại trạng thái Available.

---

## ❓ Subdomain là gì?

**✅ Subdomain** là tên miền phụ của domain chính, ví dụ như abc.vietnix.tech

---

## ❓ Virtual Hosts là gì?

**✅ Virtual Hosts** là 1 máy chủ web server có thể chạy nhiều trang web khác nhau

Virtual Hosts có 2 loại:

1. **Name-based Virtual Host**: phân biệt theo tên domain.
2. **IP-based Virtual Host**: phân biệt theo địa chỉ IP khác nhau.

```server {
    listen 80;
    server_name example.com;
    root /var/www/example.com;
}

server {
    listen 80;
    server_name blog.example.com;
    root /var/www/blog.example.com;
}

