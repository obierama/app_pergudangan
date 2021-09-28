-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06 Sep 2018 pada 14.47
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbgudang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` varchar(10) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `id_karyawan` varchar(10) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `id_permintaan` varchar(10) NOT NULL,
  `tanggal_permintaan` date NOT NULL,
  `nama_customer` varchar(50) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL,
  `jumlah` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`id`, `tanggal_keluar`, `id_karyawan`, `nama_karyawan`, `id_permintaan`, `tanggal_permintaan`, `nama_customer`, `kode_barang`, `nama_barang`, `harga`, `jumlah`) VALUES
('2', '2018-02-02', 'K-PLW01', 'Yedi Setidi', 'BK-PLW001', '2018-01-01', 'Yedi Setidi', 'BRG 01', 'AMDK Galon 19 Liter', 14000, 5),
('2', '2018-02-02', 'K-PLW01', 'Yedi Setidi', 'BK-PLW002', '2018-01-01', 'Yedi Setidi', 'BRG 02', 'AMDK CUP 240 ml(48)', 23000, 12);

--
-- Trigger `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `potong_barang` BEFORE INSERT ON `barang_keluar` FOR EACH ROW update stok set jumlah=jumlah-new.jumlah where kode_barang = new.kode_barang
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` varchar(10) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `id_supplier` varchar(10) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `pic` varchar(50) NOT NULL,
  `id_pemesanan` varchar(10) NOT NULL,
  `tanggal_pemesanan` date NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL,
  `jumlah` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `tanggal_masuk`, `id_supplier`, `nama_supplier`, `pic`, `id_pemesanan`, `tanggal_pemesanan`, `kode_barang`, `nama_karyawan`, `nama_barang`, `harga`, `jumlah`) VALUES
('2', '2018-02-02', 'PHT-002', 'Perhutani', 'Suherlan', 'Pes-PLW010', '2018-04-04', 'BRG 10', 'Yedi Setidi', 'MADU BUNGA LIAR 220 ML', 47000, 300),
('2', '2018-02-02', 'PHT-002', 'Perhutani', 'Suherlan', 'Pes-PLW009', '2018-04-04', 'BRG 09', 'Yedi Setidi', 'MADU KLENGKENG 650 ML', 144000, 300);

--
-- Trigger `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `tambah_barang` BEFORE INSERT ON `barang_masuk` FOR EACH ROW update stok set jumlah=jumlah+new.jumlah where kode_barang = new.kode_barang
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tlp` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `nama`, `tlp`, `alamat`) VALUES
('Cus001', 'PT. Amanah Ghita', '021752346', 'Menara 165, Cilandak, Jakarta Selatan'),
('Cus002', 'PT. Inhutani I', '0217741889', 'Jl. KH. Ahmad Dahlan, Kebayoran Baru, Jakarta Selatan'),
('Cus003', 'PT. Inhutani II', '0218290572', 'Jl. Tebet Timur Raya, No. 7 Jakarta'),
('Cus004', 'PT. Inhutani III', '0215721322', 'Gd. Manggalawana Bakhti Blok IV Lt. 7, Jakarta'),
('Cus005', 'PT. Inhuutani IV', '0217521899', 'Gd. Manggalawana Bakhti Blok IV Lt. 2, Jakarta'),
('Cus006', 'BPH Migas', '081219136369', 'Jl. Kapten P. Tendean No. 28, Jakarta Selatan'),
('Cus007', 'PT. Westcon Group', '02175439870', 'Jl. Setiabudi Selatan, No. 7 Jakarta Selatan'),
('Cus008', 'PT. Safetech Indonesia', '0217554391', 'Plaza Basmar, Jakarta Selatan'),
('Cus009', 'PT. Timah Karya Persada Properti', '0217224509', 'Melawai, Kebayran Baru Jakarta Selatan'),
('Cus010', 'BPSDM Kemendagri', '02175222597', 'TM. Pahlawan Kalibata, Jakarta Selatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_barang_masuk`
--

CREATE TABLE `daftar_barang_masuk` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL,
  `jumlah` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `daftar_barang_masuk`
--

INSERT INTO `daftar_barang_masuk` (`kode_barang`, `nama_barang`, `harga`, `jumlah`) VALUES
('1', 'jeruk', 1000, 20),
('1', 'jeruk', 1000, 10),
('2', 'apel', 1000, 50);

-- --------------------------------------------------------

--
-- Struktur dari tabel `harga_masuk`
--

CREATE TABLE `harga_masuk` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `harga_masuk`
--

INSERT INTO `harga_masuk` (`kode_barang`, `nama_barang`, `harga`) VALUES
('BRG 01', 'AMDK Galon 19 Liter', 10000),
('BRG 02', 'AMDK CUP 240 ml(48)', 19000),
('BRG 03', 'AMDK Granat 300 ml (24)', 28000),
('BRG 04', 'Minuman Madu CUP 220 ml (24)', 48000),
('BRG 05', 'AMDK Botol 600 ml (24)', 28000),
('BRG 06', 'MADU RANDU  220 ML', 48000),
('BRG 07', 'MADU RANDU 220 ML', 115000),
('BRG 08', 'MADU KLENGKENG 220 ML', 59000),
('BRG 09', 'MADU KLENGKENG 650 ML', 144000),
('BRG 10', 'MADU BUNGA LIAR 220 ML', 47000),
('BRG 11', 'MADU BUNGA LIAR 650 ML', 99000),
('BRG 12', ' 3 IN 1 SUPER 220 ML', 115000),
('BRG 13', '4 IN 1 SUPER 220 ML', 139000),
('BRG 14', 'PROPOLIS MURNI 10 ML', 119000),
('BRG 15', 'SABUN PADAT', 9500),
('BRG 16', 'SABUN CAIR 100 ML', 19500),
('BRG 17', 'SABUN CAIR 250 ML', 49000),
('BRG 18', 'M.K.P BOTOL BESAR', 89000),
('BRG 19', 'M.K.P BOTOL KECIL', 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tlp` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `tlp`, `alamat`) VALUES
('K-PLW01', 'Yedi Setidi', '085722653061', 'Bintaro'),
('K-PLW02', 'Multoyo', '081383800263', 'Jombang, Tanggerang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `id_karyawan` varchar(10) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `kode_barang` varchar(19) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`id`, `tanggal`, `id_karyawan`, `nama_karyawan`, `kode_barang`, `nama_barang`, `harga`, `total`) VALUES
('Pes-PLW001', '2018-01-01', 'K-PLW01', 'Yedi Setidi', 'BRG 01', 'AMDK Galon 19 Liter', 10000, 250),
('Pes-PLW002', '2018-01-01', 'K-PLW01', 'Yedi Setidi', 'BRG 02', 'AMDK CUP 240 ml(48)', 19000, 400),
('Pes-PLW003', '2018-01-01', 'K-PLW01', 'Yedi Setidi', 'BRG 03', 'AMDK Granat 300 ml (24)', 28000, 250),
('Pes-PLW004', '2018-02-02', 'K-PLW02', 'Multoyo', 'BRG 04', 'Minuman Madu CUP 220 ml (24)', 48000, 500),
('Pes-PLW005', '2018-02-02', 'K-PLW02', 'Multoyo', 'BRG 05', 'AMDK Botol 600 ml (24)', 28000, 500),
('Pes-PLW006', '2018-02-02', 'K-PLW02', 'Multoyo', 'BRG 06', 'MADU RANDU  220 ML', 48000, 200),
('Pes-PLW007', '2018-03-03', 'K-PLW02', 'Multoyo', 'BRG 07', 'MADU RANDU 220 ML', 115000, 200),
('Pes-PLW008', '2018-03-03', 'K-PLW02', 'Multoyo', 'BRG 08', 'MADU KLENGKENG 220 ML', 59000, 320),
('Pes-PLW009', '2018-04-04', 'K-PLW01', 'Yedi Setidi', 'BRG 09', 'MADU KLENGKENG 650 ML', 144000, 300),
('Pes-PLW010', '2018-04-04', 'K-PLW01', 'Yedi Setidi', 'BRG 10', 'MADU BUNGA LIAR 220 ML', 47000, 300);

-- --------------------------------------------------------

--
-- Struktur dari tabel `permintaan`
--

CREATE TABLE `permintaan` (
  `id` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `id_customer` varchar(10) NOT NULL,
  `nama_customer` varchar(50) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `permintaan`
--

INSERT INTO `permintaan` (`id`, `tanggal`, `id_customer`, `nama_customer`, `kode_barang`, `nama_barang`, `harga`, `total`) VALUES
('BK-PLW001', '2018-01-01', 'K-PLW01', 'Yedi Setidi', 'BRG 01', 'AMDK Galon 19 Liter', 14000, 5),
('BK-PLW002', '2018-01-01', 'K-PLW01', 'Yedi Setidi', 'BRG 02', 'AMDK CUP 240 ml(48)', 23000, 12),
('BK-PLW003', '2018-01-01', 'K-PLW01', 'Yedi Setidi', 'BRG 03', 'AMDK GRANAT 300 ml (24)', 32000, 21),
('BK-PLW004', '2018-02-02', 'K-PLW02', 'Multoyo', 'BRG 04', 'Minuman Madu CUP 220 ml (24)', 60000, 9),
('BK-PLW005', '2018-02-02', 'K-PLW02', 'Multoyo', 'BRG 05', 'AMDK BOTOL 600 ml (24)', 35000, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok`
--

CREATE TABLE `stok` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(40) NOT NULL,
  `harga` int(20) NOT NULL,
  `jumlah` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `stok`
--

INSERT INTO `stok` (`kode_barang`, `nama_barang`, `harga`, `jumlah`) VALUES
('BRG 01', 'AMDK Galon 19 Liter', 14000, 396),
('BRG 02', 'AMDK CUP 240 ml(48)', 23000, 1376),
('BRG 03', 'AMDK GRANAT 300 ml (24)', 32000, 799),
('BRG 04', 'Minuman Madu CUP 220 ml (24)', 60000, 503),
('BRG 05', 'AMDK BOTOL 600 ml (24)', 35000, 8),
('BRG 06', 'MADU RANDU 220 ML', 62000, 2600),
('BRG 07', 'MADU RANDU 650 ML', 137000, 10),
('BRG 08', 'MADU KLENGKENG 220 ML', 64000, 0),
('BRG 09', 'MADU KLENGKENG 650 ML', 156000, 300),
('BRG 10', 'MADU BUNGA LIAR 220 ML', 58000, 300),
('BRG 11', 'MADU BUNGA LIAR 650 ML', 125000, 0),
('BRG 12', '3 IN 1 SUPER 220 ML', 135000, 0),
('BRG 13', '4 IN 1 SUPER 220 ML', 159000, 0),
('BRG 14', 'PROPOLIS MURNI 10 ML', 130000, 0),
('BRG 15', 'SABUN PADAT', 13000, 0),
('BRG 16', 'SABUN CAIR 100 ML', 23000, 0),
('BRG 17', 'SABUN CAIR 250 ML', 52000, 0),
('BRG 18', 'M.K.P BOTOL BESAR', 104000, 0),
('BRG 19', 'M.K.P BOTOL KECIL', 37000, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `subtotal`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `subtotal` (
`id` varchar(10)
,`harga` int(20)
,`jumlah` int(20)
,`subtotal` bigint(39)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `subtotal2`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `subtotal2` (
`id` varchar(10)
,`harga` int(20)
,`jumlah` int(20)
,`subtotal2` bigint(39)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `subtotal_keluar`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `subtotal_keluar` (
`subtotal_keluar` decimal(60,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `subtotal_masuk`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `subtotal_masuk` (
`subtotal_masuk` decimal(60,0)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `pic` varchar(30) NOT NULL,
  `tlp` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `pic`, `tlp`, `alamat`) VALUES
('PHT-001', 'Perhutani', 'Bambang', '081225332344', 'Bogor'),
('PHT-002', 'Perhutani', 'Suherlan', '087534562252', 'Bintaro'),
('PHT-003', 'Perhutani', 'Sugeng', '081225243773', 'Bogor');

-- --------------------------------------------------------

--
-- Stand-in structure for view `total_harga`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `total_harga` (
`total_harga` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `total_harga_keluar`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `total_harga_keluar` (
`total_harga_keluar` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `total_jumlah`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `total_jumlah` (
`total_jumlah` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `total_jumlah_keluar`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `total_jumlah_keluar` (
`total_jumlah_keluar` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `subtotal`
--
DROP TABLE IF EXISTS `subtotal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `subtotal`  AS  select `barang_masuk`.`id` AS `id`,`barang_masuk`.`harga` AS `harga`,`barang_masuk`.`jumlah` AS `jumlah`,(`barang_masuk`.`harga` * `barang_masuk`.`jumlah`) AS `subtotal` from `barang_masuk` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `subtotal2`
--
DROP TABLE IF EXISTS `subtotal2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `subtotal2`  AS  select `barang_keluar`.`id` AS `id`,`barang_keluar`.`harga` AS `harga`,`barang_keluar`.`jumlah` AS `jumlah`,(`barang_keluar`.`harga` * `barang_keluar`.`jumlah`) AS `subtotal2` from `barang_keluar` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `subtotal_keluar`
--
DROP TABLE IF EXISTS `subtotal_keluar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `subtotal_keluar`  AS  select sum(`subtotal2`.`subtotal2`) AS `subtotal_keluar` from `subtotal2` where (`subtotal2`.`id` <> 0) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `subtotal_masuk`
--
DROP TABLE IF EXISTS `subtotal_masuk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `subtotal_masuk`  AS  select sum(`subtotal`.`subtotal`) AS `subtotal_masuk` from `subtotal` where (`subtotal`.`id` <> 0) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `total_harga`
--
DROP TABLE IF EXISTS `total_harga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_harga`  AS  select sum(`barang_masuk`.`harga`) AS `total_harga` from `barang_masuk` where (`barang_masuk`.`id` <> 0) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `total_harga_keluar`
--
DROP TABLE IF EXISTS `total_harga_keluar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_harga_keluar`  AS  select sum(`barang_keluar`.`harga`) AS `total_harga_keluar` from `barang_keluar` where (`barang_keluar`.`id` <> 0) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `total_jumlah`
--
DROP TABLE IF EXISTS `total_jumlah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_jumlah`  AS  select sum(`barang_masuk`.`jumlah`) AS `total_jumlah` from `barang_masuk` where (`barang_masuk`.`id` <> 0) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `total_jumlah_keluar`
--
DROP TABLE IF EXISTS `total_jumlah_keluar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total_jumlah_keluar`  AS  select sum(`barang_keluar`.`jumlah`) AS `total_jumlah_keluar` from `barang_keluar` where (`barang_keluar`.`id` <> 0) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `harga_masuk`
--
ALTER TABLE `harga_masuk`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
