-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 12, 2023 at 02:57 PM
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_11_25_125153_create_posts_table', 1),
(6, '2022_12_10_123825_create_pages_table', 1),
(7, '2022_12_10_125441_create_page_posts_table', 1);

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
(2, '1', 'cp', 'May the force be with you!!!', 'user/photos/cp/2022/12/t0ytGV4gsMcXk2CeAh3xwQBYD8HQJtZxHNJlZ8XA.jpg', '2022-12-12 10:43:33', '2022-12-12 10:43:56'),
(3, '1', 'generalposts', 'Amazing game between USA and England yesterday!! ⚽⚽ Absolutely Loved it 🧡🧡 🏆🏆', 'user/photos/generalposts/2022/12/CZhuKWBvtwzDHltsDn1dVEn6uKjr6tH1QsARlKoa.jpg', '2022-12-12 10:44:28', '2022-12-12 10:44:28'),
(4, '1', 'generalposts', 'One of my favorite footballers of all time 👑 CR7 👑', 'user/photos/generalposts/2022/12/a0SS3JIf1IBHnEu3JvWCgcHI9xJMDBxtc7Z28ZbC.jpg', '2022-12-12 10:44:45', '2022-12-12 10:44:45'),
(5, '1', 'generalposts', 'Ohh football!! What did you do! 😥😥', 'user/photos/generalposts/2022/12/aNKvulpxid4XYJi9PGyStqxcj4427GS4HqvBMrxO.webp', '2022-12-12 10:46:04', '2022-12-12 10:46:04'),
(6, '1', 'generalposts', 'ডিসেম্বরের শহরে ......', 'user/photos/generalposts/2022/12/uAbgPop1bnRqBQG3ayaVuUeFCz41mvSZzeLspCP1.jpg', '2022-12-12 10:48:34', '2022-12-12 10:49:23'),
(7, '2', 'dp', 'dp', 'user/photos/dp/2022/12/uWtqFvO4SCo8t4uStRpFwbv79P1Wo50hkoJcypmF.gif', '2022-12-12 10:51:06', '2022-12-12 10:51:06'),
(8, '2', 'cp', 'Beauty is toxic', 'user/photos/cp/2022/12/jHrXbrsZbvwdkHsZHRnE4kJuTgAG3cEb38ExHfE5.jpg', '2022-12-12 10:51:29', '2022-12-12 10:51:52'),
(9, '2', 'generalposts', 'Been wonderin\' if your heart\'s still open\r\nAnd if so, I wanna know what time it shuts 🎧 🎵', 'user/photos/generalposts/2022/12/y0eoNT0cT3IyMUiGRnmcAkbZq7haVBIR6fFthZqk.jpg', '2022-12-12 10:52:42', '2022-12-12 10:52:42'),
(10, '2', 'generalposts', 'Baby Yoda 🤭🤭', 'user/photos/generalposts/2022/12/FF4ZqjzeJpAb57n8s3TTJFV2VhFg9kaKAiZEt9HL.jpg', '2022-12-12 10:53:14', '2022-12-12 10:53:14'),
(11, '2', 'generalposts', 'Is North-End open today? Can anyone give me this information?', NULL, '2022-12-12 10:53:41', '2022-12-12 10:53:41'),
(12, '5', 'dp', 'dp', 'user/photos/dp/2022/12/g5txEi4f5YM1iqiJdV2W5cHY19ZcFRsmzuKXsthv.jpg', '2022-12-12 10:55:46', '2022-12-12 10:55:46'),
(13, '5', 'cp', 'cp', 'user/photos/cp/2022/12/Lc4TEbUTaT10XmuiEUjMJAGFcgOeD9ZJeu27tLK5.jpg', '2022-12-12 10:56:20', '2022-12-12 10:56:20'),
(14, '5', 'generalposts', 'How is my new hair color??', 'user/photos/generalposts/2022/12/KIWbQ24UC4vOKbm2K1EIC62j7SZ37qbRCdQRM41g.webp', '2022-12-12 10:56:38', '2022-12-12 10:56:38'),
(15, '10', 'dp', 'dp', 'user/photos/dp/2022/12/EoJeeE5DBfkJVjVWHCk9IsdGbGGtXbibYey7uYGC.jpg', '2022-12-12 10:57:28', '2022-12-12 10:57:28'),
(16, '10', 'cp', 'cp', 'user/photos/cp/2022/12/8nSEoAar3kmz5leoFKZfXpkXKvLefTNpqOrT6M7X.jpg', '2022-12-12 10:57:47', '2022-12-12 10:57:47'),
(17, '10', 'generalposts', 'আমার ড্রাগনটা সকাল থেকে খাওয়া দাওয়া করতেসে না। খুবই অসুস্থ হয়ে পরেছে। কারোও কাছে পরিচিত পেটক্লিনিকের নাম্বার থাকলে প্লিজ কমেন্ট করে জানাবেন প্লিজ 😭😭', 'user/photos/generalposts/2022/12/EnC5UiIo2nZ1SXYz8DeeuRGUY6exJ99XkgStqmRO.jpg', '2022-12-12 10:58:11', '2022-12-12 10:58:11'),
(18, '10', 'generalposts', 'Yesss, Bangladesh won!!!', 'user/photos/generalposts/2022/12/7cFOeMDBy4E3j2oi0oIuoAVQa5Hp78H2q8No5FPo.jpg', '2022-12-12 10:58:45', '2022-12-12 10:58:45'),
(19, '11', 'dp', 'dp', 'user/photos/dp/2022/12/sLtSTc40tHN5NlyTxN2DJo8CAqhoC4BxOCvv2bRE.jpg', '2022-12-12 11:01:31', '2022-12-12 11:01:31'),
(20, '11', 'cp', 'cp', 'user/photos/cp/2022/12/OSh7fN6u1xeUHf2zL7MbQMElNQZfa66dQMXhf0Qr.png', '2022-12-12 11:02:52', '2022-12-12 11:02:52'),
(21, '11', 'dp', 'dp', 'user/photos/dp/2022/12/kJ67SQ0U9c7cOoUlLI4nfUSFxu6fuhBnudsvFNMe.jpg', '2022-12-12 11:03:40', '2022-12-12 11:03:40'),
(22, '11', 'generalposts', 'Crossout is my new favorite game!!!', 'user/photos/generalposts/2022/12/nP8dDDtlpkDboXepaVibOViXQQ4u4v8OpJueLAdL.jpg', '2022-12-12 11:04:23', '2022-12-12 11:04:23'),
(23, '11', 'generalposts', 'Which magic carpet should I bring out today? Black one or red one? Let me know in the comments guys', NULL, '2022-12-12 11:05:02', '2022-12-12 11:05:02'),
(25, '4', 'dp', 'dp', 'user/photos/dp/2022/12/nCsXxBBWV19alEeU6UByNvNigWXV8qZvywu0vuRZ.webp', '2022-12-12 11:05:58', '2022-12-12 11:05:58'),
(26, '4', 'cp', 'cp', 'user/photos/cp/2022/12/vWQYYcKJF5DPASpTLkgEaeUqg22YXbDIwgapL1Ey.jpg', '2022-12-12 11:06:13', '2022-12-12 11:06:13'),
(27, '4', 'generalposts', 'My grandfather in his natural habitat !! Miss you grandpa 😥😥😥', 'user/photos/generalposts/2022/12/VAQpSSDaOtF66j8BqDk6PtY1HLLV1pJxrDroVVog.jpg', '2022-12-12 11:06:53', '2022-12-12 11:06:53'),
(28, '3', 'dp', 'dp', 'user/photos/dp/2022/12/Vf31SoxakqrKjT4xexHeMXme8Jlx5WhCWgGeznyn.jpg', '2022-12-12 11:07:59', '2022-12-12 11:07:59'),
(30, '3', 'dp', 'dp', 'user/photos/dp/2022/12/mdwuvoVOmplDggurDeMmcyFkJDvPZTdxSwgpUL3R.jpg', '2022-12-12 11:11:07', '2022-12-12 11:11:07'),
(31, '3', 'generalposts', 'My relatives from a film they starred in called \"ভূতের রাজা দিল বড়\"', 'user/photos/generalposts/2022/12/0ButbDklNBXLXAx3EBFru3ws6KV2IFyiw5MQclIc.jpg', '2022-12-12 11:12:53', '2022-12-12 11:12:53'),
(32, '3', 'generalposts', 'এটা ঢাকা কোথায় পাবো? Thanks in advance', 'user/photos/generalposts/2022/12/XVU3F061GRvoopm3hEHUU3V95uB1SI8mk6ZX7m0Y.jpg', '2022-12-12 11:14:15', '2022-12-12 11:14:15'),
(33, '1', 'dp', 'dp', 'user/photos/dp/2022/12/KyAlvIpRuRkRkechYkGl0GbXoZjAN38FgJ36iuwj.jpg', '2022-12-12 11:14:57', '2022-12-12 11:14:57'),
(34, '6', 'dp', 'dp', 'user/photos/dp/2022/12/YjRTbnt6QhYsEys41tifOx9Pv6xOUgdHz2DjsYF6.jpg', '2022-12-12 11:16:30', '2022-12-12 11:16:30'),
(35, '6', 'cp', 'cp', 'user/photos/cp/2022/12/agTtBT0SZAb4Pas4lKnV5BVwM2bRChX48FpsbPm1.jpg', '2022-12-12 11:16:48', '2022-12-12 11:16:48'),
(36, '3', 'cp', 'cp', 'user/photos/cp/2022/12/GvAJTN9dk4mS7mTrHhXgOTS6H0tD2elwsRPk2UAx.jpg', '2022-12-12 11:18:54', '2022-12-12 11:18:54'),
(37, '7', 'dp', 'dp', 'user/photos/dp/2022/12/DEexJIxDxZcrBdXZ6DfutMivQSSGF2Y5tbinMrVY.jpg', '2022-12-12 11:19:40', '2022-12-12 11:19:40'),
(38, '7', 'cp', 'cp', 'user/photos/cp/2022/12/nacW1eFRmz3NbOvssQYJumZISrvJPzIJ7jf6sqwU.jpg', '2022-12-12 11:20:14', '2022-12-12 11:20:14'),
(39, '7', 'generalposts', 'Is this cute or not?', 'user/photos/generalposts/2022/12/sQGgtI6ssqYLniPe7DilLOa29kJd9x4or0HfWsXP.webp', '2022-12-12 11:20:59', '2022-12-12 11:20:59'),
(40, '8', 'dp', 'dp', 'user/photos/dp/2022/12/M6QRSjFQOEsa5xrisFY79eIljlpHRsWr9B5gjVDy.webp', '2022-12-12 11:22:17', '2022-12-12 11:22:17'),
(41, '8', 'cp', 'cp', 'user/photos/cp/2022/12/NImHhFNOfgrApjMQCbsIVIS9h4qba2UejLHBONjQ.jpg', '2022-12-12 11:22:35', '2022-12-12 11:22:35'),
(42, '8', 'generalposts', 'Back to my earth crib after 1400 years. Apparently the meat smells the same!!', 'user/photos/generalposts/2022/12/WnJEi0lJEPQBuLMa5OgmPhQ1qPTflrUHdCx0JbvI.webp', '2022-12-12 11:22:53', '2022-12-12 11:22:53'),
(43, '9', 'dp', 'dp', 'user/photos/dp/2022/12/vfa7qiXh70RXOGu68NyuGSyVBtVGwjff49BoCY9c.jpg', '2022-12-12 11:23:53', '2022-12-12 11:23:53'),
(44, '9', 'cp', 'cp', 'user/photos/cp/2022/12/odyWjhOKCViuuqISlFDQe7oUt3SywlkGo2Gqr91m.jpg', '2022-12-12 11:24:12', '2022-12-12 11:24:12'),
(45, '9', 'generalposts', 'Cool right?', 'user/photos/generalposts/2022/12/RZwJxiW2Hs1ZYRsUVqCxLIso7PbZmeUfn1CPBQCV.jpg', '2022-12-12 11:24:42', '2022-12-12 11:24:42'),
(46, '6', 'generalposts', 'আমাদের হলের প্রানপ্রিয় বড় ভাই এরশাদ কে কোহকাফ থানা জ্বীনলীগের সহসভাপতি পদে ভোট দিন', 'user/photos/generalposts/2022/12/D7SP9FwLibnFMFHhplZM9CxW7JMoiVRu2db0iqJU.jpg', '2022-12-12 11:30:31', '2022-12-12 11:30:31'),
(47, '11', 'generalposts', 'How is my painting??', 'user/photos/generalposts/2022/12/BIqJawsiXSS4m6eoiEYiO5fXeI5V0ijb3ko1NNh3.webp', '2022-12-12 11:31:13', '2022-12-12 11:31:13'),
(48, '9', 'generalposts', 'My great grandfather with his pet human!!!', 'user/photos/generalposts/2022/12/GzQc7A3D7G5iPFb5hxZUP8AMMCCvY30LwIk8dixl.webp', '2022-12-12 11:32:28', '2022-12-12 11:32:28'),
(49, '2', 'generalposts', 'I hear voices in my head', 'user/photos/generalposts/2022/12/w5QBUxIHQfWtPtFTAHdZBHVDZ4OstlUWc0aYTGhM.jpg', '2022-12-12 11:33:03', '2022-12-12 11:33:03'),
(50, '3', 'generalposts', 'Well said', 'user/photos/generalposts/2022/12/hzxgtvKboFpRP7tKyD78Ht1EJddk4DkqDCTljQ08.jpg', '2022-12-12 11:33:38', '2022-12-12 11:33:38');

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
  `addedfriends` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pendingfriends` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `dp`, `cp`, `dob`, `gender`, `mobile`, `email`, `email_verified_at`, `password`, `addedfriends`, `pendingfriends`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '𝔍𝔦𝔫𝔫 𝔢𝔯', '𝔅𝔞𝔡𝔰𝔥𝔞𝔥', 'user/dp/2022/12/KyAlvIpRuRkRkechYkGl0GbXoZjAN38FgJ36iuwj.jpg', 'user/cp/2022/12/t0ytGV4gsMcXk2CeAh3xwQBYD8HQJtZxHNJlZ8XA.jpg', '0500-11-21', 'M', '+8801715085046', 'sami@gmail.com', NULL, '$2y$10$UQKgURfvg2XMJXTSu5F.l.TC7SKRyGOAwVAgDf9NZiFatU54zWWQC', '7,5,4,2,', '9,9,8,11,', NULL, '2022-12-12 10:21:32', '2023-01-06 12:32:52'),
(2, 'দুষ্টু░জীন░', 'মারিয়াম░', 'user/dp/2022/12/uWtqFvO4SCo8t4uStRpFwbv79P1Wo50hkoJcypmF.gif', 'user/cp/2022/12/jHrXbrsZbvwdkHsZHRnE4kJuTgAG3cEb38ExHfE5.jpg', '0500-06-05', 'F', '+8801687789654', 'mariam@gmail.com', NULL, '$2y$10$mk8BKViVbHV1uV0VSVZtNODaP6oM14FihiZhFcV3tfhbxg.wMa7lS', '1,', '', NULL, '2022-12-12 10:32:16', '2023-01-06 12:29:45'),
(3, 'Kԋαɳ', 'Jιɳɳ', 'user/dp/2022/12/mdwuvoVOmplDggurDeMmcyFkJDvPZTdxSwgpUL3R.jpg', 'user/cp/2022/12/GvAJTN9dk4mS7mTrHhXgOTS6H0tD2elwsRPk2UAx.jpg', '0500-12-27', 'F', '+8801756547892', 'tonwy@gmail.com', NULL, '$2y$10$ivSVdf1vr1H3Aduf34WRMO11v/F6CzrUsmJqCeWCYy7/fruKuvcDe', '', '', NULL, '2022-12-12 10:33:45', '2023-01-06 12:32:42'),
(4, 'Č𝐫𝐀ŽЎ 𝐣Ꭵ𝓃𝐧', 'Ⓐ𝓁ｆ𝕚', 'user/dp/2022/12/nCsXxBBWV19alEeU6UByNvNigWXV8qZvywu0vuRZ.webp', 'user/cp/2022/12/vWQYYcKJF5DPASpTLkgEaeUqg22YXbDIwgapL1Ey.jpg', '0500-01-01', 'M', '+8801817788542', 'alfi@gmail.com', NULL, '$2y$10$JsjMqBGpNCRWfHINvXBAKOTYoOXRhtDv4ydSrKWH/MD/Qag092Tnq', '1,', '', NULL, '2022-12-12 10:34:34', '2023-01-06 12:30:16'),
(5, 'Nowshin', 'Tasjinn', 'user/dp/2022/12/g5txEi4f5YM1iqiJdV2W5cHY19ZcFRsmzuKXsthv.jpg', 'user/cp/2022/12/Lc4TEbUTaT10XmuiEUjMJAGFcgOeD9ZJeu27tLK5.jpg', '0500-10-21', 'F', '+8801687789654', 'nowshin@gmail.com', NULL, '$2y$10$nw4MD9NNv/MSnNlWFIyqQOmNDanpyVkZZZQYAVk2UPuue/KmQrKI6', '1,', '', NULL, '2022-12-12 10:35:18', '2023-01-06 12:30:45'),
(6, 'AL', 'Fajinn', 'user/dp/2022/12/YjRTbnt6QhYsEys41tifOx9Pv6xOUgdHz2DjsYF6.jpg', 'user/cp/2022/12/agTtBT0SZAb4Pas4lKnV5BVwM2bRChX48FpsbPm1.jpg', '0500-03-18', 'M', '+8801789664569', 'fahim@gmail.com', NULL, '$2y$10$85agST/nUkcj88JWlQIyFOe.8SZYfrHPZ4KUskEiAK1kVvhwHgNr6', '', '', NULL, '2022-12-12 10:36:03', '2023-01-06 12:32:49'),
(7, 'Mubashshira', 'Jinnman', 'user/dp/2022/12/DEexJIxDxZcrBdXZ6DfutMivQSSGF2Y5tbinMrVY.jpg', 'user/cp/2022/12/nacW1eFRmz3NbOvssQYJumZISrvJPzIJ7jf6sqwU.jpg', '0500-06-20', 'F', '+8801756698456', 'samantha@gmail.com', NULL, '$2y$10$zIwmkHtujT.nmGK1zG/EP.qR5tyRKUN.2.KC4DmdMcxoeJtiAYKdW', '1,', '', NULL, '2022-12-12 10:36:42', '2023-01-06 12:32:52'),
(8, 'Saidur', 'Rahjinn', 'user/dp/2022/12/M6QRSjFQOEsa5xrisFY79eIljlpHRsWr9B5gjVDy.webp', 'user/cp/2022/12/NImHhFNOfgrApjMQCbsIVIS9h4qba2UejLHBONjQ.jpg', '0150-09-21', 'M', '+8801997784562', 'saidur@gmail.com', NULL, '$2y$10$uTlBznLKaMe8HM/Ex/Tp2.FkT815vkmpv3hb7s24mqfQT31Bj/7y6', '', '', NULL, '2022-12-12 10:37:33', '2023-01-06 11:53:23'),
(9, 'Sadia', 'Afjinnroz', 'user/dp/2022/12/vfa7qiXh70RXOGu68NyuGSyVBtVGwjff49BoCY9c.jpg', 'user/cp/2022/12/odyWjhOKCViuuqISlFDQe7oUt3SywlkGo2Gqr91m.jpg', '0150-08-05', 'F', '+8801818874521', 'mili@gmail.com', NULL, '$2y$10$t4Hn6Nyz7P/eAppF2xIrP.jS1LXI3/3yG6jc4hoK7/d29DKRPCVw.', '', '', NULL, '2022-12-12 10:38:21', '2023-01-06 11:55:38'),
(10, 'Anika', 'Anjinn Sadia', 'user/dp/2022/12/EoJeeE5DBfkJVjVWHCk9IsdGbGGtXbibYey7uYGC.jpg', 'user/cp/2022/12/8nSEoAar3kmz5leoFKZfXpkXKvLefTNpqOrT6M7X.jpg', '0500-02-18', 'F', '+8801789965478', 'sadia@gmail.com', NULL, '$2y$10$us9BHgxFj3CAAxg3Ymn1Dek4u9zMCnnR/OjsyXJddxkBYSyE91Y/a', '', '', NULL, '2022-12-12 10:39:01', '2023-01-06 12:32:45'),
(11, 'Sadman', 'Ajinn', 'user/dp/2022/12/kJ67SQ0U9c7cOoUlLI4nfUSFxu6fuhBnudsvFNMe.jpg', 'user/cp/2022/12/OSh7fN6u1xeUHf2zL7MbQMElNQZfa66dQMXhf0Qr.png', '0500-10-08', 'M', '+8801789965456', 'adil@gmail.com', NULL, '$2y$10$6w8aUnN5aRg1c1ih24lKp.jcYmoJGw5tMnhxizEK2.tdErlS6.0pK', '', '', NULL, '2022-12-12 10:39:39', '2022-12-16 09:15:28');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
