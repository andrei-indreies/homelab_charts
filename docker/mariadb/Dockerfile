FROM mariadb:10.6.19-ubi9


ENV MYSQL_ROOT_PASSWORD=myhomelabrootpassword


COPY init.sql /docker-entrypoint-initdb.d/

# Expose the default MySQL port
EXPOSE 3306
