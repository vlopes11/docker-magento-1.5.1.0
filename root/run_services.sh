#!/bin/bash
PURPLE='\033[0;35m'
GREEN='\033[1;32m'
GRAY='\033[1;30m'
NC='\033[0m'

printf "${GRAY}=================================================================${NC}\n"
printf "Docker ${PURPLE}vlopes11/magento-1.5.1.0${NC}\n"
printf "Maintainer ${GREEN}vlopes11 <vhrlopes@gmail.com>${NC}\n"
printf "${GRAY}=================================================================${NC}\n"

printf "===> Starting ${GREEN}MySql${NC} on 127.0.0.1:3306\n"
printf "===> User '${GREEN}root${NC}' and password '' (blank)\n"
service mysql start
printf "===> Starting PHP 5.6 FPM...\n"
service php5.6-fpm start
printf "===> PHP 5.6 FPM Sock ${GREEN}$(ls /var/run/php/php5.6-fpm.sock)${NC}\n"

printf "${GRAY}=================================================================${NC}\n"
printf "===> Starting ${GREEN}Nginx${NC} with exposed port ${GREEN}80${NC}...\n"
/usr/sbin/nginx -v
/usr/sbin/nginx
