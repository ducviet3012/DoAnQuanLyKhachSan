USE [master]
GO
/****** Object:  Database [QLKhachSanTTTN]    Script Date: 6/10/2024 9:27:01 PM ******/
CREATE DATABASE [QLKhachSanTTTN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLKhachSanTTTN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\QLKhachSanTTTN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLKhachSanTTTN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\QLKhachSanTTTN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLKhachSanTTTN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLKhachSanTTTN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLKhachSanTTTN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLKhachSanTTTN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLKhachSanTTTN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLKhachSanTTTN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLKhachSanTTTN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLKhachSanTTTN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLKhachSanTTTN] SET  MULTI_USER 
GO
ALTER DATABASE [QLKhachSanTTTN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLKhachSanTTTN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLKhachSanTTTN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLKhachSanTTTN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLKhachSanTTTN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLKhachSanTTTN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLKhachSanTTTN] SET QUERY_STORE = OFF
GO
USE [QLKhachSanTTTN]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDAdmin] [int] NULL,
	[Anh] [nvarchar](50) NULL,
	[TieuDe] [nvarchar](max) NULL,
	[ThongTin] [text] NULL,
	[NgayDang] [date] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTAnh]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTAnh](
	[TenAnh] [nvarchar](50) NOT NULL,
	[MaPhong] [int] NULL,
 CONSTRAINT [PK_CTAnh] PRIMARY KEY CLUSTERED 
(
	[TenAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatPhong]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatPhong](
	[MaPhong] [int] NOT NULL,
	[SoHoaDon] [int] NOT NULL,
	[NgayDen] [datetime] NULL,
	[NgayDi] [datetime] NULL,
	[NgayHuy] [datetime] NULL,
	[SoNguoi] [int] NULL,
	[IsDelete] [int] NULL,
 CONSTRAINT [PK_DatPhong] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC,
	[SoHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GopY]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GopY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[MaKS] [int] NULL,
	[NgayComment] [datetime] NULL,
	[Comment] [nvarchar](max) NULL,
	[DiemNhanVien] [float] NULL,
	[DiemDoAn] [float] NULL,
	[DiemSachSe] [float] NULL,
	[DiemThoaiMai] [float] NULL,
	[DiemDichVu] [float] NULL,
 CONSTRAINT [PK_GopY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[SoHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayThanhToan] [datetime] NULL,
	[NgayTao] [datetime] NULL,
	[TenKH] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[SDT] [nvarchar](50) NULL,
	[TinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[SoHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[GioiTinh] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[HieuLuc] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachSan]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachSan](
	[MaKS] [int] IDENTITY(1,1) NOT NULL,
	[MaTinh] [int] NULL,
	[IDNguoiTao] [int] NULL,
	[TenKhachSan] [nvarchar](200) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[Anh] [nvarchar](50) NULL,
	[DanhGia] [int] NULL,
	[Duyet] [int] NULL,
 CONSTRAINT [PK_KhachSan] PRIMARY KEY CLUSTERED 
(
	[MaKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[MaLP] [int] IDENTITY(1,1) NOT NULL,
	[MaKS] [int] NULL,
	[TenLP] [nvarchar](50) NULL,
	[SoNguoiToiDa] [int] NULL,
	[Gia] [float] NULL,
	[Anh] [nvarchar](50) NULL,
	[ThongTin] [nvarchar](max) NULL,
	[KichThuoc] [nvarchar](20) NULL,
 CONSTRAINT [PK_LoaiPhong] PRIMARY KEY CLUSTERED 
(
	[MaLP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[MaPhong] [int] IDENTITY(1,1) NOT NULL,
	[TenPhong] [nvarchar](50) NULL,
	[MaLP] [int] NULL,
	[Anh] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuenMatKhau]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuenMatKhau](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_QuenMatKhau] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuDungThietBi]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuDungThietBi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaTB] [int] NOT NULL,
	[MaLP] [int] NOT NULL,
 CONSTRAINT [PK_SuDungThietBi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThietBi]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThietBi](
	[MaTB] [int] IDENTITY(1,1) NOT NULL,
	[TenTB] [nvarchar](200) NULL,
 CONSTRAINT [PK_ThietBi] PRIMARY KEY CLUSTERED 
(
	[MaTB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhThanh]    Script Date: 6/10/2024 9:27:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhThanh](
	[MaTinh] [int] IDENTITY(1,1) NOT NULL,
	[TenTinh] [nvarchar](50) NULL,
	[Anh] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhThanh] PRIMARY KEY CLUSTERED 
(
	[MaTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([ID], [Email], [Password]) VALUES (1, N'viet2002@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Admin] ([ID], [Email], [Password]) VALUES (2, N'admin@gmail.com', N'21232f297a57a5a743894a0e4a801fc3')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([ID], [IDAdmin], [Anh], [TieuDe], [ThongTin], [NgayDang]) VALUES (2, 2, N'blog.jpg', N'Features holiday on the French Riviera', N'This is an example of the H2 header This is Photoshop''s version of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit.  Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non mauris vitae erat consequat auctor eu in elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris in erat justo. Nullam ac urna eu felis dapibus condimentum sit amet a augue. Sed non neque elit. Sed ut imperdiet nisi. Proin condimentum fermentum nunc. Etiam pharetra, erat sed fermentum feugiat, velit mauris egestas quam, ut aliquam massa nisl quis neque. Suspendisse in orci enim.', CAST(N'2024-04-23' AS Date))
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'anhks3.webp', 57)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'anhks7.jpeg', 52)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'blog.jpg', 55)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'dlx.webp', 6)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'dlx1.webp', 6)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'dlx2.webp', 6)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'dlx3.webp', 6)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'dlx4.webp', 6)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'dlx5.webp', 6)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'std.jpg', 1)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'std1.jpg', 1)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'std2.jpg', 1)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'std3.jpg', 1)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'std4.jpg', 1)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'stdnen.jpg', 2)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'stdnen1.webp', 2)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'stdnen2.webp', 2)
INSERT [dbo].[CTAnh] ([TenAnh], [MaPhong]) VALUES (N'stdnen3.webp', 2)
GO
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1030, CAST(N'2024-03-21T00:00:00.000' AS DateTime), CAST(N'2024-03-21T00:00:00.000' AS DateTime), CAST(N'2024-03-18T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1031, CAST(N'2024-03-23T00:00:00.000' AS DateTime), CAST(N'2024-03-23T00:00:00.000' AS DateTime), CAST(N'2024-03-20T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1033, CAST(N'2024-03-25T00:00:00.000' AS DateTime), CAST(N'2024-03-25T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1034, CAST(N'2024-03-28T00:00:00.000' AS DateTime), CAST(N'2024-03-28T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1035, CAST(N'2024-03-30T00:00:00.000' AS DateTime), CAST(N'2024-03-30T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1053, CAST(N'2024-04-05T00:00:00.000' AS DateTime), CAST(N'2024-04-05T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1060, CAST(N'2024-04-24T00:00:00.000' AS DateTime), CAST(N'2024-04-24T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1061, CAST(N'2024-04-25T00:00:00.000' AS DateTime), CAST(N'2024-04-25T00:00:00.000' AS DateTime), CAST(N'2024-04-22T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1067, CAST(N'2024-04-27T00:00:00.000' AS DateTime), CAST(N'2024-04-27T00:00:00.000' AS DateTime), CAST(N'2024-04-23T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1068, CAST(N'2024-04-28T00:00:00.000' AS DateTime), CAST(N'2024-04-28T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1072, CAST(N'2024-04-29T00:00:00.000' AS DateTime), CAST(N'2024-04-29T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1077, CAST(N'2024-04-30T00:00:00.000' AS DateTime), CAST(N'2024-04-30T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1082, CAST(N'2024-05-01T00:00:00.000' AS DateTime), CAST(N'2024-05-01T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1086, CAST(N'2024-05-02T00:00:00.000' AS DateTime), CAST(N'2024-05-02T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1089, CAST(N'2024-05-03T00:00:00.000' AS DateTime), CAST(N'2024-05-03T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1092, CAST(N'2024-05-08T00:00:00.000' AS DateTime), CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1093, CAST(N'2024-05-09T00:00:00.000' AS DateTime), CAST(N'2024-05-09T00:00:00.000' AS DateTime), CAST(N'2024-05-07T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1096, CAST(N'2024-05-10T00:00:00.000' AS DateTime), CAST(N'2024-05-10T00:00:00.000' AS DateTime), CAST(N'2024-05-08T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1136, CAST(N'2024-05-11T00:00:00.000' AS DateTime), CAST(N'2024-05-11T00:00:00.000' AS DateTime), CAST(N'2024-05-08T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1142, CAST(N'2024-05-11T00:00:00.000' AS DateTime), CAST(N'2024-05-11T00:00:00.000' AS DateTime), CAST(N'2024-05-08T00:00:00.000' AS DateTime), 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1144, CAST(N'2024-05-13T00:00:00.000' AS DateTime), CAST(N'2024-05-13T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1146, CAST(N'2024-05-14T00:00:00.000' AS DateTime), CAST(N'2024-05-14T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1152, CAST(N'2024-05-16T00:00:00.000' AS DateTime), CAST(N'2024-05-16T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1153, CAST(N'2024-05-17T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1154, CAST(N'2024-05-18T00:00:00.000' AS DateTime), CAST(N'2024-05-18T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1155, CAST(N'2024-05-19T00:00:00.000' AS DateTime), CAST(N'2024-05-19T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1156, CAST(N'2024-05-20T00:00:00.000' AS DateTime), CAST(N'2024-05-20T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1157, CAST(N'2024-05-21T00:00:00.000' AS DateTime), CAST(N'2024-05-21T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1158, CAST(N'2024-05-23T00:00:00.000' AS DateTime), CAST(N'2024-05-23T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1159, CAST(N'2024-05-15T00:00:00.000' AS DateTime), CAST(N'2024-05-15T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1160, CAST(N'2024-05-22T00:00:00.000' AS DateTime), CAST(N'2024-05-22T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1161, CAST(N'2024-05-24T00:00:00.000' AS DateTime), CAST(N'2024-05-24T00:00:00.000' AS DateTime), CAST(N'2024-05-20T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1165, CAST(N'2024-05-28T00:00:00.000' AS DateTime), CAST(N'2024-05-28T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1172, CAST(N'2024-06-03T00:00:00.000' AS DateTime), CAST(N'2024-06-03T00:00:00.000' AS DateTime), CAST(N'2024-05-30T08:18:10.353' AS DateTime), 2, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1175, CAST(N'2024-05-30T00:00:00.000' AS DateTime), CAST(N'2024-05-31T00:00:00.000' AS DateTime), NULL, 3, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (1, 1182, CAST(N'2024-06-04T00:00:00.000' AS DateTime), CAST(N'2024-06-04T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1016, CAST(N'2024-02-22T00:00:00.000' AS DateTime), CAST(N'2024-02-23T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1018, CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(N'2024-02-26T00:00:00.000' AS DateTime), CAST(N'2024-05-22T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1019, CAST(N'2024-02-28T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-05-24T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1020, CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-01T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1021, CAST(N'2024-02-27T00:00:00.000' AS DateTime), CAST(N'2024-02-27T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1023, CAST(N'2024-03-05T00:00:00.000' AS DateTime), CAST(N'2024-03-05T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1024, CAST(N'2024-03-09T00:00:00.000' AS DateTime), CAST(N'2024-03-09T00:00:00.000' AS DateTime), NULL, 3, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1025, CAST(N'2024-03-08T00:00:00.000' AS DateTime), CAST(N'2024-03-08T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1026, CAST(N'2024-03-13T00:00:00.000' AS DateTime), CAST(N'2024-03-13T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1027, CAST(N'2024-03-07T00:00:00.000' AS DateTime), CAST(N'2024-03-07T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1039, CAST(N'2024-03-27T00:00:00.000' AS DateTime), CAST(N'2024-03-27T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1049, CAST(N'2024-04-03T00:00:00.000' AS DateTime), CAST(N'2024-04-03T00:00:00.000' AS DateTime), NULL, 3, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1052, CAST(N'2024-04-11T00:00:00.000' AS DateTime), CAST(N'2024-04-11T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1143, CAST(N'2024-05-15T00:00:00.000' AS DateTime), CAST(N'2024-05-15T00:00:00.000' AS DateTime), CAST(N'2024-05-12T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1147, CAST(N'2024-05-13T00:00:00.000' AS DateTime), CAST(N'2024-05-13T00:00:00.000' AS DateTime), CAST(N'2024-05-10T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1150, CAST(N'2024-05-17T00:00:00.000' AS DateTime), CAST(N'2024-05-18T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1151, CAST(N'2024-05-20T00:00:00.000' AS DateTime), CAST(N'2024-05-20T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1162, CAST(N'2024-05-19T00:00:00.000' AS DateTime), CAST(N'2024-05-19T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1163, CAST(N'2024-05-22T00:00:00.000' AS DateTime), CAST(N'2024-05-22T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1166, CAST(N'2024-05-28T00:00:00.000' AS DateTime), CAST(N'2024-05-28T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1169, CAST(N'2024-05-29T00:00:00.000' AS DateTime), CAST(N'2024-05-29T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1170, CAST(N'2024-05-30T00:00:00.000' AS DateTime), CAST(N'2024-05-30T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1173, CAST(N'2024-05-31T00:00:00.000' AS DateTime), CAST(N'2024-05-31T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1178, CAST(N'2024-06-04T00:00:00.000' AS DateTime), CAST(N'2024-06-04T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (2, 1181, CAST(N'2024-06-05T00:00:00.000' AS DateTime), CAST(N'2024-06-05T00:00:00.000' AS DateTime), NULL, 2, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (17, 1171, CAST(N'2024-05-29T00:00:00.000' AS DateTime), CAST(N'2024-05-29T00:00:00.000' AS DateTime), NULL, 3, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (18, 1174, CAST(N'2024-05-30T00:00:00.000' AS DateTime), CAST(N'2024-05-31T00:00:00.000' AS DateTime), NULL, 3, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (50, 1184, CAST(N'2024-06-08T00:00:00.000' AS DateTime), CAST(N'2024-06-08T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[DatPhong] ([MaPhong], [SoHoaDon], [NgayDen], [NgayDi], [NgayHuy], [SoNguoi], [IsDelete]) VALUES (57, 1164, CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-05-26T00:00:00.000' AS DateTime), NULL, 2, 0)
GO
SET IDENTITY_INSERT [dbo].[GopY] ON 

INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (56, 5, 1, CAST(N'2024-03-12T00:00:00.000' AS DateTime), N'a', 4, 4, 4, 4, 4)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (57, 5, 1, CAST(N'2024-03-12T00:00:00.000' AS DateTime), N'af', 6, 6, 6, 6, 6)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (82, 5, 1, CAST(N'2024-03-12T00:00:00.000' AS DateTime), N'aa', 8, 8, 8, 8, 8)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (83, 5, 1, CAST(N'2024-03-12T00:00:00.000' AS DateTime), N'f', 9, 9, 9, 9, 9)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (89, 5, 1, CAST(N'2024-03-12T00:00:00.000' AS DateTime), N'nhân viên phục vụ quá tuyệt vời ạ', 9, 9, 9, 9, 9)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (90, 5, 1, CAST(N'2024-03-12T00:00:00.000' AS DateTime), N'tốt', 8, 8, 8, 8, 8)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (91, 5, 1, CAST(N'2024-03-12T00:00:00.000' AS DateTime), N'quá là ok', 9.3000001907348633, 9.6999998092651367, 9.3999996185302734, 9.6999998092651367, 10)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (92, 5, 2, CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'tuyệt vời', 9.4, 9.7, 9.7, 9.8, 9.8)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (93, 2, 1, CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'tuyệt vời', 9.2, 9.5, 9.7, 9.8, 9.8)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (94, 6, 1, CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'tệ', 5.5, 3.5, 2.4, 1.9, 1.1)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (95, 2, 1, CAST(N'2024-03-13T00:00:00.000' AS DateTime), N'Tốt quá đi', 10, 10, 10, 10, 10)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (96, 2, 1, CAST(N'2024-03-15T00:00:00.000' AS DateTime), N'Tệ quá tệ', 0.7, 1.3, 2.1, 2.3, 2.3)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (98, 5, 1, CAST(N'2024-05-10T00:00:00.000' AS DateTime), N'a', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (99, 5, 1, CAST(N'2024-05-10T00:00:00.000' AS DateTime), N'tốt', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (100, 5, 1, CAST(N'2024-05-10T00:00:00.000' AS DateTime), N'ppp', 9.6, 9.9, 9, 9.1, 8.8)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (101, 5, 1, CAST(N'2024-05-10T00:00:00.000' AS DateTime), N'eee', 9.5, 9.8, 9.7, 9.2, 8.9)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (102, 5, 1, CAST(N'2024-05-10T00:00:00.000' AS DateTime), N'aaa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (103, 5, 1, CAST(N'2024-05-10T00:00:00.000' AS DateTime), N'aa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (104, 5, 1, CAST(N'2024-05-10T00:00:00.000' AS DateTime), N'g', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (105, 5, 1, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'a', 9.2, 8.9, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (106, 5, 1, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'aa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (107, 5, 1, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'dd', 8.2, 8.2, 8.2, 8.2, 10)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (108, 5, 1, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'aarr', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (109, 5, 1, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'đẹp quá đi', 9.9, 9.9, 9.9, 9.9, 9.9)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (110, 5, 1, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'aa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (113, 5, 1, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'a', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (114, 5, 1, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'z', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (116, 5, 1, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'aa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (121, 5, 1, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'bb', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (122, 5, 1, CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'ô', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (126, 5, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'aa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (127, 5, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'bb', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (131, 5, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'aaa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (132, 5, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'nnn', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (146, 5, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'b', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (147, 5, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'nn', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (155, 5, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'sss', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (157, 5, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'aa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (166, 2, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'nnn', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (168, 2, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'sss', 8.9, 8.8, 8.9, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (169, 2, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'aaaaa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (170, 2, 1, CAST(N'2024-05-13T00:00:00.000' AS DateTime), N'ok', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (171, 5, 1, CAST(N'2024-05-13T11:55:20.483' AS DateTime), N'tuyệt', 9.7, 9.8, 9.9, 9.9, 9.7)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (172, 5, 1, CAST(N'2024-05-13T12:01:25.437' AS DateTime), N'ssss', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (173, 5, 1, CAST(N'2024-05-13T12:01:37.507' AS DateTime), N'e', 8.2, 8.2, 8.2, 8.2, 9.7)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (174, 2, 1, CAST(N'2024-05-13T12:02:03.233' AS DateTime), N'ggg', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (175, 5, 1, CAST(N'2024-05-13T12:09:33.623' AS DateTime), N'hh', 8.2, 8.2, 8.2, 8.2, 9.5)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (179, 5, 1, CAST(N'2024-05-13T14:55:05.530' AS DateTime), N'aa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (180, 5, 1, CAST(N'2024-05-13T14:55:17.967' AS DateTime), N'aa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (184, 5, 1, CAST(N'2024-05-13T16:30:31.447' AS DateTime), N'aa', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (189, 2, 1, CAST(N'2024-05-19T10:40:46.070' AS DateTime), N'Hoàng ', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (190, 2, 2, CAST(N'2024-05-22T21:42:53.263' AS DateTime), N'đẹp quá', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (191, 2, 2, CAST(N'2024-05-22T21:45:37.320' AS DateTime), N'a', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (192, 2, 2, CAST(N'2024-05-22T21:45:39.167' AS DateTime), N'a', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (194, 5, 1, CAST(N'2024-05-27T20:26:24.660' AS DateTime), N'ổn', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (195, 5, 1, CAST(N'2024-05-27T20:28:20.910' AS DateTime), N'a', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (196, 5, 1, CAST(N'2024-05-27T20:28:36.290' AS DateTime), N'view đẹp, dịch vụ tốt', 8.2, 8.2, 8.2, 8.2, 8.2)
INSERT [dbo].[GopY] ([ID], [MaKH], [MaKS], [NgayComment], [Comment], [DiemNhanVien], [DiemDoAn], [DiemSachSe], [DiemThoaiMai], [DiemDichVu]) VALUES (197, 5, 1, CAST(N'2024-05-28T19:25:32.810' AS DateTime), N'dịch vụ tốt quá , nhân viên phục vụ nhiệt tình', 9.5, 9.4, 9.5, 9.8, 9.8)
SET IDENTITY_INSERT [dbo].[GopY] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1016, 2, CAST(N'2024-02-23T00:00:00.000' AS DateTime), NULL, N'Viet', N'viet123@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1018, 2, CAST(N'2024-02-26T00:00:00.000' AS DateTime), NULL, N'Viet', N'viet123@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1019, 2, CAST(N'2024-02-29T00:00:00.000' AS DateTime), NULL, N'Viet', N'viet123@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1020, 5, CAST(N'2024-03-01T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1021, 5, CAST(N'2024-02-27T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1023, 5, CAST(N'2024-03-05T00:00:00.000' AS DateTime), NULL, N'Đỗ Đức Việt', N'vietsex3012@gmail.com', N'0912345678', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1024, 5, CAST(N'2024-03-09T00:00:00.000' AS DateTime), NULL, N'Đỗ Đức Việt', N'vietsex3012@gmail.com', N'0912345678', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1025, 5, CAST(N'2024-03-08T00:00:00.000' AS DateTime), NULL, N'Đỗ Đức Việt', N'vietsex3012@gmail.com', N'0924232846', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1026, 5, CAST(N'2024-03-13T00:00:00.000' AS DateTime), NULL, N'Đỗ Đức Việt', N'vietsex3012@gmail.com', N'0912345874', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1027, 5, CAST(N'2024-03-07T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1030, 2, CAST(N'2024-03-21T00:00:00.000' AS DateTime), NULL, N'Nguyen Van A', N'viet123@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1031, 2, CAST(N'2024-03-23T00:00:00.000' AS DateTime), NULL, N'Nguyen Van A', N'viet123@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1033, 2, CAST(N'2024-03-25T00:00:00.000' AS DateTime), NULL, N'Nguyen Van A', N'viet123@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1034, 2, CAST(N'2024-03-28T00:00:00.000' AS DateTime), NULL, N'Nguyen Van A', N'viet123@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1035, 2, CAST(N'2024-03-30T00:00:00.000' AS DateTime), NULL, N'Nguyen Van A', N'viet123@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1039, 2, CAST(N'2024-03-27T00:00:00.000' AS DateTime), NULL, N'Nguyen Van A', N'viet123@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1049, 5, CAST(N'2024-04-03T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1052, 5, CAST(N'2024-04-11T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1053, 5, CAST(N'2024-04-05T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1060, 5, CAST(N'2024-04-24T00:00:00.000' AS DateTime), CAST(N'2024-05-28T14:55:47.977' AS DateTime), N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1061, 5, CAST(N'2024-04-25T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1067, 5, CAST(N'2024-04-27T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1068, 5, CAST(N'2024-04-28T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1072, 5, CAST(N'2024-04-29T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1077, 5, CAST(N'2024-04-30T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1082, 5, CAST(N'2024-05-01T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1086, 5, CAST(N'2024-05-02T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1089, 5, CAST(N'2024-05-03T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1092, 5, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1093, 5, CAST(N'2024-05-09T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1096, 5, CAST(N'2024-05-10T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã đặt cọc')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1136, 5, CAST(N'2024-05-11T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã hủy')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1138, 5, CAST(N'2024-05-13T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã hủy')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1141, 5, CAST(N'2024-05-12T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã hủy')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1142, 5, CAST(N'2024-05-11T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã đặt cọc')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1143, 5, CAST(N'2024-05-15T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã hủy')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1144, 5, CAST(N'2024-05-13T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1146, 5, CAST(N'2024-05-14T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1147, 5, CAST(N'2024-05-13T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1150, 5, CAST(N'2024-05-18T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1151, 5, CAST(N'2024-05-20T00:00:00.000' AS DateTime), CAST(N'2024-06-07T08:12:24.917' AS DateTime), N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1152, 2, CAST(N'2024-05-16T00:00:00.000' AS DateTime), CAST(N'2024-06-07T08:15:56.397' AS DateTime), N'Nguyen Van A', N'viet123@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1153, 5, CAST(N'2024-05-17T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1154, 5, CAST(N'2024-05-18T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã đặt cọc')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1155, 5, CAST(N'2024-05-19T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1156, 5, CAST(N'2024-05-20T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1157, 5, CAST(N'2024-05-21T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1158, 5, CAST(N'2024-05-23T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1159, 5, CAST(N'2024-05-15T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã đặt cọc')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1160, 5, CAST(N'2024-05-22T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã đặt cọc')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1161, 5, CAST(N'2024-05-24T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã hủy')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1162, 5, CAST(N'2024-05-19T00:00:00.000' AS DateTime), NULL, N'viet', N'doducviet3012@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1163, 5, CAST(N'2024-05-22T00:00:00.000' AS DateTime), NULL, N'Việt', N'doducviet3012@gmail.com', N'0903497119', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1164, 2, CAST(N'2024-05-26T00:00:00.000' AS DateTime), NULL, N'Nguyen Van A', N'viet123@gmail.com', N'0123456789', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1165, 5, CAST(N'2024-05-28T00:00:00.000' AS DateTime), NULL, N'Việt', N'doducviet3012@gmail.com', N'0903497119', N'Đã đặt cọc')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1166, 5, CAST(N'2024-05-28T00:00:00.000' AS DateTime), NULL, N'Việt', N'doducviet3012@gmail.com', N'0903497119', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1169, 5, CAST(N'2024-05-28T16:39:45.723' AS DateTime), CAST(N'2024-06-07T08:09:54.307' AS DateTime), N'Việt', N'doducviet3012@gmail.com', N'0903497119', N'Đã đặt cọc')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1170, 5, CAST(N'2024-05-28T19:42:40.447' AS DateTime), CAST(N'2024-06-07T08:03:24.420' AS DateTime), N'Việt', N'doducviet3012@gmail.com', N'0903497119', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1171, 5, CAST(N'2024-05-29T23:36:59.293' AS DateTime), CAST(N'2024-06-07T08:14:10.387' AS DateTime), N'Việt', N'doducviet3012@gmail.com', N'0903497119', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1172, 5, CAST(N'2024-05-30T08:15:56.097' AS DateTime), CAST(N'2024-06-07T21:58:13.323' AS DateTime), N'Việt', N'doducviet3012@gmail.com', N'0903497119', N'Đã hủy')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1173, 5, CAST(N'2024-05-30T20:52:01.303' AS DateTime), CAST(N'2024-06-06T22:57:31.533' AS DateTime), N'Việt', N'doducviet3012@gmail.com', N'0903497119', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1174, 5, CAST(N'2024-05-30T21:00:48.690' AS DateTime), CAST(N'2024-06-06T22:59:29.770' AS DateTime), N'Việt', N'doducviet3012@gmail.com', N'0903497119', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1175, 5, CAST(N'2024-05-30T21:02:06.080' AS DateTime), CAST(N'2024-06-06T22:55:20.790' AS DateTime), N'Việt', N'doducviet3012@gmail.com', N'0903497119', N'Đã đặt cọc')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1178, 5, CAST(N'2024-06-03T16:21:11.407' AS DateTime), NULL, N'Việt', N'doducviet3012@gmail.com', N'0903497119', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1181, 5, CAST(N'2024-06-03T17:04:51.643' AS DateTime), CAST(N'2024-06-07T08:02:24.987' AS DateTime), N'Đỗ Đức Việt', N'doducviet3012@gmail.com', N'0903490883', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1182, 5, CAST(N'2024-06-03T17:21:40.137' AS DateTime), CAST(N'2024-06-06T22:39:44.440' AS DateTime), N'Đỗ Đức Việt', N'doducviet3012@gmail.com', N'0903490883', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1183, NULL, CAST(N'2024-06-07T15:58:04.793' AS DateTime), NULL, N'Đỗ Đức Việt', N'doducviet1@gmail.com', N'0903490883', N'Đã thanh toán')
INSERT [dbo].[HoaDon] ([SoHoaDon], [MaKH], [NgayThanhToan], [NgayTao], [TenKH], [Email], [SDT], [TinhTrang]) VALUES (1184, NULL, CAST(N'2024-06-07T16:04:17.947' AS DateTime), NULL, N'Đỗ Đức Việt', N'doducviet1@gmail.com', N'0903490883', N'Đã đặt cọc')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [Email], [Password], [NgaySinh], [DiaChi], [SDT], [UserId], [HieuLuc]) VALUES (2, N'Nguyen Van A', 0, N'viet201200413@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'1999-02-11' AS Date), N'Hà Nội', N'0123456789', 1, 0)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [Email], [Password], [NgaySinh], [DiaChi], [SDT], [UserId], [HieuLuc]) VALUES (3, N'viet', 1, N'viet1234@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'1990-02-22' AS Date), N'Hà Nội', N'0123456789', 0, 0)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [Email], [Password], [NgaySinh], [DiaChi], [SDT], [UserId], [HieuLuc]) VALUES (4, N'viet', 1, N'viet12345@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'1984-02-11' AS Date), N'Hà Nội', N'0123456789', 1, 0)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [Email], [Password], [NgaySinh], [DiaChi], [SDT], [UserId], [HieuLuc]) VALUES (5, N'Việt', 0, N'doducviet3012@gmail.com', N'fcea920f7412b5da7be0cf42b8c93759', CAST(N'1987-01-23' AS Date), N'Hà Nội', N'0903497119', 0, 0)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [Email], [Password], [NgaySinh], [DiaChi], [SDT], [UserId], [HieuLuc]) VALUES (6, N'Lê Văn An', 0, N'an123@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'1999-02-20' AS Date), N'Hà Nội', N'0123456789', 0, 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [GioiTinh], [Email], [Password], [NgaySinh], [DiaChi], [SDT], [UserId], [HieuLuc]) VALUES (9, N'Viet', 0, N'doducviet144@gmail.com', N'c4ca4238a0b923820dcc509a6f75849b', CAST(N'2000-04-29' AS Date), N'Hải Phòng', N'0909748321', 0, 0)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachSan] ON 

INSERT [dbo].[KhachSan] ([MaKS], [MaTinh], [IDNguoiTao], [TenKhachSan], [DiaChi], [MoTa], [Anh], [DanhGia], [Duyet]) VALUES (1, 1, 2, N'Hotel Royal', N'165, Phường Nghĩa Đô, Quận Cầu Giấy, Thành phố Hà Nội', N'Khách sạn Hoàng Sơn Peace tọa lạc gần Quảng trường Đinh Tiên Hoàng - Công trình lịch sử chào mừng đại lễ 1000 năm Thăng Long Hà Nội. Nằm giữa trung tâm kinh tế và văn hóa của Thành Phố Ninh Bình, Khách sạn Hoàng Sơn Peace mong muốn là cánh cửa đầu tiên ở Ninh Bình chào đón Quý khách trong nước và Quốc tế về với Ninh Bình, miền đất sở hữu 2 loại hình du lịch đặc trưng là du lịch sinh thái và du lịch văn hóa tâm linh. 

	Với chất lượng đạt chuẩn Quốc tế 4 sao,  Khách sạn Hoàng Sơn Peace không chỉ đáp ứng hoàn hảo nhu cầu nghỉ ngơi của Quý khách mà còn mang đến những giây phút thư giãn giải trí tuyệt vời và để lại dư vị ấn tượng trong văn hóa ẩm thực nơi đây. Khách sạn là sự kết hợp hài hòa của phong cách mang màu sắc sang trọng, hiện đại và cổ kính bao gồm cả quần thể Nhà hàng, Bể Bơi, sân Tennis và các khu vui chơi giải trí khác được quy tụ trong một khuôn viên rộng lớn gần 15.000 m2 . ', N'ks_hanoi.jpg', 5, 1)
INSERT [dbo].[KhachSan] ([MaKS], [MaTinh], [IDNguoiTao], [TenKhachSan], [DiaChi], [MoTa], [Anh], [DanhGia], [Duyet]) VALUES (2, 1, 2, N'Apricot Hotel', N'12, Phường Nhân Chính, Quận Thanh Xuân, Thành phố Hà Nội', NULL, N'ks_hanoi1.jpg', 4, 1)
INSERT [dbo].[KhachSan] ([MaKS], [MaTinh], [IDNguoiTao], [TenKhachSan], [DiaChi], [MoTa], [Anh], [DanhGia], [Duyet]) VALUES (3, 1, 2, N'Pan Pacific Hanoi', N'15, Phường Hàng Mã, Quận Hoàn Kiếm, Thành phố Hà Nội', NULL, N'ks_hanoi2.jpg', 3, 1)
INSERT [dbo].[KhachSan] ([MaKS], [MaTinh], [IDNguoiTao], [TenKhachSan], [DiaChi], [MoTa], [Anh], [DanhGia], [Duyet]) VALUES (4, 3, 2, N'Vinpearl Luxury Nha Trang', N'50, Phường Vĩnh Hòa, Thành phố Nha Trang, Tỉnh Khánh Hòa', NULL, N'ks_nhatrang.jpg', 3, 1)
INSERT [dbo].[KhachSan] ([MaKS], [MaTinh], [IDNguoiTao], [TenKhachSan], [DiaChi], [MoTa], [Anh], [DanhGia], [Duyet]) VALUES (5, 4, 2, N'Amiana Resort Nha Trang', N'6, Phường Bãi Cháy, Thành phố Hạ Long, Tỉnh Quảng Ninh', NULL, N'ks_nhatrang1.jpg', 4, 1)
INSERT [dbo].[KhachSan] ([MaKS], [MaTinh], [IDNguoiTao], [TenKhachSan], [DiaChi], [MoTa], [Anh], [DanhGia], [Duyet]) VALUES (6, 3, 3, N'Evason Ana Mandara Nha Trang', N'Tỉnh Khánh Hòa, Thành phố Nha Trang, Phường Vạn Thắng, Số2', N'đẹp ', N'ks_nhatrang2.jpg', 5, 1)
INSERT [dbo].[KhachSan] ([MaKS], [MaTinh], [IDNguoiTao], [TenKhachSan], [DiaChi], [MoTa], [Anh], [DanhGia], [Duyet]) VALUES (19, 1, 2, N'Cầu Giấy Hotel', N'Thành phố Hà Nội, Quận Cầu Giấy, Phường Nghĩa Đô, số 1', N'đẹp', N'anhks2.jpeg', 5, 1)
INSERT [dbo].[KhachSan] ([MaKS], [MaTinh], [IDNguoiTao], [TenKhachSan], [DiaChi], [MoTa], [Anh], [DanhGia], [Duyet]) VALUES (20, 1, 2, N'Luxury Hotel', N'2, Phường Yên Hoà, Quận Cầu Giấy, Thành phố Hà Nội', N'đẹp', N'anhks5.jpeg', 4, 1)
SET IDENTITY_INSERT [dbo].[KhachSan] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiPhong] ON 

INSERT [dbo].[LoaiPhong] ([MaLP], [MaKS], [TenLP], [SoNguoiToiDa], [Gia], [Anh], [ThongTin], [KichThuoc]) VALUES (2, 1, N'Phòng Family', 7, 1000000, N'fml.jpg', NULL, N'80m2')
INSERT [dbo].[LoaiPhong] ([MaLP], [MaKS], [TenLP], [SoNguoiToiDa], [Gia], [Anh], [ThongTin], [KichThuoc]) VALUES (3, 1, N'Phòng Standard', 3, 500000, N'std.jpg', NULL, N'25m2')
INSERT [dbo].[LoaiPhong] ([MaLP], [MaKS], [TenLP], [SoNguoiToiDa], [Gia], [Anh], [ThongTin], [KichThuoc]) VALUES (4, 1, N'Phòng Superior', 3, 400000, N'sup.webp', NULL, N'30m2')
INSERT [dbo].[LoaiPhong] ([MaLP], [MaKS], [TenLP], [SoNguoiToiDa], [Gia], [Anh], [ThongTin], [KichThuoc]) VALUES (5, 2, N'Phòng Suite', 6, 2000000, N'sui.jpg', N'đẹp', N'100m2')
INSERT [dbo].[LoaiPhong] ([MaLP], [MaKS], [TenLP], [SoNguoiToiDa], [Gia], [Anh], [ThongTin], [KichThuoc]) VALUES (6, 1, N'Phòng Deluxe', 4, 800000, N'dlx.webp', NULL, N'40m2')
INSERT [dbo].[LoaiPhong] ([MaLP], [MaKS], [TenLP], [SoNguoiToiDa], [Gia], [Anh], [ThongTin], [KichThuoc]) VALUES (9, 3, N'Phòng Standard', 3, 350000, N'anhks.jpeg', N'đẹp', N'30m2')
SET IDENTITY_INSERT [dbo].[LoaiPhong] OFF
GO
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (1, N'Phòng Standard Classic ', 3, N'std.jpg', N'Mô Tả Phòng Standard

Phòng Standard là sự kết hợp hoàn hảo giữa thoải mái và tiện nghi. Với không gian rộng rãi và trang bị đầy đủ các tiện nghi cơ bản, phòng này là lựa chọn lý tưởng cho những du khách muốn tận hưởng kỳ nghỉ thoải mái mà không làm trống hết ngân sách.

Trong phòng Standard, bạn sẽ được trải nghiệm không gian ấm áp và trang nhã với trang trí tinh tế. Đèn sáng tự nhiên và bố cục thông minh tạo nên một không gian lý tưởng cho việc nghỉ ngơi và thư giãn.

Với giá cả hợp lý, phòng Standard không chỉ là nơi dừng chân tuyệt vời mà còn là điểm xuất phát hoàn hảo để khám phá và trải nghiệm mọi điều tuyệt vời mà địa điểm này mang đến. Hãy để phòng Standard trở thành điểm dừng lý tưởng cho chuyến hành trình của bạn.')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (2, N'Phòng Comfort Retreat ', 3, N'stdnen1.webp', N'Mô Tả Phòng Standard    Phòng Standard là sự kết hợp hoàn hảo giữa thoải mái và tiện nghi. Với không gian rộng rãi và trang bị đầy đủ các tiện nghi cơ bản, phòng này là lựa chọn lý tưởng cho những du khách muốn tận hưởng kỳ nghỉ thoải mái mà không làm trống hết ngân sách.    Trong phòng Standard, bạn sẽ được trải nghiệm không gian ấm áp và trang nhã với trang trí tinh tế. Đèn sáng tự nhiên và bố cục thông minh tạo nên một không gian lý tưởng cho việc nghỉ ngơi và thư giãn.    Với giá cả hợp lý, phòng Standard không chỉ là nơi dừng chân tuyệt vời mà còn là điểm xuất phát hoàn hảo để khám phá và trải nghiệm mọi điều tuyệt vời mà địa điểm này mang đến. Hãy để phòng Standard trở thành điểm dừng lý tưởng cho chuyến hành trình của bạn')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (3, N'Phòng Tranquil Oasis', 3, N'stdnen2.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (4, N'Phòng Serenity', 3, N'stdnen3.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (5, N'Phòng Relaxation Haven', 3, N'stdnen4.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (6, N'Phòng Deluxe Serenade', 6, N'dlxnen.jpg', N'Phòng Deluxe tại khách sạn chúng tôi là sự lựa chọn hoàn hảo cho những du khách đang tìm kiếm không gian lưu trú sang trọng và đẳng cấp. Với diện tích rộng lớn, phòng này mang lại cảm giác thoải mái và tiện nghi đỉnh cao.

Trải qua cửa vào, du khách sẽ ngay lập tức bị cuốn hút bởi sự sang trọng và tinh tế của trang trí nội thất. Mọi chi tiết đều được chăm chút kỹ lưỡng, từ đèn sáng tạo không gian tới sự sắp xếp thông minh của nội thất.

Phòng Deluxe không chỉ đơn thuần là nơi nghỉ ngơi mà còn là không gian riêng tư lý tưởng để tận hưởng những khoảnh khắc quý giá. Với sự linh hoạt trong sắp xếp, du khách có thể tận hưởng không gian ấm áp và trang nhã mà phòng mang lại.

Với giá cả phù hợp với dịch vụ cao cấp, phòng Deluxe tại khách sạn chúng tôi hứa hẹn mang đến trải nghiệm lưu trú đặc biệt và đáng nhớ cho mọi du khách.')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (7, N'Phòng Premier Bliss', 6, N'dlxnen1.jpg', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (8, N'Phòng Elegance Enclave', 6, N'dlxnen2.jpg', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (9, N'Phòng Luxury Radiance', 6, N'dlxnen3.jpg', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (10, N'Phòng Opulent Sanctuary', 6, N'dlxnen4.jpg', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (11, N'Gia Ðình Suite Harmony', 2, N'fmlnen.jpg', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (12, N'Phòng Gia Ðình Joy', 2, N'fmlnen1.jpg', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (13, N'Phòng Gia Ðình Spacious Retreat', 2, N'fmlnen2.jpg', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (14, N'Phòng Gia Ðình Cozy Haven', 2, N'fmlnen3.jpg', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (15, N'Gia Ðình Suite Comfort', 2, N'fmlnen3.jpg', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (17, N'Suite Royal Elegance', 5, N'suinen.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (18, N'Suite Prestige Oasis', 5, N'suinen1.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (19, N'Suite Panorama Splendor', 5, N'suinen2.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (20, N'Suite Executive Tranquility', 5, N'suinen3.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (21, N'Suite Grandeur Retreat', 5, N'suinen4.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (22, N'Superior Comfort Room', 4, N'supnen.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (23, N'Premium Superior Suite', 4, N'supnen1.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (24, N'Elegant Superior Retreat', 4, N'supnen2.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (25, N'Superior Panorama View', 4, N'supnen3.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (26, N'Tranquil Superior Oasis', 6, N'supnen4.webp', NULL)
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (50, N'Phòng Vip2', 3, N'anhks1.jpeg', N'ư')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (51, N'Phòng Vip4', 3, N'anhks3.webp', N's')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (52, N'Phòng Vip5', 4, N'anhks7.jpeg', N'ss')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (55, N'vip3', 5, N'anhks6.jpeg', N'đẹp')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [MaLP], [Anh], [MoTa]) VALUES (57, N'Phòng Standard Classic', 9, N'anhks.jpeg', N'đẹp')
SET IDENTITY_INSERT [dbo].[Phong] OFF
GO
SET IDENTITY_INSERT [dbo].[QuenMatKhau] ON 

INSERT [dbo].[QuenMatKhau] ([ID], [Token], [Email], [NgayTao]) VALUES (1, N'127671', N'doducviet3012@gmail.com', CAST(N'2024-05-08T22:20:06.280' AS DateTime))
INSERT [dbo].[QuenMatKhau] ([ID], [Token], [Email], [NgayTao]) VALUES (2, N'924700', N'doducviet3012@gmail.com', CAST(N'2024-05-08T22:24:28.077' AS DateTime))
INSERT [dbo].[QuenMatKhau] ([ID], [Token], [Email], [NgayTao]) VALUES (3, N'181176', N'doducviet3012@gmail.com', CAST(N'2024-05-08T22:29:17.350' AS DateTime))
INSERT [dbo].[QuenMatKhau] ([ID], [Token], [Email], [NgayTao]) VALUES (4, N'169263', N'doducviet3012@gmail.com', CAST(N'2024-05-09T08:51:04.307' AS DateTime))
SET IDENTITY_INSERT [dbo].[QuenMatKhau] OFF
GO
SET IDENTITY_INSERT [dbo].[SuDungThietBi] ON 

INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (9, 1, 3)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (10, 2, 3)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (11, 3, 3)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (12, 4, 3)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (13, 5, 3)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (14, 6, 3)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (15, 1, 4)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (16, 2, 4)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (17, 3, 4)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (18, 4, 4)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (19, 5, 4)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (20, 6, 4)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (21, 7, 4)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (22, 8, 4)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (23, 9, 4)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (34, 1, 6)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (35, 2, 6)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (36, 3, 6)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (37, 4, 6)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (38, 5, 6)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (39, 6, 6)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (40, 7, 6)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (41, 8, 6)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (42, 9, 6)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (43, 10, 6)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (44, 11, 6)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (65, 1, 3)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (66, 2, 3)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (67, 3, 3)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (68, 4, 3)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (69, 5, 3)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (75, 1, 2)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (76, 2, 2)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (77, 3, 2)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (78, 4, 2)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (79, 5, 2)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (80, 6, 2)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (81, 7, 2)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (82, 8, 2)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (83, 9, 2)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (84, 11, 2)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (90, 1, 5)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (91, 2, 5)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (92, 3, 5)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (93, 4, 5)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (94, 5, 5)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (95, 6, 5)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (96, 7, 5)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (97, 8, 5)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (98, 9, 5)
INSERT [dbo].[SuDungThietBi] ([ID], [MaTB], [MaLP]) VALUES (99, 10, 5)
SET IDENTITY_INSERT [dbo].[SuDungThietBi] OFF
GO
SET IDENTITY_INSERT [dbo].[ThietBi] ON 

INSERT [dbo].[ThietBi] ([MaTB], [TenTB]) VALUES (1, N'Wi-Fi miễn phí')
INSERT [dbo].[ThietBi] ([MaTB], [TenTB]) VALUES (2, N'Vệ sinh phòng hằng ngày')
INSERT [dbo].[ThietBi] ([MaTB], [TenTB]) VALUES (3, N'Điều hòa hai chiều')
INSERT [dbo].[ThietBi] ([MaTB], [TenTB]) VALUES (4, N'Dịch vụ phòng 24/7')
INSERT [dbo].[ThietBi] ([MaTB], [TenTB]) VALUES (5, N'Truyền hình cáp')
INSERT [dbo].[ThietBi] ([MaTB], [TenTB]) VALUES (6, N'MiniBar với đồ uống miễn phí')
INSERT [dbo].[ThietBi] ([MaTB], [TenTB]) VALUES (7, N'Bể bơi đặc biệt')
INSERT [dbo].[ThietBi] ([MaTB], [TenTB]) VALUES (8, N'Khu vui chơi cho trẻ em')
INSERT [dbo].[ThietBi] ([MaTB], [TenTB]) VALUES (9, N'Đồ nội thất cao cấp')
INSERT [dbo].[ThietBi] ([MaTB], [TenTB]) VALUES (10, N'Phòng tắm cao cấp và sang trọng')
INSERT [dbo].[ThietBi] ([MaTB], [TenTB]) VALUES (11, N'Phòng ngủ và khách riêng biệt')
SET IDENTITY_INSERT [dbo].[ThietBi] OFF
GO
SET IDENTITY_INSERT [dbo].[TinhThanh] ON 

INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (1, N'Thành phố Hà Nội', N'hanoi_nen.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (2, N'Thành phố Đà Nẵng', N'danang_nen.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (3, N'Tỉnh Khánh Hòa', N'nhatrang_nen.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (4, N'Tỉnh Quảng Ninh', N'quangninh_nen.webp')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (5, N'Thành phố Hồ Chí Minh', N'hcm_nen.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (11, N'Tỉnh Bắc Ninh', N'bacninh.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (120, N'Thành phố Hải Phòng', N'haiphong.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (121, N'Thành phố Cần Thơ', N'cantho.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (122, N'Tỉnh An Giang', N'angiang.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (123, N'Tỉnh Bà Rịa - Vũng Tàu', N'baria.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (124, N'Tỉnh Bắc Giang', N'bacgiang.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (125, N'Tỉnh Bắc Kạn', N'bankan.webp')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (126, N'Tỉnh Bạc Liêu', N'baclieu.png')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (128, N'Tỉnh Bến Tre', N'bentre.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (129, N'Tỉnh Bình Định', N'binhdinh.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (130, N'Tỉnh Bình Dương', N'binhduong.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (131, N'Tỉnh Bình Phước', N'binhphuoc.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (132, N'Tỉnh Bình Thuận', N'binhthuan.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (133, N'Tỉnh Cà Mau', N'camau.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (134, N'Tỉnh Cao Bằng', N'caobang.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (135, N'Tỉnh Đắk Lắk', N'daklak.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (136, N'Tỉnh Đắk Nông', N'daknong.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (137, N'Tỉnh Điện Biên', N'dienbien.webp')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (138, N'Tỉnh Đồng Nai', N'donglai.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (139, N'Tỉnh Đồng Tháp', N'dongthap.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (140, N'Tỉnh Gia Lai', N'gialai.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (141, N'Tỉnh Hà Giang', N'hagiang.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (142, N'Tỉnh Hà Nam', N'hanam.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (143, N'Tỉnh Hà Tĩnh', N'hatinh.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (144, N'Tỉnh Hải Dương', N'haiduong.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (145, N'Tỉnh Hậu Giang', N'haugiang.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (146, N'Tỉnh Hòa Bình', N'hoabinh.webp')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (147, N'Tỉnh Hưng Yên', N'hungyen.webp')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (148, N'Tỉnh Kiên Giang', N'kiengiang.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (149, N'Tỉnh Kon Tum', N'kontum.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (150, N'Tỉnh Lai Châu', N'laichau.webp')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (151, N'Tỉnh Lâm Đồng', N'lamdong.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (152, N'Tỉnh Lạng Sơn', N'langson.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (153, N'Tỉnh Lào Cai', N'laocai.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (154, N'Tỉnh Long An', N'longan.webp')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (155, N'Tỉnh Nam Định', N'namdinh.jpeg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (156, N'Tỉnh Nghệ An', N'nghean.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (157, N'Tỉnh Ninh Bình', N'ninhbinh.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (158, N'Tỉnh Ninh Thuận', N'ninhthuan.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (159, N'Tỉnh Phú Thọ', N'phutho.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (160, N'Tỉnh Phú Yên', N'phuyen.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (161, N'Tỉnh Quảng Bình', N'quangbinh.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (162, N'Tỉnh Quảng Nam', N'quangnam.webp')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (163, N'Tỉnh Quảng Ngãi', N'quangngai.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (164, N'Tỉnh Quảng Trị', N'quangtri.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (165, N'Tỉnh Sóc Trăng', N'soctrang.webp')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (166, N'Tỉnh Sơn La', N'sonla.webp')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (167, N'Tỉnh Tây Ninh', N'tayninh.jpeg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (168, N'Tỉnh Thái Bình', N'thaibinh.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (169, N'Tỉnh Thái Nguyên', N'thainguyen.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (170, N'Tỉnh Thanh Hóa', N'thanhhoa.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (171, N'Tỉnh Thừa Thiên Huế', N'hue.jpeg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (172, N'Tỉnh Tiền Giang', N'tiengiang.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (173, N'Tỉnh Trà Vinh', N'travinh.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (174, N'Tỉnh Tuyên Quang', N'tuyenquang.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (175, N'Tỉnh Vĩnh Long', N'vinhlong.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (176, N'Tỉnh Vĩnh Phúc', N'vinhphuc.jpg')
INSERT [dbo].[TinhThanh] ([MaTinh], [TenTinh], [Anh]) VALUES (177, N'Tỉnh Yên Bái', N'yenbai.webp')
SET IDENTITY_INSERT [dbo].[TinhThanh] OFF
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_NhanVien] FOREIGN KEY([IDAdmin])
REFERENCES [dbo].[Admin] ([ID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_NhanVien]
GO
ALTER TABLE [dbo].[CTAnh]  WITH CHECK ADD  CONSTRAINT [FK_CTAnh_MaPhong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTAnh] CHECK CONSTRAINT [FK_CTAnh_MaPhong]
GO
ALTER TABLE [dbo].[DatPhong]  WITH CHECK ADD  CONSTRAINT [FK_DatPhong_HoaDon] FOREIGN KEY([SoHoaDon])
REFERENCES [dbo].[HoaDon] ([SoHoaDon])
GO
ALTER TABLE [dbo].[DatPhong] CHECK CONSTRAINT [FK_DatPhong_HoaDon]
GO
ALTER TABLE [dbo].[DatPhong]  WITH CHECK ADD  CONSTRAINT [FK_DatPhong_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DatPhong] CHECK CONSTRAINT [FK_DatPhong_Phong]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [FK_GopY_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [FK_GopY_KhachHang]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [FK_GopY_KhachSan] FOREIGN KEY([MaKS])
REFERENCES [dbo].[KhachSan] ([MaKS])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [FK_GopY_KhachSan]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[KhachSan]  WITH CHECK ADD  CONSTRAINT [FK_KhachSan_KhachHang] FOREIGN KEY([IDNguoiTao])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[KhachSan] CHECK CONSTRAINT [FK_KhachSan_KhachHang]
GO
ALTER TABLE [dbo].[KhachSan]  WITH CHECK ADD  CONSTRAINT [FK_KhachSan_TinhThanh] FOREIGN KEY([MaTinh])
REFERENCES [dbo].[TinhThanh] ([MaTinh])
GO
ALTER TABLE [dbo].[KhachSan] CHECK CONSTRAINT [FK_KhachSan_TinhThanh]
GO
ALTER TABLE [dbo].[LoaiPhong]  WITH CHECK ADD  CONSTRAINT [FK_LoaiPhong_KhachSan] FOREIGN KEY([MaKS])
REFERENCES [dbo].[KhachSan] ([MaKS])
GO
ALTER TABLE [dbo].[LoaiPhong] CHECK CONSTRAINT [FK_LoaiPhong_KhachSan]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_LoaiPhong] FOREIGN KEY([MaLP])
REFERENCES [dbo].[LoaiPhong] ([MaLP])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_LoaiPhong]
GO
ALTER TABLE [dbo].[SuDungThietBi]  WITH CHECK ADD  CONSTRAINT [FK_SuDungThietBi_LoaiPhong] FOREIGN KEY([MaLP])
REFERENCES [dbo].[LoaiPhong] ([MaLP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SuDungThietBi] CHECK CONSTRAINT [FK_SuDungThietBi_LoaiPhong]
GO
ALTER TABLE [dbo].[SuDungThietBi]  WITH CHECK ADD  CONSTRAINT [FK_SuDungThietBi_ThietBi] FOREIGN KEY([MaTB])
REFERENCES [dbo].[ThietBi] ([MaTB])
GO
ALTER TABLE [dbo].[SuDungThietBi] CHECK CONSTRAINT [FK_SuDungThietBi_ThietBi]
GO
USE [master]
GO
ALTER DATABASE [QLKhachSanTTTN] SET  READ_WRITE 
GO
