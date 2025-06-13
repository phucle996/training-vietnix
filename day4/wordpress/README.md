# 🚀 Chuyển website WordPress sang hosting mới

Quy trình này sẽ **chuyển toàn bộ website WordPress** từ VPS cũ sang hosting mới, thông qua plugin **All-in-One WP Migration**

---

## 🧰 Export dữ liệu từ website WordPress cũ

Truy cập vào website cũ, cài đặt và mở plugin **All-in-One WP Migration**, sau đó export toàn bộ website ra file `.wpress`.

<p align="center">
  <img src="/day4/wordpress/img/pic1.png" alt="Export wpress" width="500"/>
</p>

---

## 🌐 Kiểm tra domain đang trỏ về đâu

Domain đã được cài đặt sẵn, tuy nhiên hiện tại nó vẫn đang trỏ về IP của VPS cũ.

<p align="center">
  <img src="/day4/wordpress/img/checkdomain.png" alt="Check domain" width="500"/>
</p>

---

## 🛠️ Sửa file `hosts` để trỏ domain về IP hosting mới

Trước khi cập nhật DNS thật, cần chỉnh file `hosts` trên máy tính để trỏ domain về IP hosting mới

<p align="center">
  <img src="/day4/wordpress/img/domain.png" alt="Chỉnh file host" width="500"/>
</p>

---

## 🆕 Cài đặt WordPress mới trên hosting mới

Thực hiện cài đặt một trang WordPress mới trên hosting đã chuẩn bị.

<p align="center">
  <img src="/day4/wordpress/img/newwordpress.png" alt="Setup WordPress mới" width="500"/>
</p>

---

## 🔌 Cài plugin All-in-One WP Migration vào WordPress mới

<p align="center">
  <img src="/day4/wordpress/img/installplugin.png" alt="Cài plugin" width="500"/>
</p>

---

## 📥 Import file `.wpress` đã export từ trước

Sử dụng plugin vừa cài để **Import lại toàn bộ dữ liệu** vào site mới.

<p align="center">
  <img src="/day4/wordpress/img/importwebsite.png" alt="Import wpress" width="500"/>
</p>

---

## 📥 Import file ssl đã download về từ zero ssl

copy và past nội dung từ 3 file đã download về từ zero ssl 

<p align="center">
  <img src="/day4/wordpress/img/sslwp.png" alt="Import wpress" width="500"/>
</p>

---

## ✅ Website đã sẵn sàng hoạt động bình thường

Sau khi import xong, website mới sẽ có đầy đủ giao diện, bài viết, cấu hình giống website cũ.

<p align="center">
  <img src="/day4/wordpress/img/import.png" alt="Website hoạt động" width="500"/>
</p>

---

## 🔧 Cài đặt các plugin cần thiết

### 🔹 Elementor — trình dựng giao diện kéo thả

<p align="center">
  <img src="/day4/wordpress/img/elementor.png" alt="Elementor" width="300"/>
</p>

### 🔹 Rank Math SEO — hỗ trợ tối ưu công cụ tìm kiếm

<p align="center">
  <img src="/day4/wordpress/img/rankmathseo.png" alt="Rank Math SEO" width="300"/>
</p>

---

## ⚠️ Ghi chú quan trọng về plugin tối ưu tốc độ

✅ WP-Optimize
  Dùng khi hosting không có LiteSpeed (Apache/Nginx).

  Tính năng chính: Tối ưu database, xóa dữ liệu rác, cache đơn giản.

  Phù hợp với website nhỏ, blog, cần dọn dẹp và cache nhẹ.

✅ LiteSpeed Cache
  Dùng khi hosting dùng LiteSpeed/OpenLiteSpeed.

  Tính năng mạnh: Cache cấp máy chủ, minify, lazy load, tối ưu ảnh, hỗ trợ WooCommerce.

  Tốt nhất cho website lớn, bán hàng, cần hiệu suất cao.


- ❌ **Không nên cài cùng lúc cả hai plugin trên** để tránh xung đột.

