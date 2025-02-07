show databases;
use aiconcd;
create user 'ai'@'%' identified by '1234';
grant all privileges on aiconcd.* to 'ai'@'%';
flush privileges;

use mysql;
select user, host from user;
show variables like 'PORT';

drop database aiconcd;
create database aiconcd;
use aiconcd;

-- 컬럼 타입 변경--  
alter table user modify user_sex boolean;

drop table user;

CREATE TABLE IF NOT EXISTS `Frame` ( 
        `user_id` varchar(20) NOT NULL,    
        `filename` CHAR(25) NOT NULL,
        `emotion` TINYINT NOT NULL,
        `emotion_prob` FLOAT NOT NULL,
        `is_eyeopen` TINYINT NOT NULL, 
        `is_seat` TINYINT NOT NULL,
        PRIMARY KEY (user_id, filename)
        );

CREATE TABLE IF NOT EXISTS `User` ( 
        `user_id` varchar(20) PRIMARY KEY NOT NULL,    
        `user_name` VARCHAR(50) NOT NULL,
        `user_age` TINYINT NOT NULL,
        `user_sex` boolean NOT NULL,
        `user_class` INT NOT NULL, 
        `grade` TINYINT NOT NULL,
        `parents_id` varchar(100) NOT NULL
        );

drop table timetable;
CREATE TABLE IF NOT EXISTS `Timetable` (    
        `subject` VARCHAR(100) NOT NULL, 
        `subject_start` DATETIME NOT NULL,
        `subject_finish` DATETIME NOT NULL,
        `user_id` varchar(20) NOT NULL,
        foreign key(`user_id`) references `user` (`user_id`)
        );

alter table user_conc modify day_conc date;
drop table user_conc;
-- 컬럼명 변경 --  
alter table user_conc change totla_conc_time total_conc_time INT;
CREATE TABLE  IF NOT EXISTS `User_Conc` ( 
        `user_id` varchar(20) NOT NULL,   
        `day_conc` DATE NOT NULL,
        `subject` VARCHAR(100) NOT NULL,
        `total_subject_time_conc` INT NOT NULL,
        `eye_close_time` INT NOT NULL,
        `not_seat_time` INT NOT NULL,
        `total_conc_time` INT NOT NULL,
        PRIMARY KEY (user_id, day_conc, subject)
        );

drop table user_emotion;
CREATE TABLE IF NOT EXISTS `User_Emotion` ( 
        `user_id` varchar(20) NOT NULL,   
        `day_emo` DATE NOT NULL,
        `subject` VARCHAR(100) NOT NULL,
        `total_subject_time_emo` INT NOT NULL,
        `sub_emotion` INT NOT NULL,
        `sub_emotion_time` INT NOT NULL,
        PRIMARY KEY (user_id, day_emo, subject, sub_emotion)
        );
        
CREATE TABLE IF NOT EXISTS `Parents` ( 
        `parents_id` VARCHAR(100) PRIMARY KEY,   
        `parents_pw` VARCHAR(100)
        );