Trên site wordpress cũ vào plugin all in one migration và sau đó export ra 1 file wpress

![Mô tả ảnh](/day4/img/pic1.png)

Tiếp đó sẽ vào cpanel , domain đã được setup sẵn nhưng hiện tại đang trỏ về ip vps cũ
![Mô tả ảnh](/day4/img/checkdomain.png)

Hiện tại cần phải sửa lại file host để trỏ lại về ip của hosting
![Mô tả ảnh](/day4/img/domain.png)

Setup 1 wordpress mới
![Mô tả ảnh](/day4/img/newwordpress.png)

cài plugin all in one migration vào wordpress mới
![Mô tả ảnh](/day4/img/installplugin.png)

Import file wpress đã export từ trước đó
![Mô tả ảnh](/day4/img/importwebsite.png)

Import xong là trang wordpress sẽ có thể hoạt động bình thường
![Mô tả ảnh](/day4/img/import.png)

Cài đặt các plugin :
    Elementor:
    ![Mô tả ảnh](/day4/img/elementor.png)

    Rank math SEO :
    ![Mô tả ảnh](/day4/img/rankmathseo.png)


về 2 plugin LiteSpeed Cache và WP-Optimize :
- WP-Optimize chỉ nên dùng khi hosting không dùng lite speed
- LiteSpeed Cache ưu tiên dùng nếu hosting có lite speed
- không nên dùng cả 2
