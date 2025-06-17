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

 - Khoảng 15 phút sau :
  
  ```bash
  
###################################################################
                CyberPanel Successfully Installed                  
                                                                   
                Current Disk usage : 8/50GB (17%)                        
                                                                   
                Current RAM  usage : 1232/7685MB (16.03%)                         
                                                                   
                Installation time  : 0 hrs 18 min 0 sec                 
                                                                   
                Visit: https://14.225.254.47:8090                     
                Panel username: admin                              
                Panel password: vXwyIQQXFePw7CN1                        
                                                                   
             Run cyberpanel help to get FAQ info
             Run cyberpanel upgrade to upgrade it to latest version.
             Run cyberpanel utility to access some handy tools .
                                                                   
              Website : https://www.cyberpanel.net                 
              Forums  : https://forums.cyberpanel.net              
              Wikipage: https://docs.cyberpanel.net                
              Docs    : https://cyberpanel.net/docs/               
                                                                   
            Enjoy your accelerated Internet by                  
                CyberPanel & OpenLiteSpeed 				                     
###################################################################

```
- Lên web login vào
    <p align="left"><img src="/day7/images/day7-10.png" alt="" width="400"/></p>
    
  ## Up source code wordpress up lên hosting cyber panel

  - Tạo 1 trang web trong cyber panel
    <p align="left"><img src="/day7/images/day7-11.png" alt="" width="400"/></p>

  - Vào quản lí trang web -> file manager
     <p align="left"><img src="/day7/images/day7-12.png" alt="" width="400"/></p>

  - Tiến hành upload source code và giải nén
     <p align="left"><img src="/day7/images/day7-14.png" alt="" width="400"/></p>

  - Import database thông qua PHPmyadmin
 
  - 
