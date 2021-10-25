-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- ホスト: db
-- 生成日時: 2021 年 8 月 31 日 11:32
-- サーバのバージョン： 8.0.23
-- PHP のバージョン: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `hackathon`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `event_detail`
--

CREATE TABLE `event_detail` (
  `id` int NOT NULL,
  `event_id` int NOT NULL,
  `date_time` date NOT NULL,
  `place` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `event_detail`
--

INSERT INTO `event_detail` (`id`, `event_id`, `date_time`, `place`, `text`) VALUES
(1, 1, '2021-08-29', 'ペンギンの里', '亮太郎-彼女はいないがママがいる'),
(2, 2, '2021-08-30', 'ダークライ', '彼女はいないがママがいる'),
(3, 3, '2021-08-31', '俺ちっち', 'ここに内容が入ります。ここに内容が入ります。ここに内容が入ります。'),
(4, 4, '0000-00-00', '何なんｗ', 'ここに内容が入ります。ここに内容が入ります。ここに内容が入ります。');

-- --------------------------------------------------------

--
-- テーブルの構造 `event_lists`
--

CREATE TABLE `event_lists` (
  `id` int NOT NULL,
  `event_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` int DEFAULT NULL,
  `deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `event_lists`
--

INSERT INTO `event_lists` (`id`, `event_name`, `genre`, `deadline`) VALUES
(1, 'ハッカソン', 1, '2021-08-10'),
(2, 'クジラの山', 2, '2021-08-24'),
(3, '課題サポート会', 1, '2021-08-17'),
(4, '夜は無限-命は有限', 2, '2021-08-23');

-- --------------------------------------------------------

--
-- テーブルの構造 `genre`
--

CREATE TABLE `genre` (
  `id` int NOT NULL,
  `tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `genre`
--

INSERT INTO `genre` (`id`, `tag`) VALUES
(1, 'イベント'),
(2, '提出物');

-- --------------------------------------------------------

--
-- テーブルの構造 `joiner`
--

CREATE TABLE `joiner` (
  `id` int NOT NULL,
  `event_id` int NOT NULL,
  `member_id` int NOT NULL,
  `join_abstention_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `joiner`
--

INSERT INTO `joiner` (`id`, `event_id`, `member_id`, `join_abstention_id`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 5),
(3, 3, 1, 2),
(4, 1, 2, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `join_abstention`
--

CREATE TABLE `join_abstention` (
  `id` int NOT NULL,
  `class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `join_abstention`
--

INSERT INTO `join_abstention` (`id`, `class`) VALUES
(1, '参加'),
(2, '不参加'),
(3, '遅刻'),
(4, '早退'),
(5, '提出');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `user_id`, `name`, `password`) VALUES
(1, 'mrp', '森遥', '$2y$10$xsOWS8NiUkZ04a8908qCtuYCnOaUj1txTP1vp14UBKs0BLqp/rDGy');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `event_detail`
--
ALTER TABLE `event_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_id` (`event_id`);


--
-- テーブルのインデックス `event_lists`
--
ALTER TABLE `event_lists`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `joiner`
--
ALTER TABLE `joiner`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_id` (`event_id`,`member_id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `event_detail`
--
ALTER TABLE `event_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- テーブルの AUTO_INCREMENT `event_lists`
--
ALTER TABLE `event_lists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- テーブルの AUTO_INCREMENT `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `joiner`
--
ALTER TABLE `joiner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
