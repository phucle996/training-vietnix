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
- Install Cyber panel
  <p align="left"><img src="/day7/images/day7-1.png" alt="" width="400"/></p>
- Chọn install cyberpanel with OpenLiteSpeed
  <p align="left"><img src="/day7/images/day7-2.png" alt="" width="400"/></p>
- Full Service (default Y):y
  <p align="left"><img src="/day7/images/day7-3.png" alt="" width="400"/></p>
- Remote MySQL (default N): n
  <p align="left"><img src="/day7/images/day7-4.png" alt="" width="400"/></p>
- CyberPanel Version (default Latest Version):
  <p align="left"><img src="/day7/images/day7-5.png" alt="" width="400"/></p>
- Password (default “1234567”):
- Memcached (default Y): y
  <p align="left"><img src="/day7/images/day7-6.png" alt="" width="400"/></p>
- Redis (default Y):
  <p align="left"><img src="/day7/images/day7-7.png" alt="" width="400"/></p>
- Watchdog (default Yes):
  <p align="left"><img src="/day7/images/day7-8.png" alt="" width="400"/></p>

