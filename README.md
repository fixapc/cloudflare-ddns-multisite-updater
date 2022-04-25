#Basic Cloudflare API Script By Fixapc.net
#Updates A Record With IPv4 Address
#Updates AAAA Record With IPv6 Address
#If No Records Are Found The Script Will Just Cancel Out
#Uses API Snippets From Offical API Documentation
#If you need to add more than 10 domains enjoy your copy and past session or feel free to modify and loop it.
#Youtube Channel: youtube.fixapc.ne

#Note this is mainly for servers who act as a router / gateway at the moment and whos public IP resides on their network interface. 
#When i have more time i will update the script to automatically retrieve domains and have the IP be updated via Google.


#Enter Your Details Here
     interface=eth0 or interface name with public IP
     key=Cloudflare Global API Key Or Custom Token
     email=Yourcloudflare email

#Your Domain List Here
     domain1=yourdomain.com
     domain2=yourdomain.com
     domain3=yourdomain.com
     domain4=yourdomain.com
     domain5=yourdomain.com
     domain6=yourdomain.com
     domain7=yourdomain.com
     domain8=yourdomain.com
     domain9=yourdomain.com
     domain10=yourdomain.com
