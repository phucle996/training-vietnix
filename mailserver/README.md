# training-vietnix-day2

## 📬 Mail Server & các bản ghi liên quan

### MX Record

Chỉ định server nhận email cho domain.

### SPF

Xác định IP/mail server nào được phép gửi email cho domain.

### DKIM

Xác thực chữ ký số trong email, chống giả mạo nội dung.

### PTR (Reverse DNS)

Tra IP về domain, giúp xác thực server gửi mail.

---

## ✅ Tổng kết

| Record | Mục đích                | Thiết lập       |
| ------ | ----------------------- | --------------- |
| MX     | Nhận mail               | DNS             |
| SPF    | Chống giả IP gửi mail   | DNS TXT         |
| DKIM   | Chống sửa nội dung mail | DNS TXT         |
| PTR    | Xác minh IP gửi         | Nhà cung cấp IP |
