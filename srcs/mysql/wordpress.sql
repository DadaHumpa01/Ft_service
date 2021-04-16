CREATE DATABASE wpdb;
CREATE USER 'wpuser'@'%' identified by 'dbpassword';
GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'%';
FLUSH PRIVILEGES;