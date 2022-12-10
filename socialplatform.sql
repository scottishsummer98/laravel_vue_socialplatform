-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 10, 2022 at 02:28 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socialplatform`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(27, '2014_10_12_000000_create_users_table', 1),
(28, '2014_10_12_100000_create_password_resets_table', 1),
(29, '2019_08_19_000000_create_failed_jobs_table', 1),
(30, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(31, '2022_11_25_125153_create_posts_table', 1),
(35, '2022_12_10_123453_create_followers_table', 2),
(36, '2022_12_10_123825_create_pages_table', 2),
(37, '2022_12_10_125441_create_page_posts_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagetype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_posts`
--

CREATE TABLE `page_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pageid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posttype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `userid`, `posttype`, `desc`, `img`, `created_at`, `updated_at`) VALUES
(4, '1', 'generalposts', 'Amazing game between USA and England yesterday!! ⚽⚽ Absolutely Loved it 🧡🧡 🏆🏆', 'user/photos/generalposts/2022/11/PqUDeVLpepqeQCjuEpmfq0KUYDKnIa7NBomIC2iR.jpg', '2022-11-26 08:59:03', '2022-11-26 10:39:18'),
(5, '1', 'cp', 'One of my favorite footballers of all time 👑 CR7 👑', 'user/photos/cp/2022/11/tUtWb58sqtvh2kyCkKAVV3t1a7g3IYJ2KI8tnK0d.jpg', '2022-11-26 08:59:27', '2022-11-26 10:46:56'),
(8, '2', 'dp', 'dp', 'user/photos/dp/2022/11/371UbsMo28x0xndFXc9QZvvPdhx3my0W9JlutD2V.gif', '2022-11-26 09:03:21', '2022-11-26 09:03:21'),
(10, '2', 'cp', 'Baby Yoda. My first love 🤭🤭', 'user/photos/cp/2022/11/y1Ao7A2qqZIjhsAagTxjJPWbxOFg0kj4SEo9Swo2.jpg', '2022-11-26 09:19:25', '2022-11-26 10:49:45'),
(11, '2', 'generalposts', 'আমার ড্রাগনটা সকাল থেকে খাওয়া দাওয়া করতেসে না। খুবই অসুস্থ হয়ে পরেছে। কারোও কাছে পরিচিত পেটক্লিনিকের নাম্বার থাকলে প্লিজ কমেন্ট করে জানাবেন প্লিজ 😭😭', 'user/photos/generalposts/2022/11/VRmBKAQqs8H2z8TkNzi804OLpgqrqEfPZD5wIU2v.jpg', '2022-11-26 09:21:21', '2022-11-26 09:21:21'),
(12, '2', 'generalposts', 'কি খবর সবাই? কেমন আছেন? ভাল তোহ?', NULL, '2022-11-26 09:21:53', '2022-11-26 09:21:53'),
(14, '1', 'generalposts', 'Hey!! is anyone else watching France VS Denmark?? What a game!! 😵😵', NULL, '2022-11-26 10:48:38', '2022-11-26 10:48:38'),
(16, '1', 'dp', 'dp', 'user/photos/dp/2022/12/6P7sUqq0Fu25NN17KR1Dom7ZTdOeQFaSDBOHGLOP.webp', '2022-12-03 11:36:00', '2022-12-03 11:36:00'),
(17, '2', 'cp', 'cp', 'user/photos/cp/2022/12/3CP7PotFeiSUQWQvEV3WUO1qJalBsyuuWuRNRAwT.jpg', '2022-12-03 12:37:37', '2022-12-03 12:37:37'),
(18, '2', 'cp', 'cp', 'user/photos/cp/2022/12/vV5tr6v9iyYwndvkz4fUvdEKKN58nRrTtiNSOYGS.jpg', '2022-12-03 12:37:51', '2022-12-03 12:37:51'),
(20, '2', 'cp', 'cp', 'user/photos/cp/2022/12/6NnJv4X2hjjjKriNtuQWLXYkGtUveaocIJpyejGz.jpg', '2022-12-03 12:38:25', '2022-12-03 12:38:25'),
(21, '2', 'dp', 'dp', 'user/photos/dp/2022/12/A2dC4hV3UEW75GL9xo2izFBqciLj2JG6roQOqmAP.jpg', '2022-12-03 12:38:50', '2022-12-03 12:38:50'),
(22, '2', 'dp', 'dp', 'user/photos/dp/2022/12/vXYAhFuMZ1GIGdPyKAOnYAQN28H5JH5busCS9GcZ.jpg', '2022-12-03 12:39:05', '2022-12-03 12:39:05'),
(23, '2', 'dp', 'dp', 'user/photos/dp/2022/12/lDIVoymFHdUULdduyGRMp4okh84t5u5HC6aMsRjX.jpg', '2022-12-03 12:39:16', '2022-12-03 12:39:16'),
(24, '2', 'generalposts', 'কি খবর সবাই কেমন আছেন?', NULL, '2022-12-03 12:40:01', '2022-12-03 12:40:01'),
(25, '2', 'generalposts', 'আজকে আর্জেন্টিনা জিতলে খুব খুশি হবো!!! হেহেহেহে', 'user/photos/generalposts/2022/12/0fIBy1ysh73KqB4KqNU3kEjzLhwt7UzwAhZujm2v.bin', '2022-12-03 12:41:28', '2022-12-03 12:41:28'),
(27, '2', 'generalposts', 'Feeling crazyyy!!! 😵😵😵', 'user/photos/generalposts/2022/12/77dYFgE37qIezX2bdU8JkizBsQMMEj9Rt2qcBn30.jpg', '2022-12-03 12:43:47', '2022-12-03 12:43:47'),
(29, '2', 'generalposts', 'Mee 😊😊', 'user/photos/generalposts/2022/12/ILOxw34zbLDJIYPAZsYY2m7xoXJzQH1A0wvbaNgd.jpg', '2022-12-03 12:44:55', '2022-12-03 12:44:55'),
(30, '2', 'generalposts', 'My grandfather in his natural habitat !! Miss you grandpa 😥😥😥', 'user/photos/generalposts/2022/12/NNW2nWunwuoNxzsnXziybkDaOjJNZeq9rdYJBcWa.jpg', '2022-12-03 12:46:05', '2022-12-03 12:46:05'),
(31, '2', 'cp', 'cp', 'user/photos/cp/2022/12/opUErCq3JrjjnY5PTDnOJZXlKmJ5GTaQ2g10rTEw.jpg', '2022-12-03 12:46:52', '2022-12-03 12:46:52'),
(32, '1', 'generalposts', 'মনে পরে যা, কত স্মৃতি হায়, মধুর জীবন', 'user/photos/generalposts/2022/12/CAYfI7h5dlRv3FsOMkUGKU6MzeYVepowtymMMGSN.jpg', '2022-12-03 12:48:41', '2022-12-03 12:48:41'),
(33, '1', 'generalposts', 'Been wonderin\' if your heart\'s still open\r\nAnd if so, I wanna know what time it shuts 🎧 🎵', 'user/photos/generalposts/2022/12/7f18xNORwytwHDgGNjdRfXnAj1Z6DRwKw8IEaVfQ.jpg', '2022-12-03 12:51:15', '2022-12-03 12:51:15'),
(34, '1', 'generalposts', 'Crossout is my new favourite game !!  💖', 'user/photos/generalposts/2022/12/E1QrkCcGzO8ar2KBEOaEKFXBLC595NP5tQbySmyG.jpg', '2022-12-03 12:52:34', '2022-12-03 12:52:34'),
(35, '1', 'generalposts', 'Back to my earth crib after 1400 years. Apparently the meat smells the same!!', 'user/photos/generalposts/2022/12/T7hjuYvIsxX5nZOY52T4aoQSfmIRRuaGG03jEJJ3.webp', '2022-12-03 12:54:30', '2022-12-03 12:54:30'),
(36, '1', 'dp', 'dp', 'user/photos/dp/2022/12/6GuxFDV1O5Xwe9C1L7Alw88xcb1Gy3XtfD2N0Qt5.jpg', '2022-12-03 12:55:08', '2022-12-03 12:55:08'),
(37, '1', 'dp', 'dp', 'user/photos/dp/2022/12/llh7644TOK3fke72aLbXZPmRUA2TnGsIV7E4zReg.webp', '2022-12-03 12:55:16', '2022-12-03 12:55:16'),
(38, '1', 'dp', 'dp', 'user/photos/dp/2022/12/VcrXUrDK4H57DF0RxIY3nmIPd1S0JmSOI5NNsNSb.webp', '2022-12-03 12:55:52', '2022-12-03 12:55:52'),
(39, '2', 'dp', 'YOWO - You Only Witch Once', 'user/photos/dp/2022/12/fgelmLzCDG2JbeOyVabPUCSsY6AuVBAAEK6tMic7.jpg', '2022-12-03 12:57:06', '2022-12-03 12:57:32'),
(40, '1', 'cp', 'cp', 'user/photos/cp/2022/12/4dmEyGEPO3DW5XgAUYnXnmao5tQamB1ECO5YUo8g.jpg', '2022-12-03 12:57:57', '2022-12-03 12:57:57'),
(41, '1', 'cp', 'cp', 'user/photos/cp/2022/12/728xLDfDXgotivGaNTxsRsrPsAc6NFCjImAozvyZ.jpg', '2022-12-03 12:59:15', '2022-12-03 12:59:15'),
(42, '1', 'cp', 'cp', 'user/photos/cp/2022/12/SItzwZdJxHx8vQMelO24IewwgPgzN1EoTYgfXpkN.jpg', '2022-12-03 13:00:38', '2022-12-03 13:00:38'),
(43, '3', 'dp', 'dp', 'user/photos/dp/2022/12/6rvrfxE0MFp3gg5N2sR68cg9q1GL2tkdCJ0YZKaM.jpg', '2022-12-10 07:22:01', '2022-12-10 07:22:01'),
(44, '3', 'cp', 'cp', 'user/photos/cp/2022/12/IVJ5etWKbbEUpi64zk8ajYEwesGi7CibXj0E02eO.jpg', '2022-12-10 07:23:00', '2022-12-10 07:23:00'),
(45, '3', 'generalposts', 'Awww cutu <3', 'user/photos/generalposts/2022/12/5puOYzE0dUUDXpwTiTmN5JLz73Ugad2uXnVCJKuK.webp', '2022-12-10 07:23:37', '2022-12-10 07:23:37'),
(48, '4', 'dp', 'dp', 'user/photos/dp/2022/12/FQ5KJzlUB4E8qLbvdrgJkVAOJBwqHW6CRrbHDlsf.jpg', '2022-12-10 07:32:05', '2022-12-10 07:32:05'),
(49, '4', 'cp', 'cp', 'user/photos/cp/2022/12/pXvduOF5mx7EAtZkGgo8qXEphWPK979D2d5AQb5d.jpg', '2022-12-10 07:35:32', '2022-12-10 07:35:32'),
(50, '4', 'generalposts', 'OMG!!!! Brazil is out. This world cup is crazyyy 🤩🤩🤩', 'user/photos/generalposts/2022/12/OclLHtiIvL7xQEzfBPCN4TVvWFPK09Jni6qlKG45.webp', '2022-12-10 07:41:31', '2022-12-10 07:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `dp`, `cp`, `dob`, `gender`, `mobile`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '𝔍𝔦𝔫𝔫 𝔢𝔯', '𝔅𝔞𝔡𝔰𝔥𝔞𝔥', 'user/dp/2022/12/VcrXUrDK4H57DF0RxIY3nmIPd1S0JmSOI5NNsNSb.webp', 'user/cp/2022/12/SItzwZdJxHx8vQMelO24IewwgPgzN1EoTYgfXpkN.jpg', '0500-11-21', 'M', '+8801715085046', 'sami@gmail.com', NULL, '$2y$10$vyRJAmvPeaSH8plSNyXL3uPee6yE.56LhA4NJk9eQdg/IO9qh9yki', NULL, '2022-11-26 08:54:09', '2022-12-03 13:00:38'),
(2, 'দুষ্টু░জীন░', 'মারিয়াম░', 'user/dp/2022/12/fgelmLzCDG2JbeOyVabPUCSsY6AuVBAAEK6tMic7.jpg', 'user/cp/2022/12/opUErCq3JrjjnY5PTDnOJZXlKmJ5GTaQ2g10rTEw.jpg', '0550-06-05', 'F', '+8801688874598', 'armana@gmail.com', NULL, '$2y$10$Eq..OmBwL/5p7Gvl8f9YTe5YQGT8/ACJMoFgCZ/YzddXVCeWXMFNS', NULL, '2022-11-26 09:01:14', '2022-12-03 12:57:06'),
(3, 'Kԋαɳ', 'Jιɳɳ', 'user/dp/2022/12/6rvrfxE0MFp3gg5N2sR68cg9q1GL2tkdCJ0YZKaM.jpg', 'user/cp/2022/12/IVJ5etWKbbEUpi64zk8ajYEwesGi7CibXj0E02eO.jpg', '1997-12-27', 'F', '+8801447896541', 'tonwy@gmail.com', NULL, '$2y$10$Nm5tEEJB0fIsfYem2owXm.vk28oKF8GWt3BDeYm8g5Nd/AaSLvG7y', NULL, '2022-12-10 07:20:49', '2022-12-10 07:25:54'),
(4, 'Č𝐫𝐀ŽЎ 𝐣Ꭵ𝓃𝐧', 'Ⓐ𝓁ｆ𝕚', 'user/dp/2022/12/FQ5KJzlUB4E8qLbvdrgJkVAOJBwqHW6CRrbHDlsf.jpg', 'user/cp/2022/12/pXvduOF5mx7EAtZkGgo8qXEphWPK979D2d5AQb5d.jpg', '1997-01-01', 'M', '+88014785511', 'alfi@gmail.com', NULL, '$2y$10$1GfSRFs0f5IlyOrl2ACiEORIS.yRgVDuWqefFTiaOkzQ7JQIQ7756', NULL, '2022-12-10 07:24:38', '2022-12-10 07:35:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_posts`
--
ALTER TABLE `page_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_posts`
--
ALTER TABLE `page_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
