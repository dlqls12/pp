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
    email char(200) not null,
    nickname char(200) not null
);

create table articleReply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    articleId int(10) NOT NULL,
    `body` TEXT NOT NULL,
    memberId int(10) NOT NULL
);

# 게시물 작성
insert into article set
regDate = now(),
updateDate = now(),
cateItemId = 2,
displayStatus = 1,
title = 'jsp에서 파라미터를 변수처럼 쓰는 방법',
`body` = '테스트입니다.';

INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
cateItemId = 4,
displayStatus = 1,
title = '자주 쓰는 MySQL 명령어 정리',
`body` = '';

INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
cateItemId = 3,
displayStatus = 1,
title = '웹 페이지 top-body-bottom 보기 좋게 나누기',
`body` = '';

INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
cateItemId = 2,
displayStatus = 1,
title = '[JSP 기초 5강] 데이터 입력',
`body` = '';

select * from article order by id desc;
SELECT * FROM article where id=1;
SELECT * FROM cateItem;
select * from `member`;
SELECT * FROM articleReply;

truncate `member`;

drop table articleReply;

DELETE FROM article
WHERE cateItemId = 1;

select * from `member` where loginId = '111' and loginPw = '111';