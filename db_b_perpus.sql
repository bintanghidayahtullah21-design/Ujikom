-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2026 at 04:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundry`
--
CREATE DATABASE IF NOT EXISTS `db_laundry` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_laundry`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `berat_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL,
  `harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `role` enum('admin','customer') NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD UNIQUE KEY `id_kategori` (`id_kategori`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD UNIQUE KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD UNIQUE KEY `id_user` (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `tb_barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id_kategori`),
  ADD CONSTRAINT `tb_barang_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_transaksi` (`id_barang`);

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_transaksi` (`id_user`);
--
-- Database: `db_perpustakaan`
--
CREATE DATABASE IF NOT EXISTS `db_perpustakaan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_perpustakaan`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(20) NOT NULL,
  `penerbit` varchar(20) NOT NULL,
  `tahun_terbit` varchar(20) NOT NULL,
  `stok` int(20) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `judul`, `penerbit`, `tahun_terbit`, `stok`, `deskripsi`) VALUES
(123, 'buku coding', 'andi', '2020', 10, ''),
(1234, 'cara jago ngoding', 'andi', '2024', 20, 'cara agar bisa jago ngoding');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pinjam`
--

CREATE TABLE `tb_pinjam` (
  `id_pinjam` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `jml_pinjam` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `role` enum('admin','anggota') NOT NULL,
  `nama` varchar(20) NOT NULL,
  `kelas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `email`, `pass`, `role`, `nama`, `kelas`) VALUES
(1, 'anda@gmail.com', '123', 'admin', 'anda', '12rpl'),
(2, 'andra@gmail.com', '123', 'anggota', 'andra', '11rpl'),
(1234, 'andi@gmail.com', '123', 'admin', 'andi', '12rpl'),
(12345, 'ando@gmail.com', '123', 'anggota', 'ando', '12 rpl'),
(123456, 'andri@gmail.com', '123', 'anggota', 'andri', '12rpl');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `tb_pinjam`
--
ALTER TABLE `tb_pinjam`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_buku`
--
ALTER TABLE `tb_buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1235;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_pinjam`
--
ALTER TABLE `tb_pinjam`
  ADD CONSTRAINT `tb_pinjam_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `tb_buku` (`id_buku`),
  ADD CONSTRAINT `tb_pinjam_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`);
--
-- Database: `db_perpus_b`
--
CREATE DATABASE IF NOT EXISTS `db_perpus_b` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_perpus_b`;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tahun_terbit` int(11) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `stok`) VALUES
(6, 'CANTIK ITU LUKA', 'EKA KURNIAWAN', 'BOOTOK INDONESIA', 2026, 150),
(7, 'LAUT BERCERITA', 'LEILA S.CHUDORI', 'KEPUSTAKAAN INDONESIA', 2017, 100),
(8, 'BUMI MANUSIA', 'PRAMOEDYA ANANTA TOER', 'LENTERA DIPANTARA', 2015, 79),
(9, 'LASKAR PELANGI', 'ANDREA HIRATA', 'BENTANG PUSTAKA', 2020, 50),
(10, 'SANG PEMIMPI', 'ANDREA HIRATA', 'BENTANG PUSTAKA', 2006, 100),
(11, 'DOSA MANUSIA', 'Heri Firmawan', 'PT. Baca buku', 2020, 0);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status` enum('dipinjam','dikembalikan') DEFAULT 'dipinjam'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `id_user`, `id_buku`, `tanggal_pinjam`, `tanggal_kembali`, `status`) VALUES
(1, 13, 8, '2026-02-16', NULL, 'dipinjam'),
(2, 16, 11, '2026-02-18', NULL, 'dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `buku_id` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status` enum('pinjam','kembali') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `nis`, `username`, `password`, `role`) VALUES
(1, 'Administrator', NULL, 'amba', '12345', 'admin'),
(13, 'bintang', '84192', 'bintang123', '123', 'user'),
(14, 'Ayuna Yunitasari', '39102', 'ayuna15', 'ayuna1524', 'user'),
(15, 'Raka Nur Maulana', '58291', 'raka1524', '1524', 'user'),
(16, 'Ramdan', '10394', 'Ramdan1524', '1524', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `buku_id` (`buku_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON DELETE CASCADE;
--
-- Database: `parkiran_borma`
--
CREATE DATABASE IF NOT EXISTS `parkiran_borma` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `parkiran_borma`;
--
-- Database: `pengaduan_bullying`
--
CREATE DATABASE IF NOT EXISTS `pengaduan_bullying` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pengaduan_bullying`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `username`, `password`, `created_at`) VALUES
(1, 'Guru BK', 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:17:52'),
(6, 'Ibu Rina', 'rina_bk', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:20:52'),
(7, 'Pak Andi', 'andi_bk', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int(11) NOT NULL,
  `id_laporan` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `isi_feedback` text NOT NULL,
  `tanggal` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `deskripsi_kategori` text DEFAULT NULL,
  `ikon` varchar(50) DEFAULT 'fa-exclamation-circle',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `deskripsi_kategori`, `ikon`, `created_at`) VALUES
(1, 'Bullying Fisik', 'Tindakan kekerasan fisik seperti memukul, menendang, mendorong, atau merusak barang milik korban.', 'fa-hand-fist', '2026-04-07 23:17:53'),
(2, 'Bullying Verbal', 'Tindakan pelecehan verbal seperti mengejek, menghina, memaki, atau menyebarkan rumor negatif.', 'fa-comment-slash', '2026-04-07 23:17:53'),
(3, 'Bullying Sosial', 'Tindakan pengucilan sosial seperti mengabaikan, mengisolasi, atau merusak reputasi korban di lingkungan sosial.', 'fa-users-slash', '2026-04-07 23:17:53'),
(4, 'Cyberbullying', 'Tindakan perundungan melalui media digital seperti media sosial, pesan teks, atau platform online lainnya.', 'fa-mobile-screen', '2026-04-07 23:17:53'),
(5, 'Bullying Seksual', 'Tindakan pelecehan yang bersifat seksual termasuk komentar tidak pantas, sentuhan tidak diinginkan, atau penyebaran konten tidak senonoh.', 'fa-shield-halved', '2026-04-07 23:17:53'),
(6, 'Pemerasan', 'Tindakan memaksa korban menyerahkan uang, barang, atau melakukan sesuatu di bawah ancaman.', 'fa-money-bill-wave', '2026-04-07 23:17:53');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` int(11) NOT NULL,
  `kode_laporan` varchar(20) NOT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `is_anonim` tinyint(1) DEFAULT 0,
  `nama_anonim` varchar(100) DEFAULT NULL,
  `id_kategori` int(11) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `tanggal_kejadian` date NOT NULL,
  `deskripsi` text NOT NULL,
  `nama_pelaku` varchar(255) DEFAULT NULL,
  `bukti` varchar(255) DEFAULT NULL,
  `status` enum('Menunggu','Diproses','Selesai','Ditolak') DEFAULT 'Menunggu',
  `prioritas` enum('Normal','Urgent') DEFAULT 'Normal',
  `tanggal_lapor` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `kode_laporan`, `nis`, `is_anonim`, `nama_anonim`, `id_kategori`, `lokasi`, `tanggal_kejadian`, `deskripsi`, `nama_pelaku`, `bukti`, `status`, `prioritas`, `tanggal_lapor`, `updated_at`) VALUES
(1, 'LPR-0001', '12345', 0, NULL, 1, 'Lapangan Sekolah', '2026-03-10', 'Saya didorong dan dipukul oleh kakak kelas saat istirahat.', 'Andi (XI)', NULL, 'Menunggu', 'Normal', '2026-04-07 23:20:52', NULL),
(2, 'LPR-0002', '12346', 0, NULL, 2, 'Kelas XI RPL 1', '2026-03-12', 'Sering diejek dan dipanggil dengan nama tidak pantas.', 'Beberapa teman kelas', NULL, 'Diproses', 'Urgent', '2026-04-07 23:20:52', NULL),
(3, 'LPR-0003', NULL, 1, 'Pelapor Rahasia', 4, 'Grup WhatsApp Kelas', '2026-03-15', 'Ada siswa yang menyebarkan meme menghina teman di grup.', 'Tidak diketahui', NULL, 'Diproses', 'Normal', '2026-04-07 23:20:52', NULL),
(4, 'BLY-260407-526F', NULL, 1, 'PYLKB-Anonim', 6, 'tepa', '2026-04-07', 'korban di palak', 'R', NULL, 'Menunggu', 'Urgent', '2026-04-08 05:39:22', NULL),
(5, 'BLY-260408-793C', NULL, 1, 'RZWPX-Anonim', 1, 'wc', '2026-04-08', 'korban dicekik', 'r', NULL, 'Menunggu', 'Urgent', '2026-04-08 14:12:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `kelas`, `jenis_kelamin`, `no_hp`, `password`, `created_at`) VALUES
('12345', 'siswa', 'XII RPL 2', 'Laki-laki', '081234567890', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:20:52'),
('12346', 'Siti Aisyah', 'XI RPL 1', 'Perempuan', '081234567891', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:20:52'),
('12347', 'Rizky Pratama', 'X TKJ 1', 'Laki-laki', '081234567892', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2026-04-07 23:20:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD KEY `id_laporan` (`id_laporan`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`),
  ADD UNIQUE KEY `kode_laporan` (`kode_laporan`),
  ADD KEY `nis` (`nis`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan` (`id_laporan`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON DELETE SET NULL,
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"db_perpustakaan\",\"table\":\"tb_buku\"},{\"db\":\"db_perpustakaan\",\"table\":\"tb_user\"},{\"db\":\"db_perpustakaan\",\"table\":\"tb_pinjam\"},{\"db\":\"perpustakaan\",\"table\":\"tb_pinjam\"},{\"db\":\"perpustakaan\",\"table\":\"tb_user\"},{\"db\":\"perpustakaan\",\"table\":\"tb_buku\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-02-25 02:22:27', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `ukk_1_muhamadfareski`
--
CREATE DATABASE IF NOT EXISTS `ukk_1_muhamadfareski` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ukk_1_muhamadfareski`;

-- --------------------------------------------------------

--
-- Table structure for table `alat`
--

CREATE TABLE `alat` (
  `id_alat` int(11) NOT NULL,
  `nama_alat` varchar(100) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `kondisi` enum('baik','rusak') DEFAULT NULL,
  `status` enum('tersedia','dipinjam','tidak tersedia') DEFAULT 'tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `alat`
--

INSERT INTO `alat` (`id_alat`, `nama_alat`, `id_kategori`, `stok`, `kondisi`, `status`) VALUES
(34, 'Sepatu Futsal', 6, 8, 'baik', 'tersedia'),
(35, 'Bola Futsal', 6, 2, 'baik', 'tersedia'),
(36, 'Pelindung Kaki', 6, 4, 'baik', 'tersedia'),
(37, 'Bola Basket', 7, 0, 'baik', 'tersedia'),
(38, 'Sepatu Basket', 7, 0, 'baik', 'tersedia'),
(39, 'Jersey Basket', 7, 7, 'baik', 'tersedia'),
(40, 'Raket', 8, 3, 'baik', 'tersedia'),
(41, 'Kok', 8, 8, 'baik', 'tersedia'),
(42, 'Sepatu Badminton', 8, 9, 'baik', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(6, 'Futsal'),
(7, 'Basket'),
(8, 'Badminton');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id_log` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `aktivitas` text DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id_log`, `id_user`, `aktivitas`, `tanggal`) VALUES
(11, 58, 'Mengajukan peminjaman alat (ID Alat: 34)', '2026-03-31 23:26:43'),
(12, 56, 'Menyetujui peminjaman (ID: 48)', '2026-03-31 23:26:59'),
(13, 58, 'Mengajukan peminjaman alat (ID Alat: 34)', '2026-04-01 00:00:59'),
(14, 56, 'Menyetujui peminjaman (ID: 49)', '2026-04-01 00:01:45'),
(15, 58, 'Mengajukan peminjaman alat (ID Alat: 34)', '2026-04-03 23:29:50'),
(16, 60, 'Mengajukan peminjaman alat (ID Alat: 39)', '2026-04-03 23:31:39'),
(17, 56, 'Menyetujui peminjaman (ID: 53)', '2026-04-03 23:31:55'),
(18, 58, 'Mengajukan peminjaman alat (ID Alat: 34)', '2026-04-04 07:22:34'),
(19, 56, 'Menyetujui peminjaman (ID: 54)', '2026-04-04 07:22:58'),
(0, 58, 'Mengajukan peminjaman alat (ID Alat: 42)', '2026-04-08 04:16:59'),
(0, NULL, 'Mengarsipkan (menghapus) peminjaman (ID: 9)', '2026-04-08 04:19:26'),
(0, NULL, 'Mengarsipkan (menghapus) peminjaman (ID: 2)', '2026-04-08 04:19:31'),
(0, NULL, 'Mengarsipkan (menghapus) peminjaman (ID: 4)', '2026-04-08 04:19:35');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notif` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `pesan` text DEFAULT NULL,
  `status_baca` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('baru','dibaca') DEFAULT 'baru'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id_notif`, `id_user`, `pesan`, `status_baca`, `created_at`, `status`) VALUES
(1, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-03-29 13:19:43', 'dibaca'),
(2, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-03-29 13:19:46', 'dibaca'),
(3, 58, 'Peminjaman kamu DITOLAK', 0, '2026-03-29 13:19:47', 'dibaca'),
(4, 58, 'Peminjaman kamu DITOLAK', 0, '2026-03-29 13:19:49', 'dibaca'),
(5, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-03-30 09:54:51', 'dibaca'),
(6, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-03-30 09:59:23', 'dibaca'),
(7, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-03-30 10:02:32', 'dibaca'),
(8, 58, 'Peminjaman kamu DITOLAK', 0, '2026-03-30 10:11:19', 'dibaca'),
(9, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-03-31 00:58:35', 'dibaca'),
(10, 58, 'Peminjaman kamu DITOLAK', 0, '2026-03-31 00:58:40', 'dibaca'),
(11, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-03-31 01:38:20', 'dibaca'),
(12, 58, 'Peminjaman kamu DITOLAK', 0, '2026-03-31 01:38:21', 'dibaca'),
(13, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-03-31 01:51:42', 'dibaca'),
(14, 58, 'Peminjaman kamu DITOLAK', 0, '2026-03-31 07:23:58', 'dibaca'),
(15, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-03-31 07:26:48', 'dibaca'),
(16, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-04-01 00:30:23', 'dibaca'),
(17, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-04-01 00:31:19', 'dibaca'),
(18, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-04-01 00:31:21', 'dibaca'),
(19, 58, 'Peminjaman kamu DITOLAK', 0, '2026-04-01 00:31:22', 'dibaca'),
(20, 58, 'Peminjaman kamu DITOLAK', 0, '2026-04-01 00:31:23', 'dibaca'),
(21, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-04-01 03:16:49', 'dibaca'),
(22, 58, 'Peminjaman kamu DITOLAK', 0, '2026-04-01 03:16:50', 'dibaca'),
(23, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-04-01 03:43:15', 'dibaca'),
(24, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-04-01 03:55:28', 'dibaca'),
(25, 58, 'Peminjaman kamu telah DISETUJUI', 0, '2026-04-01 05:43:46', 'dibaca'),
(26, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-01 05:48:24', 'dibaca'),
(27, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-01 06:06:55', 'dibaca'),
(28, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-01 06:26:59', 'dibaca'),
(29, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-01 07:01:45', 'dibaca'),
(30, 60, 'Peminjaman kamu DISETUJUI', 0, '2026-04-04 06:31:55', 'dibaca'),
(31, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-04 14:22:58', 'dibaca'),
(0, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-08 01:51:36', 'dibaca'),
(0, 58, 'Peminjaman kamu DITOLAK', 0, '2026-04-08 02:15:49', 'dibaca'),
(0, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-08 02:15:53', 'dibaca'),
(0, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-08 02:18:41', 'dibaca'),
(0, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-08 02:24:35', 'dibaca'),
(0, 58, 'Peminjaman kamu DITOLAK', 0, '2026-04-08 02:49:35', 'dibaca'),
(0, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-08 02:50:18', 'dibaca'),
(0, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-08 03:41:50', 'dibaca'),
(0, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-08 03:41:51', 'dibaca'),
(0, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-08 03:57:15', 'dibaca'),
(0, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-08 03:57:16', 'dibaca'),
(0, 58, 'Peminjaman kamu DISETUJUI', 0, '2026-04-08 04:03:42', 'dibaca');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_alat` int(11) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `tgl_persetujuan` date DEFAULT NULL,
  `status` enum('menunggu','disetujui','ditolak','dipinjam','dikembalikan','arsip') DEFAULT 'menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_user`, `id_alat`, `tgl_pinjam`, `tgl_kembali`, `tgl_persetujuan`, `status`) VALUES
(3, 58, 35, '2026-04-08', '2026-04-09', '2026-04-08', 'dikembalikan'),
(7, 58, 34, '2026-04-08', '2026-04-08', '2026-04-08', 'dikembalikan'),
(8, 58, 34, '2026-04-08', '2026-04-08', '2026-04-08', 'dipinjam'),
(10, 58, 34, '2026-04-08', '2026-04-08', '2026-04-08', 'dikembalikan'),
(11, 58, 39, '2026-04-08', '2026-04-08', '2026-04-08', 'dikembalikan'),
(12, 58, 35, '2026-04-08', '2026-04-08', '2026-04-08', 'dikembalikan'),
(13, 58, 36, '2026-04-08', '2026-04-08', '2026-04-08', 'dikembalikan'),
(14, 58, 34, '2026-04-08', '2026-04-08', NULL, 'ditolak'),
(15, 58, 34, '2026-04-08', '2026-04-29', '2026-04-08', 'dikembalikan'),
(16, 58, 42, '2026-04-08', '2026-04-08', '2026-04-08', 'dipinjam');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_peminjaman` int(11) DEFAULT NULL,
  `tgl_dikembalikan` date DEFAULT NULL,
  `kondisi_kembali` enum('baik','rusak','hilang') DEFAULT NULL,
  `denda` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `id_peminjaman`, `tgl_dikembalikan`, `kondisi_kembali`, `denda`) VALUES
(1, 3, '2026-04-08', 'rusak', 120000),
(2, 7, '2026-04-08', 'baik', 1111111),
(4, 11, '2026-04-08', 'rusak', 50000),
(5, 10, '2026-04-08', 'baik', 0),
(7, 13, '2026-04-08', 'rusak', 50000),
(8, 15, '2026-04-08', 'baik', 122);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_tlp` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','petugas','peminjam','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `email`, `no_tlp`, `password`, `role`) VALUES
(50, 'admin0', 'admin0@gmail.com', '829398282', '$2y$10$SXT9nki3OTxoptrSjj7gZOj698EiKyeiChGTQ9NeyjnNOcuwHnRzm', 'admin'),
(52, 'gipiri', 'gipiri@gmail.com', '089726736726', '$2y$10$fFG5/9idtkvNn4xGw5Sq/.JPa4m/qgoZF6cLPJdET7k5dAdscLSNS', 'peminjam'),
(53, 'epang', 'pan@gmail.com', '18181818', '$2y$10$OKKpHPwroOAOtbLw/1laLOeVhVMl0OS/iQTwxltaW71e2eyAzW/2m', 'petugas'),
(54, 'bonkop', 'bongkop@gmail.com', '0891028372828', '$2y$10$7y6K15TfhpGoSc5qyPdGtue2kA3fbyiPtagXQSozjjxMGknefOF6.', 'peminjam'),
(56, 'p', 'petugas0@gmail.com', '000000000', '$2y$10$DHJHszocTg/3BzNN8lafM.jcZkTHqmrIrMbi1yRyUVLTpR2BnqYYy', 'petugas'),
(58, 'fk', 'peminjam0@gmail.com', '111111', '$2y$10$cR2gR56T6cQHte5JMwGRN.6kwdNjBovQP.R10ApyZzBsSKbdmmyP6', 'peminjam'),
(60, 'KIRANNNNN', 'kir@gmail.com', '00', '$2y$10$pZCs/lS1hFY./Lw.JGFf7e11hOrDws879v9eBhNasJY7TDws800Sm', 'peminjam'),
(62, 'fareski', 'res@gmail.com', '1111', '$2y$10$llFBvPiRbSfkGjreVz.sqeWZHncAZR9B.1kRtyUJ1AOX/0vYh12NO', 'peminjam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alat`
--
ALTER TABLE `alat`
  ADD PRIMARY KEY (`id_alat`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alat`
--
ALTER TABLE `alat`
  MODIFY `id_alat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
