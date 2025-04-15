CREATE TABLE `loaicongnghe` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(256) NOT NULL,
  `TieuDeSEO` varchar(256) NOT NULL,
  `MoTa` varchar(500) DEFAULT NULL,
  `ParentID` int DEFAULT NULL,
  `ThuTu` int DEFAULT NULL,
  `HienThiTrangChu` tinyint(1) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NguoiTao` varchar(100) DEFAULT NULL,
  `NgayCapNhat` datetime DEFAULT NULL,
  `NguoiCapNhat` varchar(100) DEFAULT NULL,
  `MetaKeyword` varchar(256) DEFAULT NULL,
  `MetaDescription` varchar(500) DEFAULT NULL,
  `TrangThai` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_parent` (`ParentID`),
  CONSTRAINT `fk_parent` FOREIGN KEY (`ParentID`) REFERENCES `loaicongnghe` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `congnghe` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Ten` varchar(100) NOT NULL,
  `TieuDe` varchar(100) NOT NULL,
  `MoTa` varchar(500) DEFAULT NULL,
  `LoaiCongNgheID` int NOT NULL,
  `Icon` varchar(256) DEFAULT NULL,
  `Logo` varchar(256) DEFAULT NULL,
  `PhienBan` varchar(100) NOT NULL,
  `STT` int DEFAULT NULL,
  `Tags` text,
  `HienThiTrangChu` tinyint(1) DEFAULT NULL,
  `HienThiHot` tinyint(1) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NguoiTao` varchar(100) DEFAULT NULL,
  `NgayCapNhat` datetime DEFAULT NULL,
  `NguoiCapNhat` varchar(100) DEFAULT NULL,
  `MetaKeyword` varchar(256) DEFAULT NULL,
  `MetaDescription` varchar(500) DEFAULT NULL,
  `TrangThai` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `fk_loai_cong_nghe` (`LoaiCongNgheID`),
  CONSTRAINT `fk_loai_cong_nghe` FOREIGN KEY (`LoaiCongNgheID`) REFERENCES `loaicongnghe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tags` (
  `ID` varchar(50) NOT NULL,
  `Ten` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `congnghetags` (
  `CongNgheID` int NOT NULL,
  `TagID` varchar(50) NOT NULL,
  PRIMARY KEY (`CongNgheID`,`TagID`),
  KEY `TagID` (`TagID`),
  CONSTRAINT `congnghetags_ibfk_1` FOREIGN KEY (`CongNgheID`) REFERENCES `congnghe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `congnghetags_ibfk_2` FOREIGN KEY (`TagID`) REFERENCES `tags` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `loainoidung` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TenLoai` varchar(50) NOT NULL,
  `CongNgheID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CongNgheID` (`CongNgheID`),
  CONSTRAINT `loainoidung_ibfk_1` FOREIGN KEY (`CongNgheID`) REFERENCES `congnghe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `noidungcongnghe` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ChuDe` varchar(200) NOT NULL,
  `TieuDe` varchar(200) NOT NULL,
  `NoiDung` varchar(200) NOT NULL,
  `LinkTaiLieu` varchar(200) DEFAULT NULL,
  `LoaiNoiDungID` int NOT NULL,
  `STT` int DEFAULT NULL,
  `Tags` text,
  `HienThiTrangChu` tinyint(1) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NguoiTao` varchar(255) DEFAULT NULL,
  `NgayCapNhat` datetime DEFAULT NULL,
  `NguoiCapNhat` varchar(255) DEFAULT NULL,
  `MetaKeyword` varchar(255) DEFAULT NULL,
  `MetaDescription` varchar(255) DEFAULT NULL,
  `TrangThai` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LoaiNoiDungID` (`LoaiNoiDungID`),
  CONSTRAINT `noidungcongnghe_ibfk_1` FOREIGN KEY (`LoaiNoiDungID`) REFERENCES `loainoidung` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `khoahoc` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TenKhoaHoc` varchar(200) NOT NULL,
  `MoTa` text,
  `NgayBatDau` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  `GiaGoc` decimal(10,2) NOT NULL,
  `GiaSauGiam` decimal(10,2) DEFAULT NULL,
  `MucGiam` int DEFAULT NULL,
  `AnhDaiDien` varchar(255) DEFAULT NULL,
  `TrangThai` enum('DangMo','DaDong') DEFAULT 'DangMo',
  `IDNguoiTao` int DEFAULT NULL,
  `IDNguoiThayDoi` int DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `NgayThayDoi` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `videokhoahoc` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `KhoaHocID` int NOT NULL,
  `TenVideo` varchar(200) NOT NULL,
  `MoTaVideo` text,
  `LinkVideo` text NOT NULL,
  `LuotXem` int DEFAULT '0',
  `NgayTao` datetime DEFAULT CURRENT_TIMESTAMP,
  `NgayCapNhat` datetime DEFAULT NULL,
  `TrangThai` enum('HoatDong','BiKhoa') DEFAULT 'HoatDong',
  `ThuTu` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `KhoaHocID` (`KhoaHocID`),
  CONSTRAINT `videokhoahoc_ibfk_1` FOREIGN KEY (`KhoaHocID`) REFERENCES `khoahoc` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `baihoc` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `KhoaHocID` int NOT NULL,
  `TieuDe` varchar(200) NOT NULL,
  `NoiDung` text,
  `VideoLink` varchar(200) DEFAULT NULL,
  `TaiLieuLink` varchar(200) DEFAULT NULL,
  `ThuTu` int DEFAULT NULL,
  `NgayTao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `KhoaHocID` (`KhoaHocID`),
  CONSTRAINT `baihoc_ibfk_1` FOREIGN KEY (`KhoaHocID`) REFERENCES `khoahoc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cauhoi` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BaiHocID` int NOT NULL,
  `NoiDungCauHoi` text NOT NULL,
  `LoaiCauHoi` enum('TracNghiem','TuLuan') DEFAULT 'TracNghiem',
  `DapAnDung` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `BaiHocID` (`BaiHocID`),
  CONSTRAINT `cauhoi_ibfk_1` FOREIGN KEY (`BaiHocID`) REFERENCES `baihoc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `luachon` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CauHoiID` int NOT NULL,
  `NoiDungLuaChon` varchar(255) NOT NULL,
  `IsCorrect` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CauHoiID` (`CauHoiID`),
  CONSTRAINT `luachon_ibfk_1` FOREIGN KEY (`CauHoiID`) REFERENCES `cauhoi` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `vaitro` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TenVaiTro` varchar(50) NOT NULL,
  `MoTa` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TenVaiTro` (`TenVaiTro`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nguoidung` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(50) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `SoDienThoai` varchar(15) DEFAULT NULL,
  `HoTen` varchar(100) DEFAULT NULL,
  `VaiTroID` int NOT NULL,
  `NgayDangKy` datetime DEFAULT CURRENT_TIMESTAMP,
  `TrangThai` enum('HoatDong','BiKhoa','TamNgung') DEFAULT 'HoatDong',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TenDangNhap` (`TenDangNhap`),
  UNIQUE KEY `Email` (`Email`),
  KEY `VaiTroID` (`VaiTroID`),
  CONSTRAINT `nguoidung_ibfk_1` FOREIGN KEY (`VaiTroID`) REFERENCES `vaitro` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cart` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NguoiDungID` int NOT NULL,
  `KhoaHocID` int NOT NULL,
  `SoLuong` int DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `KhoaHocID` (`KhoaHocID`),
  KEY `NguoiDungID` (`NguoiDungID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`KhoaHocID`) REFERENCES `khoahoc` (`ID`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`NguoiDungID`) REFERENCES `nguoidung` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `quyen` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TenQuyen` varchar(50) NOT NULL,
  `MoTa` text,
  `CapDo` enum('HeThong','KhoaHoc') NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TenQuyen` (`TenQuyen`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `vaitroquyen` (
  `VaiTroID` int NOT NULL,
  `QuyenID` int NOT NULL,
  PRIMARY KEY (`VaiTroID`,`QuyenID`),
  KEY `QuyenID` (`QuyenID`),
  CONSTRAINT `vaitroquyen_ibfk_1` FOREIGN KEY (`VaiTroID`) REFERENCES `vaitro` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vaitroquyen_ibfk_2` FOREIGN KEY (`QuyenID`) REFERENCES `quyen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `donhang` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NguoiDungID` int DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `SoDienThoai` varchar(50) DEFAULT NULL,
  `TongTien` decimal(10,2) DEFAULT NULL,
  `PhuongThucThanhToan` varchar(50) DEFAULT NULL,
  `TrangThaiThanhToan` varchar(50) DEFAULT NULL,
  `ThoiGianTao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `NguoiDungID` (`NguoiDungID`),
  CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`NguoiDungID`) REFERENCES `nguoidung` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `chitietdonhang` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DonHangID` int DEFAULT NULL,
  `KhoaHocID` int NOT NULL,
  `TenKhoaHoc` varchar(500) DEFAULT NULL,
  `SoLuong` int DEFAULT NULL,
  `gia` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DonHangID` (`DonHangID`),
  KEY `KhoaHocID` (`KhoaHocID`),
  CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`DonHangID`) REFERENCES `donhang` (`ID`),
  CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`KhoaHocID`) REFERENCES `khoahoc` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `thanhtoan` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DonHangID` int DEFAULT NULL,
  `NgayThanhToan` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `PhuongThucThanhToan` varchar(50) DEFAULT NULL,
  `SoTien` decimal(10,2) DEFAULT NULL,
  `TrangThaiThanhToan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DonHangID` (`DonHangID`),
  CONSTRAINT `thanhtoan_ibfk_1` FOREIGN KEY (`DonHangID`) REFERENCES `donhang` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `chungchi` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NguoiDungID` int NOT NULL,
  `KhoaHocID` int NOT NULL,
  `NgayCap` datetime DEFAULT CURRENT_TIMESTAMP,
  `XepLoai` enum('XuatSac','Gioi','Kha','TrungBinh') DEFAULT 'TrungBinh',
  PRIMARY KEY (`ID`),
  KEY `NguoiDungID` (`NguoiDungID`),
  KEY `KhoaHocID` (`KhoaHocID`),
  CONSTRAINT `chungchi_ibfk_1` FOREIGN KEY (`NguoiDungID`) REFERENCES `nguoidung` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chungchi_ibfk_2` FOREIGN KEY (`KhoaHocID`) REFERENCES `khoahoc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `khoahocgiangvien` (
  `KhoaHocID` int NOT NULL,
  `NguoiDungID` int NOT NULL,
  PRIMARY KEY (`KhoaHocID`,`NguoiDungID`),
  KEY `NguoiDungID` (`NguoiDungID`),
  CONSTRAINT `khoahocgiangvien_ibfk_1` FOREIGN KEY (`KhoaHocID`) REFERENCES `khoahoc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `khoahocgiangvien_ibfk_2` FOREIGN KEY (`NguoiDungID`) REFERENCES `nguoidung` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `danhgiakhoahoc` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `KhoaHocID` int NOT NULL,
  `NguoiDungID` int NOT NULL,
  `SoSao` int DEFAULT NULL,
  `BinhLuan` text,
  `NgayDanhGia` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `KhoaHocID` (`KhoaHocID`),
  KEY `NguoiDungID` (`NguoiDungID`),
  CONSTRAINT `danhgiakhoahoc_ibfk_1` FOREIGN KEY (`KhoaHocID`) REFERENCES `khoahoc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `danhgiakhoahoc_ibfk_2` FOREIGN KEY (`NguoiDungID`) REFERENCES `nguoidung` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `danhgiakhoahoc_chk_1` CHECK (((`SoSao` >= 1) and (`SoSao` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ketquathi` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NguoiDungID` int NOT NULL,
  `BaiHocID` int NOT NULL,
  `Diem` float DEFAULT NULL,
  `NgayThi` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `NguoiDungID` (`NguoiDungID`),
  KEY `BaiHocID` (`BaiHocID`),
  CONSTRAINT `ketquathi_ibfk_1` FOREIGN KEY (`NguoiDungID`) REFERENCES `nguoidung` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ketquathi_ibfk_2` FOREIGN KEY (`BaiHocID`) REFERENCES `baihoc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `thongtincanhan` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(100) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `GioiTinh` varchar(10) DEFAULT NULL,
  `QuocTich` varchar(50) DEFAULT NULL,
  `DanToc` varchar(50) DEFAULT NULL,
  `TonGiao` varchar(50) DEFAULT NULL,
  `QueQuan` varchar(255) DEFAULT NULL,
  `MaSoBaoHiem` varchar(20) DEFAULT NULL,
  `SoTaiKhoan` varchar(20) DEFAULT NULL,
  `TenNganHang` varchar(50) DEFAULT NULL,
  `TheCanCuoc` varchar(20) DEFAULT NULL,
  `NgayCap` date DEFAULT NULL,
  `NoiCap` varchar(100) DEFAULT NULL,
  `DTHoRieng` varchar(20) DEFAULT NULL,
  `DTCaNhan` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `TinhThanhPhoThuongTru` varchar(100) DEFAULT NULL,
  `DiaChiBaoTin` varchar(255) DEFAULT NULL,
  `LinkFacebook` varchar(255) DEFAULT NULL,
  `AnhThe` varchar(255) DEFAULT NULL,
  `AnhCMND` varchar(255) DEFAULT NULL,
  `NguoiDungID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NguoiDungID` (`NguoiDungID`),
  CONSTRAINT `thongtincanhan_ibfk_1` FOREIGN KEY (`NguoiDungID`) REFERENCES `nguoidung` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
