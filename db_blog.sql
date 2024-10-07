-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03 Nov 2022 pada 11.47
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_blog`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `album_name` varchar(100) NOT NULL,
  `album_seo` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`id`, `album_name`, `album_seo`, `photo`, `is_active`) VALUES
(17, 'Album 1', 'album-1', 'album-1-1581343722711.jpg', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `banner`
--

INSERT INTO `banner` (`id`, `title`, `photo`) VALUES
(5, 'Home', '3f0edd4a3de4375c41038e0ccf300b3b.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `category_name`, `slug`, `is_active`) VALUES
(7, 'Berita Kampus', 'berita-kampus', 'Y'),
(8, 'Berita Mahasiswa', 'berita-mahasiswa', 'Y'),
(9, 'Media Patner', 'media-patner', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `contact`
--

INSERT INTO `contact` (`id`, `contact_name`, `description`) VALUES
(1, 'About Me', 'Ini adalah project portal berita dan artikel sederhana, yang bertujuan membantu para programmer memahami dalam pembuatan projects serta penguasaan dalam bahasa pemrograman, library dan framework.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `id_album` int(11) NOT NULL,
  `gallery_name` varchar(100) NOT NULL,
  `gallery_seo` varchar(100) NOT NULL,
  `information` text NOT NULL,
  `photo` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`id`, `id_album`, `gallery_name`, `gallery_seo`, `information`, `photo`, `is_active`) VALUES
(9, 17, 'Galeri 2', 'galeri-2', 'LIfe is Strange', 'galeri-2-15815614412.jpg', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `identity`
--

CREATE TABLE `identity` (
  `id` int(11) NOT NULL,
  `web_name` varchar(255) NOT NULL,
  `web_address` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `identity`
--

INSERT INTO `identity` (`id`, `web_name`, `web_address`, `meta_description`, `meta_keyword`, `photo`) VALUES
(1, 'persmahasiswa.com', 'persmahasiswa.com', 'Latest Indonesia and World News Today, the Latest Most Complete Daily News Regarding Politics, Economy, Travel, Technology, Automotive, ...', 'persmahasiswa.com', 'c551664b65bad27d6b56ac71bfdd016f.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 'Setting Web', '', 'fas fa-fw fa-cog', 'Y'),
(2, 'Setting Menu', '', 'fas fa-fw fa-sliders-h', 'Y'),
(3, 'Manajemen Artikel', '', 'fas fa-fw fa-newspaper', 'Y'),
(4, 'Media', '', 'fas fa-fw fa-photo-video', 'Y'),
(5, 'Profile', 'home', 'fas fa-fw fa-home', 'Y'),
(6, 'Logout', 'auth/logout', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `posting`
--

CREATE TABLE `posting` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `featured` char(1) NOT NULL,
  `choice` char(1) NOT NULL,
  `thread` char(1) NOT NULL,
  `id_category` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `is_active` char(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `posting`
--

INSERT INTO `posting` (`id`, `title`, `seo_title`, `content`, `featured`, `choice`, `thread`, `id_category`, `photo`, `is_active`, `date`) VALUES
(69, 'New MacBook Pro 13-inch spotted with 10th-generation Ice Lake', 'new-macbook-pro-13-inch-spotted-with-10th-generation-ice-lake', '<p>It looks like Apple has plans to give the MacBook Pro 13-inch a \r\nconsiderable power boost in 2020. And, it’s about darn time, especially \r\nsince 8th-generation Intel Core processors are aging at this point, \r\nespecially on a premium laptop.</p><p>A <a href=\"https://twitter.com/_rogame/status/1228636786517270529?s=20\" target=\"_blank\" class=\"hawk-link-parsed\"><u>3DMark Time Spy benchmark</u></a>, recently leaked by <a href=\"https://twitter.com/_rogame\" target=\"_blank\" class=\"hawk-link-parsed\"><u>@_rogame</u></a>\r\n on Twitter, shows a new 13-inch MacBook Pro boasting marked performance\r\n improvements over 2019’s second highest configuration. If you’re not \r\nfamiliar with this serial leaker, he was responsible for uncovering a <a href=\"https://www.reddit.com/r/Amd/comments/dvq3xx/16_macbook_pro_with_an_rx_5500m_8gb/\" target=\"_blank\" class=\"hawk-link-parsed\"><u>Geekbench 4 benchmark</u></a>\r\n of the 16-inch MacBook Pro boasting the Radeon 5500M graphics card \r\nbefore it came out. So, you know this is coming from a reliable source.</p><aside class=\"hawk-widget\" data-render-type=\"fte\" data-widget-type=\"seasonal\"></aside><p>The\r\n unreleased 13-inch MacBook Pro model is fitted with an Intel Core \r\ni7-1068NG7 processor with a 2.3GHz base clock, Turbo Boost up to 4.1GHz \r\nclocks and a TDP of 28W. Based on an <a href=\"https://twitter.com/_rogame/status/1228628173509857280?s=20\" target=\"_blank\" class=\"hawk-link-parsed\"><u>earlier tweet</u></a>, it also boasts 32GB of memory and 2TB of storage (SSD).</p><p>It’s worth noting that the i7-1068NG7 could be a variant of the i7-1068G7, which <a href=\"https://wccftech.com/2020-macbook-pro-13-vs-predecessor-benchmark-leak-shows-30-gpu-lead/\" target=\"_blank\" class=\"hawk-link-parsed\"><u>Wccftech.com</u></a> praises as the best performing mobile chip in the Ice Lake U family. <br></p>', 'Y', 'N', 'Y', 6, '1c9ed66e86d7f2edff5ea376dba2f5b0.jpg', 'Y', '2020-02-23'),
(72, 'Nintendo Switch Pro: what we want to see from a new Switch console', 'nintendo-switch-pro-what-we-want-to-see-from-a-new-switch-console', '<p>Rumors have been circling for a while now that a Nintendo Switch Pro \r\nis in the works. However, contrary to belief, a Switch Pro certainly \r\nwon\'t be releasing this year as Nintendo has officially confirmed that a\r\n new Switch isn\'t coming in 2020.</p><p>But that\'s not to say we won\'t see a new Nintendo Switch in the future.</p><aside class=\"hawk-widget\" data-render-type=\"fte\" data-widget-type=\"seasonal\"></aside><p>While we technically seen two new Switch devices release in 2019 - the Switch with longer battery and the handheld <a href=\"https://www.techradar.com/reviews/nintendo-switch-lite-review\" data-original-url=\"https://www.techradar.com/uk/news/nintendo-switch-lite-release-date-price-games-and-more\" class=\"hawk-link-parsed\">Nintendo Switch Lite</a> - we\'re still expecting Nintendo to have another, more premium, Switch up its sleeve. </p><p>This new Switch (or Switch Pro) would boast upgraded hardware in comparison to the original <a href=\"https://www.techradar.com/reviews/nintendo-switch\" class=\"hawk-link-parsed\">Nintendo Switch</a>, potentially offering better graphics and processing power, among other improved features - although it\'s been suggested this <a href=\"https://www.techradar.com/news/the-latest-nintendo-switch-pro-rumors-are-pretty-disappointing\" class=\"hawk-link-parsed\">upgrade won\'t be as extensive as we\'d like to see</a>.</p><p>With Nintendo not even confirming the existence of a Switch Pro, and the\r\n company ruling out a 2020 release for any new Switch, when would be a \r\nlikely release window? And, if the rumors <em>are</em> true, what \r\nfeatures would this new Switch likely offer? While we wait for more \r\ndefinitive answers, let\'s run through the likely (and unlikely) \r\npossibilities below.</p>', 'N', 'Y', 'Y', 6, '91c9893cd2a1f8284c883b3b04775b90.jpg', 'Y', '2020-02-23'),
(75, 'Apple shares drop amid reports of low demand for iPhone X', 'apple-shares-drop-amid-reports-of-low-demand-for-iphone-x', '<p>BEIJING/SAN FRANCISCO, Dec 26 (Reuters) – Shares in <a href=\"http://www.globalnews.ca/tag/apple\" target=\"_blank\" rel=\"noopener\">Apple Inc</a>\r\n and several of its Asian suppliers fell on Tuesday after a report by \r\nTaiwan’s Economic Daily and comments from some analysts suggested <a href=\"http://www.globalnews.ca/tag/iphone-x\" target=\"_blank\" rel=\"noopener\">iPhone X</a> demand could come in below expectations in the first quarter.</p><p>Apple\r\n will slash its sales forecast for the iPhone X in the quarter to 30 \r\nmillion units, the newspaper said on Monday, citing unidentified \r\nsources, down from what it said was an initial plan of 50 million units.</p><p>Apple\r\n has not publicly disclosed quarterly sales targets for the iPhone X, \r\nwhich went on sale in November at a base price of $999 in the United \r\nStates. An Apple spokeswoman said the company does not comment on market\r\n rumors.</p><p>Shares of Apple surged 45 percent this year before the iPhone X launch \r\nas investors anticipated interest from iPhone users who had gone years \r\nsince buying a new one.</p><p>Shares of Apple have edged slightly lower since the iPhone X debut. They fell 2.5 percent to $170.57 on Tuesday.</p><p>During\r\n a trip to China this month Apple Chief Executive Tim Cook said he \r\n“couldn’t be happier” with the demand for the iPhone X in the country. \r\nThe company also had described pre-orders for iPhone X as “off the \r\ncharts.”</p> \r\n  \r\n  \r\n <h3>Varying estimates</h3><p>Estimates of how many of the new phones Apple is making, and how many it will sell, vary widely.</p>', 'N', 'Y', 'N', 6, '0806ef39ec267c04b99a51a88129327a.jpg', 'Y', '2020-02-24'),
(76, 'Massive Samsung Galaxy S20 Ultra camera test: 100x zoom and 108MP photo samples', 'massive-samsung-galaxy-s20-ultra-camera-test-100x-zoom-and-108mp-photo-samples', '<p>At the low end, U.S.-based JL Warren Capital expects Apple to ship 25\r\n million iPhone X units as consumers balk at the “high price” and “lack \r\nof interesting innovations.”</p><p>On the high end, Chicago-based Loop \r\nCapital estimated in a note last week 40 million to 45 million \r\nfirst-quarter shipments. Jefferies forecast about 40 million \r\nfirst-quarter sales.</p>         ', 'N', 'N', 'Y', 6, '344d68e696bcc03d9a9e4445b5a7be24.jpg', 'Y', '2020-02-24'),
(79, 'Nintendo Switch New Color', 'nintendo-switch-new-color', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \r\neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad \r\nminim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip \r\nex ea commodo consequat. Duis aute irure dolor in reprehenderit in \r\nvoluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur \r\nsint occaecat cupidatat non proident, sunt in culpa qui officia deserunt\r\n mollit anim id est laborum.\"</p><p>\"Sed\r\n ut perspiciatis unde omnis iste natus error sit voluptatem accusantium \r\ndoloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo \r\ninventore veritatis et quasi architecto beatae vitae dicta sunt \r\nexplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut \r\nodit aut fugit, sed quia consequuntur magni dolores eos qui ratione \r\nvoluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum \r\nquia dolor sit amet, consectetur, adipisci velit, sed quia non numquam \r\neius modi tempora incidunt ut labore et dolore magnam aliquam quaerat \r\nvoluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam \r\ncorporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?\r\n Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse \r\nquam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo \r\nvoluptas nulla pariatur?\"</p>\r\n\r\n<p>\"But I must explain to you how all this mistaken idea of denouncing \r\npleasure and praising pain was born and I will give you a complete \r\naccount of the system, and expound the actual teachings of the great \r\nexplorer of the truth, the master-builder of human happiness. No one \r\nrejects, dislikes, or avoids pleasure itself, because it is pleasure, \r\nbut because those who do not know how to pursue pleasure rationally \r\nencounter consequences that are extremely painful. Nor again is there \r\nanyone who loves or pursues or desires to obtain pain of itself, because\r\n it is pain, but because occasionally circumstances occur in which toil \r\nand pain can procure him some great pleasure. To take a trivial example,\r\n which of us ever undertakes laborious physical exercise, except to \r\nobtain some advantage from it? But who has any right to find fault with a\r\n man who chooses to enjoy a pleasure that has no annoying consequences, \r\nor one who avoids a pain that produces no resultant pleasure?\"</p>', 'N', 'N', 'N', 6, '33e0169602846b53eb635ca6cd3397a1.jpg', 'Y', '2020-02-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `submenu`
--

CREATE TABLE `submenu` (
  `id` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `sub_title` varchar(50) NOT NULL,
  `sub_url` varchar(50) NOT NULL,
  `is_active` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `submenu`
--

INSERT INTO `submenu` (`id`, `id_menu`, `sub_title`, `sub_url`, `is_active`) VALUES
(1, 1, 'Identitas Web', 'admin/identity', 'Y'),
(2, 1, 'Kontak', 'admin/contact', 'Y'),
(3, 2, 'Menu Utama', 'admin/menu', 'Y'),
(4, 2, 'Sub Menu', 'admin/submenu', 'Y'),
(5, 3, 'Kategori', 'admin/category', 'Y'),
(6, 3, 'Posting', 'admin/posting', 'Y'),
(7, 4, 'Album', 'admin/album', 'Y'),
(8, 4, 'Gallery Foto', 'admin/gallery', 'N'),
(10, 4, 'Banner', 'admin/banner', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$QUM2OeQCZclQqJIhZKKMt.Aq8dA3Y7eIzjtXsyr.xuE0kDjfj8SLS', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1639314587, 1, 'Sahril Angga', 'Permana', NULL, '081564685525');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(39, 1, 1),
(40, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `identity`
--
ALTER TABLE `identity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posting`
--
ALTER TABLE `posting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `identity`
--
ALTER TABLE `identity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posting`
--
ALTER TABLE `posting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
