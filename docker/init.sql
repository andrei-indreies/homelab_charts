-- Create the databases
CREATE DATABASE keycloak;
CREATE DATABASE db2;
CREATE DATABASE db3;
CREATE DATABASE db4;

-- Create users and grant privileges
CREATE USER 'keycloak'@'%' IDENTIFIED BY 'keycloakpass';
CREATE USER 'user2'@'%' IDENTIFIED BY 'password2';
CREATE USER 'user3'@'%' IDENTIFIED BY 'password3';
CREATE USER 'user4'@'%' IDENTIFIED BY 'password4';

-- Grant all privileges on the respective databases to the corresponding users
GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloak'@'%';
GRANT ALL PRIVILEGES ON db2.* TO 'user2'@'%';
GRANT ALL PRIVILEGES ON db3.* TO 'user3'@'%';
GRANT ALL PRIVILEGES ON db4.* TO 'user4'@'%';

-- Apply the changes
FLUSH PRIVILEGES;
