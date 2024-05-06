-- Create databases
CREATE DATABASE keycloak;
CREATE DATABASE database_one;
CREATE DATABASE database_two;
CREATE DATABASE database_three;

-- Create users and grant permissions
CREATE USER keycloak WITH PASSWORD 'keycloakpass';
CREATE USER user_one WITH PASSWORD 'password';
CREATE USER user_two WITH PASSWORD 'password';
CREATE USER user_three WITH PASSWORD 'password';

GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;
GRANT ALL PRIVILEGES ON DATABASE database_one TO user_one;
GRANT ALL PRIVILEGES ON DATABASE database_two TO user_two;
GRANT ALL PRIVILEGES ON DATABASE database_three TO user_three;
