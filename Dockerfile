FROM mysql:8

ENV TZ Asia/Shanghai

COPY ./etc/mysql/my.cnf /etc/mysql/my.cnf
COPY ./etc/mysql/conf.d/mysql.cnf /etc/mysql/conf.d/mysql.cnf
