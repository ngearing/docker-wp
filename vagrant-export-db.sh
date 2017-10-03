#!/bin/bash

wp_config=$(find / -name wp-config.php 2>/dev/null)
wp_database=$(grep "DB_NAME" "$wp_config" | sed -e "s/[[:space:]]*//g;" -e "s/define('DB_NAME','//g" -e "s/');//g")
wp_user=$(grep "DB_USER" "$wp_config" | sed -e "s/[[:space:]]*//g;" -e "s/define('DB_USER','//g" -e "s/');//g")
wp_pass=$(grep "DB_PASSWORD" "$wp_config" | sed -e "s/[[:space:]]*//g;" -e "s/define('DB_PASSWORD','//g" -e "s/');//g")

cd "$wp_config" || exit "Could not find Wordpress directory"

mysqldump -u"$wp_user" -p"$wp_pass" -v --skip-lock-tables "$wp_database" > dump.sql
