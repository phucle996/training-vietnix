# Install Wordpress và laravel trên cyber panel

## Cài đặt Cyber panel :
  ### Update các pakage
```bash 
  sudo yum check-update
  sudo yum update

```

### Cài Cyber panel với lệnh:

```bash
sh <(curl https://cyberpanel.net/install.sh || wget -O - https://cyberpanel.net/install.sh)
```
### các option khi cài đặt :
```bash 
- Chọn install cyberpanel with OpenLiteSpeed
- Full Service (default Y):y
- Remote MySQL (default N): n
- CyberPanel Version (default Latest Version): 2.0.1
- Password (default “1234567”):
- Memcached (default Y): y
- Redis (default Y):
- Watchdog (default Yes):
```

