# 캐릭터SET 설정
SET NAMES utf8mb4;

# DB 생성
DROP DATABASE IF EXISTS site30;
CREATE DATABASE site30;
USE site30;

# 카테고리
DROP TABLE IF EXISTS cateItem;
CREATE TABLE cateItem (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    `name` CHAR(100) NOT NULL UNIQUE
);

# 카테고리 아이템
INSERT INTO cateItem SET regDate=NOW(), `name`='JAVA';
INSERT INTO cateItem SET regDate=NOW(), `name`='JSP';
INSERT INTO cateItem SET regDate=NOW(), `name`='HTML/CSS';
INSERT INTO cateItem SET regDate=NOW(), `name`='DB';
INSERT INTO cateItem SET regDate=NOW(), `name`='PROJECT';
INSERT INTO cateItem SET regDate=NOW(), `name`='기타';

# 게시물 테이블 생성
DROP TABLE IF EXISTS article;
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    cateItemId INT(10) UNSIGNED NOT NULL,
    displayStatus TINYINT(1) UNSIGNED NOT NULL,
    `title` CHAR(200) NOT NULL,
    `body` TEXT NOT NULL
);

# 회원 테이블 생성
DROP TABLE IF EXISTS MEMBER;
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(100) NOT NULL UNIQUE,
    loginPw CHAR(200) NOT NULL,
    `name` CHAR(100) NOT NULL,
    email CHAR(200) NOT NULL,
    nickname CHAR(200) NOT NULL
);

CREATE TABLE articleReply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    articleId INT(10) NOT NULL,
    `body` TEXT NOT NULL,
    memberId INT(10) NOT NULL
);

SELECT * FROM article ORDER BY id DESC;
SELECT * FROM cateItem;
SELECT * FROM `member`;
SELECT * FROM articleReply;

ALTER TABLE `member` ADD mailAuthStatus TINYINT(1) UNSIGNED;
ALTER TABLE `article` ADD INDEX (`cateItemId`, `displayStatus`);
ALTER TABLE `articleReply` ADD INDEX (`articleId`);

DROP TABLE IF EXISTS attr;
CREATE TABLE attr (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `name` CHAR(100) NOT NULL UNIQUE,
    `value` TEXT NOT NULL
);

# updateDate 칼럼 추가
ALTER TABLE `cateItem` ADD COLUMN `updateDate` DATETIME NOT NULL AFTER `regDate`;

# attr 테이블에서 name을 4가지 칼럼으로 나누기
ALTER TABLE `attr` DROP COLUMN `name`,
ADD COLUMN `relTypeCode` CHAR(20) NOT NULL AFTER `updateDate`,
ADD COLUMN `relId` INT(10) NOT NULL AFTER `relTypeCode`,
ADD COLUMN `typeCode` CHAR(30) NOT NULL AFTER `relId`,
ADD COLUMN `type2Code` CHAR(30) NOT NULL AFTER `typeCode`,
CHANGE `value` `value` TEXT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL AFTER `type2Code`,
DROP INDEX `name`; 

# attr 유니크 인덱스 걸기
## 중복 변수 생성금지
## 변수 찾는 속도 최적화
ALTER TABLE `attr` ADD UNIQUE INDEX (`relTypeCode`, `relId`, `typeCode`, `type2Code`);

## 특정 조건을 만족하는 회원 또는 게시물(기타 데이터)를 빠르게 찾기 위해서
ADD INDEX (`relTypeCode`, `typeCode`, `type2Code`);