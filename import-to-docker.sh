#!/bin/bash

docker-compose exec mysql sh
find / -name 'test.sql'
mysql -u root -ppassword wpdb < /var/lib/mysql/test.sql