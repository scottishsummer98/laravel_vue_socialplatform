-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2022 at 04:51 PM
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
(31, '2022_11_25_125153_create_posts_table', 1);

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
(1, '1', 'dp', 'Me flying my cousins to Dhaka from Kohkaf! Good day indeed !! 😄😄', 'user/photos/dp/2022/11/3MDXc8jrhMVuiKQwbhoDUPV4tbLyKe0CbzKcwJVA.jpg', '2022-11-26 08:55:50', '2022-11-26 10:47:51'),
(4, '1', 'generalposts', 'Amazing game between USA and England yesterday!! ⚽⚽ Absolutely Loved it 🧡🧡 🏆🏆', 'user/photos/generalposts/2022/11/PqUDeVLpepqeQCjuEpmfq0KUYDKnIa7NBomIC2iR.jpg', '2022-11-26 08:59:03', '2022-11-26 10:39:18'),
(5, '1', 'cp', 'One of my favorite footballers of all time 👑 CR7 👑', 'user/photos/cp/2022/11/tUtWb58sqtvh2kyCkKAVV3t1a7g3IYJ2KI8tnK0d.jpg', '2022-11-26 08:59:27', '2022-11-26 10:46:56'),
(8, '2', 'dp', 'dp', 'user/photos/dp/2022/11/371UbsMo28x0xndFXc9QZvvPdhx3my0W9JlutD2V.gif', '2022-11-26 09:03:21', '2022-11-26 09:03:21'),
(10, '2', 'cp', 'Baby Yoda. My first love 🤭🤭', 'user/photos/cp/2022/11/y1Ao7A2qqZIjhsAagTxjJPWbxOFg0kj4SEo9Swo2.jpg', '2022-11-26 09:19:25', '2022-11-26 10:49:45'),
(11, '2', 'generalposts', 'আমার ড্রাগনটা সকাল থেকে খাওয়া দাওয়া করতেসে না। খুবই অসুস্থ হয়ে পরেছে। কারোও কাছে পরিচিত পেটক্লিনিকের নাম্বার থাকলে প্লিজ কমেন্ট করে জানাবেন প্লিজ 😭😭', 'user/photos/generalposts/2022/11/VRmBKAQqs8H2z8TkNzi804OLpgqrqEfPZD5wIU2v.jpg', '2022-11-26 09:21:21', '2022-11-26 09:21:21'),
(12, '2', 'generalposts', 'কি খবর সবাই? কেমন আছেন? ভাল তোহ?', NULL, '2022-11-26 09:21:53', '2022-11-26 09:21:53'),
(14, '1', 'generalposts', 'Hey!! is anyone else watching France VS Denmark?? What a game!! 😵😵', NULL, '2022-11-26 10:48:38', '2022-11-26 10:48:38');

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
(1, '𝔍𝔦𝔫𝔫 𝔢𝔯', '𝔅𝔞𝔡𝔰𝔥𝔞𝔥', 'user/dp/2022/11/3MDXc8jrhMVuiKQwbhoDUPV4tbLyKe0CbzKcwJVA.jpg', 'user/cp/2022/11/tUtWb58sqtvh2kyCkKAVV3t1a7g3IYJ2KI8tnK0d.jpg', '0500-11-21', 'M', '+8801715085046', 'sami@gmail.com', NULL, '$2y$10$vyRJAmvPeaSH8plSNyXL3uPee6yE.56LhA4NJk9eQdg/IO9qh9yki', NULL, '2022-11-26 08:54:09', '2022-11-26 08:59:27'),
(2, 'দুষ্টু░জীন░', 'মারিয়াম░', 'user/dp/2022/11/371UbsMo28x0xndFXc9QZvvPdhx3my0W9JlutD2V.gif', 'user/cp/2022/11/y1Ao7A2qqZIjhsAagTxjJPWbxOFg0kj4SEo9Swo2.jpg', '0550-06-05', 'F', '+8801688874598', 'armana@gmail.com', NULL, '$2y$10$Eq..OmBwL/5p7Gvl8f9YTe5YQGT8/ACJMoFgCZ/YzddXVCeWXMFNS', NULL, '2022-11-26 09:01:14', '2022-11-26 09:19:25');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
