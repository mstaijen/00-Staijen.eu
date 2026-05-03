CREATE DATABASE gezinsdb; 
USE gezinsdb; 
CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(50), password VARCHAR(255), role ENUM('admin','user')); 
