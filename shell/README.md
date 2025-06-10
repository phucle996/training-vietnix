## Linux Command Reference & Networking Tools

### 🔍 Ping & hping3

```bash
ping vietnix.vn
hping3 -S vietnix.vn -p 80
```

* `ttl=`: Time To Live, số lần hop gói tin được phép đi qua (router).
* `time=`: thời gian round-trip (RTT) gói tin gửi và nhận lại.

---

### 🔐 SSH Commands

```bash
ssh user@host
ssh user@host -p <custom-port>
ssh -i ~/.ssh/id_rsa user@host
```

### 📦 SCP (Secure Copy)

```bash
scp file.txt user@host:/path
scp -r folder/ user@host:/path
```

### 🔁 rsync

```bash
rsync file.txt user@host:/path
rsync -r folder/ user@host:/path
rsync -a --delete folder/ user@host:/path
```

---

### 📄 cat

```bash
cat file.txt
sed -n '5p' file.txt
cat <<EOF > file.txt
line1
line2
EOF
```

### 💬 echo

```bash
echo "new line" >> file.txt
echo "overwrite" > file.txt
```

---

### 📑 tail/head

```bash
tail -n 10 file.txt
tail -f file.txt
head -n 10 file.txt
```

### 🔄 sed

```bash
sed -i 's/old/new/g' file.txt
```

---

### 🚥 traceroute/tracert

```bash
traceroute vietnix.vn
```

* Mỗi dòng là 1 router hop qua. Mỗi hop có 3 thử (timeout hoặc ms).

### 🌐 netstat

```bash
netstat -tuln            # Show listening
netstat -an               # Don’t resolve host/port
netstat -tulnp            # Show PID/program
netstat -t                # Only TCP
netstat -u                # Only UDP
```

---

### 📊 sort

```bash
sort file.txt
sort -r file.txt
sort -k 2 file.txt
```

### 🔁 uniq

```bash
uniq file.txt
uniq -c file.txt
```

### 🔢 wc

```bash
wc -l file.txt
wc -m file.txt
```

---

### 🔐 chmod/chown/chattr

```bash
chmod 755 file
chmod u+x file
chown user:group file
chattr +i file   # Set Immutable
```

### 🔎 find

```bash
find / -name "*.log"
find / -type d -name abc
find / -type f -name abc
find / -type f -name abc -exec chmod 444 {} \;
```

---

### 📋 cp & mv

```bash
cp file.txt /path/
cp -r folder/ /path/
mv file.txt /path/
```

### ✂️ cut

```bash
echo "abcdef" | cut -c3
echo "abcdef" | cut -c3-
echo "abcdef" | cut -c-3
```

---

### 🧠 dig

```bash
dig vietnix.vn A
 dig vietnix.vn MX
 dig vietnix.vn NS
 dig @8.8.8.8 vietnix.vn MX
```

---

### 📦 tar/zip

```bash
tar -czf file.tar.gz folder/
tar -xzf file.tar.gz
zip -r file.zip folder/
unzip file.zip
```

### 💽 mount/umount

```bash
lsblk                          # Kiểm tra ổ cứng
mount /dev/sdb1 /mnt/test
umount /mnt/test
```

---

### 🔗 Symbolic & Hard Links

```bash
ln -s original.txt link.txt      # Sym link
ln original.txt link.txt         # Hard link
```

### 📂 ls

```bash
ls
ls -l
ls -a
```

---

### 🧠 ps/top

```bash
ps aux
kill <PID>
top
```

* Load avg: 1, 5, 15 min
* us: user, sy: system, ni: nice, id: idle
* wa: IO wait, hi/si: hardware/software irq, st: stolen

---

### 📈 free

```bash
free -h
```

* `used`, `free`, `buff/cache` giải thích RAM sử dụng

### 💾 df

```bash
df -h
```

* Phân vùng `/` là root filesystem
