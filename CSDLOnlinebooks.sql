USE [master]
GO
/****** Object:  Database [QuanLyBanSach]    Script Date: 2018-12-22 16:35:35 ******/
CREATE DATABASE [QuanLyBanSach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyBanSach', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVERD\MSSQL\DATA\QuanLyBanSach.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyBanSach_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVERD\MSSQL\DATA\QuanLyBanSach_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyBanSach] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyBanSach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyBanSach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBanSach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyBanSach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyBanSach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyBanSach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyBanSach] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyBanSach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyBanSach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyBanSach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyBanSach] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyBanSach] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyBanSach]
GO
/****** Object:  User [IIS APPPOOL\DucTrinh]    Script Date: 2018-12-22 16:35:35 ******/
CREATE USER [IIS APPPOOL\DucTrinh] FOR LOGIN [IIS APPPOOL\DucTrinh] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DucTrinh]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018-12-22 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[MaAd] [int] IDENTITY(1,1) NOT NULL,
	[HoTenAd] [nvarchar](100) NULL,
	[TaiKhoanAd] [varchar](50) NULL,
	[MatKhauAd] [varchar](50) NULL,
	[EmailAd] [varchar](50) NULL,
	[DiaChiAd] [nvarchar](200) NULL,
	[DienThoaiAd] [int] NULL,
	[GioiTinhAd] [nvarchar](10) NULL,
	[NgaySinh] [date] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[MaAd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 2018-12-22 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[MaSach] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [nchar](10) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 2018-12-22 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaChuDe] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](100) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 2018-12-22 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[MaSach] [int] NOT NULL,
	[MaDanhGia] [int] IDENTITY(1,1) NOT NULL,
	[cmtDanhGia] [nvarchar](1000) NULL,
	[DiemDG] [float] NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[NgayCmt] [date] NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaDanhGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 2018-12-22 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[DaThanhToan] [int] NULL,
	[TinhTrangGiaoHang] [int] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2018-12-22 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[DienThoai] [varchar](50) NULL,
	[GioiTinh] [nvarchar](20) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 2018-12-22 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](100) NULL,
	[SoDT] [varchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
 CONSTRAINT [PK_NhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 2018-12-22 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](100) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[AnhBia] [nvarchar](50) NULL,
	[NgayCapNhat] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[MaNXB] [int] NULL,
	[MaChuDe] [int] NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 2018-12-22 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTacGia] [int] IDENTITY(1,1) NOT NULL,
	[TenTacGia] [nvarchar](100) NULL,
	[TieuSu] [nvarchar](max) NULL,
 CONSTRAINT [PK_TacGia] PRIMARY KEY CLUSTERED 
(
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThamGia]    Script Date: 2018-12-22 16:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThamGia](
	[MaSach] [int] NOT NULL,
	[MaTacGia] [int] NOT NULL,
	[VaiTro] [nvarchar](50) NULL,
	[ViTri] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThamGia] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([MaAd], [HoTenAd], [TaiKhoanAd], [MatKhauAd], [EmailAd], [DiaChiAd], [DienThoaiAd], [GioiTinhAd], [NgaySinh]) VALUES (1, N'Trịnh Đức', N'TDuc', N'123', N'D@gmail.com', N'Bình Dương', 125864793, N'Nam', CAST(N'2011-01-11' AS Date))
INSERT [dbo].[Admin] ([MaAd], [HoTenAd], [TaiKhoanAd], [MatKhauAd], [EmailAd], [DiaChiAd], [DienThoaiAd], [GioiTinhAd], [NgaySinh]) VALUES (2, N'Phương nam', N'PNam', N'123', N'N@gmail.com', N'Bình Dương', 147852369, N'Nam', CAST(N'2013-03-13' AS Date))
INSERT [dbo].[Admin] ([MaAd], [HoTenAd], [TaiKhoanAd], [MatKhauAd], [EmailAd], [DiaChiAd], [DienThoaiAd], [GioiTinhAd], [NgaySinh]) VALUES (3, N'Hưu Tường', N'HTuong', N'123', N'T@gmail.com', N'Bình Dương', 123658947, N'Nam', CAST(N'2014-04-14' AS Date))
INSERT [dbo].[Admin] ([MaAd], [HoTenAd], [TaiKhoanAd], [MatKhauAd], [EmailAd], [DiaChiAd], [DienThoaiAd], [GioiTinhAd], [NgaySinh]) VALUES (4, N'Phan Thịnh', N'PThinh', N'123', N'TH@gmail.com', N'Bình Dương', 159753684, N'Nam', CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Admin] ([MaAd], [HoTenAd], [TaiKhoanAd], [MatKhauAd], [EmailAd], [DiaChiAd], [DienThoaiAd], [GioiTinhAd], [NgaySinh]) VALUES (5, N'Minh Phuc', N'MPhuc', N'123', N'PH@gmail.com', N'Bình Dương', 125897463, N'Nam', CAST(N'2016-06-16' AS Date))
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[ChuDe] ON 

INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (1, N'Văn Học')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (2, N'Kinh Tế')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (3, N'Giáo Dục')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (4, N'Kỹ Năng')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (5, N'Du lịch')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (6, N'Thiếu Nhi')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (7, N'Truyện Tranh')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (8, N'Truyện Kiếm Hiệp')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (9, N'Đời Sống')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (10, N'Sách Chuyên Ngành')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (11, N'Chính Trị')
SET IDENTITY_INSERT [dbo].[ChuDe] OFF
SET IDENTITY_INSERT [dbo].[DanhGia] ON 

INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (2, 2, N'hay', 4, N'trinh xuan duc', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (2, 3, N'dỡ', 3, N'trinh', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (2, 4, N'hay', 5, N'duc', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (2, 14, N'hay', 5, N'nam', CAST(N'2018-12-01' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (2, 15, N'dỡ', 1, N'phuc', CAST(N'2018-12-01' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (2, 16, N'tốt', 3, N'thịnh', CAST(N'2018-12-01' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (2, 17, N'good', 4, N'xuân đức', CAST(N'2018-12-01' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (2, 21, N'hay', 5, N'nam', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (2, 41, N'rating', NULL, N'rating', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (2, 59, N'dỡ', 2, N'nam', CAST(N'2018-12-08' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (3, 18, N'hay', 5, N'trịnh xuân đức', CAST(N'2018-12-01' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (3, 19, N'tốt', 4, N'nam', CAST(N'2018-12-01' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (3, 22, N'hay', 3, N'hay', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (3, 23, N'hay', 4, N'hay', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (3, 31, N'hay', 3, N'thịnh', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (3, 32, N'hay ', 5, N'nam', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (3, 33, N'hay', 3, N'nam', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (3, 34, N'hay', 4, N'văn thịnh', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (3, 35, N'hay', 5, N'phuc', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (3, 57, N'duc', 1, N'nam', CAST(N'2018-12-05' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (3, 58, N'duc', 1, N'nam', CAST(N'2018-12-05' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (4, 24, N'hay', 4, N'đức', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (4, 25, N'hay', 4, N'đức', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (4, 26, N'hay', 1, N'hay', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (4, 29, N'hay', 4, N'phuc', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (4, 36, N'hay', 4, N'nam', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (4, 43, N'test', 5, N'nam', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (5, 27, N'hay', 5, N'đức', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (5, 30, N'hay', 5, N'đức', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (6, 37, N'hay', 5, N'nam', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (6, 40, N'javascript', NULL, N'duc', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (6, 42, N'javascript', 4, N'phuc', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (6, 44, N'test', 5, N'nam', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (6, 46, N'test', 3, N'thịnh', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (6, 47, N'test', 3, N'thịnh', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (6, 56, N'hay', 5, N'duc', CAST(N'2018-12-04' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (8, 20, N'hay', 4, N'trịnh đức', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (8, 52, N'hay', 2, N'nam', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (8, 53, N'hay', 4, N'đức', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (8, 54, N'dỡ', 2, N'đức', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (8, 55, N'hay', 4, N'nam', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (9, 28, N'hay', 1, N'nam', CAST(N'2018-12-02' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (10, 45, N'tye', 5, N'phuc', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (10, 48, N'test', 4, N'phuc', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (10, 49, N'hay', 3, N'hay', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (10, 50, N'hay', 3, N'hay', CAST(N'2018-12-03' AS Date))
INSERT [dbo].[DanhGia] ([MaSach], [MaDanhGia], [cmtDanhGia], [DiemDG], [TenKhachHang], [NgayCmt]) VALUES (10, 51, N'hay', 3, N'hay', CAST(N'2018-12-03' AS Date))
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (1013, N'trịnh  đức', N'DUC1', N'202CB962AC59075B964B07152D234B70', N'trinhxuanduc997@gmail.com', N'Bình Phước', N'0919999999', N'Nam', CAST(N'2011-11-01 00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (1015, N'Trang', N'Trang1', N'202CB962AC59075B964B07152D234B70', N'TT@gmail.com', N'Bình Phước', N'123', N'Nữ', CAST(N'2000-11-03 00:00:00.000' AS DateTime))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (1016, N'trịnh xuân đức', N'DUC', N'F97E9293227B5B70A8DAF65E971DA0F9', N'trinhxuanduc997@gmail.com', N'Số nhà 119/6/52,Đường Hoàng Hoa Thám,Khu phố 7,Tổ 98', N'0967084484', N'Nam', CAST(N'2011-11-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [SoDT], [DiaChi]) VALUES (1, N'Phan Thị', NULL, N'TP. Hồ Chí Minh')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [SoDT], [DiaChi]) VALUES (2, N'NXB Trẻ', NULL, N'TP. Hồ Chí Minh')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [SoDT], [DiaChi]) VALUES (3, N'NXB Kim Đồng', NULL, N'TP. Hồ Chí Minh')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [SoDT], [DiaChi]) VALUES (4, N'Bách Việt', NULL, N'Hà Nội')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [SoDT], [DiaChi]) VALUES (5, N'Văn Việt', NULL, N'Hà Nội')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [SoDT], [DiaChi]) VALUES (6, N'Đinh Tị', NULL, N'Hà Nội')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [SoDT], [DiaChi]) VALUES (7, N'Nhã Nam', NULL, N'TP. Hồ Chí Minh')
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (2, N'Nghệ thuật phỏng vấn chính trị', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'0006.jpg', NULL, 20, 1, 11)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (3, N'Cô ơi em quên làm bài tập rồi', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'co-oi-em-quen-lam-bai-tap-roi.jpg', NULL, 30, 3, 3)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (4, N'Điều anh cần duy nhất chỉ là em', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'dieu-anh-can-duy-nhat-chi-la-em_1.jpg', NULL, 4, 2, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (5, N'Hiệu ảnh ishiura', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'hieu-anh-nishiura-o-enoshima.jpg', NULL, 5, 2, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (6, N'lên tám', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'len-tam.jpg', NULL, 50, 3, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (7, N'Mái trường xưa', CAST(69000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'mai-truong-xua-tai-ban-2018.jpg', NULL, 6, 2, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (8, N'Người đi vào hang sói', CAST(65000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'nguoi-di-vao-hang-soi.jpg', NULL, 20, 1, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (9, N'Nguyên tác thiết kê slide chuẩn ted', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'nguyen-tac-thiet-ke-slide-chuan-ted.jpg', NULL, 10, 4, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (10, N'Qua Khỏi dốc là nhà', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'qua-khoi-doc-la-nha.jpg', NULL, 15, 5, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (11, N'Ranh con ten Ly', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'ranh-con-ten-ly.jpg', NULL, 25, 6, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (12, N'Sài gòn khâu lại mãnh thời gian', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'sai-gon-khau-lai-manh-thoi-gian.jpg', NULL, 32, 7, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (13, N'Bán đá mua vàng bán hàng đệ nhất', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'ban-da-mua-vang-ban-hang-de-nhat.jpg', NULL, 12, 1, 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (14, N'Được tôn trọng', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'duoc-ton-trong.jpg', NULL, 10, 5, 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (15, N'Mail Maketing thấu hiểu để tối ưu', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'email-marketing-thau-hieu-de-toi-uu.png', NULL, 11, 6, 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (16, N'Facebook marketing 4.0', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'facebook-marketing-4-0.png', NULL, 22, 4, 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (17, N'Ngưng viện cớ', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'ngung-vien-co.png', NULL, 33, 7, 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (18, N'Stepping up nhà quản lý 4.0', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'-nha-quan-ly-4-0.jpg', NULL, 44, 6, 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (19, N'Tạo dựng thương hiệu cá nhân', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'tao-dung-thuong-hieu-ca-nhan.jpg', NULL, 55, 5, 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (20, N'thấu hiểu khách hàng bán hàng hiệu quả', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'thau-hieu-khach-hang-ban-hang-hieu-qua.jpg', NULL, 66, 4, 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (22, N'7 Viên Ngọc Rồng', CAST(15000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'7VNR.jpg', NULL, 55, 3, 7)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (23, N'10 Vạn Câu Hỏi Vì Sao', CAST(23000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'10VCHVS_.jpg', NULL, 50, 3, 6)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (24, N'Bài Học Cuộc Sống', CAST(25000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'BHCS.jpg', NULL, 23, 6, 4)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (25, N'Bí Quyết Học Đâu Nhớ Đó', CAST(30000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'BQHDND.jpg', NULL, 32, 4, 4)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (26, N'Bàn Về Văn Hóa Du Lịch Việt Nam', CAST(32000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'BVVHDLV.jpg', NULL, 56, 1, 5)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (27, N'Chân Không Mõi', CAST(35000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'CHM.jpg', NULL, 32, 2, 5)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (28, N'Cơ Diện Tử', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'CNCDT.jpg', NULL, 32, 4, 10)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (29, N'Kỹ Thuật Điện - Điện Tử', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'CNKTĐT.jpg', NULL, 25, 7, 10)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (30, N'Kỹ Thuật Oto và Xe máy', CAST(55000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'CNKTOVXM.jpg', NULL, 21, 6, 10)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (31, N'Chuyện Nhà Quê', CAST(40000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'CNQ.jpg', NULL, 23, 5, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (32, N'Conan', CAST(20000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'conan.jpg', NULL, 36, 2, 7)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (33, N'Chí Phèo', CAST(35000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'CP.png', NULL, 56, 1, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (34, N'Doremon', CAST(20000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'Doremon.jpg', NULL, 54, 3, 7)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (35, N'Động Vật Và Thực Vật', CAST(40000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'DVVTV.jpg', NULL, 21, 2, 6)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (36, N'Công Thức Và Hàm Trong EXCEL ', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'EX.jpg', NULL, 25, 3, 10)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (37, N'Hai Chú Gấu', CAST(50000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'HCG.jpg', NULL, 24, 4, 6)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (38, N'Ăn Nói Khéo Được Lòng Thiên Hạ', CAST(45000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'KANDLTH.jpg', NULL, 26, 7, 4)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (39, N'Kế Hoạch Cuộc Đời', CAST(46000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'KHCD.jpg', NULL, 2, 1, 3)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (40, N'Kỹ Thuật Điện', CAST(45000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'KTD.jpg', NULL, 3, 2, 10)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (41, N'Lão Hạc', CAST(35000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'LH.jpg', NULL, 35, 7, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (42, N'Lớp Học Gia Đình', CAST(15000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'LHGD.jpg', NULL, 34, 6, 3)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (43, N'Lắp Ráp Và Sửa Chửa Máy Tính', CAST(30000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'LRSCMT.jpg', NULL, 36, 5, 10)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (44, N'Lập Trình C', CAST(45000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'LTC.jpg', NULL, 15, 4, 10)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (45, N'Minh Triết Trong Đời Sống', CAST(60000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'MTTDS.jpg', NULL, 14, 1, 3)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (46, N'Nhà Giả Kim', CAST(69000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'NGK.jpg', NULL, 12, 5, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (47, N'Ngôi Nhà Tranh', CAST(74000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'NNT.jpg', NULL, 13, 6, 6)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (48, N'Ngạo Thế Cửu Trọng Thiên', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'NTCTT.jpg', NULL, 16, 4, 8)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (49, N'Tạo Website hướng Database bằng PHP và MySQL', CAST(100000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'PHP.jpg', NULL, 41, 5, 10)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (50, N'Quốc Gia Khởi Nghiệp', CAST(69000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'QGKN.jpg', NULL, 45, 1, 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (51, N'Quản Lý Thời Gian', CAST(59000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'QLTG.jpg', NULL, 42, 2, 4)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (52, N'Tiếng Anh Chuyên Ngành Công Nghẻ Thông Tin', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TACNCNTT.jpg', NULL, 43, 6, 10)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (53, N'Thần Điêu Đại Hiệp', CAST(89000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TĐH.jpg', NULL, 46, 4, 8)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (54, N'Tư Duy Tích Cực Thay Đổi Cuộc Sống', CAST(79000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TDTCTDCS.jpg', NULL, 52, 1, 4)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (55, N'Du Lịch Thế Giới ', CAST(56000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TGDL.jpg', NULL, 51, 7, 5)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (56, N'Thế Giới Phẳng', CAST(99000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TheGioiPhang.jpg', NULL, 53, 6, 2)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (57, N'Thực Hành Kỹ Năng Sống', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'THKNS.jpg', NULL, 54, 5, 3)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (58, N'Thiết Kế Website', CAST(59000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TKW.jpg', NULL, 55, 4, 10)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (59, N'Thiên Long Bát Bộ', CAST(20000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TLBB.jpg', NULL, 22, 7, 8)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (60, N'Tâm Lý Học Và Đời Sống', CAST(39000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TLHVDS.jpg', NULL, 21, 5, 3)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (61, N'Tôi Là Một Con Lửa', CAST(49000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TLMCL.jpg', NULL, 25, 4, 5)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (62, N'Thôi Miên Bằng Ngôn Ngữ', CAST(56000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TMBNN.jpg', NULL, 27, 1, 3)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (63, N'Trạng Quỷnh', CAST(45000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TQ.jpg', NULL, 28, 5, 7)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (64, N'Thục Sơn Kiếm hiệp', CAST(46000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TSKH.jpg', NULL, 29, 6, 8)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (65, N'Trạng Tí', CAST(20000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TT.jpg', NULL, 18, 4, 7)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (66, N'Tôi Thấy Hoa Vàng Trên Cỏ Xanh', CAST(39000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'TTHVTCX.png', NULL, 17, 7, 1)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (67, N'Vượt Lên Chính Mình', CAST(20000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'VLCM.jpg', NULL, 19, 1, 4)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (68, N'Xách Balo lên Và đi', CAST(36000 AS Decimal(18, 0)), N'Nhà khoa học Albert Einstein từng nói:

“Trí tưởng tượng quan trọng hơn cả kiến thức, vì kiến thức là có hạn, còn trí tưởng tượng thì vô hạn, trí tưởng tượng chính là tiền đề của tương lai.”

Khi đọc sách, trí óc chúng ta tự do hình dung và liên kết các thông tin ta thu nạp, đem lại cảm giác như chính bạn đang trải nghiệm tình huống đó, đang thấy, đang chứng kiến những gì xảy ra. Đó là những cảm xúc rất thật. Với sách, trí tưởng tượng của bạn được rèn luyện để bay cao, bay xa và mang lại cho bạn những ý tưởng tuyệt vời.', N'XBLLVD.jpg', NULL, 39, 4, 5)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (69, N'Ỷ Thiên Đồ Long Ký', CAST(45000 AS Decimal(18, 0)), NULL, N'YTDLK.jpg', NULL, 38, 5, 8)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [GiaBan], [MoTa], [AnhBia], [NgayCapNhat], [SoLuongTon], [MaNXB], [MaChuDe]) VALUES (75, N'trinh duc', CAST(50000 AS Decimal(18, 0)), N'1', N'banhang.PNG', CAST(N'2018-11-11 00:00:00.000' AS DateTime), 2, 3, 3)
SET IDENTITY_INSERT [dbo].[Sach] OFF
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (1, N'Arika Toriyama', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (2, N'Tôn Nguyên Vĩ', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (3, N'Marshall Goldsmith', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (4, N'Peter C.Brown', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (5, N'Phan Huy Xu', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (6, N'Đinh Hằng ', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (7, N'Nhiều Tác Giả', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (9, N'Nguyễn Quang Lập', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (10, N'Aoyama', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (11, N'Nam Cao', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (12, N'Fujiko Fujio', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (13, N'Trác Nhã', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (14, N'ASHTON', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (15, N'DARSHANI', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (16, N'PAULO COELHO', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (17, N'MARTIN', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (18, N'KIM DUNG', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (19, N'NGUYỄN PHƯƠNG MAI', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (20, N'LÊ LINH', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (21, N'NGUYỄN NHẬT ÁNH', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (22, N'GORDON', NULL)
INSERT [dbo].[TacGia] ([MaTacGia], [TenTacGia], [TieuSu]) VALUES (23, N'Tom', NULL)
SET IDENTITY_INSERT [dbo].[TacGia] OFF
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (2, 1, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (2, 2, N'Dịch Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (3, 3, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (4, 4, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (5, 5, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (6, 6, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (7, 7, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (8, 9, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (9, 10, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (10, 11, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (11, 12, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (12, 13, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (13, 14, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (14, 15, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (15, 16, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (17, 18, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (18, 17, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (19, 18, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (20, 19, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (20, 21, N'Dịch Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (22, 22, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (23, 1, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (24, 2, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (25, 3, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (26, 4, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (27, 5, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (28, 6, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (29, 7, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (30, 9, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (31, 10, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (32, 11, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (33, 12, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (34, 12, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (35, 13, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (36, 14, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (37, 15, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (38, 18, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (39, 16, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (40, 17, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (41, 19, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (42, 20, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (43, 22, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (44, 21, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (45, 1, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (46, 2, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (47, 3, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (48, 4, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (49, 6, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (50, 5, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (51, 10, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (52, 12, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (53, 13, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (54, 14, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (55, 15, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (56, 16, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (57, 17, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (58, 18, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (59, 19, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (60, 20, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (61, 21, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (62, 22, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (63, 3, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (64, 4, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (65, 5, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (66, 6, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (67, 7, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (68, 9, N'Tác Giả', NULL)
INSERT [dbo].[ThamGia] ([MaSach], [MaTacGia], [VaiTro], [ViTri]) VALUES (69, 10, N'Tác Giả', NULL)
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_Sach]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_Sach]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_ChuDe] FOREIGN KEY([MaChuDe])
REFERENCES [dbo].[ChuDe] ([MaChuDe])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_ChuDe]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NhaXuatBan] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NhaXuatBan] ([MaNXB])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NhaXuatBan]
GO
ALTER TABLE [dbo].[ThamGia]  WITH CHECK ADD  CONSTRAINT [FK_ThamGia_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[ThamGia] CHECK CONSTRAINT [FK_ThamGia_Sach]
GO
ALTER TABLE [dbo].[ThamGia]  WITH CHECK ADD  CONSTRAINT [FK_ThamGia_TacGia] FOREIGN KEY([MaTacGia])
REFERENCES [dbo].[TacGia] ([MaTacGia])
GO
ALTER TABLE [dbo].[ThamGia] CHECK CONSTRAINT [FK_ThamGia_TacGia]
GO
USE [master]
GO
ALTER DATABASE [QuanLyBanSach] SET  READ_WRITE 
GO
