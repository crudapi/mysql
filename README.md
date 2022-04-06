# crudapi mysql

### mysql
```bash
mkdir -p /opt/crudapi/mysql
chmod 777 /opt/crudapi/mysql

docker pull crudapi/mysql
docker tag crudapi/mysql crudapi-mysql
docker rm -f mysql
docker run --privileged --name "mysql" \
   --restart=always \
   -e "MYSQL_DATABASE=crudapi" \
   -e "MYSQL_ROOT_PASSWORD=" \
   -e "TZ=Asia/Shanghai" \
   -p "3306:3306" \
   -p "33060:33060" \
   -v "/opt/crudapi/mysql/data:/var/lib/mysql" \
   -d crudapi-mysql  \
   --character-set-server=utf8mb4 \
   --collation-server=utf8mb4_unicode_ci
```

### phpmyadmin
```bash
docker rm -f myadmin
docker run --name myadmin \
   --restart=always \
   --link mysql:db \
   -p 8081:80 \
   -e PMA_PORT=3306 \
   -d phpmyadmin/phpmyadmin
```


