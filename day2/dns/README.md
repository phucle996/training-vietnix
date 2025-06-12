# 🌐 DNS - Domain Name System

## ✅ DNS là gì?

DNS là hệ thống phân giải tên miền thành địa chỉ IP, giúp người dùng truy cập website bằng tên miền thay vì IP khó nhớ.

---

## ✅ Các loại bản ghi DNS (DNS Records)

| Loại bản ghi | Mô tả                                             |
| ------------ | ------------------------------------------------- |
| **A**        | Trỏ tên miền đến địa chỉ IPv4                     |
| **AAAA**     | Trỏ tên miền đến địa chỉ IPv6                     |
| **CNAME**    | Alias, trỏ một tên miền tới một tên miền khác     |
| **MX**       | Chỉ định mail server cho tên miền                 |
| **TXT**      | Chứa văn bản, dùng cho xác thực (SPF, DKIM, v.v.) |
| **NS**       | Chỉ định nameserver cho tên miền                  |
| **PTR**      | Phân giải ngược IP về domain                      |
| **SRV**      | Định nghĩa dịch vụ cụ thể chạy trên domain        |
| **SOA**      | Bản ghi nguồn của vùng dữ liệu DNS                |

---

## ✅ Nguyên tắc hoạt động của DNS

1. Trình duyệt gửi truy vấn DNS khi truy cập domain
2. Hệ điều hành kiểm tra cache nội bộ
3. Nếu không có, truy vấn tới DNS resolver
4. Resolver truy vấn tới root DNS -> TLD -> authoritative DNS
5. Trả về địa chỉ IP tương ứng

---

## ✅ Cách phân giải tên miền (DNS Resolution)

* **Forward Lookup**: Từ tên miền -> địa chỉ IP
* **Reverse Lookup**: Từ địa chỉ IP -> tên miền (dùng PTR record)

---
