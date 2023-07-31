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

### mysql phpmyadmin
```bash
docker rm -f mysqladmin
docker run --name mysqladmin \
   --restart=always \
   --link mysql:db \
   -p 8081:80 \
   -d phpmyadmin/phpmyadmin
```

### mariadb
```bash
mkdir -p /opt/crudapi/mariadb
chmod 777 /opt/crudapi/mariadb

docker pull mariadb
docker rm -f mariadb
docker run --name mariadb \
--env MARIADB_DATABASE=crudapi \
--env MARIADB_USER=crudapi \
--env MARIADB_PASSWORD=crudapi \
--env MARIADB_ROOT_PASSWORD=root \
-p "3307:3307" \
-p "33070:33070" \
-v "/opt/crudapi/mariadb/data:/var/lib/mysql" \
-d mariadb:latest
```

### mariadb phpmyadmin
```bash
docker rm -f mariadbadmin
docker run --name mariadbadmin \
   --restart=always \
   --link mariadb:db \
   -p 8082:80 \
   -d phpmyadmin/phpmyadmin
```
