#!/bin/bash
service mysql start
service php5.6-fpm start
service nginx start

mysql -u root < /opt/database_magento.sql

bash
