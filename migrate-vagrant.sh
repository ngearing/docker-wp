#!/bin/bash

if [ ! -e '.vagrant' ] || [ ! -e 'Vagrantfile' ]
    then 
    echo "Error - are you sure you are using vagrant here?"
    echo "Could not find Vagrantfile"
    exit;
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VAGRANT_STATUS=$(vagrant status | awk "running" "$1")

# wp_config=$(find . -name wp-config.php)
# wp_database=$(grep "DB_NAME" "$wp_config" | sed -e "s/[[:space:]]*//g;" -e "s/define('DB_NAME','//g" -e "s/');//g")
# wp_user=$(grep "DB_USER" "$wp_config" | sed -e "s/[[:space:]]*//g;" -e "s/define('DB_USER','//g" -e "s/');//g")
# wp_pass=$(grep "DB_PASSWORD" "$wp_config" | sed -e "s/[[:space:]]*//g;" -e "s/define('DB_PASSWORD','//g" -e "s/');//g")

if [ ! "$VAGRANT_STATUS" ]
    then
    vagrant up
fi

vagrant ssh -c "$DIR/vagrant-export-db.sh"


# cd "$wp_config" || return

# mysqldump -u"$wp_user" -p"$wp_pass" -v --skip-lock-tables "$wp_database" > dump.sql

# echo "COOl"