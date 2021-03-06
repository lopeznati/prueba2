USE [master]
GO
/****** Object:  Database [FabricaAberturas]    Script Date: 12/4/2016 9:38:43 p. m. ******/
CREATE DATABASE [FabricaAberturas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FabricaAberturas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FabricaAberturas.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FabricaAberturas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FabricaAberturas_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FabricaAberturas] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FabricaAberturas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FabricaAberturas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FabricaAberturas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FabricaAberturas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FabricaAberturas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FabricaAberturas] SET ARITHABORT OFF 
GO
ALTER DATABASE [FabricaAberturas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FabricaAberturas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FabricaAberturas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FabricaAberturas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FabricaAberturas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FabricaAberturas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FabricaAberturas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FabricaAberturas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FabricaAberturas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FabricaAberturas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FabricaAberturas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FabricaAberturas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FabricaAberturas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FabricaAberturas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FabricaAberturas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FabricaAberturas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FabricaAberturas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FabricaAberturas] SET RECOVERY FULL 
GO
ALTER DATABASE [FabricaAberturas] SET  MULTI_USER 
GO
ALTER DATABASE [FabricaAberturas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FabricaAberturas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FabricaAberturas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FabricaAberturas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FabricaAberturas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FabricaAberturas', N'ON'
GO
USE [FabricaAberturas]
GO
/****** Object:  Table [dbo].[aberturas]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aberturas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_aberturas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

GO
/****** Object:  Table [dbo].[aberturas_accesorios]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aberturas_accesorios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_abertura] [int] NOT NULL,
	[id_detalle_accesorio] [int] NOT NULL,
	[cantidad] [real] NOT NULL,
 CONSTRAINT [PK_aberturas_accesorios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aberturas_perfiles]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aberturas_perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_perfil] [int] NOT NULL,
	[id_color] [int] NOT NULL,
	[id_abertura] [int] NOT NULL,
	[cantidad] [real] NOT NULL,
 CONSTRAINT [PK_aberturas_perfiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aberturas_vidrios]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aberturas_vidrios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_abertura] [int] NOT NULL,
	[id_vidrio] [int] NOT NULL,
	[cantidad] [real] NOT NULL,
 CONSTRAINT [PK_aberturas_vidrios] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id_abertura] ASC,
	[id_vidrio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[accesorios]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accesorios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](100) NOT NULL,
	[tipo] [int] NOT NULL,
 CONSTRAINT [PK_accesorios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[colores]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nchar](100) NULL,
	[porcentaje_peso_adicional] [real] NULL,
 CONSTRAINT [PK_colores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalles_accesorios]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_accesorios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nchar](10) NOT NULL,
	[descripcion] [nchar](100) NOT NULL,
	[valor] [real] NULL,
	[id_accesorio] [int] NOT NULL,
 CONSTRAINT [PK_detalles_accesorios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historial_parametros]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historial_parametros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[valor] [real] NOT NULL,
	[fecha] [date] NOT NULL,
	[id_parametro] [int] NOT NULL,
 CONSTRAINT [PK_historial_parametros] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historial_precio_accesorios]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historial_precio_accesorios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[valor] [real] NOT NULL,
	[fecha] [date] NOT NULL,
	[id_detalle_accesorio] [int] NOT NULL,
 CONSTRAINT [PK_historial_precio_accesorios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historial_precios_vidrios]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historial_precios_vidrios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[valor] [real] NOT NULL,
	[fecha] [date] NOT NULL,
	[id_vidrio] [int] NOT NULL,
 CONSTRAINT [PK_historial_precios_vidrios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[parametros]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parametros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_parametros] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[perfiles]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nchar](10) NOT NULL,
	[descripcion] [nchar](100) NOT NULL,
	[gramo_por_metro] [real] NOT NULL,
	[longitud_maxima] [real] NOT NULL,
	[id_tipo] [int] NOT NULL,
 CONSTRAINT [PK_perfiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipos_perfiles]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nchar](100) NOT NULL,
 CONSTRAINT [PK_tipo_perfil] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vidrios]    Script Date: 12/4/2016 9:38:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vidrios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](60) NOT NULL,
	[espesor] [real] NOT NULL,
 CONSTRAINT [PK_vidrios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[aberturas] ON 

INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (5, N'Banderola 116 x 46 (con picaporte)')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (6, N'Puerta 2,0 x 0,71')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (7, N'Ventana corredisa 1,1x1,45')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (8, N'Banderola 0,9x0,8')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (9, N'Ventana corredisa 1,1x1,45')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (10, N'Porton 2,7x2')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (11, N'Ventiluz banderola 50 x 50')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (13, N'Ventana corrediza 1,1 x 1,45 R')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (14, N'Ventana mosquitero 0,75 x 1,5')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (15, N'Paño fijo 1 x 3')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (16, N'Paño fijo 1 x 3')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (17, N'Mosquitero 0,71 x 0,52')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (18, N'Ventana corredisa con guia p/cortina 1,1 x 1,45')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (19, N'Ventana corredisa 1,5 x 2 - 4 Vidrios')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (20, N'Banderola 0,70 x 1,70')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (21, N'Puerta frente con paño fijo 80x40x200')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (22, N'puerta para francisco')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (23, N'puerta fernando 1,3 x 2,1')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (24, N'puerta fernando 1,3 x 2,1 completa')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (25, N'Puerta doble completa 1,3 x 2,1')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (26, N'banderola 50 x 80')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (27, N'corredisa 50 x 80')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (28, N'Ventiluz 60x40')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (29, N'Corrdisa 1,2 x 1')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (30, N'Banderola esquinero 0,6x1,3x0,4')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (31, N'Paño fijo 1,2 x 1,2')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (32, N'Banderola 0,5 x 1,2 con union paño fijo')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (33, N'Puerta 0,85 x 2,02')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (34, N'V. Corredisa 1,3 x 1,0')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (35, N'Ventiluz banderola 0,6 x 0,4')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (36, N'ventana balcon 1,5 x 2')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (37, N'Puerta 0,7 x 2 mitad vidrio')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (38, N'Mosquitero puerta balcon')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (39, N'V. Corrediza 1,2 x 1,2')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (40, N'puerta 1 x 2')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (41, N'Ventana corrediza 1,1 x 1,45 con guia p/ cortina')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (42, N'Puerta mosquitero 0,96 x 2,07')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (43, N'Mosquitero 0,86 x 1,23')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (44, N'Puerta de Frente 0,71x2')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (45, N'Porton dos hojas 2,16 x 2,08')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (46, N'Porton dos hojas 2,16 x 2,08 R')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (47, N'V. Corrediza')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (48, N'Puerta trasera o,7 x 2')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (49, N'Ventana corrediza 0,8 x 0,95')
INSERT [dbo].[aberturas] ([id], [descripcion]) VALUES (50, N'Puerta trasera 0,75 x 2 mitad vidrio')
SET IDENTITY_INSERT [dbo].[aberturas] OFF
SET IDENTITY_INSERT [dbo].[aberturas_accesorios] ON 

INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (4, 5, 7, 46)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (5, 5, 12, 7.55)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (6, 6, 6, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (7, 6, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (8, 6, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (9, 6, 10, 6.84)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (10, 6, 11, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (11, 6, 12, 4.71)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (12, 6, 14, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (13, 6, 15, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (14, 7, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (15, 7, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (16, 7, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (17, 7, 12, 13.1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (18, 7, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (19, 7, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (20, 7, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (21, 7, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (22, 7, 20, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (23, 8, 7, 48)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (24, 8, 12, 3.4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (25, 8, 23, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (26, 9, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (27, 9, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (28, 9, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (29, 9, 12, 13.1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (30, 9, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (31, 9, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (32, 9, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (33, 9, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (34, 9, 21, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (35, 10, 6, 36)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (36, 10, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (37, 10, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (38, 10, 10, 11.52)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (39, 10, 11, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (40, 10, 12, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (41, 10, 14, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (42, 10, 15, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (43, 10, 24, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (44, 10, 25, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (45, 11, 7, 48)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (46, 11, 10, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (47, 11, 12, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (48, 11, 23, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (57, 13, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (58, 13, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (59, 13, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (60, 13, 12, 13.1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (61, 13, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (62, 13, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (63, 13, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (64, 13, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (65, 13, 21, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (66, 14, 7, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (67, 14, 26, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (68, 14, 27, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (69, 14, 28, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (70, 14, 29, 1.6)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (71, 14, 31, 4.5)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (72, 15, 10, 14)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (73, 16, 10, 14)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (74, 17, 7, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (75, 17, 26, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (76, 17, 27, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (77, 17, 28, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (78, 17, 29, 0.52)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (79, 17, 31, 2.5)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (80, 18, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (81, 18, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (82, 18, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (83, 18, 12, 13.1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (84, 18, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (85, 18, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (86, 18, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (87, 18, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (88, 18, 21, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (89, 19, 6, 10)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (90, 19, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (91, 19, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (92, 19, 12, 14)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (93, 19, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (94, 19, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (95, 19, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (96, 19, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (97, 19, 20, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (98, 20, 7, 48)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (99, 20, 12, 9.6)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (100, 20, 23, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (101, 20, 32, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (102, 21, 6, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (103, 21, 7, 24)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (104, 21, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (105, 21, 11, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (106, 21, 14, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (107, 21, 16, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (108, 22, 6, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (109, 22, 7, 24)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (110, 22, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (111, 22, 11, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (112, 22, 14, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (113, 22, 16, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (114, 23, 6, 28)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (115, 23, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (116, 23, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (117, 23, 11, 13.5)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (118, 23, 14, 7)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (119, 23, 16, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (120, 24, 6, 28)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (121, 24, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (122, 24, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (123, 24, 11, 13.5)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (124, 24, 14, 7)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (125, 24, 16, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (126, 25, 6, 28)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (127, 25, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (128, 25, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (129, 25, 11, 13.5)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (130, 25, 14, 7)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (131, 25, 16, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (132, 26, 7, 48)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (133, 26, 12, 5.2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (134, 26, 23, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (135, 27, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (136, 27, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (137, 27, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (138, 27, 12, 6.2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (139, 27, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (140, 27, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (141, 27, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (142, 27, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (143, 27, 21, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (144, 28, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (145, 28, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (146, 28, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (147, 28, 12, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (148, 28, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (149, 28, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (150, 28, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (151, 28, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (152, 28, 20, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (153, 29, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (154, 29, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (155, 29, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (156, 29, 12, 10.4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (157, 29, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (158, 29, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (159, 29, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (160, 29, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (161, 29, 21, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (162, 30, 7, 48)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (163, 30, 12, 7)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (164, 30, 22, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (165, 31, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (166, 31, 10, 4.8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (167, 32, 7, 48)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (168, 32, 12, 6.8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (169, 32, 23, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (170, 33, 6, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (171, 33, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (172, 33, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (173, 33, 11, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (174, 33, 12, 4.85)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (175, 33, 14, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (176, 33, 16, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (177, 34, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (178, 34, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (179, 34, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (180, 34, 12, 9.2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (181, 34, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (182, 34, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (183, 34, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (184, 34, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (185, 34, 21, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (186, 35, 7, 48)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (187, 35, 12, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (188, 35, 22, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (189, 36, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (190, 36, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (191, 36, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (192, 36, 12, 18)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (193, 36, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (194, 36, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (195, 36, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (196, 36, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (197, 36, 20, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (198, 37, 6, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (199, 37, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (200, 37, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (201, 37, 11, 8.7)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (202, 37, 12, 4.7)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (203, 37, 14, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (204, 37, 15, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (205, 38, 7, 10)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (206, 38, 26, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (207, 38, 27, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (208, 38, 28, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (209, 38, 29, 2.8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (210, 38, 31, 2.5)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (211, 39, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (212, 39, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (213, 39, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (214, 39, 12, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (215, 39, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (216, 39, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (217, 39, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (218, 39, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (219, 39, 20, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (220, 40, 6, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (221, 40, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (222, 40, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (223, 40, 11, 14)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (224, 40, 12, 6)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (225, 40, 14, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (226, 40, 15, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (227, 41, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (228, 41, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (229, 41, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (230, 41, 12, 13.1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (231, 41, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (232, 41, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (233, 41, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (234, 41, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (235, 41, 21, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (236, 42, 6, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (237, 42, 7, 30)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (238, 42, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (239, 42, 26, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (240, 42, 29, 1.42)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (241, 42, 30, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (242, 43, 7, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (243, 43, 26, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (244, 43, 27, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (245, 43, 28, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (246, 43, 29, 1.25)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (247, 43, 31, 4.2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (248, 44, 6, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (249, 44, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (250, 44, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (251, 44, 10, 6.84)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (252, 44, 11, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (253, 44, 12, 4.71)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (254, 44, 14, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (255, 44, 15, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (256, 45, 6, 24)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (257, 45, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (258, 45, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (259, 45, 11, 15)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (260, 45, 12, 63)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (261, 45, 14, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (262, 45, 16, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (263, 46, 6, 24)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (264, 46, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (265, 46, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (266, 46, 11, 15)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (267, 46, 12, 63)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (268, 46, 14, 10)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (269, 46, 16, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (270, 47, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (271, 47, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (272, 47, 12, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (273, 47, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (274, 47, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (275, 47, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (276, 47, 21, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (277, 48, 6, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (278, 48, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (279, 48, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (280, 48, 10, 6.84)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (281, 48, 11, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (282, 48, 12, 4.71)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (283, 48, 14, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (284, 48, 15, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (285, 49, 6, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (286, 49, 7, 32)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (287, 49, 8, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (288, 49, 12, 8.9)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (289, 49, 13, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (290, 49, 17, 4)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (291, 49, 18, 8)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (292, 49, 19, 2)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (293, 49, 20, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (294, 50, 6, 12)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (295, 50, 7, 16)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (296, 50, 9, 1)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (297, 50, 11, 9.5)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (298, 50, 12, 4.75)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (299, 50, 14, 3)
INSERT [dbo].[aberturas_accesorios] ([id], [id_abertura], [id_detalle_accesorio], [cantidad]) VALUES (300, 50, 15, 1)
SET IDENTITY_INSERT [dbo].[aberturas_accesorios] OFF
SET IDENTITY_INSERT [dbo].[aberturas_perfiles] ON 

INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (3, 19, 2, 5, 3.24)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (4, 21, 2, 5, 3.24)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (5, 23, 2, 5, 0.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (6, 24, 2, 5, 3.24)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (7, 26, 3, 5, 0.56)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (8, 12, 2, 6, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (9, 15, 2, 6, 4.71)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (10, 16, 2, 6, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (11, 17, 2, 6, 2.13)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (12, 27, 2, 6, 3.42)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (13, 3, 2, 7, 5.1)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (14, 4, 2, 7, 2.9)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (15, 5, 2, 7, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (16, 6, 2, 7, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (17, 19, 2, 8, 3.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (18, 21, 2, 8, 3.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (19, 23, 2, 8, 0.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (20, 24, 2, 8, 3.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (21, 3, 2, 9, 5.1)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (22, 4, 2, 9, 2.9)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (23, 5, 2, 9, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (24, 6, 2, 9, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (25, 12, 2, 10, 26.16)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (26, 15, 2, 10, 6.7)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (27, 16, 2, 10, 12)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (28, 17, 2, 10, 6.54)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (29, 27, 2, 10, 6.08)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (30, 30, 2, 10, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (31, 19, 2, 11, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (32, 21, 2, 11, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (33, 23, 2, 11, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (34, 24, 2, 11, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (41, 7, 2, 13, 5.1)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (42, 8, 2, 13, 2.9)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (43, 9, 2, 13, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (44, 10, 2, 13, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (45, 11, 2, 14, 4.5)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (46, 18, 2, 15, 14)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (47, 19, 2, 15, 14)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (48, 18, 2, 16, 8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (49, 19, 2, 16, 8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (50, 11, 2, 17, 2.53)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (51, 7, 2, 18, 5.1)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (52, 8, 2, 18, 2.9)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (53, 9, 2, 18, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (54, 10, 2, 18, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (55, 31, 2, 18, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (56, 3, 2, 19, 7)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (57, 4, 2, 19, 4.5)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (58, 5, 2, 19, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (59, 6, 2, 19, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (60, 19, 2, 20, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (61, 21, 2, 20, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (62, 23, 2, 20, 0.3)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (63, 24, 2, 20, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (64, 26, 3, 20, 0.3)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (65, 12, 2, 21, 3.45)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (66, 13, 2, 21, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (67, 15, 2, 21, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (68, 16, 2, 21, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (69, 17, 2, 21, 3.6)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (70, 18, 2, 21, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (71, 19, 2, 21, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (72, 26, 3, 21, 0.42)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (73, 12, 2, 22, 3.45)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (74, 13, 2, 22, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (75, 15, 2, 22, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (76, 16, 2, 22, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (77, 17, 2, 22, 3.6)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (78, 18, 2, 22, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (79, 19, 2, 22, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (80, 26, 3, 22, 0.42)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (81, 12, 2, 23, 6.24)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (82, 15, 2, 23, 5.5)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (83, 16, 2, 23, 8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (84, 17, 2, 23, 5.5)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (85, 26, 3, 23, 0.14)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (86, 12, 2, 24, 6.24)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (87, 15, 2, 24, 5.5)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (88, 16, 2, 24, 8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (89, 17, 2, 24, 5.5)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (90, 26, 3, 24, 0.14)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (91, 30, 2, 24, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (92, 12, 2, 25, 6.24)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (93, 15, 2, 25, 5.5)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (94, 16, 2, 25, 8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (95, 17, 2, 25, 5.5)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (96, 26, 3, 25, 0.14)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (97, 30, 2, 25, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (98, 19, 2, 26, 2.6)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (99, 21, 2, 26, 2.6)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (100, 23, 2, 26, 0.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (101, 24, 2, 26, 2.6)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (102, 3, 2, 27, 2.6)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (103, 4, 2, 27, 1.6)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (104, 5, 2, 27, 1)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (105, 6, 2, 27, 1)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (106, 3, 2, 28, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (107, 4, 2, 28, 0.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (108, 5, 2, 28, 0.7)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (109, 6, 2, 28, 0.7)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (110, 3, 2, 29, 4.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (111, 4, 2, 29, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (112, 5, 2, 29, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (113, 6, 2, 29, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (114, 19, 2, 30, 5.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (115, 21, 2, 30, 5.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (116, 23, 2, 30, 0.5)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (117, 24, 2, 30, 5.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (118, 32, 2, 30, 0.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (119, 18, 2, 31, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (120, 19, 2, 31, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (121, 13, 2, 32, 1.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (122, 19, 2, 32, 3.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (123, 21, 2, 32, 3.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (124, 23, 2, 32, 0.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (125, 24, 2, 32, 3.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (126, 12, 2, 33, 5.04)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (127, 15, 2, 33, 4.89)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (128, 16, 2, 33, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (129, 17, 2, 33, 2.4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (130, 3, 2, 34, 4.6)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (131, 4, 2, 34, 2.6)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (132, 5, 2, 34, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (133, 6, 2, 34, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (134, 19, 2, 35, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (135, 21, 2, 35, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (136, 23, 2, 35, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (137, 24, 2, 35, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (138, 7, 2, 36, 7)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (139, 8, 2, 36, 3)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (140, 9, 2, 36, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (141, 10, 2, 36, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (142, 12, 2, 37, 3.7)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (143, 15, 2, 37, 4.7)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (144, 16, 2, 37, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (145, 17, 2, 37, 1.44)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (146, 26, 3, 37, 0.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (147, 11, 2, 38, 5.6)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (148, 22, 2, 38, 0.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (149, 3, 2, 39, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (150, 4, 2, 39, 2.1)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (151, 5, 2, 39, 2.3)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (152, 6, 2, 39, 2.3)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (153, 14, 2, 40, 2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (154, 15, 2, 40, 3)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (155, 16, 2, 40, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (156, 17, 2, 40, 3)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (157, 3, 2, 41, 5.1)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (158, 4, 2, 41, 2.9)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (159, 5, 2, 41, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (160, 6, 2, 41, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (161, 31, 2, 41, 2.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (162, 11, 2, 42, 6.06)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (163, 12, 2, 42, 0.96)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (164, 14, 2, 42, 5.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (165, 22, 2, 42, 0.96)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (166, 11, 2, 43, 4.2)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (167, 12, 2, 44, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (168, 15, 2, 44, 4.71)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (169, 16, 2, 44, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (170, 17, 2, 44, 2.13)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (171, 27, 2, 44, 3.42)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (172, 28, 2, 44, 1)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (173, 14, 2, 45, 14.64)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (174, 15, 2, 45, 6.3)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (175, 16, 2, 45, 8.172)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (176, 17, 2, 45, 7.22)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (177, 14, 2, 46, 14.64)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (178, 34, 2, 46, 6.3)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (179, 35, 2, 46, 8.172)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (180, 36, 2, 46, 7.22)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (181, 37, 2, 46, 7.22)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (182, 38, 2, 47, 4.8)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (183, 39, 2, 47, 2.1)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (184, 40, 2, 47, 2.3)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (185, 41, 2, 47, 2.3)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (186, 14, 2, 48, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (187, 15, 2, 48, 4.71)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (188, 16, 2, 48, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (189, 17, 2, 48, 2.13)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (190, 3, 2, 49, 3.5)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (191, 4, 2, 49, 1.6)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (192, 5, 2, 49, 1.9)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (193, 6, 2, 49, 1.9)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (194, 14, 2, 50, 4.5)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (195, 15, 2, 50, 4.75)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (196, 16, 2, 50, 4)
INSERT [dbo].[aberturas_perfiles] ([id], [id_perfil], [id_color], [id_abertura], [cantidad]) VALUES (197, 17, 2, 50, 1.74)
SET IDENTITY_INSERT [dbo].[aberturas_perfiles] OFF
SET IDENTITY_INSERT [dbo].[aberturas_vidrios] ON 

INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (1, 5, 4, 0.35)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (2, 6, 4, 0.524)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (3, 7, 4, 1.27)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (4, 8, 4, 0.62)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (5, 9, 4, 1.27)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (6, 10, 6, 0.72)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (7, 11, 4, 0.25)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (9, 13, 4, 1.27)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (10, 15, 4, 4)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (11, 16, 4, 4)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (12, 18, 4, 1.27)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (13, 19, 5, 1.83)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (14, 20, 5, 0.96)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (15, 21, 5, 1.36)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (16, 23, 5, 2.64)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (17, 24, 5, 2.64)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (18, 25, 5, 2.64)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (19, 26, 4, 0.33)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (20, 27, 4, 0.4)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (21, 28, 4, 0.13)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (22, 30, 4, 0.63)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (23, 31, 5, 1.32)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (24, 32, 5, 0.64)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (25, 33, 5, 0.54)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (26, 34, 4, 1)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (27, 35, 4, 0.25)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (28, 36, 5, 2.56)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (29, 37, 5, 0.49)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (30, 39, 4, 0.9)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (31, 40, 4, 0.524)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (32, 41, 4, 1.27)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (33, 44, 4, 0.524)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (34, 45, 4, 1.613)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (35, 46, 4, 1.613)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (36, 47, 4, 0.9)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (37, 48, 4, 0.52)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (38, 49, 4, 0.574)
INSERT [dbo].[aberturas_vidrios] ([id], [id_abertura], [id_vidrio], [cantidad]) VALUES (39, 50, 4, 0.527)
SET IDENTITY_INSERT [dbo].[aberturas_vidrios] OFF
SET IDENTITY_INSERT [dbo].[accesorios] ON 

INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (1, N'Tornillo                                                                                            ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (2, N'Felpa                                                                                               ', 2)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (3, N'Tope                                                                                                ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (4, N'Bisagra                                                                                             ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (5, N'Cierre central                                                                                      ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (6, N'Cerradura                                                                                           ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (7, N'Manija                                                                                              ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (8, N'Rueda naranja                                                                                       ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (9, N'Antirruido                                                                                          ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (10, N'Burlete                                                                                             ', 2)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (11, N'Cubre desague                                                                                       ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (12, N'Cierre central                                                                                      ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (13, N'Coplanar  brazo blanco veinte cm                                                                    ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (14, N'Coplanar brazo blanco cuarenta cm                                                                   ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (15, N'herrajes                                                                                            ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (16, N'Juego de curvas                                                                                     ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (17, N'Escuadra mosquitero                                                                                 ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (18, N'Patin inferior mosquitero ADR                                                                       ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (19, N'Patin PB Regul Mosquitero                                                                           ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (20, N'Tejido mosquetero                                                                                   ', 2)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (21, N'Bisagra puerta mosquetero                                                                           ', 1)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (22, N'Cordon mosquetero                                                                                   ', 2)
INSERT [dbo].[accesorios] ([id], [nombre], [tipo]) VALUES (23, N'Escuadra banderola                                                                                  ', 1)
SET IDENTITY_INSERT [dbo].[accesorios] OFF
SET IDENTITY_INSERT [dbo].[colores] ON 

INSERT [dbo].[colores] ([id], [descripcion], [porcentaje_peso_adicional]) VALUES (2, N'Blanco                                                                                              ', 10)
INSERT [dbo].[colores] ([id], [descripcion], [porcentaje_peso_adicional]) VALUES (3, N'Natural                                                                                             ', 0)
SET IDENTITY_INSERT [dbo].[colores] OFF
SET IDENTITY_INSERT [dbo].[detalles_accesorios] ON 

INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (6, N'tw9x112p  ', N'Wafer 9 X 1 1/2 zincado                                                                             ', NULL, 1)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (7, N'apt12     ', N'Autoperforante 1/2                                                                                  ', NULL, 1)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (8, N'13079     ', N'Lz - Manija tirador negro                                                                           ', NULL, 7)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (9, N'6032      ', N'D/B zanat liv bce forno                                                                             ', NULL, 7)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (10, N'12002     ', N'Cuña n° 11 vidrio rep con x mtr                                                                     ', NULL, 10)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (11, N'10652     ', N'Barna - H36 lg                                                                                      ', NULL, 10)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (12, N'10454     ', N'7 X 5 eco                                                                                           ', NULL, 2)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (13, N'13123     ', N'J - Tope                                                                                            ', NULL, 3)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (14, N'13514     ', N'H36 - (flh-1) blanco                                                                                ', NULL, 4)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (15, N'101       ', N'Andif 857                                                                                           ', NULL, 6)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (16, N'102       ', N'Andif 855                                                                                           ', NULL, 6)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (17, N'13160     ', N'ROD. CONJ.39 - RODAM. SIMPLE C/RUL Y PIS                                                            ', NULL, 8)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (18, N'13515     ', N'Universal                                                                                           ', NULL, 9)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (19, N'10329     ', N'N°5100 Blaco                                                                                        ', NULL, 11)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (20, N'10301     ', N'1042-R (negro)                                                                                      ', NULL, 5)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (21, N'M0303     ', N'Plastico                                                                                            ', NULL, 5)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (22, N'13656     ', N'20cm                                                                                                ', NULL, 13)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (23, N'13730     ', N'40cm                                                                                                ', NULL, 14)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (24, N'-------   ', N'BISAGRAS Y GUIAS                                                                                    ', NULL, 15)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (25, N'-------   ', N'CURVA 075                                                                                           ', NULL, 16)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (26, N'13124     ', N'Escuadra B                                                                                          ', NULL, 17)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (27, N'13574     ', N'PATIN MOSQ                                                                                          ', NULL, 18)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (28, N'13575     ', N'PATIN MOSQ                                                                                          ', NULL, 19)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (29, N'4190      ', N'Tejido mosquetero aluminio williams 0,80                                                            ', NULL, 20)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (30, N'10146     ', N'Bisagra mosquera blanca                                                                             ', NULL, 21)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (31, N'11995     ', N'Cordon mosquetero 5,5mm                                                                             ', NULL, 22)
INSERT [dbo].[detalles_accesorios] ([id], [codigo], [descripcion], [valor], [id_accesorio]) VALUES (32, N'M3140     ', N'Parte C-Escuadra banderola                                                                          ', NULL, 23)
SET IDENTITY_INSERT [dbo].[detalles_accesorios] OFF
SET IDENTITY_INSERT [dbo].[historial_parametros] ON 

INSERT [dbo].[historial_parametros] ([id], [valor], [fecha], [id_parametro]) VALUES (6, 143.83, CAST(N'2016-01-12' AS Date), 1)
INSERT [dbo].[historial_parametros] ([id], [valor], [fecha], [id_parametro]) VALUES (7, 133.83, CAST(N'2016-01-20' AS Date), 1)
INSERT [dbo].[historial_parametros] ([id], [valor], [fecha], [id_parametro]) VALUES (8, 137, CAST(N'2016-02-01' AS Date), 1)
INSERT [dbo].[historial_parametros] ([id], [valor], [fecha], [id_parametro]) VALUES (9, 150, CAST(N'2016-02-16' AS Date), 1)
INSERT [dbo].[historial_parametros] ([id], [valor], [fecha], [id_parametro]) VALUES (10, 147, CAST(N'2016-02-18' AS Date), 1)
INSERT [dbo].[historial_parametros] ([id], [valor], [fecha], [id_parametro]) VALUES (11, 132.3, CAST(N'2016-02-20' AS Date), 1)
SET IDENTITY_INSERT [dbo].[historial_parametros] OFF
SET IDENTITY_INSERT [dbo].[historial_precio_accesorios] ON 

INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (5, 0.75, CAST(N'2016-01-12' AS Date), 6)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (6, 0.35, CAST(N'2016-01-12' AS Date), 7)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (7, 6.12, CAST(N'2016-01-12' AS Date), 8)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (8, 166.99, CAST(N'2016-01-12' AS Date), 9)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (9, 2.83, CAST(N'2016-01-12' AS Date), 10)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (10, 11.47, CAST(N'2016-01-12' AS Date), 11)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (11, 1.46, CAST(N'2016-01-12' AS Date), 12)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (12, 0.11, CAST(N'2016-01-12' AS Date), 13)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (13, 18.76, CAST(N'2016-01-12' AS Date), 14)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (14, 186.4, CAST(N'2016-01-12' AS Date), 15)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (15, 186.4, CAST(N'2016-01-12' AS Date), 16)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (16, 14.62, CAST(N'2016-01-12' AS Date), 17)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (17, 0.18, CAST(N'2016-01-12' AS Date), 18)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (18, 1.21, CAST(N'2016-01-12' AS Date), 19)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (19, 39.4, CAST(N'2016-01-12' AS Date), 20)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (20, 48.78, CAST(N'2016-01-20' AS Date), 22)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (21, 53.11, CAST(N'2016-01-20' AS Date), 23)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (22, 15.02, CAST(N'2016-01-20' AS Date), 21)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (23, 2498, CAST(N'2016-01-21' AS Date), 24)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (24, 580, CAST(N'2016-01-21' AS Date), 25)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (25, 1.75, CAST(N'2016-01-21' AS Date), 26)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (26, 0.25, CAST(N'2016-01-21' AS Date), 27)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (27, 0.25, CAST(N'2016-01-21' AS Date), 28)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (28, 7.78, CAST(N'2016-01-21' AS Date), 17)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (29, 124.75, CAST(N'2016-01-26' AS Date), 29)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (30, 18.47, CAST(N'2016-01-26' AS Date), 30)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (31, 0.96, CAST(N'2016-01-26' AS Date), 31)
INSERT [dbo].[historial_precio_accesorios] ([id], [valor], [fecha], [id_detalle_accesorio]) VALUES (32, 4.6, CAST(N'2016-01-26' AS Date), 32)
SET IDENTITY_INSERT [dbo].[historial_precio_accesorios] OFF
SET IDENTITY_INSERT [dbo].[historial_precios_vidrios] ON 

INSERT [dbo].[historial_precios_vidrios] ([id], [valor], [fecha], [id_vidrio]) VALUES (2, 160, CAST(N'2016-01-12' AS Date), 4)
INSERT [dbo].[historial_precios_vidrios] ([id], [valor], [fecha], [id_vidrio]) VALUES (3, 180, CAST(N'2016-01-12' AS Date), 5)
INSERT [dbo].[historial_precios_vidrios] ([id], [valor], [fecha], [id_vidrio]) VALUES (4, 180, CAST(N'2016-01-12' AS Date), 6)
SET IDENTITY_INSERT [dbo].[historial_precios_vidrios] OFF
SET IDENTITY_INSERT [dbo].[parametros] ON 

INSERT [dbo].[parametros] ([id], [descripcion]) VALUES (1, N'KilogramoAluminio')
INSERT [dbo].[parametros] ([id], [descripcion]) VALUES (2, N'PorcentajeGanancias')
SET IDENTITY_INSERT [dbo].[parametros] OFF
SET IDENTITY_INSERT [dbo].[perfiles] ON 

INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (3, N'3005/01   ', N'Marco ventana corrediza                                                                             ', 726, 6.15, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (4, N'3005/02   ', N' Zocalo y cabezal ventana corrediza                                                                 ', 416, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (5, N'3005/03   ', N' Parante lateral ventana corredisa                                                                  ', 462, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (6, N'3005/04   ', N' Parante central ventana corrediza                                                                  ', 419, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (7, N'3005/01R  ', N' Marco Ventana corrediza                                                                            ', 752, 6.15, 3)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (8, N'3005/02R  ', N' Zocalo y cabezal ventana corediza                                                                  ', 456, 6.05, 3)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (9, N'3005/03R  ', N' Parante lateral ventana corrediza                                                                  ', 474, 6.05, 3)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (10, N'3005/04R  ', N' Parante central ventana corrediza                                                                  ', 457, 6.05, 3)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (11, N'3005/05   ', N' Mosquitero                                                                                         ', 328, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (12, N'3005/33   ', N' Revestimiento tubular                                                                              ', 997, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (13, N'3005/69   ', N' Perfil unión 75 mm                                                                                 ', 419, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (14, N'3005/81   ', N' Revestimiento doble faz                                                                            ', 595, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (15, N'3005/36   ', N' Marco puerta 36                                                                                    ', 655, 6.2, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (16, N'3005/09   ', N' Parante puerta                                                                                     ', 891, 6.15, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (17, N'3005/37   ', N' Zocalo y travesaño inferior puerta 36                                                              ', 952, 6.2, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (18, N'3005/06   ', N' Paño fijo                                                                                          ', 559, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (19, N'3005/07   ', N' Contravidrio                                                                                       ', 161, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (20, N'3005/94   ', N' Travesaño paño fijo                                                                                ', 1037, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (21, N'3005/16   ', N' Marco banderola proyectante                                                                        ', 729, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (22, N'3005/90   ', N' Travesaño de mosquitero                                                                            ', 543, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (23, N'3005/15   ', N' Bisagra                                                                                            ', 344, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (24, N'3005/18   ', N' Hoja proyectante                                                                                   ', 547, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (25, N'3005/85   ', N' Columna de acople                                                                                  ', 1353, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (26, N'3005/00   ', N' Escuadra                                                                                           ', 535, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (27, N'3005/26   ', N' Bastidor vidrio repartido                                                                          ', 243, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (28, N'3005/25   ', N' Travesaño vdrio repartido                                                                          ', 359, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (29, N'3005/26   ', N' Bastidor vidrio repartido                                                                          ', 243, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (30, N'3005/40   ', N' Doble contacto                                                                                     ', 289, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (31, N'3005/20   ', N' Guia p/cortina                                                                                     ', 428, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (32, N'3005/86   ', N' Acople de esquina                                                                                  ', 1.196, 6.05, 5)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (33, N'3015/24   ', N' Guía cortina                                                                                       ', 316, 6.15, 2)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (34, N'3005/39   ', N' Marco puerta                                                                                       ', 713, 6.15, 3)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (35, N'3005/42   ', N' Parante                                                                                            ', 1102, 6.15, 3)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (36, N'3005/41   ', N' Travesaños                                                                                         ', 1018, 6, 3)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (37, N'3005/88   ', N' Contravidrio                                                                                       ', 132, 6, 3)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (38, N'3015/01   ', N' Marco ventana corrediza                                                                            ', 592, 6.15, 2)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (39, N'3015/02   ', N' Zócalo y cabezal ventana corrediza                                                                 ', 383, 6.15, 2)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (40, N'3015/03   ', N' Parante ventana corrediza                                                                          ', 398, 6.15, 2)
INSERT [dbo].[perfiles] ([id], [codigo], [descripcion], [gramo_por_metro], [longitud_maxima], [id_tipo]) VALUES (41, N'3015/04   ', N' Parante central ventana corrediza                                                                  ', 377, 6.15, 2)
SET IDENTITY_INSERT [dbo].[perfiles] OFF
SET IDENTITY_INSERT [dbo].[tipos_perfiles] ON 

INSERT [dbo].[tipos_perfiles] ([id], [descripcion]) VALUES (2, N'Liviano                                                                                             ')
INSERT [dbo].[tipos_perfiles] ([id], [descripcion]) VALUES (3, N'Reforzado                                                                                           ')
INSERT [dbo].[tipos_perfiles] ([id], [descripcion]) VALUES (5, N'Pesado                                                                                              ')
SET IDENTITY_INSERT [dbo].[tipos_perfiles] OFF
SET IDENTITY_INSERT [dbo].[vidrios] ON 

INSERT [dbo].[vidrios] ([id], [nombre], [espesor]) VALUES (4, N'Comun                                                       ', 3)
INSERT [dbo].[vidrios] ([id], [nombre], [espesor]) VALUES (5, N'Comun                                                       ', 4)
INSERT [dbo].[vidrios] ([id], [nombre], [espesor]) VALUES (6, N'Fantasia                                                    ', 3)
SET IDENTITY_INSERT [dbo].[vidrios] OFF
ALTER TABLE [dbo].[aberturas_accesorios]  WITH CHECK ADD  CONSTRAINT [FK_aberturas_accesorios_aberturas] FOREIGN KEY([id_abertura])
REFERENCES [dbo].[aberturas] ([id])
GO
ALTER TABLE [dbo].[aberturas_accesorios] CHECK CONSTRAINT [FK_aberturas_accesorios_aberturas]
GO
ALTER TABLE [dbo].[aberturas_accesorios]  WITH CHECK ADD  CONSTRAINT [FK_aberturas_accesorios_detalles_accesorios] FOREIGN KEY([id_detalle_accesorio])
REFERENCES [dbo].[detalles_accesorios] ([id])
GO
ALTER TABLE [dbo].[aberturas_accesorios] CHECK CONSTRAINT [FK_aberturas_accesorios_detalles_accesorios]
GO
ALTER TABLE [dbo].[aberturas_perfiles]  WITH CHECK ADD  CONSTRAINT [FK_aberturas_perfiles_aberturas] FOREIGN KEY([id_abertura])
REFERENCES [dbo].[aberturas] ([id])
GO
ALTER TABLE [dbo].[aberturas_perfiles] CHECK CONSTRAINT [FK_aberturas_perfiles_aberturas]
GO
ALTER TABLE [dbo].[aberturas_perfiles]  WITH CHECK ADD  CONSTRAINT [FK_aberturas_perfiles_colores] FOREIGN KEY([id_color])
REFERENCES [dbo].[colores] ([id])
GO
ALTER TABLE [dbo].[aberturas_perfiles] CHECK CONSTRAINT [FK_aberturas_perfiles_colores]
GO
ALTER TABLE [dbo].[aberturas_perfiles]  WITH CHECK ADD  CONSTRAINT [FK_aberturas_perfiles_perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[perfiles] ([id])
GO
ALTER TABLE [dbo].[aberturas_perfiles] CHECK CONSTRAINT [FK_aberturas_perfiles_perfiles]
GO
ALTER TABLE [dbo].[aberturas_vidrios]  WITH CHECK ADD  CONSTRAINT [FK_aberturas_vidrios_aberturas] FOREIGN KEY([id_abertura])
REFERENCES [dbo].[aberturas] ([id])
GO
ALTER TABLE [dbo].[aberturas_vidrios] CHECK CONSTRAINT [FK_aberturas_vidrios_aberturas]
GO
ALTER TABLE [dbo].[aberturas_vidrios]  WITH CHECK ADD  CONSTRAINT [FK_aberturas_vidrios_vidrios] FOREIGN KEY([id_vidrio])
REFERENCES [dbo].[vidrios] ([id])
GO
ALTER TABLE [dbo].[aberturas_vidrios] CHECK CONSTRAINT [FK_aberturas_vidrios_vidrios]
GO
ALTER TABLE [dbo].[detalles_accesorios]  WITH CHECK ADD  CONSTRAINT [FK_detalles_accesorios_accesorios] FOREIGN KEY([id_accesorio])
REFERENCES [dbo].[accesorios] ([id])
GO
ALTER TABLE [dbo].[detalles_accesorios] CHECK CONSTRAINT [FK_detalles_accesorios_accesorios]
GO
ALTER TABLE [dbo].[historial_parametros]  WITH CHECK ADD  CONSTRAINT [FK_historial_parametros_parametros] FOREIGN KEY([id_parametro])
REFERENCES [dbo].[parametros] ([id])
GO
ALTER TABLE [dbo].[historial_parametros] CHECK CONSTRAINT [FK_historial_parametros_parametros]
GO
ALTER TABLE [dbo].[historial_precio_accesorios]  WITH CHECK ADD  CONSTRAINT [FK_historial_precio_accesorios_detalles_accesorios] FOREIGN KEY([id_detalle_accesorio])
REFERENCES [dbo].[detalles_accesorios] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[historial_precio_accesorios] CHECK CONSTRAINT [FK_historial_precio_accesorios_detalles_accesorios]
GO
ALTER TABLE [dbo].[historial_precios_vidrios]  WITH CHECK ADD  CONSTRAINT [FK_historial_precios_vidrios_vidrios] FOREIGN KEY([id_vidrio])
REFERENCES [dbo].[vidrios] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[historial_precios_vidrios] CHECK CONSTRAINT [FK_historial_precios_vidrios_vidrios]
GO
USE [master]
GO
ALTER DATABASE [FabricaAberturas] SET  READ_WRITE 
GO
