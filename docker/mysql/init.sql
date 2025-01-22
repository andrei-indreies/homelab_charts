-- Create the databases
CREATE DATABASE keycloak;
CREATE DATABASE ldap;
CREATE DATABASE nextcloud;

CREATE DATABASE db1;
CREATE DATABASE db2;
CREATE DATABASE db3;
CREATE DATABASE db4;
CREATE DATABASE db5;
CREATE DATABASE db6;

-- Create users and grant privileges
CREATE USER 'keycloak'@'%' IDENTIFIED BY 'keycloakpass';
CREATE USER 'ldap'@'%' IDENTIFIED BY 'ldappass';
CREATE USER 'nextcloud'@'%' IDENTIFIED BY 'nextcloud';

CREATE USER 'user1'@'%' IDENTIFIED BY 'password1';
CREATE USER 'user2'@'%' IDENTIFIED BY 'password2';
CREATE USER 'user3'@'%' IDENTIFIED BY 'password3';
CREATE USER 'user4'@'%' IDENTIFIED BY 'password4';
CREATE USER 'user5'@'%' IDENTIFIED BY 'password5';
CREATE USER 'user6'@'%' IDENTIFIED BY 'password6';

-- Grant all privileges on the respective databases to the corresponding users
GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloak'@'%';
GRANT ALL PRIVILEGES ON ldap.* TO 'ldap'@'%';
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'%';
GRANT ALL PRIVILEGES ON db2.* TO 'user2'@'%';
GRANT ALL PRIVILEGES ON db3.* TO 'user3'@'%';
GRANT ALL PRIVILEGES ON db4.* TO 'user4'@'%';
GRANT ALL PRIVILEGES ON db5.* TO 'user5'@'%';
GRANT ALL PRIVILEGES ON db6.* TO 'user6'@'%';

-- Apply the changes
FLUSH PRIVILEGES;
