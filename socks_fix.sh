#!/bin/bash

function refreshtime
{
    timestamp="`date +%Y%m%d_%H:%M:%S`"
    fulldate="`date +%Y%m%d_%H%M%S`"
}
refreshtime

printf "Running $0 now... \n"


pia_ip_list=$(nslookup proxy-nl.privateinternetaccess.com | grep Address | cut -d' ' -f2 | grep -v Address)
prowlarr_container=$(docker ps | grep prowlarr | cut -d' ' -f1)
prowlarr_docker_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $prowlarr_container)

for ip in $pia_ip_list; do
	printf "  Testing $ip ... \n"
	ping -c1 $ip 1> /dev/null
	if [[ $? -eq 0 ]]; then
		printf "    Successful \n"
		socks_ip=$ip
		printf "    SOCKS5 IP $socks_ip will be used for Prowlarr container $prowlarr_container ($prowlarr_docker_ip). \n"
		break
	else
		continue
	fi
done

cat << EOF > /Docker/homes/prowlarr/hosts
127.0.0.1    localhost
::1 localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
$prowlarr_docker_ip $prowlarr_container
$socks_ip proxy-nl.privateinternetaccess.com
EOF
