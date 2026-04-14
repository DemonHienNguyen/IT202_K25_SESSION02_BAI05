-- KỊCH BẢN RỦI RO
-- 3 kịch bản:
-- kịch bản 1: người dùng nhập số tiền rút nhiều hơn so với số dư đang có
-- kịch bản 2: người dùng cố tình sử dụng nhiều hơn 1 ví
-- kịch bản 3: người dùng không có định danh cho ví của mình
-- Kịch bản 4: người dùng không nhập thông tin của người dùng vào
-- Kịch bản 5: Người dùng nạp số tiền âm vào ví 

CREATE DATABASE `Bai05`;
USE `Bai05`;

CREATE TABLE `Users`(
	`User_Id` INT PRIMARY KEY,
    `Full_Name` VARCHAR(80) NOT NULL,
    `Address` VARCHAR(150) DEFAULT 'Khong xac dinh',
    `From` VARCHAR(20) DEFAULT 'VietNam',
    `Age` INT NOT NULL CHECK (`Age` > 18),
    `Phone` VARCHAR(10) UNIQUE
);
CREATE TABLE `Wallet`(
	`Wallet_Id` INT PRIMARY KEY,
    `Amount` DECIMAL(19, 4) DEFAULT 0,
    `User_id` INT,
	FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_Id`)
);

CREATE TABLE `History_Trade`(
	`Trade_Id` INT PRIMARY KEY,
    `Amount_Wallet` DECIMAL(19, 4),
    `Trade_money` DECIMAL(19, 4),
    `User_Id` INT,
    `Wallet_Id` INT,
    `Trade_Date` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
    CONSTRAINT `fk_History_Wallet`
    FOREIGN KEY (`Wallet_Id`) REFERENCES `Wallet` (`Wallet_Id`),
    CONSTRAINT `fk_User_Trade`
    FOREIGN KEY (`User_Id`) REFERENCES `Users` (`User_Id`)
);
