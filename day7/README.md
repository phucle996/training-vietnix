# Install Wordpress và laravel trên cyber panel

## Cài đặt Cyber panel :
  ### Update các pakage
```bash 
  sudo yum check-update
  sudo yum update

```
<p align="center"><img src="/day7/images/day2.png" alt="" width="400"/></p>

### Cài Cyber panel với lệnh:

```bash
sh <(curl https://cyberpanel.net/install.sh || wget -O - https://cyberpanel.net/install.sh)
```
<p align="center"><img src="/day7/images/day2.png" alt="" width="400"/></p>

### các option khi cài đặt :
- Chọn install cyberpanel with OpenLiteSpeed
<p align="center"><img src="/day7/images/day7-1.png" alt="" width="400"/></p>
- Full Service (default Y):y
<p align="center"><img src="/day7/images/day7-2.png" alt="" width="400"/></p>
- Remote MySQL (default N): n
<p align="center"><img src="/day7/images/day7-3.png" alt="" width="400"/></p>
- CyberPanel Version (default Latest Version): 2.0.1
<p align="center"><img src="/day7/images/day7-4.png" alt="" width="400"/></p>
- Password (default “1234567”):
<p align="center"><img src="/day7/images/day7-5.png" alt="" width="400"/></p>
- Memcached (default Y): y
<p align="center"><img src="/day7/images/day7-6.png" alt="" width="400"/></p>
- Redis (default Y):
<p align="center"><img src="/day7/images/day7-7.png" alt="" width="400"/></p>
- Watchdog (default Yes):
<p align="center"><img src="/day7/images/day7-8.png" alt="" width="400"/></p>

