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

SET @cnt = 0;
UPDATE article SET id = @cnt:= @cnt + 1;
ALTER TABLE article AUTO_INCREMENT = 1;