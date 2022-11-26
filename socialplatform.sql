-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2022 at 09:22 AM
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
(22, '2014_10_12_000000_create_users_table', 1),
(23, '2014_10_12_100000_create_password_resets_table', 1),
(24, '2019_08_19_000000_create_failed_jobs_table', 1),
(25, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(26, '2022_11_25_125153_create_posts_table', 1);

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
(1, '1', 'cp', 'cp', 'user/photos/cp/2022/11/GHkB8FSQhK8Z9G9nigkbKYmQl351g2F3NXJj2AAe.jpg', '2022-11-26 01:42:12', '2022-11-26 01:42:12'),
(2, '1', 'dp', 'dp', 'user/photos/dp/2022/11/BRcvb1hf1mUG2vkTXdrcuc1FDPgxEnFEB7nMHzVs.webp', '2022-11-26 01:42:26', '2022-11-26 01:42:26'),
(3, '1', 'generalposts', 'Watched the game between England and USA last night!!! ⚽⚽ Amazing football all around. 🤩🤩 Sadly it ended in a draw. 😭', 'user/photos/generalposts/2022/11/hpO5IaDZsbc5CrdppswyvYOzq7fP6vRpNy6g7rzu.jpg', '2022-11-26 01:43:51', '2022-11-26 01:43:51'),
(4, '1', 'cp', 'cp', 'user/photos/cp/2022/11/Ptoe7eMIz9YSZiB8p9f8gAZRHw65gWahYISowLfw.jpg', '2022-11-26 03:14:07', '2022-11-26 03:14:07'),
(5, '2', 'generalposts', 'আমার পোষা ড্রাগনটা আজকে সকাল থেকেই খুব অসুস্থ। 😭😭 খাওয়া দাওয়া বন্ধ করে দিসে একেবারে। কারোও কাছে পরিচিত পেটক্লিনিকের নাম্বার থাকলে প্লিজ কমেন্ট করে জানাও!!', 'user/photos/generalposts/2022/11/grft7hdZcuZO8tw9FpKWHjZp1wdAjFhNVnlfeZL2.jpg', '2022-11-26 03:18:17', '2022-11-26 03:18:17'),
(6, '2', 'dp', 'dp', 'user/photos/dp/2022/11/MBAegS9tlECX7zuOobv53bDy8TwVNvGLlpECMDmj.gif', '2022-11-26 03:18:32', '2022-11-26 03:18:32'),
(7, '2', 'cp', 'cp', 'user/photos/cp/2022/11/Zsw3zeNIEfG6ReTOuT5Nwzp4tBXl8A060GeYvaPy.jpg', '2022-11-26 03:18:42', '2022-11-26 03:18:42'),
(8, '2', 'generalposts', 'Hi everyone, how are you all?? 😄😄 Who is excited for the Argentina Vs Mexico match? 🔥🔥', NULL, '2022-11-26 03:19:53', '2022-11-26 03:19:53');

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
(1, '𝔍𝔦𝔫𝔫 𝔢𝔯', '𝔅𝔞𝔡𝔰𝔥𝔞', 'user/dp/2022/11/BRcvb1hf1mUG2vkTXdrcuc1FDPgxEnFEB7nMHzVs.webp', 'user/cp/2022/11/Ptoe7eMIz9YSZiB8p9f8gAZRHw65gWahYISowLfw.jpg', '0500-11-21', 'M', '+8801715085046', 'sami@gmail.com', NULL, '$2y$10$XfkoYP5mQjKPiPV2OSiVaOPUChIf6fXhYwuN0WusJsZjmDb7y2JRG', NULL, '2022-11-26 01:37:50', '2022-11-26 03:14:07'),
(2, 'দুষ্টু░জীন░', 'মারিয়াম░', 'user/dp/2022/11/MBAegS9tlECX7zuOobv53bDy8TwVNvGLlpECMDmj.gif', 'user/cp/2022/11/Zsw3zeNIEfG6ReTOuT5Nwzp4tBXl8A060GeYvaPy.jpg', '0550-06-05', 'F', '+8801689874561', 'armana@gmail.com', NULL, '$2y$10$FUFP.PMV0eFqrqPfnzGH/e1eyLsziWQ6eyJ/izAMGX4hujUf1DqUe', NULL, '2022-11-26 03:16:11', '2022-11-26 03:18:42');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
