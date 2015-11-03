#!/bin/bash

source /etc/profile

test_db(){
NOW=$(date "+%Y-%m-%-d %H:%M:%S")
IP=$(ifconfig eth0 | grep -i "inet" | grep -iv "inet6" | awk {'print $2'} | sed -ne 's/addr\://p')
SQL="insert into contest2(title,create_time) values('$IP','$NOW')"
DB_HOST="192.168.122.138"
DB_USER="atyu30"
DB_NAME="test"
DB_PASS="test"
mysql -h$DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME <<EOF
$SQL
EOF
}

while ((1))
do
    test_db
    sleep 1
done
