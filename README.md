# training-vietnix-day2

## ❓ SSL là gì?

**SSL** là viết tắt của **Secure Socket Layer**, dùng để **mã hoá dữ liệu từ client tới server** nhằm đảm bảo an toàn thông tin khi truyền tải trên Internet.

---

## ❓ Có bao nhiêu cách chứng thực SSL?

Có **3 cách chứng thực SSL**:

1. **Chứng thực phía máy chủ** (Server Authentication)
2. **Chứng thực phía máy khách** (Client Authentication)
3. **Chứng thực 2 chiều** (Mutual Authentication)

---

## ❓ CSR file dùng làm gì trong quá trình tạo SSL?

* File `.csr` (**Certificate Signing Request**) chứa thông tin domain và public key.
* Dùng để **yêu cầu bên thứ 3 (CA)** cấp chứng chỉ số.
* Sau khi được ký, CA sẽ trả lại file `.crt` (certificate).

---

## 🔧 Sử dụng OpenSSL để gen file CSR sau đó request SSL cho domain `tech.training.vietnix.tech`

### ✅ Step 1: Tạo private key

```bash
openssl genrsa -out tech.training.vietnix.tech.key 2048
```

---

### ✅ Step 2: Tạo file CSR

```bash
openssl req -new -key tech.training.vietnix.tech.key -out tech.training.vietnix.tech.csr
```

---

### ✅ Step 3: Tự ký vào file CSR (self-signed)

```bash
openssl x509 -req -in tech.training.vietnix.tech.csr \
  -signkey tech.training.vietnix.tech.key \
  -out tech.training.vietnix.tech.crt \
  -days 365
```

---

### ✅ Step 4: Cài đặt và cấu hình Nginx

Cấu hình block `server` trong file Nginx như sau:

```nginx
server {
    listen 443 ssl;
    server_name tech.training.vietnix.tech;

    ssl_certificate     /etc/ssl/certs/tech.training.vietnix.tech.crt;
    ssl_certificate_key /etc/ssl/private/tech.training.vietnix.tech.key;

    location / {
        root /var/www/html;
        index index.html;
    }
}
```

---

### ✅ Step 5: Reload Nginx và truy cập web

```bash
sudo systemctl reload nginx
```

Sau đó truy cập: `https://tech.training.vietnix.tech`

> ⚠️ Vì đây là chứng chỉ tự ký nên trình duyệt sẽ hiển thị cảnh báo bảo mật.

---

Pem file là gì?

A: File .pem là một file dạng văn bản (text) có phần đầu và cuối đặc trưng:

-----BEGIN CERTIFICATE-----
(nội dung mã hóa Base64)
-----END CERTIFICATE-----

File PEM thường chứa certificate (chứng chỉ), key, hoặc cả hai, được mã hóa theo định dạng Base64.

Private key SSL là gì?

A: Private key là khóa bí mật mà server giữ riêng, dùng để giải mã dữ liệu đã được mã hóa bằng public key. Nó rất quan trọng trong việc đảm bảo an toàn truyền thông qua SSL/TLS.

PFX file là gì? Cách chuyển từ file .crt sang .pfx?

A: File .pfx (hoặc .p12) là file nhị phân (binary) chứa:

Chứng chỉ (certificate)

Khóa riêng (private key)

Và chuỗi chứng chỉ của CA (certificate chain)

✅ Cách chuyển từ .crt và .key sang .pfx:

openssl pkcs12 -export \
  -out domain.pfx \
  -inkey domain.key \
  -in domain.crt \
  -certfile ca_bundle.crt

ca_bundle.crt là chuỗi chứng chỉ của CA nếu có

