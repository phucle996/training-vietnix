#!/bin/bash

# ======== 1. Khởi tạo thông tin ========
CA_DIR="/etc/ssl/apache2/ca"
SITE_BASE="/etc/ssl/apache2/sites"

DOMAINS=(
  "wp.phuc.vietnix.tech"
  "laravel.phuc.vietnix.tech"
  "phpmyadmin.phuc.vietnix.tech"
)

# ======== 2. Tạo CA nếu chưa có ========
mkdir -p "$CA_DIR"
cd "$CA_DIR" || exit 1

if [[ ! -f "myCA.key" || ! -f "myCA.crt" ]]; then
  echo "🔐 Tạo CA private key và chứng chỉ tự ký..."
  openssl genrsa -out myCA.key 4096

  openssl req -x509 -new -nodes -key myCA.key -sha256 -days 3650 \
    -out myCA.crt \
    -subj "/C=VN/ST=HN/L=Hanoi/O=Phuc/CN=PhucCA"

  echo "✅ Đã tạo CA tại $CA_DIR"
else
  echo "ℹ️ CA đã tồn tại, bỏ qua bước tạo."
fi

# ======== 3. Tạo chứng chỉ cho từng domain ========
for domain in "${DOMAINS[@]}"; do
  DOMAIN_DIR="$SITE_BASE/$domain"
  mkdir -p "$DOMAIN_DIR"
  cd "$DOMAIN_DIR" || exit 1

  echo "🔐 Đang tạo chứng chỉ cho $domain ..."

  # Private key
  openssl genrsa -out "$domain.key" 2048

  # CSR
  openssl req -new -key "$domain.key" -out "$domain.csr" \
    -subj "/C=VN/ST=HN/L=Hanoi/O=Phuc/CN=$domain"

  # SAN config
  cat > san.ext <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage=digitalSignature,nonRepudiation,keyEncipherment,dataEncipherment
subjectAltName=DNS:$domain
EOF

  # Sign cert with CA
  openssl x509 -req -in "$domain.csr" \
    -CA "$CA_DIR/myCA.crt" -CAkey "$CA_DIR/myCA.key" \
    -CAcreateserial -out "$domain.crt" -days 825 -sha256 -extfile san.ext

  echo "✅ Hoàn tất chứng chỉ cho $domain"
done

echo "🎉 Đã tạo CA và SSL cho tất cả domain!"
