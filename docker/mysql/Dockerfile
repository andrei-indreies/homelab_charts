# Use the official MySQL 8 base image (which supports multiple architectures including ARM64)
FROM mysql:8

# Set the root password for MySQL using an environment variable
ENV MYSQL_ROOT_PASSWORD=myhomelabrootpassword

# Copy the initialization script to the image
COPY ./docker/mysql/init.sql /docker-entrypoint-initdb.d/

# Expose the default MySQL port
EXPOSE 3306
