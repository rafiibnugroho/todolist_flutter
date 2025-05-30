-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 30, 2025 at 02:49 PM
-- Server version: 8.4.0
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todolist_api_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '0001_01_01_000000_create_users_table', 1),
(9, '0001_01_01_000001_create_cache_table', 2),
(10, '0001_01_01_000002_create_jobs_table', 2),
(11, '2025_05_23_013249_create_tasks_table', 2),
(12, '2025_05_20_143544_pengguna', 3),
(13, '2025_05_20_144158_to-list', 3),
(14, '2025_05_22_130026_create_personal_access_tokens_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'rafi', 'rafi@gmail.com', '$2y$12$Thu5mJklSNOTqjsJ0brPjequJjR63HEp9aPDd04Q9QT7lPEyCIht.', '2025-05-25 06:18:49', '2025-05-25 06:18:49'),
(3, 'aku', 'aku@gmail.com', '$2y$12$ED6Yu1mCTOAwRWYjBJ7YSeVIGXkFABoGbTrpz48IHLfPrsnieDc.2', '2025-05-30 01:31:53', '2025-05-30 01:31:53'),
(4, 'dedi mulyadi', 'dedi@gmail.com', '$2y$12$wwvbN5BAYccgMKFu.mhHReunng5EbYQuAz2onpcWa9uDVpEcHxaBu', '2025-05-30 02:40:44', '2025-05-30 02:40:44'),
(5, 'try', 'try@gmail.com', '$2y$12$mlaryvudsdCOcVX2dQLZd.HaF71M1frQ3bTNhFp5XhMA.Gc.eIP8G', '2025-05-30 05:47:32', '2025-05-30 05:47:32');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Pengguna', 1, 'token-auth', '92a4cc654b0ccd623b6c127242abf1ee7ed3f0da3fa7e3a9cdad3d5012f14eb6', '[\"*\"]', '2025-05-25 06:30:52', NULL, '2025-05-25 06:19:03', '2025-05-25 06:30:52'),
(2, 'App\\Models\\Pengguna', 1, 'token-auth', 'be7ef47d7d2aa5798bd976b5241b0bef767d3cf347e0061e0d9878156e8ba5d5', '[\"*\"]', '2025-05-25 07:24:02', NULL, '2025-05-25 07:23:18', '2025-05-25 07:24:02'),
(3, 'App\\Models\\Pengguna', 1, 'token-auth', '59729854361f58ad6d48a142a238168f35e58ab9790644ca8d49e5acef72181d', '[\"*\"]', '2025-05-25 07:30:05', NULL, '2025-05-25 07:27:53', '2025-05-25 07:30:05'),
(4, 'App\\Models\\Pengguna', 1, 'token-auth', 'c38bde81f1c8652f565d2d9d0485b8cd2f613accb2e13c9c563b6e9bf6e579b0', '[\"*\"]', '2025-05-25 07:33:17', NULL, '2025-05-25 07:33:15', '2025-05-25 07:33:17'),
(5, 'App\\Models\\Pengguna', 1, 'token-auth', 'adaf0e5887796394aecb6f4d6ad646883046595abd20c25e40b5fd8f0d325142', '[\"*\"]', '2025-05-25 07:38:38', NULL, '2025-05-25 07:38:37', '2025-05-25 07:38:38'),
(6, 'App\\Models\\Pengguna', 1, 'token-auth', '1d501b0b67dce616eab4f8edc7d4491dd70cd9314a8cbc7961ff2bfadcd97c83', '[\"*\"]', '2025-05-25 07:43:03', NULL, '2025-05-25 07:43:01', '2025-05-25 07:43:03'),
(7, 'App\\Models\\Pengguna', 1, 'token-auth', 'ed0f4135cd0decf695796d682d39fd1d611d507e1abb328daf6be1962a930330', '[\"*\"]', '2025-05-27 08:44:28', NULL, '2025-05-27 08:43:31', '2025-05-27 08:44:28'),
(8, 'App\\Models\\Pengguna', 1, 'token-auth', 'ff12e001e54d6c0352e91fce46fba543f4f0d0c4a340fa1693f0ea013e8ee999', '[\"*\"]', '2025-05-27 09:02:30', NULL, '2025-05-27 09:02:29', '2025-05-27 09:02:30'),
(9, 'App\\Models\\Pengguna', 1, 'token-auth', '4259e04cbbe89b8f93499030d96e3592003fa45385d983787faf5ed63b5188fe', '[\"*\"]', '2025-05-27 09:35:27', NULL, '2025-05-27 09:35:25', '2025-05-27 09:35:27'),
(10, 'App\\Models\\Pengguna', 1, 'token-auth', 'e0556e0d8af12aa886c5a18e5b39e19e7741473c12db888e60e3af91743e2ae2', '[\"*\"]', '2025-05-27 09:36:00', NULL, '2025-05-27 09:35:59', '2025-05-27 09:36:00'),
(11, 'App\\Models\\Pengguna', 1, 'token-auth', '6a86e1c5cb4a3834bec2ba8e11b88b326cfd910006aeb1f4d6ba3ee343e70a4a', '[\"*\"]', '2025-05-27 09:36:53', NULL, '2025-05-27 09:36:45', '2025-05-27 09:36:53'),
(12, 'App\\Models\\Pengguna', 1, 'token-auth', 'a31f3d262e3ddfb8073efd24f57122e4bbe9dc7770cfb816e59c4e1e71043fae', '[\"*\"]', '2025-05-29 20:13:52', NULL, '2025-05-29 20:13:48', '2025-05-29 20:13:52'),
(13, 'App\\Models\\Pengguna', 1, 'token-auth', '183dd7cf0348a74fac0bca1f2a75a65c29f7f6f36c6c2ef20c659e25c96b411e', '[\"*\"]', '2025-05-29 20:18:37', NULL, '2025-05-29 20:18:11', '2025-05-29 20:18:37'),
(14, 'App\\Models\\Pengguna', 1, 'token-auth', '91f60d3c3f24da0b7eb2ba74d6f9b12fd1a432038d40c85cec4b2e6021c240f3', '[\"*\"]', '2025-05-29 20:19:38', NULL, '2025-05-29 20:18:43', '2025-05-29 20:19:38'),
(15, 'App\\Models\\Pengguna', 1, 'token-auth', '6b2aefe1d0fb5eae7ba4a628cb785d0120ad59ebf3c215ad1164b680d675c38c', '[\"*\"]', '2025-05-29 20:22:41', NULL, '2025-05-29 20:22:41', '2025-05-29 20:22:41'),
(16, 'App\\Models\\Pengguna', 1, 'token-auth', 'eea7d9703298a311c900553fbda261e5e023aaf3afedd9ac68d1b6fd85865a43', '[\"*\"]', '2025-05-29 20:24:23', NULL, '2025-05-29 20:23:54', '2025-05-29 20:24:23'),
(17, 'App\\Models\\Pengguna', 1, 'token-auth', 'b02126b3a99855d68811c3ee1d08666a587313a43a6dda981eb851f658916cc6', '[\"*\"]', '2025-05-29 20:24:55', NULL, '2025-05-29 20:24:54', '2025-05-29 20:24:55'),
(18, 'App\\Models\\Pengguna', 1, 'token-auth', '03e07ac551966cf9ebfa7402cadf30feaedaf0b5e0c845e47fd275b48f02fb32', '[\"*\"]', '2025-05-29 20:26:29', NULL, '2025-05-29 20:26:28', '2025-05-29 20:26:29'),
(19, 'App\\Models\\Pengguna', 1, 'token-auth', '5d577988ec817a1252cc22a9691aeabe809b2ee97e6e8b2027929bd34fa2ec39', '[\"*\"]', '2025-05-29 20:28:18', NULL, '2025-05-29 20:28:17', '2025-05-29 20:28:18'),
(20, 'App\\Models\\Pengguna', 1, 'token-auth', 'e2ef6b18d61360a2346edcbf106810adeceaa3f601871537b27baa3bd97be844', '[\"*\"]', '2025-05-29 20:37:04', NULL, '2025-05-29 20:35:01', '2025-05-29 20:37:04'),
(21, 'App\\Models\\Pengguna', 1, 'token-auth', 'db621e569b67354d9ded2d8653eb0a4589913ec0f05a322c1b34a989718c50c5', '[\"*\"]', '2025-05-29 20:46:08', NULL, '2025-05-29 20:41:17', '2025-05-29 20:46:08'),
(22, 'App\\Models\\Pengguna', 2, 'token-auth', 'f16ea4cace35a5117ea3f9b7620208c6456e35c6fff03b0b087947d40811228c', '[\"*\"]', '2025-05-29 20:49:48', NULL, '2025-05-29 20:49:47', '2025-05-29 20:49:48'),
(23, 'App\\Models\\Pengguna', 2, 'token-auth', 'bd33a054d1b46b3f9ab01ef9fa441632173a3e119f8cb054ab4c0ceceb5170dd', '[\"*\"]', '2025-05-29 20:51:11', NULL, '2025-05-29 20:51:10', '2025-05-29 20:51:11'),
(24, 'App\\Models\\Pengguna', 2, 'token-auth', '32d5350f08dae309e1279b05ea5e96ff4cd24586b759b0dedc1b889e9489a4f5', '[\"*\"]', '2025-05-29 20:53:12', NULL, '2025-05-29 20:52:44', '2025-05-29 20:53:12'),
(25, 'App\\Models\\Pengguna', 1, 'token-auth', 'ec5270693216359497d652101047e09b894259afd5a48096f6d5db418592c395', '[\"*\"]', '2025-05-29 21:07:12', NULL, '2025-05-29 21:07:11', '2025-05-29 21:07:12'),
(26, 'App\\Models\\Pengguna', 1, 'token-auth', '11b4b51161bee3870eed5af9c38dfc75b43928b02ee49a7147a9053bb66c4b71', '[\"*\"]', '2025-05-30 01:40:27', NULL, '2025-05-30 01:40:24', '2025-05-30 01:40:27'),
(27, 'App\\Models\\Pengguna', 1, 'token-auth', '8f3020de4bc87283e1cc7741f97a1ef9fcf8c25d575688e36bdea1cf79fce24b', '[\"*\"]', '2025-05-30 01:42:16', NULL, '2025-05-30 01:42:15', '2025-05-30 01:42:16'),
(28, 'App\\Models\\Pengguna', 1, 'token-auth', 'd64e150392ec6f4a8648c418c1f253eda2ae6fc32f29e7e7e9c8d805729b661e', '[\"*\"]', '2025-05-30 01:51:35', NULL, '2025-05-30 01:51:20', '2025-05-30 01:51:35'),
(29, 'App\\Models\\Pengguna', 1, 'token-auth', '94e398c8165547d93f7cb9a904f0b6519a366129aaca2d2850ef42feb7107b11', '[\"*\"]', '2025-05-30 01:54:25', NULL, '2025-05-30 01:54:24', '2025-05-30 01:54:25'),
(30, 'App\\Models\\Pengguna', 1, 'token-auth', '58e820ffdf6de3328bb10ebd6572e759cd097fd4dc716619e24eca4f9065efb5', '[\"*\"]', '2025-05-30 01:55:22', NULL, '2025-05-30 01:55:21', '2025-05-30 01:55:22'),
(31, 'App\\Models\\Pengguna', 1, 'token-auth', '234df920ead892db359fee6cafbaeee93cec2a33f85b98c84b8f1ba31dd2324a', '[\"*\"]', '2025-05-30 01:58:09', NULL, '2025-05-30 01:58:08', '2025-05-30 01:58:09'),
(32, 'App\\Models\\Pengguna', 1, 'token-auth', '5b3d069534aea8ebf2c51280867cb2e3c970fa42acdd4d2425ea7114f3bb70fd', '[\"*\"]', '2025-05-30 02:01:34', NULL, '2025-05-30 02:01:33', '2025-05-30 02:01:34'),
(33, 'App\\Models\\Pengguna', 1, 'token-auth', 'df75e247b962d698d63d8e0136560fdf68a0179cd0e6a91c9932a0a4a3462e88', '[\"*\"]', '2025-05-30 02:01:54', NULL, '2025-05-30 02:01:53', '2025-05-30 02:01:54'),
(34, 'App\\Models\\Pengguna', 1, 'token-auth', '451760bd6a7610482a8e40e613e96326edb5dd87c1d2173051c7b9aba8de10e4', '[\"*\"]', '2025-05-30 02:09:31', NULL, '2025-05-30 02:09:00', '2025-05-30 02:09:31'),
(35, 'App\\Models\\Pengguna', 1, 'token-auth', 'cdb50971565584313898a1d615e9e1d453ca066b90ecb9b551ac46f7e523898e', '[\"*\"]', '2025-05-30 02:11:35', NULL, '2025-05-30 02:11:34', '2025-05-30 02:11:35'),
(36, 'App\\Models\\Pengguna', 1, 'token-auth', '8071cd1dc6ed7e6a88ff1962d0d94f91aa4a2b16e926fdcfab008a0fbcaae288', '[\"*\"]', '2025-05-30 02:15:42', NULL, '2025-05-30 02:15:41', '2025-05-30 02:15:42'),
(37, 'App\\Models\\Pengguna', 1, 'token-auth', '6a1341e96ed312acf23f509049586fe6007b038580bc5792c6876741cf798e14', '[\"*\"]', '2025-05-30 02:18:40', NULL, '2025-05-30 02:18:39', '2025-05-30 02:18:40'),
(38, 'App\\Models\\Pengguna', 1, 'token-auth', '2f5543966c2b8ed2a8c98544a920a2b7b792ed027206b9a85be41ab8c7a92162', '[\"*\"]', '2025-05-30 02:35:10', NULL, '2025-05-30 02:35:05', '2025-05-30 02:35:10'),
(39, 'App\\Models\\Pengguna', 1, 'token-auth', '85632a95ba4ada75997e9eb5d83b021d9fd36bc412075abe9fdbd5038801aee3', '[\"*\"]', '2025-05-30 02:39:06', NULL, '2025-05-30 02:38:59', '2025-05-30 02:39:06'),
(40, 'App\\Models\\Pengguna', 4, 'token-auth', '473347af7030f64856a30f8910fe1d43e942e2bdd8e322d9bc5a4eb9ee30b9d3', '[\"*\"]', '2025-05-30 02:41:08', NULL, '2025-05-30 02:41:02', '2025-05-30 02:41:08'),
(41, 'App\\Models\\Pengguna', 4, 'token-auth', '88025c02861b5cafb08d9ec060dd9fe7a06e07bd2e9836a19994821611935247', '[\"*\"]', '2025-05-30 02:46:52', NULL, '2025-05-30 02:45:12', '2025-05-30 02:46:52'),
(42, 'App\\Models\\Pengguna', 4, 'token-auth', '1dec1e873fd61fb404baee5f5392702d3074dc7279a072d340bff0f8410d3e77', '[\"*\"]', '2025-05-30 02:52:55', NULL, '2025-05-30 02:52:54', '2025-05-30 02:52:55'),
(43, 'App\\Models\\Pengguna', 4, 'token-auth', 'f5c309e23f5970807e9d71cad21f3572a40e5dda788beceb717555751ac0c83a', '[\"*\"]', '2025-05-30 02:53:47', NULL, '2025-05-30 02:53:46', '2025-05-30 02:53:47'),
(44, 'App\\Models\\Pengguna', 1, 'token-auth', 'f7afa716497d5e0ddbc69375808cea859280bbeed179bcca89206b926f4aad15', '[\"*\"]', '2025-05-30 02:54:31', NULL, '2025-05-30 02:54:26', '2025-05-30 02:54:31'),
(45, 'App\\Models\\Pengguna', 1, 'token-auth', '52c72bc75aa38aee36f644e0b1b2034c116ee6c2a2d67b9b143361ad34b36e32', '[\"*\"]', '2025-05-30 03:00:30', NULL, '2025-05-30 03:00:29', '2025-05-30 03:00:30'),
(46, 'App\\Models\\Pengguna', 1, 'token-auth', '4fce059743047d709fcdadd732b19a8e9b4879e230e8868bfd1d204ba592a0af', '[\"*\"]', '2025-05-30 03:10:35', NULL, '2025-05-30 03:01:25', '2025-05-30 03:10:35'),
(47, 'App\\Models\\Pengguna', 5, 'token-auth', '8d3a73694df75d9487a4878fd5a4ea0cdd308dc7a72c05f5c6d2cfdfe51badd0', '[\"*\"]', '2025-05-30 05:49:05', NULL, '2025-05-30 05:47:48', '2025-05-30 05:49:05');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('J2Jv7yQkWCIYxt1V6V3i8z2mTPvaZCWNGwKekJRu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 OPR/118.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFIxVWZ3STBWR1MzWXZ1NVdXQVlpOG01dVlKdm81RHJ2WjJwb0c5YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747969460);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id_todo` bigint UNSIGNED NOT NULL,
  `id_users` bigint UNSIGNED NOT NULL,
  `list` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `deskripsi` text,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `selesai` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `to_do_lists`
--

CREATE TABLE `to_do_lists` (
  `id_todo` bigint UNSIGNED NOT NULL,
  `id_users` bigint UNSIGNED NOT NULL,
  `list` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `status` enum('low','medium','high') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selesai` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `to_do_lists`
--

INSERT INTO `to_do_lists` (`id_todo`, `id_users`, `list`, `tanggal`, `deskripsi`, `status`, `selesai`, `created_at`, `updated_at`) VALUES
(1, 1, 'indo suka indo', '2025-05-15', 'indonesia', 'medium', 1, '2025-05-25 06:19:48', '2025-05-30 02:09:26'),
(3, 1, 'IPA', '2025-05-31', 'Aku harus menyelesaikan ini tetap sambil lostening music', 'medium', 0, '2025-05-29 20:19:38', '2025-05-30 02:09:30'),
(4, 1, 'mendapatkan hp baru', '2026-10-01', 'aku harus mempunyai uang 7 jt untuk samsung s24 fe', 'high', 0, '2025-05-29 20:37:04', '2025-05-29 20:37:04'),
(6, 4, 'ci benong', '2025-05-29', 'saya harus ke cibenong besok senin untuk meninjau proyek jalan tol yang sudah berlangsung selama 7 bulan, apakah sudah mau jadi atau belum', 'high', 1, '2025-05-30 02:46:37', '2025-05-30 02:46:42'),
(7, 1, 'ino', '2025-05-01', 'ff', 'low', 0, '2025-05-30 03:10:34', '2025-05-30 03:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pengguna_username_unique` (`username`),
  ADD UNIQUE KEY `pengguna_email_unique` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id_todo`),
  ADD KEY `tasks_id_users_foreign` (`id_users`);

--
-- Indexes for table `to_do_lists`
--
ALTER TABLE `to_do_lists`
  ADD PRIMARY KEY (`id_todo`),
  ADD KEY `to_do_lists_id_users_foreign` (`id_users`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id_todo` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `to_do_lists`
--
ALTER TABLE `to_do_lists`
  MODIFY `id_todo` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_id_users_foreign` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `to_do_lists`
--
ALTER TABLE `to_do_lists`
  ADD CONSTRAINT `to_do_lists_id_users_foreign` FOREIGN KEY (`id_users`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
