-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 29 Mei 2017 pada 14.54
-- Versi Server: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbakademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `angsuran`
--

CREATE TABLE `angsuran` (
  `angsuran` char(2) NOT NULL,
  `SPA` int(11) DEFAULT NULL,
  `SPP_Tetap` int(11) DEFAULT NULL,
  `NIIT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `angsuran`
--

INSERT INTO `angsuran` (`angsuran`, `SPA`, `SPP_Tetap`, `NIIT`) VALUES
('01', 20, 2750000, 1250000),
('02', 20, 2750000, 1250000),
('03', 15, 2750000, 1250000),
('04', 15, 2750000, 1250000),
('05', 15, 2750000, 1250000),
('06', 15, 2750000, 1250000),
('07', 0, 2750000, 1250000),
('08', 0, 2750000, 1250000),
('09', 0, 2750000, 1250000),
('10', 20, 2750000, 1250000),
('11', 20, 2750000, 1250000),
('12', 20, 2750000, 1250000),
('13', 20, 2750000, 1250000),
('14', 20, 2750000, 1250000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` char(9) NOT NULL,
  `Nama` varchar(30) DEFAULT NULL,
  `Jurusan` char(2) DEFAULT NULL,
  `Jenjang` char(2) DEFAULT NULL,
  `Gelombang` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `Nama`, `Jurusan`, `Jenjang`, `Gelombang`) VALUES
('163110001', 'Putri Ayu Lestari', 'MI', 'D3', '1'),
('163110002', 'Astrini Twi Alfi Kusumastuti', 'MI', 'D3', '1'),
('163110003', 'Leni Adawiyah', 'MI', 'D3', '1'),
('163110004', 'Ade Annisa Rahmawati', 'MI', 'D3', '1'),
('163110005', 'Dahniar Ramadhanti Karyani', 'MI', 'D3', '1'),
('163110006', 'Febrianto', 'MI', 'D3', '1'),
('163110007', 'Aprila Bena Putra', 'MI', 'D3', '1'),
('163110008', 'Ade Puspitaningrum', 'MI', 'D3', '1'),
('163110009', 'Dana Nur Fiqi', 'MI', 'D3', '2'),
('163110010', 'Valentina Nurpuspita', 'MI', 'D3', '2'),
('163110011', 'Muhdi Pangestu', 'MI', 'D3', '2'),
('163110012', 'Yuli Supriani', 'MI', 'D3', '2'),
('163110013', 'Muhammad Taufik', 'MI', 'D3', '2'),
('163110014', 'Marselinus Seran', 'MI', 'D3', '2'),
('163110015', 'Candra Kurniawan', 'MI', 'D3', '2'),
('163110016', 'Bian Yovieta Wijaya', 'MI', 'D3', '2'),
('163110017', 'Doni Yanuar Kusuma Putra', 'MI', 'D3', '2'),
('163110019', 'Vita Ariyana', 'MI', 'D3', '2'),
('163110020', 'Ulfa Nur Fajri Maharani', 'MI', 'D3', '3'),
('163110021', 'Rahmi Nanda Kusuma Pratiwi', 'MI', 'D3', '3'),
('163110022', 'Dwi Dian Hayati', 'MI', 'D3', '3'),
('163110023', 'Randy Bayu Samudra P', 'MI', 'D3', '3'),
('163110024', 'Khiftian Aji Pamungkas', 'MI', 'D3', '3'),
('163110025', 'Dewi Irawati', 'MI', 'D3', '3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_bayar` int(11) NOT NULL,
  `NIM` char(9) DEFAULT NULL,
  `angsuran` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_bayar`, `NIM`, `angsuran`) VALUES
(1, '163110001', '03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `spa`
--

CREATE TABLE `spa` (
  `id` char(2) NOT NULL,
  `angkatan` char(4) DEFAULT NULL,
  `gelombang` char(2) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `spa`
--

INSERT INTO `spa` (`id`, `angkatan`, `gelombang`, `nilai`) VALUES
('01', '2016', '01', 8600000),
('02', '2016', '02', 9000000),
('03', '2016', '03', 9600000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `angsuran`
--
ALTER TABLE `angsuran`
  ADD PRIMARY KEY (`angsuran`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_bayar`),
  ADD KEY `NIM` (`NIM`),
  ADD KEY `angsuran` (`angsuran`);

--
-- Indexes for table `spa`
--
ALTER TABLE `spa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`angsuran`) REFERENCES `angsuran` (`angsuran`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
