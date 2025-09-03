CREATE DATABASE IF NOT EXISTS olpay CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE olpay;

-- Users
CREATE TABLE IF NOT EXISTS users (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  provider ENUM('kakao','apple','email') NOT NULL,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(150),
  password_hash VARCHAR(255),
  status ENUM('active','suspended','deleted') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Contracts
CREATE TABLE IF NOT EXISTS contracts (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT NOT NULL,
  file_url VARCHAR(255) NOT NULL,
  status ENUM('pending','approved','rejected') DEFAULT 'pending',
  uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Payments
CREATE TABLE IF NOT EXISTS payments (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT NOT NULL,
  contract_id BIGINT,
  amount INT NOT NULL,
  method VARCHAR(50),
  status ENUM('success','fail','pending') DEFAULT 'pending',
  paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (contract_id) REFERENCES contracts(id)
);

-- Admins
CREATE TABLE IF NOT EXISTS admins (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(150) NOT NULL,
  role ENUM('super','staff') DEFAULT 'staff',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
