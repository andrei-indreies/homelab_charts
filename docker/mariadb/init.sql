CREATE DATABASE recumeddatabase;
CREATE DATABASE geodandatabase;

CREATE USER 'recumed'@'%' IDENTIFIED BY 'Xq#61"z_3c6e';
CREATE USER 'geodan'@'%' IDENTIFIED BY '2gV9o5z{6hE[';

-- Grant all privileges on the respective databases to the corresponding users
GRANT ALL PRIVILEGES ON recumeddatabase.* TO 'recumed'@'%';
GRANT ALL PRIVILEGES ON geodandatabase.* TO 'geodan'@'%';

-- Apply the changes
FLUSH PRIVILEGES;
