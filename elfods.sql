-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jun 2020 pada 03.50
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elfods`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `asrama`
--

CREATE TABLE `asrama` (
  `id_asrama` int(11) NOT NULL,
  `nama_asrama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `asrama`
--

INSERT INTO `asrama` (`id_asrama`, `nama_asrama`) VALUES
(1, 'TB 1'),
(2, 'TB 2'),
(3, 'TB 3'),
(4, 'TB 4');

-- --------------------------------------------------------

--
-- Struktur dari tabel `isi`
--

CREATE TABLE `isi` (
  `id_isi` int(11) NOT NULL,
  `pagi` varchar(100) NOT NULL,
  `siang` varchar(100) NOT NULL,
  `malam` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `asrama` int(11) NOT NULL,
  `lantai` int(11) NOT NULL,
  `nomor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `asrama`, `lantai`, `nomor`) VALUES
(1, 1, 1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'elfoods', 1, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kurir`
--

CREATE TABLE `kurir` (
  `user` int(11) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `rumah_makan` int(11) NOT NULL,
  `foto` varchar(150) NOT NULL,
  `status_antar` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `user` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `foto` varchar(150) NOT NULL,
  `no_hp` char(15) NOT NULL,
  `kartu_identitas` varchar(100) NOT NULL,
  `kamar` int(11) DEFAULT NULL,
  `nama_darurat` varchar(100) NOT NULL,
  `no_hp_darurat` char(15) NOT NULL,
  `qr_code` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`user`, `nama_lengkap`, `foto`, `no_hp`, `kartu_identitas`, `kamar`, `nama_darurat`, `no_hp_darurat`, `qr_code`) VALUES
(4, 'djflsj', 'dkjfslk', 'dfjlkajdf', 'dkfjakldj', 1, 'sjdfl', 'djflks', 'ksldjfs'),
(9, 'taufik agung santoso', 'foto 1', '0493485023', '498654302453', 1, 'bejo', '039458943', 'ekjfghkdlks'),
(19, 'adik', '9827893', '980980932', '', 1, '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `nama` int(11) NOT NULL,
  `rumah_makan` int(11) NOT NULL,
  `isi` int(11) NOT NULL,
  `harga` varchar(100) NOT NULL,
  `jadwal` int(1) NOT NULL,
  `status` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `nama_bank` varchar(150) NOT NULL,
  `atas_nama` varchar(150) NOT NULL,
  `no_rek` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengiriman`
--

CREATE TABLE `pengiriman` (
  `id_pengiriman` int(11) NOT NULL,
  `transaksi` int(11) NOT NULL,
  `kurir` int(11) NOT NULL,
  `bukti` varchar(150) NOT NULL,
  `waktu_kirim` datetime NOT NULL,
  `waktu_terima` datetime NOT NULL,
  `penerima` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rumah_makan`
--

CREATE TABLE `rumah_makan` (
  `user` int(11) NOT NULL,
  `nama_rm` varchar(150) NOT NULL,
  `alamat` text NOT NULL,
  `pemilik` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `mahasiswa` int(11) NOT NULL,
  `paket` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `pembayaran` int(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_akun` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role_user` enum('1','2','3','4') NOT NULL COMMENT '1.admin 2.kurir 3.penjual 4.pembeli',
  `waktu_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `terakhir_login` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_akun`, `username`, `password`, `role_user`, `waktu_daftar`, `terakhir_login`, `status`) VALUES
(1, 'admin', 'admin', '1', '2020-01-30 15:47:20', NULL, 0),
(2, 'penjual', 'penjual', '3', '2020-01-30 15:47:12', NULL, 0),
(3, 'kurir', 'kurir', '2', '2020-01-30 15:48:21', NULL, 0),
(4, 'pembeli', 'pembeli', '4', '2020-02-13 02:16:09', NULL, 0),
(9, 'taufik', 'agung', '4', '2020-02-13 02:20:16', NULL, 0),
(10, 'taufiksan', 'agung', '4', '2020-02-13 02:34:38', NULL, 0),
(19, 'diki', 'agung', '4', '2020-02-13 03:26:05', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `asrama`
--
ALTER TABLE `asrama`
  ADD PRIMARY KEY (`id_asrama`);

--
-- Indeks untuk tabel `isi`
--
ALTER TABLE `isi`
  ADD PRIMARY KEY (`id_isi`);

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`),
  ADD KEY `asrama` (`asrama`);

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`user`),
  ADD KEY `rumah_makan` (`rumah_makan`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`user`),
  ADD KEY `mahasiswa_ibfk_2` (`kamar`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`),
  ADD KEY `isi` (`isi`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`),
  ADD KEY `kurir` (`kurir`),
  ADD KEY `transaksi` (`transaksi`);

--
-- Indeks untuk tabel `rumah_makan`
--
ALTER TABLE `rumah_makan`
  ADD PRIMARY KEY (`user`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `mahasiswa` (`mahasiswa`),
  ADD KEY `pembayaran` (`pembayaran`),
  ADD KEY `paket` (`paket`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_akun`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `asrama`
--
ALTER TABLE `asrama`
  MODIFY `id_asrama` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `isi`
--
ALTER TABLE `isi`
  MODIFY `id_isi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  MODIFY `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `kamar_ibfk_1` FOREIGN KEY (`asrama`) REFERENCES `asrama` (`id_asrama`);

--
-- Ketidakleluasaan untuk tabel `kurir`
--
ALTER TABLE `kurir`
  ADD CONSTRAINT `kurir_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id_akun`),
  ADD CONSTRAINT `kurir_ibfk_2` FOREIGN KEY (`rumah_makan`) REFERENCES `rumah_makan` (`user`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id_akun`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`kamar`) REFERENCES `kamar` (`id_kamar`);

--
-- Ketidakleluasaan untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD CONSTRAINT `paket_ibfk_1` FOREIGN KEY (`isi`) REFERENCES `isi` (`id_isi`);

--
-- Ketidakleluasaan untuk tabel `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pengiriman_ibfk_1` FOREIGN KEY (`kurir`) REFERENCES `kurir` (`user`),
  ADD CONSTRAINT `pengiriman_ibfk_2` FOREIGN KEY (`transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Ketidakleluasaan untuk tabel `rumah_makan`
--
ALTER TABLE `rumah_makan`
  ADD CONSTRAINT `rumah_makan_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id_akun`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`mahasiswa`) REFERENCES `mahasiswa` (`user`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`pembayaran`) REFERENCES `pembayaran` (`id_pembayaran`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`paket`) REFERENCES `paket` (`id_paket`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
