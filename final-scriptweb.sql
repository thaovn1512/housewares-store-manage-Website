USE [master]
GO
/****** Object:  Database [WebGiaDung]    Script Date: 11/21/2021 8:28:08 PM ******/
CREATE DATABASE [WebGiaDung]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebGiaDung', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebGiaDung.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebGiaDung_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebGiaDung_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebGiaDung] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebGiaDung].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebGiaDung] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebGiaDung] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebGiaDung] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebGiaDung] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebGiaDung] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebGiaDung] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebGiaDung] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebGiaDung] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebGiaDung] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebGiaDung] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebGiaDung] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebGiaDung] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebGiaDung] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebGiaDung] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebGiaDung] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebGiaDung] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebGiaDung] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebGiaDung] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebGiaDung] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebGiaDung] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebGiaDung] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebGiaDung] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebGiaDung] SET RECOVERY FULL 
GO
ALTER DATABASE [WebGiaDung] SET  MULTI_USER 
GO
ALTER DATABASE [WebGiaDung] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebGiaDung] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebGiaDung] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebGiaDung] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebGiaDung] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebGiaDung', N'ON'
GO
USE [WebGiaDung]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/21/2021 8:28:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[dayCreate] [date] NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 11/21/2021 8:28:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer] [nvarchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[status] [bit] NOT NULL,
	[total] [bigint] NOT NULL,
	[dayCreate] [date] NOT NULL,
	[userId] [int] NOT NULL,
	[adId] [int] NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 11/21/2021 8:28:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[billId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_billDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blog]    Script Date: 11/21/2021 8:28:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[image] [nvarchar](50) NOT NULL,
	[link] [nvarchar](max) NOT NULL,
	[adId] [int] NULL,
	[dayCreate] [date] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brand]    Script Date: 11/21/2021 8:28:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/21/2021 8:28:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/21/2021 8:28:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [bigint] NOT NULL,
	[discount] [int] NOT NULL,
	[image] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[dateCreate] [date] NOT NULL,
	[information] [nvarchar](max) NOT NULL,
	[purchased] [int] NOT NULL,
	[idCategory] [int] NOT NULL,
	[idBrand] [int] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/21/2021 8:28:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[dayCreated] [date] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([id], [name], [email], [password], [dayCreate]) VALUES (1, N'Admin', N'admin@gmail.com', N'123456789', CAST(N'2021-11-20' AS Date))
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (10, N'Thảo Võ', N'039718135', N'vntvnt1512@gmail.com', N'Cái Bè', 0, 16506500, CAST(N'2021-11-10' AS Date), 5, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (11, N'Thảo Võ', N'03971813501', N'vntvnt1512@gmail.com', N'Cái Bè', 0, 17600000, CAST(N'2021-11-10' AS Date), 5, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (12, N'Võ Nhật Thảo', N'03971813501', N'vntvnt1512@gmail.com', N'97 Man Thiện, phường Hiệp Phú, TP HCM', 0, 22444000, CAST(N'2021-11-10' AS Date), 5, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (13, N'user', N'03971813501', N'user1@gmail.com', N'CB', 0, 5845600, CAST(N'2021-11-10' AS Date), 7, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (14, N'user', N'03971813501', N'user1@gmail.com', N'CB', 0, 12627200, CAST(N'2021-11-10' AS Date), 7, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (15, N'Thảo Võ', N'039718135', N'vntvnt1512@gmail.com', N'Cái Bè', 0, 24210000, CAST(N'2021-11-10' AS Date), 5, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (16, N'Thảo Võ', N'039718135', N'vntvnt1512@gmail.com', N'Cái Bè', 0, 12605000, CAST(N'2021-11-10' AS Date), 5, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (17, N'Thảo Võ', N'039718135', N'vntvnt1512@gmail.com', N'Cái Bè', 0, 726600, CAST(N'2021-11-10' AS Date), 5, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (18, N'Thảo Võ', N'039718135', N'vntvnt1512@gmail.com', N'Cái Bè', 0, 7390000, CAST(N'2021-11-11' AS Date), 5, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (19, N'LNH', N'039718135', N'vntvnt1512@gmail.com', N'TP HCM', 0, 17820000, CAST(N'2021-11-11' AS Date), 5, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (20, N'Thảo Võ', N'039718135', N'vntvnt1512@gmail.com', N'Cái Bè', 0, 8910000, CAST(N'2021-11-12' AS Date), 5, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (21, N'test', N'039718135', N'vntvnt1512@gmail.com', N'Cái Bè', 0, 8910000, CAST(N'2021-11-12' AS Date), 5, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (22, N'user', N'03971813501', N'user1@gmail.com', N'CB', 0, 24210000, CAST(N'2021-11-12' AS Date), 7, NULL)
INSERT [dbo].[Bill] ([id], [customer], [phone], [email], [address], [status], [total], [dayCreate], [userId], [adId]) VALUES (23, N'user', N'03971813501', N'user1@gmail.com', N'CB', 0, 17820000, CAST(N'2021-11-12' AS Date), 7, NULL)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillDetail] ON 

INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (1, 10, 1, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (2, 10, 3, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (3, 10, 4, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (4, 11, 1, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (5, 11, 3, 2)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (6, 11, 23, 2)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (7, 12, 1, 2)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (8, 12, 50, 8)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (9, 12, 3, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (10, 12, 60, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (11, 13, 54, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (12, 13, 61, 10)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (13, 13, 63, 4)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (14, 14, 1, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (15, 14, 3, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (16, 14, 56, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (17, 15, 1, 2)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (18, 15, 2, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (19, 16, 1, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (20, 16, 3, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (21, 17, 54, 3)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (22, 17, 57, 2)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (23, 18, 3, 2)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (24, 19, 1, 2)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (25, 20, 1, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (26, 21, 1, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (27, 22, 1, 2)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (28, 22, 2, 1)
INSERT [dbo].[BillDetail] ([id], [billId], [productId], [quantity]) VALUES (29, 23, 1, 2)
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([id], [name], [image], [link], [adId], [dayCreate]) VALUES (2, N'NỘI THẤT AVALO: NƠI THIẾT KẾ NHỮNG NGÔI NHÀ ĐẸP NHẤT HÀ NỘI
', N'blog-2', N'Sau một vài lần gặp gỡ những kiến trúc sư tại Avalo, tôi dễ dàng hiểu được tại sao nơi này lại có nhiều công trình sáng tạo và xuất sắc như vậy. Hơn nữa, có một thứ mà tôi tin rằng không đâu có được ngoài Avalo, đó là sự đam mê của tuổi trẻ đối với vẻ đẹp của mỗi ngôi nhà, mà nếu thiếu đi thứ này, sẽ rất nhiều ngôi nhà thiết kế lên bản vẽ lẫn hiện thực chỉ là những mảng màu sắc vô hồn.


Thiết kế nội thất của Avalo rất coi trọng hai chữ tinh tế. Tinh tế thể hiện qua những sáng tạo đầy chất nghệ thuật, những công năng giản dị mà khiến người ta bất ngờ, những bố cục sắp đặt nhìn vào là thấy ấn tượng và bị cuốn theo lối kiến trúc của những ngôi nhà ấy. Có thể nói những chàng trai kiến trúc sư của Avalo rất hiểu một ngôi nhà cần gì, một ngôi nhà muốn gì, và làm sao để kết nối một cách khăng khít ngôi nhà với chủ nhân của nó.


Nếu lựa chọn một công ty thiết kế nội thất cho gia đình mình tại Hà Nội, dù cho phong cách tôi ưa thích là Tân Cổ Điển, Á Đông, Hiện đại hay Đương đại, thì tôi cũng không bao giờ bỏ qua Avalo.


Đơn giản cách một người làm việc có thể phản chiếu được con người họ, và những người ở Avalo là những người sẽ tận tâm với ngôi nhà của bất kỳ ai.', 1, CAST(N'2021-11-01' AS Date))
INSERT [dbo].[Blog] ([id], [name], [image], [link], [adId], [dayCreate]) VALUES (3, N'SIÊU THỊ Ồ ẠT KHUYẾN MÃI ĐỒ GIA DỤNG GIÁ TRỊ THẤP
', N'blog-3', N'Thay vì mua sắm những vật dụng đắt tiền như tivi, tủ lạnh, máy gặt… người tiêu dùng chuyển sang mua sắm những đồ dùng thiết yếu trong gia đình. Đây là xu hướng mua sắm mới của người dân trong thời buổi kinh tế khó khăn.
>> Phía sau ''bề nổi'' của các siêu thị điện máy

Sieu thi o at khuyen mai do gia dung gia tri thap hinh anh 1
Quầy đồ gia dụng luôn tấp nập người mua.
Tìm hiểu của phóng viên tại các siêu thị và nhu cầu mua sắm của người tiêu dùng cho thấy, hiện có một xu hướng mua sắm mới của người dân Thủ đô, đó là thay vì mua những vật dụng đắt tiền như trước đây, thì hiện nay họ chỉ mua sắm những vật dụng cần thiết trong gia đình với giá cả hợp lý để tiết kiệm chi tiêu.

Nắm bắt được nhu cầu này, nhiều siêu thị đã tung ra những chương trình khuyến mại hấp dẫn, tập trung chủ yếu vào mặt hàng gia dụng như: nồi cơm điện, lò nướng, lò vi sóng… Tại siêu thị Big C Thăng Long, nhân dịp 30/4 và 1/5, siêu thị này đưa ra 6 chương trình khuyến mại, trong đó 2 chương trình khuyến mại nhằm vào đồ gia dụng, đó là chương trình “Bếp việt” và “Hội chợ chiếu”, chương trình áp dụng từ 18/4-6/5.

Tại hai chương trình khuyến mại này, hàng trăm sản phẩm gia dụng như: xoong, chảo, nồi cơm điện, bếp gas, bếp điện từ, lò vi ba, lò nướng, bình, ly, chén, dĩa, thực phẩm, nước tẩy rửa... đến các loại chiếu được Big C giảm giá đặc biệt từ 5-50%.

Với chương trình "Bếp việt", hơn 700 sản phẩm được giảm giá. Cụ thể như: Chảo Supor AA NJA 26cm giá 99.000đ/cái (giảm 30%), bộ 3 nồi inox nắp inox Happy Sun giá 197.500đ/bộ (giảm 50%), bộ 7 món dao thớt giá 69.900đ/bộ 7 (giảm 35%), bộ 4 thau inox 16-18-20-22cm giá 69.000đ/bộ 4 (giảm 30%), chén inox giá 12.900đ/cái (giảm 30%)…

Sieu thi o at khuyen mai do gia dung gia tri thap hinh anh 2
Nhiều mặt hàng được khuyến mại 30-50%...
Với các loại chiếu, nệm, đệm dùng cho mùa hè cũng được giảm giá hấp dẫn. Chiếu bốn mùa hoa văn 1,6mx2m giá 499.000đ/cái, nệm nước baby 52x92cm giá 115.000đ/cái, chiếu du lịch 0,6x1,8m giá 35.000đ/cái, chiếu tre cao cấp 1,5mx1,95m giá 459.000đ/cái, chiếu cỏ trơn 1,48x1,87m giá 125.000đ/cái, chiếu thổ cẩm 1,48x1,85m giá 85.000đ/cái, chiếu nhựa kẻ vuông 1,6mx1,9m giá 115.000đ/cái,...

Bà Nguyễn Thanh Huyền, đại diện siêu thị BigC cho biết, sau 6 ngày diễn ra chương trình khuyến mại, các mặt hàng thuộc ngành hàng gia dụng bán khá chạy. “Do đây là những đồ dùng rất thiết thực đối với mỗi gia đình, cộng với việc giảm giá khá cao nên nhiều người đã tìm mua. Hiện hơn 700 sản phẩm đã được đưa vào khuyến mại và sẽ tiếp tục bổ sung nếu khách hàng có nhu cầu cao”, Bà Huyền nói.

Ghi nhận của phóng viên tại gian hàng bày bán đồ gia dụng của siêu thị BigC ngày 24/4, khá đông người tiêu dùng đến chọn mua sản phẩm. Chị Nguyễn Thị Hoan, ở Mỹ Đình cho biết: “Tôi định thay chiếc máy giặt cũ ở nhà có công suất lớn hơn, nhưng nghĩ đi nghĩ lại, thấy chưa cần thiết. Trong thời buổi khó khăn như hiện nay không thể tiêu pha hoang phí được. Số tiền đó dùng làm việc khác. Thấy siêu thị giảm giá bộ nồi nấu ăn, nên tôi quyết định mua luôn”.

Sieu thi o at khuyen mai do gia dung gia tri thap hinh anh 3
Do hàng bán chạy nên nhân viên quầy gia dụng liên tục phải bổ sung hàng.
Siêu thị điện máy HC cũng đưa ra chương trình khuyến mại, giảm giá từ 30-50% với 10 mặt hàng gia dụng. Ông Đoàn Quốc Khánh, Trưởng phòng Maketting cho biết, hiện nhu cầu mua sắm đồ điện máy gần như bão hòa. Tuy nhiên, với những mặt hàng gia dụng thì luôn bán tốt vì giá trị nhỏ, người tiêu dùng thường có nhu cầu thay đổi đồ mới.

“Chương trình khuyến mại của chúng tôi chia đều cho cả bốn nhóm hàng hóa chứ không chỉ tập trung vào những sản phẩm điện lạnh dùng cho mùa hè. Những sản phẩm đồ gia dụng dù giá trị thấp, nhưng mang lại hiệu quả khá cao trong tình hình kinh tế khó khăn hiện nay. Nó giúp cho khách hàng đến với siêu thị, đó cũng là một thành công”, ông Khánh cho biết.

Trước thông tin nhiều nhà cung cấp các sản phẩm gia dụng đề nghị tăng giá khi giá xăng tăng lên 23.800đ/lít, đại diện các siêu thị cho biết, hiện chưa nhân được bất cứ một thông báo nào đề nghị tăng giá đối với mặt hàng này.

“Hiện chúng tôi chưa nhận được thông báo nào đề nghị tăng giá của nhà cung cấp đối với mặt hàng gia dụng. Tuy nhiên, để kích thích nhu cầu mua sắm của người tiêu dùng, chúng tôi có những chương trình khuyến mại giảm giá hàng tuần, đặc biệt đối với những sản phẩm đang được người tiêu dùng quan tâm như: các loại máy xay sinh tố, máy ép hoa quả hay máy làm sữa chua…” - ông Lê Việt Chung, cán bộ truyền thông của Siêu thị Trần Anh cho biết.', 1, CAST(N'2021-10-30' AS Date))
INSERT [dbo].[Blog] ([id], [name], [image], [link], [adId], [dayCreate]) VALUES (4, N'Loạt gia dụng giảm giá hơn 40% dịp cuối tháng
', N'blog-4', N'Nồi cơm điện, bếp điện, máy làm sữa hạt kiêm xay sinh tố và nấu cháo... chính hãng của Nagakawa, Elmich, Mishio đang được ưu đãi 40-48% trên Shop VnExpress.

Combo 3 món: nồi cơm điện Nagakawa NAG0101, bộ 3 nồi NAG1304, ấm siêu tốc NAG0308 đang được ưu đãi 41% còn 999.000 đồng. Nồi cơm điện 1,8 lít, lòng bằng hợp kim nhôm cấp phủ lớp chống dính kép teflon, nắp dạng gài, mâm nhiệt lớn, công suất 700 W, nấu chín cơm chỉ trong vòng 25 phút. Bộ 3 nồi bằng inox, thiết kết 4 đáy, có kích thước lần lượt 16cm, 20cm, 24cm, vung bằng kính cường lực, quai bằng inox đinh tán, bắt vít. Ấm siêu tốc dung tích 1,8 lít, có thân bình bằng inox, tự ngắt điện khi nước sôi, có đèn báo hiệu thông minh, đế xoay 360 độ thuận tiện khi sử dụng.
Combo 3 món: nồi cơm điện Nagakawa NAG0101, bộ 3 nồi NAG1304, ấm siêu tốc NAG0308 đang được ưu đãi 41% còn 999.000 đồng. Nồi cơm điện 1,8 lít, lòng bằng hợp kim nhôm phủ lớp chống dính kép teflon, nắp dạng gài, mâm nhiệt lớn, công suất 700 W, nấu chín cơm chỉ trong vòng 25 phút. Bộ 3 nồi bằng inox, thiết kết 4 đáy, đường kính lần lượt 16cm, 20cm, 24cm, vung bằng kính cường lực, quai bằng inox đinh tán, bắt vít. Ấm siêu tốc dung tích 1,8 lít, thân bằng inox, tự ngắt điện khi nước sôi, có đèn báo hiệu, đế xoay 360 độ thuận tiện khi sử dụng. Khi mua combo, khách có cơ hội được tặng thêm 10 khẩu trang vải kháng khuẩn 2 lớp Nagakawa trị giá 110.000 đồng.

Nồi cơm điện tử 1.5 lít Nagakawa NAG0123 đang được ưu đãi 47% còn 1,099 triệu đồng. Thân vỏ bằng inox và nhựa nguyên sinh, hạn chế vỡ và trầy xước khi rơi hoặc va đập, dễ dàng vệ sinh. Lòng nồi phủ chống dính Whitford. Nắp có lỗi thoát hơi giúp hơi nước sẽ không bị rơi ngược xuống, cho cơm ngon hơn. Mâm nhiệt lớn và phẳng, thiết kế dạng niêu giúp tiếp xúc đáy nồi 100%, công suất 700 W cho cơm chín đều và nhanh. Hệ thống hẹn giờ lên đến 24 giờ. 10 chương trình nấu (nấu nhanh, luộc, nấu cháo, nấu súp, nấu cơm, làm bánh, hấp, nấu cơm trộn....) được tích hợp sẵn. Nồi dễ sử dụng thông qua các nút nhấn điện tử và màn hình led.
Nồi cơm điện tử 1.5 lít Nagakawa NAG0123 đang được ưu đãi 47% còn 1,099 triệu đồng. Thân vỏ bằng inox và nhựa nguyên sinh, hạn chế vỡ và trầy xước khi rơi hoặc va đập, dễ vệ sinh. Lòng nồi phủ chống dính Whitford. Nắp có lỗ thoát hơi giúp hơi nước sẽ không bị rơi ngược xuống, cho cơm ngon hơn. Mâm nhiệt lớn và phẳng, thiết kế dạng niêu giúp tiếp xúc đáy nồi 100%, công suất 700 W cho cơm chín đều và nhanh. Hệ thống hẹn giờ lên đến 24 giờ. 10 chương trình nấu (nấu nhanh, luộc, nấu cháo, nấu súp, nấu cơm, làm bánh, hấp, nấu cơm trộn....) được tích hợp sẵn. Nồi dễ sử dụng thông qua các nút nhấn điện tử và màn hình led. Khi mua sản phẩm, khách có cơ hội được tặng thêm 10 khẩu trang vải kháng khuẩn 2 lớp Nagakawa trị giá 110.000 đồng.

Bếp điện đôi Mishio cao cấp MK-144 đang được ưu đãi 45% còn 249.000 đồng. Bếp dài 46,7 cm, dày 7, cm, sâu 29,7 cm, nặng 2,6 kg phù hợp nhiều không gian bếp. Thân bếp làm bằng thép không gỉ, phủ thêm một lớp sơn nhựa cách nhiệt, dễ lau chùi. Hai mặt bếp sinh nhiệt bằng mâm đúc có kích thước khác nhau để tạo mặt tiếp xúc vừa vặn với kích thước nồi bạn muốn nấu. Bếp không kén nồi, có thể sử dụng được cho hầu hết các loại nồi thông dụng, từ chất liệu nhôm, inox, đất cho đến men, thủy tinh, sứ....Công suất mỗi bếp nấu là 1.000 W, có thể điều chỉnh 5 mức độ bằng núm cơ.
Bếp điện đôi Mishio MK-144 đang được ưu đãi 45% còn 249.000 đồng. Bếp dài 46,7 cm, dày 7,8 cm, sâu 29,7 cm, nặng 2,6 kg phù hợp nhiều không gian bếp. Thân bếp làm bằng thép không gỉ, phủ thêm một lớp sơn nhựa cách nhiệt, dễ lau chùi. Hai mặt bếp sinh nhiệt bằng mâm đúc có kích thước khác nhau để tạo mặt tiếp xúc vừa vặn với kích thước nhiều size nồi. Bếp không kén nồi, có thể sử dụng được cho hầu hết các loại nồi thông dụng, nhôm, inox, đất cho đến men, thủy tinh, sứ... Công suất mỗi bếp nấu là 1.000 W, có thể điều chỉnh 5 mức độ bằng núm cơ.

• Máy làm sữa hạt đa năng Mishio MK160 đang được ưu đãi 40% còn 1,499 triệu đồng. Máy có thể làm sữa hạt (đậu nành, đậu xanh, gạo lức...) nhờ chức năng xay kết hợp nầu trong 25-25 phút, không cần phải lọc bã. Ngoài ra, máy còn hầm canh, làm các loại sốt, nấu soup, nấu cháo dinh dưỡng, bột ăn dặm cho bé, xay nhuyễn các loại hạt khô, xay sinh tố hoa quả, đun trà, xay nhuyễn các loại thịt, cá, xay xương, hâm nóng thực phẩm. Tất cả các công đoạn được thực hiện chỉ còn gói gọn trong một thao tác. Lõi động cơ làm bằng đồng nguyên chất, cho tốc độ quay lên đến 30.000 vòng mỗi phút, công suất làm nóng đạt 800 W, công suất khuấy, xay là 1.000 W. Dung tích cối xay đạt 1,75 lít. Lưỡi dao 4 cạnh, thiết kế kép, làm bằng thép không gì 304.
Máy làm sữa hạt đa năng Mishio MK160 đang được ưu đãi 40% còn 1,499 triệu đồng. Máy có thể làm sữa hạt (đậu nành, đậu xanh, gạo lức...) nhờ chức năng xay kết hợp nấu trong 25 - 25 phút, không cần phải lọc bã. Ngoài ra, máy còn hầm canh, làm các loại sốt, nấu soup, nấu cháo, bột ăn dặm cho bé, xay nhuyễn các loại hạt khô, xay sinh tố hoa quả, đun trà, xay nhuyễn các loại thịt, cá, xay xương, hâm nóng thực phẩm. Tất cả các công đoạn được thực hiện chỉ còn gói gọn trong một thao tác. Lõi động cơ làm bằng đồng nguyên chất, cho tốc độ quay lên đến 30.000 vòng mỗi phút, công suất làm nóng đạt 800 W, công suất khuấy, xay là 1.000 W. Dung tích cối xay đạt 1,75 lít. Lưỡi dao 4 cạnh, thiết kế kép, làm bằng thép không gì 304.

Máy xay sinh tố Elmich BLE-1840OL, đang được ưu đãi 43% còn 799.000 đồng. Máy gồm 2 cối xay đều được làm từ nhựa. Cối to dung tích 1,2 lít có thể xay hoa quả, xay cháo, xay thực phẩm, cối nhỏ có thể xay các hạt khô như ngũ cốc, xay hạt đậu đỗ... Động cơ bằng đồng nguyên chất, công suất 300 W, máy xay nhanh, giúp tiết thời gian chế biến. Lưỡi dao làm bằng inox 304, hình răng cưa, có thể xay nhuyễn mọi loại thực phẩm. Các bộ phận của máy có thể tháo rời để vệ sinh.
Máy xay sinh tố Elmich BLE-1840OL, đang được ưu đãi 43% còn 799.000 đồng. Máy gồm 2 cối xay đều được làm từ nhựa. Cối to dung tích 1,2 lít có thể xay hoa quả, xay cháo, xay thực phẩm, cối nhỏ có thể xay các hạt khô như ngũ cốc, xay hạt đậu đỗ... Động cơ bằng đồng nguyên chất, công suất 300 W, xay nhanh, tiết kiệm thời gian chế biến. Lưỡi dao làm bằng inox 304, hình răng cưa, có thể xay nhuyễn mọi loại thực phẩm. Các bộ phận của máy có thể tháo rời để vệ sinh.

Chảo chống dính Elmich EL-1143 làm bằng hợp kim nhôm, bên trong phủ hai lớp chống dính, chịu nhiệt lên đến 250 độ C. Chảo có đường kính 28 cm, thành cao 8 cm và dày 2,4 mm. Vung bằng kính cường lực, thuận tiện làm món xào. Cán chảo bằng bakelit, ốp inox cách điệu, chịu nhiệt đến 180 độ C. Đáy từ sử dụng được trên các loại bếp.
Chảo chống dính Elmich EL-1143 làm bằng hợp kim nhôm, bên trong phủ hai lớp chống dính, chịu nhiệt lên đến 250 độ C. Chảo có đường kính 28 cm, thành cao 8 cm và dày 2,4 mm. Vung bằng kính cường lực, thuận tiện làm món xào. Cán chảo bằng bakelit, ốp inox cách điệu, chịu nhiệt đến 180 độ C. Đáy từ sử dụng được trên các loại bếp.

Ấm đun nước siêu tốc Elmich KEE-1779OL màu vàng đồng, dung tích 1,7 đang được ưu đãi 46% còn 542.000 đồng. Ruột và vỏ đều bằng inox. Ở giữa là nhựa PP cách nhiệt giúp giảm nóng. Công suất 1.800 W với mâm nhiệt rộng, tỏa nhiệt nhanh giúp đun sôi nước trong vòng 3 phút. Phần đế ấm có thể xoay 360 độ, dễ dàng tháo rời khi cần di chuyển hay rót nước. Tay cầm rộng, bằng nhựa chống nhiệt.
Ấm đun nước siêu tốc Elmich KEE-1779OL màu vàng đồng, dung tích 1,7 lít đang được ưu đãi 46% còn 542.000 đồng. Ruột và vỏ đều bằng inox. Ở giữa là nhựa PP cách nhiệt giúp giảm nóng. Công suất 1.800 W với mâm nhiệt rộng, tỏa nhiệt nhanh giúp đun sôi nước trong vòng 3 phút. Phần đế ấm có thể xoay 360 độ, dễ tháo rời khi cần di chuyển hay rót nước. Tay cầm rộng, bằng nhựa chống nhiệt.

Ngoài các sản phẩm trên, tại Shop VnExpress còn nhiều mặt hàng gia dụng đang được bán với giá ưu đãi dịp cuối tháng. Tham khảo thêm tại đây.', 1, CAST(N'2021-11-11' AS Date))
INSERT [dbo].[Blog] ([id], [name], [image], [link], [adId], [dayCreate]) VALUES (5, N'Sunhouse bứt tốc trong bối cảnh Covid-19
', N'blog-5', N'Trong bối cảnh Covid-19, Sunhouse vẫn phát triển mạnh mẽ với mục tiêu có thể tự chủ sản xuất các sản phẩm công nghệ cao.

Giữ vững vị thế trong nước

Đại diện thương hiệu cho biết, Sunhouse là doanh nghiệp duy nhất trong ngành hàng gia dụng có sản phẩm đạt Thương hiệu quốc gia Việt Nam 2020, với hai sản phẩm chủ lực là chảo chống dính và nồi inox.

Ông Nguyễn Đại Thắng – Tổng giám đốc Tập đoàn SUNHOUSE vinh dự nhận biểu trưng Thương hiệu quốc gia 2020
Ông Nguyễn Đại Thắng – Tổng giám đốc Tập đoàn SUNHOUSE vinh dự nhận biểu trưng Thương hiệu quốc gia 2020

Năm 2020 cũng đánh dấu sự cải thiện thứ bậc một cách mạnh mẽ của Sunhouse trong bảng xếp hạng Top 500 Doanh nghiệp tư nhân lớn nhất Việt Nam, vừa được công bố và vinh danh ngày 8/1 vừa qua. Theo đó Sunhouse đã tăng 50 bậc so với năm 2019, lên vị trí 193. Điều này cho thấy, những chỉ số về nhân sự, doanh thu, lợi nhuận... đều tăng trưởng bền vững, bấp chất những biến động kinh tế - xã hội năm qua.

Để luôn duy trì được sự phát triển mạnh mẽ này, Sunhouse cho biết đã rất linh hoạt trong vận dụng, thực thi các chính sách sản xuất, kinh doanh. Cụ thể là: tích cực củng cố và phát triển hệ thống phân phối khắp cả nước; nghiên cứu nâng cao chất lượng sản phẩm hiện có và tung ra những sản phẩm mới tiện ích cho người tiêu dùng; luôn có dự phòng cho những biến cố không lường trước...

Chinh phục thị trường nước ngoài

Không chỉ được công nhận bằng các giải thưởng, bằng khen trong nước, Sunhouse đang từng bước khẳng định sức cạnh tranh quốc tế. Năm 2019, doanh nghiệp này đã xuất khẩu thành công đèn LED chiếu sáng đi thị trường Bắc Mỹ, mở rộng danh mục các quốc gia xuất khẩu lên con số 15. Đây là kết quả từ việc khởi động nhà máy Lighting với hệ thống tự động hóa, kiểm soát chất lượng tiêu chuẩn quốc tế.

Sunhouse đầu tư rất nhiều cho hệ thống máy móc kiểm định chất lượng sản phẩm
Sunhouse đầu tư rất nhiều cho hệ thống máy móc kiểm định chất lượng sản phẩm.

Tất cả các sản phẩm do doanh nghiệp kinh doanh đều được đầu tư hệ thống QA – QC (kiểm tra, kiểm soát chất lượng) hàng tỷ đồng. Bên cạnh đó, trung tâm R&D (nghiên cứu và phát triển) dưới sự quản lý của chuyên đến từ Hàn Quốc đang nghiên cứu, cải tiến sản phẩm nhằm đáp ứng như cầu ngày càng cao của khách hàng.

Sunhouse cho biết, sẽ luôn chú trọng đầu tư hệ thống R&D để chủ động hơn trong khâu xây dựng và giám sát tiêu chuẩn chất lượng sản phẩm, tự đặt ra tiêu chuẩn để đặt bài toán ngược lại cho các nhà cung cấp nhằm đưa đến cho người tiêu dùng sản phẩm chất lượng của Sunhouse đề ra, đúng với mong muốn và nhu cầu, cũng như khả năng chi trả của người tiêu dùng.

Nhà máy Narae Sunhouse System nằm trong định hướng tự chủ sản xuất các sản phẩm công nghệ cao của doanh nghiệp
Nhà máy Narae Sunhouse System nằm trong định hướng tự chủ sản xuất các sản phẩm công nghệ cao của doanh nghiệp.

Một trong những bước đi nổi bật của Sunhouse là rót vốn 7 tỷ USD cho nhà máy mạch điện tử Narae Sunhouse System hồi năm 2019. Đây là nhà máy nằm trong định hướng phát triển sản phẩm có hàm lượng công nghệ cao, được xây dựng và quản lý theo tiêu chuẩn của các hãng điện tử lớn như Samsung, LG...

Với quy mô như hiện tại, Sunhouse cho biết đã có thể làm chủ gần như 100% quy trình sản xuất bất cứ sản phẩm nào mà công ty kinh doanh, bao gồm những sản phẩm có hàm lượng công nghệ cao như quạt điều hòa không khí, nồi cơm điện tử, bếp từ - bếp điện đôi...Đại diện thương hiệu nhận định, chỉ khi hoàn thiện được chuỗi sản xuất khép kín, làm chủ công nghệ lõi, Sunhouse mới có được những bước tiến vững chắc trong tương lai..

Ông Nguyễn Xuân Phú – Chủ tịch HĐQT Sunhouse cho biết, tất cả những bước đi trên nhằm tạo cơ sử để thương hiệu tiến gần hơn đến những tiêu chuẩn quản lý chất lượng quốc tế, tự tin tham gia vào chuỗi cung ứng toàn cầu.

(Nguồn: Sunhouse)

  Trở lại Kinh doanh
Lưu
Chia sẻ
Xem nhiều
Xây dựng nhà máy, trung tâm nghiên cứu dược phẩm công nghệ cao
Xây dựng nhà máy, trung tâm nghiên cứu dược phẩm công nghệ cao 
Thương hiệu gỗ nhựa ngoài trời AWood 
Netflix ra mắt quỹ điện ảnh trị giá gần 5 tỷ đồng 
Starlake Tây Hồ Tây hưởng lợi từ hạ tầng giao thông công cộng 
', 1, CAST(N'2021-12-20' AS Date))
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [name]) VALUES (1, N'Panasonic')
INSERT [dbo].[Brand] ([id], [name]) VALUES (2, N'Toshiba')
INSERT [dbo].[Brand] ([id], [name]) VALUES (3, N'Senko')
INSERT [dbo].[Brand] ([id], [name]) VALUES (4, N'Mishio')
INSERT [dbo].[Brand] ([id], [name]) VALUES (5, N'Lock&Lock')
INSERT [dbo].[Brand] ([id], [name]) VALUES (6, N'Bosch')
INSERT [dbo].[Brand] ([id], [name]) VALUES (7, N'Kangaroo')
INSERT [dbo].[Brand] ([id], [name]) VALUES (8, N'Delli')
INSERT [dbo].[Brand] ([id], [name]) VALUES (9, N'Kalite')
INSERT [dbo].[Brand] ([id], [name]) VALUES (10, N'Tolsen')
INSERT [dbo].[Brand] ([id], [name]) VALUES (11, N'RO')
INSERT [dbo].[Brand] ([id], [name]) VALUES (12, N'Philips')
INSERT [dbo].[Brand] ([id], [name]) VALUES (13, N'Sunhouse')
INSERT [dbo].[Brand] ([id], [name]) VALUES (14, N'Karofi')
INSERT [dbo].[Brand] ([id], [name]) VALUES (15, N'Khác...')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'MÁY LỌC NƯỚC')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'ĐIỆN GIA DỤNG')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'THIẾT BỊ NHÀ BẾP')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'DỤNG CỤ NHÀ BẾP')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'VỆ SINH NHÀ CỬA')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'THIẾT BỊ PHÒNG TẮM')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'SỨC KHỎE GIA ĐÌNH')
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'DỤNG CỤ SỬA CHỮA')
INSERT [dbo].[Category] ([id], [name]) VALUES (9, N'THIẾT BỊ KHÁC')
INSERT [dbo].[Category] ([id], [name]) VALUES (31, N'THIẾT BỊ test')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (1, N'Máy lọc nước Kangaroo 10 lõi KG100HK
', 9900000, 10, N'product--1', 0, N'Máy lọc nước Kangaroo 10 lõi KG100HK là một trong những sản phẩm hiện đại với những tính năng ưu việt tạo nên đột phá trong công nghệ xử lý nước sạch uống tại vòi ở Việt Nam. Không chỉ ghi điểm với vẻ ngoài sang trọng tô điểm không gian nội thất, máy lọc nước Kangaroo còn được trang bị hệ thống lõi lọc tiên tiến và 2 vòi nóng - lạnh mang đến cho gia đình bạn nguồn nước sạch tinh khiết và sử dụng tiện lợi. ', 0, CAST(N'2021-10-17' AS Date), N'Máy lọc nước trang bị 10 cấp lọc với công suất lọc 15-20 lít/h
Công nghệ lọc RO Vortex giảm đóng cặn, kéo dài tuổi thọ
Lõi lọc thô nguyên khối chống rò rỉ, chống vi khuẩn xâm nhập
Tăng hàm lượng khoáng và Hydrogen đến hơn 25%
Máy lọc nước thiết kế 2 vòi với 3 chế độ nóng, lạnh/mát tiện lợi', 4, 1, 7)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (2, N'Máy lọc nước Karofi Optimus Pro O-I439
', 6390000, 0, N'product--2', 1, N'Máy lọc nước Karofi Optimus Plus O-P1310 được tích hợp công nghệ Aiotec hiện đại bao gồm nhiều tính năng hữu dụng. Công nghệ này cho phép người dùng điều khiển sản phẩm thông qua ứng dụng trên thiết bị thông minh. Giờ đây, bạn dễ dàng điều chỉnh chế độ nước chỉ với một cái chạm tay đơn giản.

', 1, CAST(N'2021-01-01' AS Date), N'Thiết kế 10 lõi lọc, đảm bảo sự tinh khiết của nguồn nước
Công suất lọc 10-15 lít/h, cung cấp đầy đủ nước uống cho bạn
Công nghệ lọc RO tiên tiến, cung cấp nước sạch cho gia đình
Dung tích 10 lít đáp ứng nhu cầu sử dụng của nhiều người
Có 2 vòi đơn tay gạt, dễ dàng lấy nước với thao tác đơn giản
Vỏ tủ làm từ kính cường lực, bảo vệ tối đa bộ máy bên trong
Hệ thống bơm và van điều tiết cao cấp, duy trì hoạt động tốt
Vỏ tủ tôn sơn tĩnh điện dày 0.5mm, đi cùng hoa văn bắt mắt', 3, 1, 14)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (3, N'Máy lọc nước R.O 10 lõi Sunhouse SHA88119K
', 7390000, 50, N'product--3', 0, N'Máy lọc nước R.O 10 lõi Sunhouse SHA88119K là sản phẩm máy lọc nước hiện đại thuộc thương hiệu Sunhouse. Mang trong mình công nghệ lọc nước R.O tiên tiến nhất hiện nay, máy có khả năng lọc sạch bụi bẩn, vi khuẩn có hại tối ưu. Đi cùng dung tích 10 lít sẽ đem lại nguồn nước uống tinh khiết và dồi dào cho cả gia đình.', 0, CAST(N'2021-10-17' AS Date), N'Máy lọc nước trang bị 10 cấp lọc với công suất lọc 15-20 lít/h
Công nghệ lọc RO Vortex giảm đóng cặn, kéo dài tuổi thọ
Lõi lọc thô nguyên khối chống rò rỉ, chống vi khuẩn xâm nhập
Tăng hàm lượng khoáng và Hydrogen đến hơn 25%
Máy lọc nước thiết kế 2 vòi với 3 chế độ nóng, lạnh/mát tiện lợi', 10, 1, 13)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (4, N'Máy lọc nước RO Karofi 8 lõi H8RO
', 4590000, 15, N'product--4', 0, N'Máy lọc nước RO Karofi 8 lõi H8RO sở hữu thiết kế hiện đại, màu sắc nổi bật, kết cấu vững chắc, phù hợp để sử dụng cho gia đình và cả văn phòng hay lớp học. Nhờ được trang bị công nghệ lọc RO kết hợp với công suất lọc mạnh mẽ, chiếc máy lọc nước này sẽ mang đến cho bạn và gia đình nguồn nước sạch dồi dào và tốt cho sức khỏe.  
', 0, CAST(N'2021-01-01' AS Date), N'4ệ thống lọc 8 lõi mang lại nguồn nước sạch tinh khiết
Công suất lọc 10 lít/ giờ đáp ứng nhu cầu sử dụng
Dung tích bình chứa 10 lít, đủ dùng trong gia đình
Thiết kế vòi gạt nước dễ dàng thao tác sử dụng
Bình chứa được làm từ nhựa ABS, an toàn cho sức khỏe
Thiết kế sang trọng hiện đại tô điểm không gian sống', 4, 1, 14)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (6, N'Máy lọc nước RO nóng lạnh Kangaroo', 9000000, 0, N'product--6', 0, N'Máy lọc nước RO nóng lạnh Kangaroo KG19A3 VTU sở hữu dung tích bầu nóng 1L được quấn bảo ôn duy trì nhiệt độ ở mức 80 - 90 độ C, giúp người dùng dễ dàng nấu mì và pha chế các món thức uống như cà phê, trà, sữa... nhưng vẫn tiết kiệm điện. Trong khi đó, nước lạnh được cung cấp ở mức 10 - 15 độ C, giải nhiệt nhanh chóng trong ngày hè oi bức. ', 0, CAST(N'2021-01-21' AS Date), N'9 cấp lọc hấp thụ mùi vị, chất hữu cơ, kim loại nặng, clo dư
2 vòi tích hợp 3 chức năng gồm nóng, lạnh và RO tiện lợi
Công suất lọc 10 - 15L/giờ nhanh chóng cung cấp nước sạch
Có khả năng ngăn chặn vi khuẩn, tăng oxy hòa tan trong nước
Làm mềm nước và cân bằng độ PH đảm bảo an toàn khi dùng', 3, 1, 7)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (8, N'Máy lọc nước RO 5 lõi A.O.Smith A2
', 7990000, 15, N'product--8', 0, N'Máy lọc nước R.O 5 lõi A.O.Smith S600 được thiết kế với kích thước nhỏ gọn 310x185x430mm. Máy lọc nước sở hữu sắc trắng thanh lịch tăng thêm phần tinh tế cho không gian căn bếp của gia đình bạn. Thiết kế nhỏ gọn nhưng được tích hợp nhiều công nghệ tân tiến và thông minh giúp người dùng thưởng thức các giọt nước tinh khiết nhất, đảm bảo an toàn cho người dùng.', 0, CAST(N'2021-10-01' AS Date), N'Máy lọc nước thiết kế hiện đại, tinh tế mọi góc nhìn
Công suất lọc vượt trội 600GPD ~ 94L/h, không bình chứa
Lõi lọc nguyên khối In-line giảm tuyệt đối nguy cơ rò rỉ nước
Hệ thống cảnh báo thay thế lõi lọc tự động ngay trên thân máy
Màng lọc RO – Side Stream 2.0 với tỉ lệ thu hồi nước tinh khiết cao
Tự động sục rửa lõi sau 30 phút lấy nước liên tục/sau 72h không dùng máy', 4, 1, 11)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (10, N'Máy lọc nước Kangaroo Hydrogen KG100HA VTU
', 6500000, 10, N'product--10', 1, N'Máy lọc nước Kangaroo Hydrogen KG100HC VTU sở hữu thiết kế hình khối tròn độc đáo là sự kết hợp vừa đột phá vừa cổ điển giữa phong cách kiến trúc sang trọng của châu Âu và quan niệm phong thủy Á Đông. Kiệt tác thiết kế đến từ chiếc máy lọc nước này sẽ tạo nên sự nổi bật giữa không gian kiến trúc, nội thất của gia đình bạn.', 1, CAST(N'2021-01-01' AS Date), N'Thiết kế thẩm mỹ cao làm nổi bật không gian nhà bạn
Dung tích bình chứa 10 lít đáp ứng đủ nước cho cả gia đình
Công suất lọc mạnh mẽ, lọc được tới 18-20 lít/giờ
Công nghệ RO Vortex nâng hiệu suất lọc lên đến 75%
Công nghệ từ tính tạo nguồn nước giàu Hydrogen
Trang bị 10 cấp lọc tiên tiến loại bỏ các chất bẩn độc hại
Mang đến nguồn nước sạch an toàn cho sức khỏe', 2, 1, 7)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (14, N'Quạt điều hoà Gree ', 2373000, 20, N'product-14', 1, N'Quạt điều hòa Gree có ngăn chứa đá làm mát rộng, kết hợp với 2 hộp đá khô tặng kèm giúp khả năng làm mát nâng cao
Cho đá khô vào ngăn chứa đá hoặc cho trực tiếp vào thùng chứa nước (nếu máy không có khay đá riêng biệt), khả năng làm mát sẽ nâng cao rõ rệt.

Nếu gia đình bạn không có máy lạnh không thể tạo đá khô thì quạt vẫn sử dụng nước bình thường chỉ là hiệu quả không mát như khi sử dụng kèm đá khô.', 2, CAST(N'2021-01-01' AS Date), N'Tự ngắt bơm khi cạn nướcHẹn giờ tắtCó thang đo hiển thị mực nướcCó hộp đá khô làm mátCó bánh xe di chuyển', 4, 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (15, N'Quạt điều hòa không khí Rapido 6000D', 650000, 0, N'product-15', 1, N'Quạt sử dụng động cơ SD Plus siêu êm, siêu tiết kiệm điện với độ ồn vận hành từ 64 - 68 - 72 dB
Độ ồn tương đương với âm thanh tại phòng làm việc, sảnh yên tĩnh khách sạn... tạo sự thoải mái, dễ chịu khi sử dụng.', 2, CAST(N'2021-01-01' AS Date), N'Tạo ion lọc không khíTự ngắt bơm khi cạn nướcĐiều khiển từ xaHẹn giờCó thang đo hiển thị mực nướcCó van xả cặn khoang chứa nướcCó hộp đá khô làm mátCó bánh xe di chuyển', 1, 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (16, N'Quạt điều hòa Boss ', 450000, 30, N'product-16', 1, N'Tích hợp chế độ tạo ion công nghệ tiên tiến diệt khuẩn tối ưu, lọc không khí sạch sẽ, trong lành hơn
Tạo ion làm sạch không khí - Quạt điều hòa Boss FEAB-407-G

Quạt điều hòa Boss tạo hơi nước làm dịu không khí nhanh chóng với công suất 120W
Lưu lượng gió đến 1500 m³/h, cho phạm vi làm mát tối ưu từ 20 - 30 m². 

Công suất - Quạt điều hòa Boss FEAB-407-G

Sử dụng động cơ SQD, cánh quạt đảo gió đa chiều, hoạt động êm ái, tạo lưu lượng gió lớn hơn, tiết kiệm điện năng', 2, CAST(N'2021-01-01' AS Date), N'Có bánh xe di chuyểnCó thang đo hiển thị mực nướcCảnh báo mức nước thấpHẹn giờ tắtTạo ion lọc không khíTự ngắt bơm khi cạn nước', 1, 2, 1)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (17, N'Máy hút bụi Bosch', 3000000, 50, N'product-17', 1, N'Máy hút bụi Bosch màu đỏ đô bắt mắt, thiết kế trang nhã, bánh xe tròn đều làm bằng chất liệu tốt, cho máy di chuyển êm ái, nhẹ nhàng trên mọi bề mặt
Trang bị hộp chứa bụi có dung tích 1.9 lít, chứa lượng bụi lớn, người dùng hút bụi trong thời gian dài mà không cần đổ bụi nhiều lần.

', 2, CAST(N'2021-01-01' AS Date), N'Máy hút bụi dạng hộp hoạt động mạnh, nhanh với công suất 2000W, giúp tiết kiệm thời gian, công sức cho công việc vệ sinh nhà cửa tối đa', 1, 2, 6)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (18, N'Robot hút bụi Neato Botvac Connected D302 ', 5000000, 70, N'product-18', 1, N'Robot hút bụi Neato Botvac sở hữu công nghệ điều hướng laser thông minh
Công nghệ quét laser 360 độ theo phương nằm ngang của thiết bị giúp xác định vị trí đồ vật và thiết lập bản đồ căn hộ chính xác hơn, không bị ảnh hưởng bởi môi trường thiếu ánh sáng như các loại robot khác', 2, CAST(N'2021-01-01' AS Date), N'Cảm biến chống rơi, chống va chạm

Hẹn giờ

Tự quay về đế sạc

Điều khiển và theo dõi tình trạng hoạt động trên App', 2, 2, 6)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (19, N'Bàn ủi khô Philips', 350000, 10, N'product-19', 1, N'Bàn ủi làm thẳng quần áo nhanh, tiết kiệm điện. Mặt đế hợp kim nhôm đúc giúp dẫn nhiệt rất nhanh và khả năng chống dính tốt
Nhờ vậy, bạn có thể ủi được quần áo của mình nhanh hơn. Ngoài ra, chất liệu này cũng rất an toàn với quần áo, giúp bạn lướt nhẹ và êm trên bề mặt quần áo và dễ dàng làm sạch mặt bàn ủi hiệu quả.', 2, CAST(N'2021-01-01' AS Date), N'
Có rãnh cúc tiện lợiMặt đế chống dính', 1, 2, 12)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (20, N'Bàn ủi hơi nước đứng Kangaroo ', 2300000, 30, N'product-20', 1, N'Bàn ủi hơi nước đứng Kangaroo có kiểu dáng đứng kèm theo móc treo tiện lợi, hơi nước phả ra đều đặn giúp đánh bay những vết nhăn cứng đầu nhất. Công suất 1580 W giúp làm thẳng những nếp nhăn trên quần áo nhanh chóng và giảm hao phí điện năng 
Hệ thống khởi động làm nóng bàn ủi nhanh chỉ trong vòng 30 giây, giúp tiết kiệm thời gian', 2, CAST(N'2021-01-01' AS Date), N'Cảm biến nhiệt đóng ngắt an toàn

Màn hình hiển thị chức năng

Nút trượt xả cặn

Thời gian làm nóng 30 giây

Ủi quần áo treo', 0, 2, 7)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (21, N'Bàn ủi hơi nước Philips', 350000, 10, N'product-21', 1, N'Bàn ủi Philips GC2992 thiết kế sang trọng, của thương hiệu nổi tiếng Hà Lan – Philips, công suất 2300W
Ủi đồ hiệu quả, nhanh chóng, tiết kiệm điện, thích hợp sử dụng trong mọi gia đình.', 2, CAST(N'2021-01-01' AS Date), N'Mặt đế chống dính

Không xoắn dây (dây nguồn xoay 360 độ)

Nút trượt xả cặn', 3, 2, 12)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (22, N'Bàn ủi khô Bluestone ', 300000, 0, N'product-22', 1, N'Bàn ủi khô Bluestone thiết kế đẹp mắt, màu sắc nhã nhặn
Bàn ủi có công suất 1300W giúp ủi đồ nhanh thẳng tiết kiệm thời gian.  Dễ dàng điều chỉnh nhiệt độ ủi chỉ với 1 núm vặn
Bàn ủi với nhiều mức nhiệt phù hợp với chất liệu vải như lụa, len, vải tổng hợp... bằng núm vặn dễ dàng và nhanh chóng. Đầu bàn ủi khô nhọn kèm rãnh cúc giúp ủi những vị trí khó ủi như: hàng cúc, cổ tay, cổ áo... ', 2, CAST(N'2021-01-01' AS Date), N'Mặt đế chống dính. Tự ngắt khi quá nhiệt
', 0, 2, 12)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (23, N'Bếp từ Teka FIC', 1300000, 0, N'product-23', 1, N'Bếp từ Teka FIC 31T30 KG mẫu mã đơn giản, sang trọng, gọn đẹp trong không gian sử dụng. Bếp công suất nấu 2000 W nấu ăn nhanh chín, tiết kiệm điện, phục vụ tốt cho nhu cầu người bận rộn.Mặt  bếp từ bằng kính chịu nhiệt dày bền, chống trầy xước tốt, sang đẹp, dễ dàng lau chùi giúp giữ bếp mới lâu', 2, CAST(N'2021-01-01' AS Date), N'Loại nồi nấu:

Chỉ sử dụng loại nồi có đế nhiễm từ
Tính năng an toàn:

Khóa bảng điều khiểnTự ngắt khi bếp nóng quá tải', 0, 3, 13)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (24, N'Bếp từ Sunhouse Mama', 1400000, 0, N'product-24', 1, N'Cài đặt 10 mức công suất tối đa 2100W tương đương 60 - 220°C làm nóng nhanh, phù hợp với từng món ăn. Bếp từ Sunhouse có chế độ hẹn giờ tối đa 24 tiếng
Kiểm soát thời gian nấu tối ưu, cho bạn có thể thêm thời gian để tranh thủ nấu món khác hoặc làm việc khác.', 2, CAST(N'2021-01-01' AS Date), N'Cảm ứng kết hợp núm vặn
Loại nồi nấu:

Chỉ sử dụng loại nồi có đế nhiễm từ
Tính năng an toàn:

Tự ngắt khi bếp nóng quá tải.', 0, 3, 13)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (25, N'Nồi chiên không dầu Kalite', 2000000, 2, N'product-25', 1, N'Nồi chiên không dầu Kalite thiết kế với dung tích 5 lít chiên nướng thuận tiện cho 4 - 6 người dùng
Sử dụng chế biến các món như khoai tây, gà rán, thịt nướng (trọng lượng 1 - 1.2 kg) thơm ngon chuẩn vị, đơn giản cho bữa ăn gia đình.', 2, CAST(N'2021-01-01' AS Date), N'Lòng nồi kim loại phủ chống dínhVỏ nhựa chịu nhiệt cao cấp', 0, 3, 9)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (30, N'Nồi chiên không dầu Joyoung', 3000000, 10, N'product-30', 1, N'Nồi chiên không dầu Joyoung có thể hẹn giờ lên đến 24 tiếng, chủ động thời gian chiên nướng thực phẩm
Người dùng chọn thời gian nấu phù hợp, sau đó rảnh tay để thuận tiện làm những công việc khác trong khi chờ món ăn chín, rất tiện lợi.', 50, CAST(N'2021-11-03' AS Date), N'Sắt phủ sơn tĩnh điệnVỏ nhựa PVC chịu nhiệt, chống dính', 0, 3, 9)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (33, N'Máy xay đa năng Kangaroo', 426000, 15, N'product-33', 1, N'Máy xay đa năng Kangaroo xay hoa quả, rau củ, ngũ cốc, thực phẩm khô với 2 cối xay
Máy gồm 2 cối: Cối xay 1 lít để pha chế các món sinh tố thơm ngon và bổ dưỡng, bên cạnh đó cối 0.2 lít để xay các loại hạt, ngũ cốc hay thịt,….Công suất 380W giúp xay nhuyễn các loại thực phẩm nhanh và dễ dàng chỉ với một lần xay
Lưu ý: Các nguyên liệu phải được cắt nhỏ và xay 1 lần tầm 50 - 100g để đảm bảo độ bền cho máy. ', 10, CAST(N'2021-11-03' AS Date), N'Chân đế chống trượtMáy chỉ hoạt động khi lắp cối vừa thân máyTự ngắt khi quá tải', 1, 3, 7)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (35, N'Bộ nồi chảo inox 5 đáy nắp kính Kalite', 1790000, 20, N'product-35', 0, N'Đáy nồi và chảo rộng, phẳng, thiết kế 5 lớp giúp truyền nhiệt nhanh và đều, giữ nhiệt tốt, tiết kiệm thời gian
Lớp thứ 1: chất liệu thép không gỉ 18/10 (inox 304) chống ăn mòn cao, không phản ứng với thức ăn, không thôi nhiễm các chất có hại, đảm bảo an toàn tuyệt đối cho người sử dụng.

Lớp thứ 2, 3, 4: nhôm nguyên chất - hợp kim nhôm - nhôm nguyên chất giúp truyền nhiệt được nhanh và đều, tăng khả năng giữ nhiệt, tránh hiện tượng cháy khét, rút ngắn thời gian nấu và tiết kiệm tối đa năng lượng.

Lớp thứ 5: làm từ thép không gỉ (inox 304) chống ăn mòn cao, khả năng chịu nhiệt lên đến gần 1000 độ C giúp nồi chảo có thể sử dụng trên tất cả các loại bếp, kể cả bếp từ.', 0, CAST(N'2020-01-01' AS Date), N'Bộ nồi chảo có 4 sản phẩm, đường kính nồi 16, 20, 24 cm, chảo 26 cm.
Chất liệu inox 304 sáng bóng, sang trọng, an toàn cho sức khỏe.
Nắp bằng kính cường lực cao cấp, tay cầm cách nhiệt Stop Hot tránh bỏng, dễ di chuyển.
Đáy nồi, chảo cấu tạo 5 lớp giúp truyền nhiệt nhanh và giữ nhiệt tốt.
Sử dụng được trên bếp ga, bếp hồng ngoại, bếp từ.
Thương hiệu Kalite - Việt Nam, sản xuất tại Trung Quốc.', 20, 4, 9)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (36, N'Bộ 3 nồi inox 5 đáy nắp kính Kalite', 1390000, 0, N'product-36', 0, N'Đáy cấu tạo 5 lớp giúp truyền nhiệt nhanh và giữ nhiệt tốt.
Chất liệu inox 304 - nhôm nguyên chất - inox 304 bền bỉ, đảm bảo an toàn khi nấu ăn.
Nắp kính cường lực dày bền, tay cầm cách nhiệt công nghệ Stop Hot di chuyển nồi không bị nóng tay. 
Có 3 nồi đường kính lần lượt là 16 cm, 20 cm và  24 cm, phù hợp cho gia đình 3 - 4 người. 
Sử dụng được trên bếp từ, bếp hồng ngoại và bếp ga. 
Thương hiệu Kalite - Việt Nam, sản xuất tại Trung Quốc. ', 0, CAST(N'2021-11-01' AS Date), N'Nồi Kalite đáy 5 lớp cho khả năng hấp thu nhiệt tốt, tỏa nhiệt đều, làm chín thức ăn nhanh chóng
Đạt hiệu suất bắt từ lên tới 99% giúp rút ngắn thời gian nấu, tiết kiệm năng lượng, chi phí tối ưu. 

Lớp trong cùng tiếp xúc với thức ăn được làm bằng inox 304, chất liệu có độ trơ, tính chống ăn mòn cao, không thôi nhiễm các chất độc hại vào thức ăn.

Ở giữa có 3 lớp bao gồm lớp nhôm nguyên chất, hợp kim nhôm và nhôm nguyên chất, tác dụng của 3 lớp này là hấp thụ nhiệt, dẫn nhiệt, tán nhiệt đều cho thức ăn chín nhanh. Đặc biệt, lớp hợp kim nhôm nhẹ giúp giảm khối lượng nồi cho người nội trợ di chuyển nồi tiện hơn.

Lớp ngoài cùng là inox 304 nhận từ, bắt từ nhanh cho nồi có khả năng dùng được với mọi loại bếp kể cả bếp từ. ', 10, 4, 9)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (37, N'Chảo nhôm chống dính 24cm Delites', 109000, 0, N'product-37', 0, N'Chảo chống dính Delites có đường kính 24 cm, chiên được 4 - 5 trứng ốp la hay 4 đùi gà cỡ vừa cùng lúc
Chảo có thiết kế đẹp mắt với hoa văn vân đá sang trọng và màu sắc trẻ trung. Độ dày lòng chảo 1.825 mm hạn chế móp méo tốt, giữ nhiệt hiệu quả khi nấu ăn', 0, CAST(N'2021-03-03' AS Date), N'Chảo chống dính gọn đẹp, đường kính 24 cm, chiên được 4 - 5 trứng ốp la cùng lúc.
Chất liệu hợp kim nhôm dày 1.825 mm giúp giữ ấm tốt, hạn chế biến dạng.
Bề mặt lòng chảo là lớp chống dính vân đá phủ sơn Whitford Xylan chịu mức nhiệt tối đa 380 °C.
Tay cầm bọc nhựa cách nhiệt chống nóng.
Sử dụng được cho bếp hồng ngoại, bếp gas, không dùng được trên bếp từ.
Thương hiệu Delites - Việt Nam, sản xuất tại Việt Nam.', 3, 4, 5)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (40, N'Chảo nhôm chống dính đáy từ 26 cm', 144000, 15, N'product-40', 1, N'Chảo nhôm chống dính DMX đường kính chảo 26 cm (đường kính chảo tính luôn viền: 26.5 cm) có thể chiên cá nguyên con dưới 1.5 kg, hoặc 4 - 5 miếng đùi gà cùng lúc
Chảo có thiết kế đẹp mắt với hoa văn vân đá sang trọng cùng với trọng lượng chảo nhẹ chỉ 0.5 kg giúp dễ di chuyển linh hoạt trong gian bếp.', 2, CAST(N'2021-03-03' AS Date), N'Đường kính 26 cm chiên được 1 con cá lớn dưới 1.5 kg.
Chảo hợp kim nhôm dày 2.437 mm giúp giữ ấm tốt, hạn chế biến dạng do va đập.
Bề mặt là lớp chống dính vân đá phủ sơn Whitford Xylan chịu mức nhiệt tối đa 380 °C.
Tay cầm bọc nhựa cách nhiệt, chống bỏng, dễ cầm nắm, tiện thao tác.
Chảo chống dính dùng tốt trên bếp từ, bếp hồng ngoại và bếp gas.
Thương hiệu của DMX - Việt Nam, độc quyền Điện máy XANH, sản xuất tại Việt Nam.', 1, 4, 5)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (47, N'Chảo nhôm chống dính đáy từ 20 cm Elmich', 280000, 10, N'product-47', 0, N'Chảo chống dính đáy từ Elmich EL-5740MN màu sắc sang đẹp, thời thượng, thành chảo chất liệu nhôm A3003 dày 2.937 mm
Chảo có khả năng giữ nhiệt tốt, nấu nhanh hơn, giữ ấm thức ăn lâu và chịu va đập tốt. Mặt ngoài là lớp sơn phủ sơn Whitford màu hồng chống bám bẩn và lớp vân đá đen thời thượng đẹp mắt, tô điểm không gian bếp.', 1, CAST(N'2021-11-11' AS Date), N'Thành chảo bằng nhôm A3003 dày 2.937 mm giữ nhiệt tốt, chịu va đập.
Mặt ngoài phủ sơn Whitford chống bám bẩn và vân đá đen đẹp mắt.
Đáy chảo bằng inox 430 giúp bắt từ hiệu quả.
Lòng chảo phủ chống dính ILAG Ultimate 3 lớp và vân đá đen sang đẹp, chịu nhiệt tối đa 400 °C, hạn chế mài mòn, chống dính cháy thực phẩm.
Chảo nặng 0.6 kg, tay cầm làm từ inox không gây nóng khi cầm, an toàn và tiện lợi khi sử dụng.
Đường kính 20 cm tiện chiên xào thực phẩm cho 2 - 3 người ăn.
Thiết kế dạng sâu lòng, thành chảo cao hạn chế tối đa khả năng bắn mỡ.
Sử dụng được trên bếp gas, bếp hồng ngoại và bếp từ.
Thương hiệu Elmich - Việt Nam, sản xuất tại Việt Nam.', 0, 4, 5)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (48, N'Găng tay cao su có móc treo size L', 25000, 0, N'product-48', 0, N'Sản phẩm thương hiệu Scotch Brite thuộc tập đoàn 3M Hoa Kỳ, sản xuất Việt Nam.
', 1, CAST(N'2021-11-11' AS Date), N'Bao tay gia dụng chất liệu cao su, bền, an toàn sử dụng.
Màu hồng nhẹ nhàng, thích hợp dùng cho nữ giới.
Bảo vệ đôi tay khỏi chất bẩn, chất tẩy rửa trong quá trình vệ sinh nhà cửa.
Size L, chiều dài phủ hết phần cẳng tay giúp che chở tốt.
Thiết kế có sẵn móc treo tiện lợi cất giữ sau khi dùng.', 0, 5, 15)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (50, N'Bàn chải chà sàn nhựa Tự Lập ', 9000, 0, N'product-50', 0, N'Bàn chải chà sàn màu xanh nhạt trẻ trung, tươi sáng, gọn gàng với chiều rộng 6 cm, dài 13.5 cm.
Thích hợp dùng chà sàn nhà, kệ bếp, tường phòng tắm, phòng vệ sinh, bồn tắm...', 2, CAST(N'2021-12-12' AS Date), N'Chất liệu nhựa PP cho thân bàn chải, bề mặt bàn chà bằng cước bền bỉ, không đứt gãy, tiện chùi rửa.
Thương hiệu Tự Lập - Việt Nam, sản xuất tại Việt Nam, chất lượng tốt.', 0, 5, 15)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (53, N'Sọt rác nhựa Duy Tân', 13000, 0, N'product-53', 1, N'Thiết kế màu sắc bắt mắt, quanh thân có nhiều lỗ nhỏ giúp tránh ẩm cho đồ dùng.
Sọt nhựa tiện đựng đồ dùng ở văn phòng, nhà bếp hay phòng tắm đều được.', 1, CAST(N'2019-12-12' AS Date), N'Đường kính 30 x cao 31.5 cm, chất liệu nhựa PP bền đẹp, an toàn.
Thương hiệu Duy Tân - Việt Nam, sản xuất tại Việt Nam.', 1, 5, 15)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (54, N'Tay sen tăng áp nóng lạnh nhựa có lõi lọc', 168000, 5, N'product-54', 1, N'Tay sen tăng áp nhựa có lõi lọc Vitamin C Eurolife EL-H145 thiết kế sang trọng, bắt mắt với màu inox sáng bóng và màu trắng sữa, tạo nét tinh tế trong không gian lắp đặt', 1, CAST(N'2020-12-12' AS Date), N'
Có lõi lọc

Lõi lọc bổ sung khoáng và vitamin C

Mặt phun có thể điều chỉnh lên xuống

Tiết kiệm nước

Tăng áp

Vòi nóng lạnh', 2, 6, 15)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (55, N'Tay sen nhựa kèm dây Empire', 200000, 10, N'product-55', 1, N'Dây sen bằng nhựa PVC cao cấp trắng sáng cùng chỉ nylon đan khít siêu bền với khả năng chịu áp lực nước cao
Có tán đồng thau kết nối giữa dây và tay sen thêm chắc chắn.

Cổ vặn đồng thau sáng bóng, hạn chế rỉ sét.

Dây sen dài 140 cm giúp thao tác linh hoạt và dễ dàng hơn.', 5, CAST(N'2021-02-02' AS Date), N'Tay sen: Nhựa ABSDây sen: Nhựa PVC đan chỉ nylon', 1, 6, 15)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (56, N'Vòi xịt vệ sinh nhựa Empire ', 111000, 80, N'product-56', 1, N'Vòi xịt vệ sinh nhựa Empire kiểu dáng nhỏ gọn với 350g, màu trắng bạc sang trọng, có thiết kế nhỏ gọn, chắc chắn, dễ dàng lắp đặt và sử dụng
Đi kèm bát gác đi kèm tay xịt có thể lắp vào tường, giúp treo cất vòi xịt gọn gàng, ngăn nắp.', 3, CAST(N'2020-12-12' AS Date), N'Kiểu dáng nhỏ gọn vs 350g, tiện lợi áp lực nước cao, đánh bay các vết bẩn cứng đầu.
Tay xịt bằng nhựa ABS bền chắc, hạn chế bám bẩn.
Dây xịt bằng nhựa PVC đan chỉ nylon có chất lượng tốt, chịu được áp lực cao, bền, dẻo và không bị rối.
Lực xịt vòi vệ sinh đẩy nước với tốc độ nhanh và mạnh kể cả khi áp lực nước yếu giúp loại bỏ những bụi bẩn cứng đầu.
Thương hiệu Empire - Mỹ, sản xuất tại Trung Quốc.', 2, 6, 15)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (57, N'Máy đo huyết áp tự động Kachi', 630000, 10, N'product-57', 1, N'Máy đo huyết áp tự động Kachi MK-167 thiết kế nhỏ gọn, hiện đại
Sản xuất trên chất liệu nhựa ABS cao cấp, nhẹ và an toàn, tránh va đập. Có thể đo huyết áp tại nhà mà không cần đến bệnh viện hay cơ sở y tế. Ngoài ra cũng thuận tiện mang theo bên người khi bạn di chuyển mọi nơi.', 2, CAST(N'2021-11-11' AS Date), N'Âm báo đo xong

Cảnh báo sức khoẻ

Đọc kết quả đo bằng tiếng Việt', 0, 7, 15)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (58, N'Ghế Massage toàn thân Airbike', 2100000, 20, N'product-58', 1, N'Ghế Massage toàn thân Airbike Sport MK-280 có thể sẽ chiếm một khoảng không gian sinh hoạt đáng kể nhà bạn với kích thước 122 x 110 x 74 cm (Dài x Cao x Sâu) nhưng kiểu ghế lại rất phù hợp với vóc dáng của người Việt, kể cả người châu Á nói chung, góp phần mang lại hiệu quả massage khi sử dụng. Ghế massage có thể được di chuyển dễ dàng với hệ thống bánh xe phía dưới.

Mẫu ghế Massage toàn thân Airbike Sport MK-280 phù hợp cho cả người lớn tuổi với kiểu thiết kế đơn giản và không gây khó khăn trong quá trình thao tác chức năng của ghế.', 3, CAST(N'2021-11-01' AS Date), N'Nghe nhạc qua bluetoothĐiều chỉnh tốc độ và thao tác massageĐiện áp hoạt động an toàn 24VThiết kế với nhiều túi khí cho toàn bộ cơ thểRung massage trên đệm ghế', 0, 7, 15)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (59, N'Máy chạy bộ thể dục Airbike ', 18900000, 5, N'product-59', 1, N'An toàn và bền bỉ với thiết kế chắc chắn
Máy chạy bộ thể dục Airbike Sport MK-272 có tải trọng tối đa lên đến 140 Kg nhờ khung máy được làm bằng thép sơn tĩnh điện cứng cáp, hạn chế rỉ sét và bào mòn. Tay cầm được làm từ nhựa ABS chống trơn trợt khi cầm nắm trong quá trình chạy.

Bên cạnh đó, phần chân còn có các miếng lót chống trượt giúp máy hoạt động êm ái, giảm lực tác động lên khung xương người dùng. 4 bánh xe giúp dễ dàng di chuyển, thay đổi vị trí đặt mặc dù trọng lượng máy là 80 Kg.', 1, CAST(N'2021-01-01' AS Date), N'Chân đế chống trượtChức năng kiểm tra tình trạng cơ thểChức năng tiết kiệm điện với chế độ ngủ đôngCó loa phát nhạcCó xếp gọn với piston trợ lựcKhe cắm USBKhoá an toàn chống ngãMàn hình hiển th', 0, 7, 15)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (60, N'Máy khoan động lực điện Bosch', 920000, 0, N'product-60', 1, N'Thiết kế nhỏ gọn, thích hợp với mọi không gian
Máy khoan động lực điện Bosch GSB 550 550W sở hữu thiết kế nhỏ gọn với trọng lượng chỉ 1.8 kg, giúp người dùng thoải mái khi sử dụng thích hợp bố trí ở những không gian khác nhau và rất thuận tiện để di chuyển tới nơi làm việc.', 3, CAST(N'2021-02-02' AS Date), N'Trang bị tay nắm phụ chắc chắn
Tay nắm phụ được trang bị phía trước máy khoan động lực, giúp cố định và cân bằng khi sử dụng máy khoan, cho người dùng cảm giác chắc chắn, chống trơn trượt.', 1, 8, 6)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (61, N'Máy khoan búa điện Tolsen', 550000, 2, N'product-61', 1, N'Thiết kế chắc chắn, gọn gàng
Máy khoan búa điện Tolsen 79501 500W được thiết kế với kiểu dáng hiện đại, an toàn với vỏ được làm từ nhựa cao cấp giúp cách nhiệt, cách điện tốt. Tay cầm chắc chắn với lớp cao su được bọc bên ngoài mang lại hiệu quả cao trong quá trình khoan.', 10, CAST(N'2021-03-03' AS Date), N'Chế độ đục bê tông

Có tay cầm phụ

Kiểm soát tốc độ

Đảo chiều khoan

Có nút khóa cò khoan

Dây điện dài 2m', 2, 8, 10)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (62, N'Bộ mũi khoan và vặn vít 34 món', 247000, 0, N'product-62', 0, N'Bộ mũi khoan và vặn vít Bosch X-Line 34 món có hộp đựng bằng nhựa, nhỏ gọn giúp người dùng dễ dàng xách theo bên mình. Ngoài ra, bên trong hộp được thiết kế thông minh với từng vị trí cố định ứng với từng loại mũi giúp sản phẩm không bị rơi rớt khi di chuyển.', 0, CAST(N'2021-04-04' AS Date), N'Hộp đựng nhỏ, tiện lợi, thông minh dễ thao tác.
Chất liệu các dụng cụ bằng thép không gỉ, chống bào mòn bền bỉ.
Bộ sản phẩm chi tiết bao gồm:
5x Mũi khoan kim loại HSS, đường kính 2-5mm.
5x Mũi khoan đá, đường kính 5-8 mm.
5x Mũi khoan gỗ, đường kính 4-8 mm.', 2, 8, 15)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (63, N'Kìm răng Tolsen 18 cm', 74000, 0, N'product-63', 1, N'Hỗ trợ các công việc giữ, vặn chắc chắn nhờ mũi được thiết kế dạng dẹp và răng cưa.
Sử dụng để cắt hoặc uốn đinh, thép, dây điện,... trong gia đình và các ngành như điện, cơ khí.', 1, CAST(N'2020-05-05' AS Date), N'Thiết kế nhỏ gọn, tiện lợi với chiều dài 180mm.
Tay cầm vừa vặn, chắc chắn được làm bằng nhựa cao cấp.
Chống gỉ, cứng chắc nhờ mũi kìm làm từ chất liệu thép Crv mạ niken.', 0, 8, 10)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (64, N'Mũ 1/2 size XL Delites', 12000, 0, N'product-64', 1, N'Mũ bảo hiểm Delites màu đen mờ đơn giản, kiểu dáng gọn nhẹ, trẻ trung, size XL phù hợp cho cả nam và nữ 66 - 67 cm
Thiết kế mũ nửa đầu dễ dàng mang, đội thoải mái và tiện lợi sử dụng di chuyển đi lại trong thành phố, đoạn đường gần,...', 2, CAST(N'2021-06-06' AS Date), N'Kiểu dáng 1/2 đầu, size XL phù hợp cả nam và nữ có vòng đầu 66 - 67 cm.
Võ mũ nửa đầu làm từ nhựa ABS chịu qua đập tốt.
Màu sơn đen mờ, không bong tróc dưới tác động thời tiết.', 0, 9, 8)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (66, N'Mũ 1/2 size M Delites bò sữa xanh dương', 139000, 0, N'product-66', 1, N'Mũ bảo hiểm Delites màu xanh có họa tiết bò sữa trẻ trung, tạo điểm nhấn cho người dùng
Loại mũ nửa đầu hay 1/2 gọn gàng, size M đội vừa đầu người trưởng thành (chu vi 56 - 57 cm). Đáp ứng nhu cầu di chuyển bằng xe máy.', 2, CAST(N'2021-07-07' AS Date), N'Nón bảo hiểm size M (chu vi 56 - 57 cm) phù hợp đi lại trong nội thành hoặc ngoại thành gần.
Vỏ mũ được làm bằng chất liệu ABS chịu va đập tốt.', 0, 9, 8)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (67, N'Két sắt cá nhân 14.4 lít Honeywell ', 2000000, 20, N'product-67', 1, N'Thiết kế tinh tế, không chiếm nhiều diện tích không gian
Két sắt cá nhân 14.4 lít Honeywell điện tử 5110 được thiết kế nhỏ gọn với kiểu dáng hình hộp chữ nhật với dung tích 14.4 lít, thích hợp với nhiều không gian khác nhau, đáp ứng được nhu cầu lưu trữ nhiều loại tài sản có giá trị như: tiền mặt, trang sức, giấy tờ quan trọng,...', 3, CAST(N'2021-08-08' AS Date), N'Khay chứa có thể tháo rời

Nút reset mật khẩu khi quên

Cố định két sắt vào tường hoặc tủ bằng ốc vít giúp chống trộm', 1, 9, 15)
INSERT [dbo].[Product] ([id], [name], [price], [discount], [image], [status], [description], [quantity], [dateCreate], [information], [purchased], [idCategory], [idBrand]) VALUES (68, N'Két sắt cá nhân  điện tử ', 1500000, 10, N'product-68', 1, N'Thiết kế tinh tế, không chiếm nhiều diện tích không gian
Két sắt cá nhân 14.4 lít Honeywell điện tử 5110 được thiết kế nhỏ gọn với kiểu dáng hình hộp chữ nhật với dung tích 14.4 lít, thích hợp với nhiều không gian khác nhau, đáp ứng được nhu cầu lưu trữ nhiều loại tài sản có giá trị như: tiền mặt, trang sức, giấy tờ quan trọng,...', 1, CAST(N'2021-09-09' AS Date), N'Khay chứa có thể tháo rời

Nút reset mật khẩu khi quên

Cố định két sắt vào tường hoặc tủ bằng ốc vít giúp chống trộm', 0, 9, 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [name], [email], [password], [phone], [address], [dayCreated]) VALUES (4, N'mahoa', N'mahoa@gmail.com', N'$2a$12$1jD5d7zSnPRe4GJk9XJzWunqnEWoGpZYtmCb8ogexR57Nn.cvyGn2', N'03971813501', N'Tiền Giang', CAST(N'2021-11-03' AS Date))
INSERT [dbo].[Users] ([id], [name], [email], [password], [phone], [address], [dayCreated]) VALUES (5, N'Thảo Võ', N'vntvnt1512@gmail.com', N'$2a$12$BgX.piEWblPcGobLYdfY7OmIK.phrKIPiRKv0VS727NDHaGDn53E.', N'039718135', N'Cái Bè', CAST(N'2021-11-03' AS Date))
INSERT [dbo].[Users] ([id], [name], [email], [password], [phone], [address], [dayCreated]) VALUES (6, N'test', N'test1@gmail.com', N'$2a$12$5KRJzMeaYtZoFkmuwxOPp.zRAtlxSkOfrFOfqMNxb.8bhfm4w6lPm', N'03971813501', N'Tiền Giang', CAST(N'2021-11-04' AS Date))
INSERT [dbo].[Users] ([id], [name], [email], [password], [phone], [address], [dayCreated]) VALUES (7, N'user', N'user1@gmail.com', N'$2a$12$wYCqedSLbRs2YUpCOkOOGufKCfrimQ/hiRGLmtQqU8Q.gm5gZJv8W', N'03971813501', N'CB', CAST(N'2021-11-10' AS Date))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_admin] FOREIGN KEY([adId])
REFERENCES [dbo].[Admin] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_bill_admin]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_bill_users]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_billDetails_bill] FOREIGN KEY([billId])
REFERENCES [dbo].[Bill] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_billDetails_bill]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_billDetails_product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_billDetails_product]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Admin] FOREIGN KEY([adId])
REFERENCES [dbo].[Admin] ([id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Admin]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([idBrand])
REFERENCES [dbo].[Brand] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([idCategory])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_product_category]
GO
USE [master]
GO
ALTER DATABASE [WebGiaDung] SET  READ_WRITE 
GO
