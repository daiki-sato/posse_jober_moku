SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- データベース: `quizy`
DROP SCHEMA IF EXISTS jobmoku;
CREATE SCHEMA jobmoku;
USE jobmoku;
--

-- --------------------------------------------------------

--
-- テーブルの構造 `tokyo`
--

DROP TABLE IF EXISTS people;
CREATE TABLE people (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(140) NOT NULL,
  family_id INT NOT NULL,
  family_role_id INT NOT NULL
);

DROP TABLE IF EXISTS family;
CREATE TABLE family (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(140) NOT NULL
);

DROP TABLE IF EXISTS family_role;
CREATE TABLE family_role (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  role VARCHAR(140) NOT NULL
);

DROP TABLE IF EXISTS friends;
CREATE TABLE friends (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  people_id INT NOT NULL,
  friend_id INT NOT NULL
);


INSERT INTO people (name, family_id, family_role_id) VALUES
('新島駿', 1, 3),
('新島父', 1, 1),
('新島母', 1, 2),
('新島弟', 1, 4),
('佐藤大輝', 2, 4),
('佐藤父', 2, 4),
('佐藤母', 2, 4),
('佐藤姉', 2, 5),
('小堺真季子', 3, 5),
('小堺父', 3, 1),
('小堺母', 3, 2),
('小堺弟', 3, 4);



INSERT INTO family (name) VALUES
('新島家'),
('佐藤家'),
('小堺家');


INSERT INTO family_role (role) VALUES
('父'),
('母'),
('兄'),
('弟'),
('姉'),
('妹');



INSERT INTO friends (people_id, friend_id) VALUES
(1, 5),
(1, 9),
(4, 9),
(8, 9),
(5, 1),
(5, 9),
(9, 5);