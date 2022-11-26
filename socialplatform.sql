-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2022 at 05:16 AM
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
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(21, '2022_11_25_125153_create_posts_table', 2);

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
  `desc` text COLLATE utf8mb4_unicode_ci,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `userid`, `posttype`, `desc`, `img`, `created_at`, `updated_at`) VALUES
(36, '3', 'dp', NULL, 'user/photos/dp/2022/11/c7NTbFwoNjhmvKYN6OmS9ymYOWmRiIHU4UDX6MWs.webp', '2022-11-25 23:02:38', '2022-11-25 23:02:38'),
(37, '3', 'cp', NULL, 'user/photos/cp/2022/11/xcSumW3Q6T3MqKAa9o1P6XGJQ6Qjumz0zNlfVRDq.jpg', '2022-11-25 23:03:07', '2022-11-25 23:03:07'),
(38, '3', 'generalposts', 'What an exciting game between England VS Usa. Absolutely Loved it!!', 'user/photos/generalposts/2022/11/muQmUWlM6o3OOuqwObsJsYj17uGkYWDkAGFYIWJ3.jpg', '2022-11-25 23:03:42', '2022-11-25 23:03:42'),
(39, '3', 'generalposts', 'আব্বা, পাঁচ-দশ টাকা দামের ১৫ টাকার মধ্যে একটি করে খানা খাওয়াতে হবে জিনদের। বাজান, এই খানা খাওয়ানোর সঙ্গে সঙ্গেই সম্পদ তোর হাতে তুলে দেয়া হবে', NULL, '2022-11-25 23:05:14', '2022-11-25 23:05:14'),
(40, '4', 'generalposts', 'আমার পোষা ড্রাগনটা সকাল থেকে কিছু খাচ্ছেনা।😭😭 কারোও কাছে পরিচিত কোন পেটক্লিনিক এর নাম্বার থাকলে প্লিজ জানাও আমাকে!!', 'user/photos/generalposts/2022/11/mHueHejufbOgpbgGSzl7K9Br7Q1GW2EVwkIvZeE5.jpg', '2022-11-25 23:13:50', '2022-11-25 23:13:50'),
(41, '4', 'cp', NULL, 'user/photos/cp/2022/11/yHygR866KbjhOkkiZDYiMV4YRZHSd3oy0rYdXnLW.webp', '2022-11-25 23:14:39', '2022-11-25 23:14:39'),
(42, '4', 'dp', NULL, 'user/photos/dp/2022/11/caxBhANkT28M8LKlTQoABGWQSRVCZybUAMhyqCxn.gif', '2022-11-25 23:14:47', '2022-11-25 23:14:47'),
(43, '4', 'generalposts', 'Hi guys, How are you all?  😎😎', NULL, '2022-11-25 23:15:20', '2022-11-25 23:15:20'),
(44, '4', 'cp', NULL, 'user/photos/cp/2022/11/o0isS3KKgkFVSfusDWzezCfDzL7G0DNv3MV5rbuq.jpg', '2022-11-25 23:15:40', '2022-11-25 23:15:40');

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
(3, '𝔍𝔦𝔫𝔫 𝔢𝔯', '𝔟𝔞𝔡𝔰𝔥𝔞𝔥', 'user/dp/2022/11/c7NTbFwoNjhmvKYN6OmS9ymYOWmRiIHU4UDX6MWs.webp', 'user/cp/2022/11/xcSumW3Q6T3MqKAa9o1P6XGJQ6Qjumz0zNlfVRDq.jpg', '0500-11-21', 'M', '+8801746547899', 'sami@gmail.com', NULL, '$2y$10$vF8bda1WOGL4dP2hqmR/9eiH3RJSYgLoxi/7a2v6tyHNpfThAZ0Be', NULL, '2022-11-25 23:01:56', '2022-11-25 23:11:03'),
(4, 'দুষ্টু░জীন░', 'মারিয়াম░', 'user/dp/2022/11/caxBhANkT28M8LKlTQoABGWQSRVCZybUAMhyqCxn.gif', 'user/cp/2022/11/o0isS3KKgkFVSfusDWzezCfDzL7G0DNv3MV5rbuq.jpg', '0650-06-05', 'F', '+8801457789654', 'armana@gmail.com', NULL, '$2y$10$lCY.QGaKlE5lvJQGx8GOL.Eu3eERNT6DBgehTg20TdicsCqgu7tqC', NULL, '2022-11-25 23:09:01', '2022-11-25 23:15:40');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
