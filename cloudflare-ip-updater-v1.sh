#Basic Cloudflare API Script By Fixapc.net
#Updates A Record With IPv4 Address
#Updates AAAA Record With IPv6 Address
#If No Records Are Found The Script Will Just Cancel Out
#Uses API Snippets From Offical API Documentation
#If you need to add more than 10 domains enjoy your copy and past session or feel free to modify and loop it. 
#Youtube Channel: youtube.fixapc.net

#!/bin/sh
#User Specific Details here
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

#Gets Your Ipv4 Global Address From The Previded Interface
     ipv4=$(ip address show $interface  | awk '/inet / {split($2,var,"/"); print var[1]}')

#Gets Your Ipv6 Global Address From The Previded Interface
     ipv6=$(ip address show $interface | awk '/inet6 / {split($2,var,"/"); print var[1]}')

#Echo Current IP On Specified Interface
     echo CURRENT IPv4 Address ON $interface is $ipv4
     echo CURRENT IPv6 Address ON $interface is $ipv6

#===========================DOMAIN 1===========================
     
     #Add a space
          echo " "

#Echo Basic Message
	echo Attempting To Update ''$domain1''s A Record To $ipv4 
	echo Attempting To Update ''$domain1''s AAAA Record To $ipv6
     
     #Add a space
          echo " "

#Get Zone ID
     zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name="$domain1"" \
     	     -H "X-Auth-Email: "$email"" \
     	     -H "X-Auth-Key: "$key"" \
     	     -H "Content-Type: application/json" \
                  | json_pp | grep -E 'name|id' | sed -n 3p | awk '{print $3}' | tr -d [:punct:])

#Get A Record ID
     arecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=A" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Get AAAA Record ID
     aaaarecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=AAAA" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Update Domain1's A Record With Correct IPv4 Address
     echo A Record Update Results For $domain1
     curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$arecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"A","name":"'$domain1'","content":"'$ipv4'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t
     
     #Add a space
          echo " "

#Update Domain1's AAAA Record With Correct IPv6 Address
     echo AAAA Record Update Results For $domain1
      curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$aaaarecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"AAAA","name":"'$domain1'","content":"'$ipv6'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t

#===========================DOMAIN 2===========================
      
     #Add a space
          echo " "

#Echo Basic Message
     echo Attempting To Update ''$domain2''s A Record To $ipv4 
     echo Attempting To Update ''$domain2''s AAAA Record To $ipv6
     
     #Add a space
          echo " "

#Get Zone ID
     zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name="$domain2"" \
               -H "X-Auth-Email: "$email"" \
               -H "X-Auth-Key: "$key"" \
               -H "Content-Type: application/json" \
                  | json_pp | grep -E 'name|id' | sed -n 3p | awk '{print $3}' | tr -d [:punct:])

#Get A Record ID
     arecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=A" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Get AAAA Record ID
     aaaarecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=AAAA" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Update domain2's A Record With Correct IPv4 Address
     echo A Record Update Results For $domain2
     curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$arecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"A","name":"'$domain2'","content":"'$ipv4'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t
     
     #Add a space
          echo " "

#Update domain2's AAAA Record With Correct IPv6 Address
     echo AAAA Record Update Results For $domain2
      curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$aaaarecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"AAAA","name":"'$domain2'","content":"'$ipv6'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t

#===========================DOMAIN 3===========================
      
     #Add a space
          echo " "

#Echo Basic Message
     echo Attempting To Update ''$domain3''s A Record To $ipv4 
     echo Attempting To Update ''$domain3''s AAAA Record To $ipv6
     
     #Add a space
          echo " "

#Get Zone ID
     zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name="$domain3"" \
               -H "X-Auth-Email: "$email"" \
               -H "X-Auth-Key: "$key"" \
               -H "Content-Type: application/json" \
                  | json_pp | grep -E 'name|id' | sed -n 3p | awk '{print $3}' | tr -d [:punct:])

#Get A Record ID
     arecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=A" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Get AAAA Record ID
     aaaarecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=AAAA" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Update domain3's A Record With Correct IPv4 Address
     echo A Record Update Results For $domain3
     curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$arecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"A","name":"'$domain3'","content":"'$ipv4'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t
     
     #Add a space
          echo " "

#Update domain3's AAAA Record With Correct IPv6 Address
     echo AAAA Record Update Results For $domain3
      curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$aaaarecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"AAAA","name":"'$domain3'","content":"'$ipv6'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t

#===========================DOMAIN 4===========================
      
     #Add a space
          echo " "

#Echo Basic Message
     echo Attempting To Update ''$domain4''s A Record To $ipv4 
     echo Attempting To Update ''$domain4''s AAAA Record To $ipv6
     
     #Add a space
          echo " "

#Get Zone ID
     zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name="$domain4"" \
               -H "X-Auth-Email: "$email"" \
               -H "X-Auth-Key: "$key"" \
               -H "Content-Type: application/json" \
                  | json_pp | grep -E 'name|id' | sed -n 3p | awk '{print $3}' | tr -d [:punct:])

#Get A Record ID
     arecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=A" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Get AAAA Record ID
     aaaarecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=AAAA" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Update domain4's A Record With Correct IPv4 Address
     echo A Record Update Results For $domain4
     curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$arecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"A","name":"'$domain4'","content":"'$ipv4'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t
     
     #Add a space
          echo " "

#Update domain4's AAAA Record With Correct IPv6 Address
     echo AAAA Record Update Results For $domain4
      curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$aaaarecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"AAAA","name":"'$domain4'","content":"'$ipv6'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t

#===========================DOMAIN 5===========================
      
     #Add a space
          echo " "

#Echo Basic Message
     echo Attempting To Update ''$domain5''s A Record To $ipv4 
     echo Attempting To Update ''$domain5''s AAAA Record To $ipv6
     
     #Add a space
          echo " "

#Get Zone ID
     zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name="$domain5"" \
               -H "X-Auth-Email: "$email"" \
               -H "X-Auth-Key: "$key"" \
               -H "Content-Type: application/json" \
                  | json_pp | grep -E 'name|id' | sed -n 3p | awk '{print $3}' | tr -d [:punct:])

#Get A Record ID
     arecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=A" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Get AAAA Record ID
     aaaarecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=AAAA" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Update domain5's A Record With Correct IPv4 Address
     echo A Record Update Results For $domain5
     curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$arecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"A","name":"'$domain5'","content":"'$ipv4'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t
     
     #Add a space
          echo " "

#Update domain5's AAAA Record With Correct IPv6 Address
     echo AAAA Record Update Results For $domain5
      curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$aaaarecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"AAAA","name":"'$domain5'","content":"'$ipv6'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t

#===========================DOMAIN 6===========================
      
     #Add a space
          echo " "

#Echo Basic Message
     echo Attempting To Update ''$domain6''s A Record To $ipv4 
     echo Attempting To Update ''$domain6''s AAAA Record To $ipv6
     
     #Add a space
          echo " "

#Get Zone ID
     zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name="$domain6"" \
               -H "X-Auth-Email: "$email"" \
               -H "X-Auth-Key: "$key"" \
               -H "Content-Type: application/json" \
                  | json_pp | grep -E 'name|id' | sed -n 3p | awk '{print $3}' | tr -d [:punct:])

#Get A Record ID
     arecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=A" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Get AAAA Record ID
     aaaarecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=AAAA" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Update domain6's A Record With Correct IPv4 Address
     echo A Record Update Results For $domain6
     curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$arecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"A","name":"'$domain6'","content":"'$ipv4'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t
     
     #Add a space
          echo " "

#Update domain6's AAAA Record With Correct IPv6 Address
     echo AAAA Record Update Results For $domain6
      curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$aaaarecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"AAAA","name":"'$domain6'","content":"'$ipv6'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t

#===========================DOMAIN 7===========================
      
     #Add a space
          echo " "

#Echo Basic Message
     echo Attempting To Update ''$domain7''s A Record To $ipv4 
     echo Attempting To Update ''$domain7''s AAAA Record To $ipv6
     
     #Add a space
          echo " "

#Get Zone ID
     zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name="$domain7"" \
               -H "X-Auth-Email: "$email"" \
               -H "X-Auth-Key: "$key"" \
               -H "Content-Type: application/json" \
                  | json_pp | grep -E 'name|id' | sed -n 3p | awk '{print $3}' | tr -d [:punct:])

#Get A Record ID
     arecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=A" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Get AAAA Record ID
     aaaarecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=AAAA" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Update domain7's A Record With Correct IPv4 Address
     echo A Record Update Results For $domain7
     curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$arecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"A","name":"'$domain7'","content":"'$ipv4'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t
     
     #Add a space
          echo " "

#Update domain7's AAAA Record With Correct IPv6 Address
     echo AAAA Record Update Results For $domain7
      curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$aaaarecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"AAAA","name":"'$domain7'","content":"'$ipv6'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t

#===========================DOMAIN 8===========================
      
     #Add a space
          echo " "

#Echo Basic Message
     echo Attempting To Update ''$domain8''s A Record To $ipv4 
     echo Attempting To Update ''$domain8''s AAAA Record To $ipv6
     
     #Add a space
          echo " "

#Get Zone ID
     zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name="$domain8"" \
               -H "X-Auth-Email: "$email"" \
               -H "X-Auth-Key: "$key"" \
               -H "Content-Type: application/json" \
                  | json_pp | grep -E 'name|id' | sed -n 3p | awk '{print $3}' | tr -d [:punct:])

#Get A Record ID
     arecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=A" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Get AAAA Record ID
     aaaarecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=AAAA" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Update domain8's A Record With Correct IPv4 Address
     echo A Record Update Results For $domain8
     curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$arecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"A","name":"'$domain8'","content":"'$ipv4'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t
     
     #Add a space
          echo " "

#Update domain8's AAAA Record With Correct IPv6 Address
     echo AAAA Record Update Results For $domain8
      curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$aaaarecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"AAAA","name":"'$domain8'","content":"'$ipv6'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t

#===========================DOMAIN 9===========================
      
     #Add a space
          echo " "

#Echo Basic Message
     echo Attempting To Update ''$domain9''s A Record To $ipv4 
     echo Attempting To Update ''$domain9''s AAAA Record To $ipv6
     
     #Add a space
          echo " "

#Get Zone ID
     zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name="$domain9"" \
               -H "X-Auth-Email: "$email"" \
               -H "X-Auth-Key: "$key"" \
               -H "Content-Type: application/json" \
                  | json_pp | grep -E 'name|id' | sed -n 3p | awk '{print $3}' | tr -d [:punct:])

#Get A Record ID
     arecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=A" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Get AAAA Record ID
     aaaarecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=AAAA" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Update domain9's A Record With Correct IPv4 Address
     echo A Record Update Results For $domain9
     curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$arecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"A","name":"'$domain9'","content":"'$ipv4'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t
     
     #Add a space
          echo " "

#Update domain9's AAAA Record With Correct IPv6 Address
     echo AAAA Record Update Results For $domain9
      curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$aaaarecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"AAAA","name":"'$domain9'","content":"'$ipv6'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t

#===========================DOMAIN 10===========================
      
     #Add a space
          echo " "

#Echo Basic Message
     echo Attempting To Update ''$domain10''s A Record To $ipv4 
     echo Attempting To Update ''$domain10''s AAAA Record To $ipv6
     
     #Add a space
          echo " "

#Get Zone ID
     zoneid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones?name="$domain10"" \
               -H "X-Auth-Email: "$email"" \
               -H "X-Auth-Key: "$key"" \
               -H "Content-Type: application/json" \
                  | json_pp | grep -E 'name|id' | sed -n 3p | awk '{print $3}' | tr -d [:punct:])

#Get A Record ID
     arecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=A" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Get AAAA Record ID
     aaaarecid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/?type=AAAA" \
                  -H "X-Auth-Email: "$email"" \
                  -H "X-Auth-Key: "$key"" \
                  -H "Content-Type: application/json" \
                  | json_pp | sed -n 8p | awk '{print $3}' | tr -d [:punct:])

#Update domain10's A Record With Correct IPv4 Address
     echo A Record Update Results For $domain10
     curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$arecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"A","name":"'$domain10'","content":"'$ipv4'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t
     
     #Add a space
          echo " "

#Update domain10's AAAA Record With Correct IPv6 Address
     echo AAAA Record Update Results For $domain10
      curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/"$zoneid"/dns_records/"$aaaarecid"" \
          -H "X-Auth-Email: "$email"" \
          -H "X-Auth-Key: "$key"" \
          -H "Content-Type: application/json" \
          --data '{"type":"AAAA","name":"'$domain10'","content":"'$ipv6'","ttl":3600,"proxied":false}' | json_pp | tr -d '""()[]{},' | column -t
          
          #Exits Script
          exit
