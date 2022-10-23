-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2022 at 05:19 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `latihanlaravel`
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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(1, '1.2022_09_25_074106_create_tb_divisions_table', 1),
(2, '2.2022_09_25_074026_create_tb_users_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '3.2022_09_25_074113_create_tb_polls_table', 1),
(8, '4.2022_09_25_074126_create_tb_choices_table', 1),
(9, '5.2022_09_25_074120_create_tb_votes_table', 1);

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
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_choices`
--

CREATE TABLE `tb_choices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `choice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poll_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_choices`
--

INSERT INTO `tb_choices` (`id`, `choice`, `poll_id`, `created_at`, `updated_at`) VALUES
(1, 'nopal', 1, '2022-10-19 17:53:50', '2022-10-19 17:53:50'),
(2, 'nurgiavany', 1, '2022-10-19 17:53:50', '2022-10-19 17:53:50'),
(3, 'iqbal', 1, '2022-10-19 17:53:51', '2022-10-19 17:53:51'),
(4, 'hendy', 1, '2022-10-19 17:53:51', '2022-10-19 17:53:51'),
(5, 'ayu', 2, '2022-10-19 18:25:29', '2022-10-19 18:25:29'),
(6, 'fauzi', 2, '2022-10-19 18:25:29', '2022-10-19 18:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `tb_divisions`
--

CREATE TABLE `tb_divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_divisions`
--

INSERT INTO `tb_divisions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Keuangan', '2022-10-20 00:03:08', '2022-10-20 00:03:08'),
(2, 'Kesehatan', '2022-10-20 00:03:19', '2022-10-20 00:03:19');

-- --------------------------------------------------------

--
-- Table structure for table `tb_polls`
--

CREATE TABLE `tb_polls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` datetime NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_polls`
--

INSERT INTO `tb_polls` (`id`, `title`, `description`, `deadline`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pemilihan Ketua Kelas', 'Ini ada poll pemilihan ketua kelas di kelas 12 rpl 1', '2022-10-19 07:52:48', 1, '2022-10-19 17:53:50', '2022-10-19 17:53:50', NULL),
(2, 'Pemilihan Ketua osis', 'Ini ada poll pemilihan ketua osis', '2022-10-26 07:52:48', 1, '2022-10-19 18:25:29', '2022-10-19 18:25:29', NULL),
(4, 'das', 'asd', '2022-10-17 10:20:40', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `username`, `password`, `role`, `created_at`, `updated_at`, `division_id`) VALUES
(1, 'rizky', '$2y$10$3NoMdKkLXOfx1hlYXKVZAeUujBi4ByNWqYBaGRh2l2E9LmMnX69h6', 'admin', '2022-10-19 17:04:27', '2022-10-19 17:33:02', 1),
(2, 'ananda', '$2y$10$6L1.GnrtREy39Aqu1i1houWgCF56UHAQy.Rjrn8dQTKnJR49nt05.', 'user', '2022-10-19 17:05:27', '2022-10-19 17:05:27', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_votes`
--

CREATE TABLE `tb_votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `choice_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `poll_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `divisions_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_votes`
--

INSERT INTO `tb_votes` (`id`, `choice_id`, `user_id`, `poll_id`, `created_at`, `updated_at`, `divisions_id`) VALUES
(1, 4, 1, 1, '2022-10-20 01:05:30', '2022-10-20 01:05:30', 1),
(2, 4, 2, 1, '2022-10-20 01:08:11', '2022-10-20 01:08:11', 2),
(3, 6, 2, 2, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `tb_choices`
--
ALTER TABLE `tb_choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_choices_poll_id_foreign` (`poll_id`);

--
-- Indexes for table `tb_divisions`
--
ALTER TABLE `tb_divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_polls`
--
ALTER TABLE `tb_polls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_polls_created_by_foreign` (`created_by`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_users_division_id_foreign` (`division_id`);

--
-- Indexes for table `tb_votes`
--
ALTER TABLE `tb_votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_votes_choice_id_foreign` (`choice_id`),
  ADD KEY `tb_votes_user_id_foreign` (`user_id`),
  ADD KEY `tb_votes_poll_id_foreign` (`poll_id`),
  ADD KEY `tb_votes_divisions_id_foreign` (`divisions_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_choices`
--
ALTER TABLE `tb_choices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_divisions`
--
ALTER TABLE `tb_divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_polls`
--
ALTER TABLE `tb_polls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_votes`
--
ALTER TABLE `tb_votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_choices`
--
ALTER TABLE `tb_choices`
  ADD CONSTRAINT `tb_choices_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `tb_polls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_polls`
--
ALTER TABLE `tb_polls`
  ADD CONSTRAINT `tb_polls_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `tb_users_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `tb_divisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_votes`
--
ALTER TABLE `tb_votes`
  ADD CONSTRAINT `tb_votes_choice_id_foreign` FOREIGN KEY (`choice_id`) REFERENCES `tb_choices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_votes_divisions_id_foreign` FOREIGN KEY (`divisions_id`) REFERENCES `tb_divisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_votes_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `tb_polls` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
