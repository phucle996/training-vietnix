# training-vietnix-day2

Q: SSL là gì ?

A: SSL là viết tắt của Secure Socket Layer, dùng để mã hoá dữ liệu từ client tới server

Q: Có bao nhiêu cách chứng thực SSL ?

A: có 3 cách , chúng thức phía máy chủ, chứng thực phía máy khách và chứng thực 2 chiều

Q: CSR file dùng làm gì trong quá trình tạo SSL

A: file có đuôi .csr là file chứa thông tin của domain của mình và dùng để xin chứ kí số của bên thứ 3. Nếu bên thứ 3 kí vào thì sẽ trả về file.crt

Q: Sử dụng OpenSSL để gen file CSR sau đó request SSL cho domain tech.training.vietnix.tech

A: 
step1: tạo private key : 
openssl genrsa -out tech.training.vietnix.tech.key 2048

Step2: tạo file csr:
openssl req -new -key tech.training.vietnix.tech.key -out tech.training.vietnix.tech.csr

Step3: tự kí vào file csr:
openssl x509 -req -in tech.training.vietnix.tech.csr \
  -signkey tech.training.vietnix.tech.key \
  -out tech.training.vietnix.tech.crt \
  -days 365

step4: install và config nginx: khai báo ssl public key, private key, sửa port listen và server name bên trong block server 
    listen 443 ssl;
    server_name tech.training.vietnix.tech;

    ssl_certificate     /etc/ssl/certs/tech.training.vietnix.tech.crt;
    ssl_certificate_key /etc/ssl/private/tech.training.vietnix.tech.key;

step5: reload nginx và vào web 


