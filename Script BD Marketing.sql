USE [master]
GO
/****** Object:  User [marketing]    Script Date: 27/12/2021 08:55:13 PM ******/
CREATE DATABASE Marketing;
GO
/****** Object:  User [marketing]    Script Date: 29/04/2016 11:26:49 PM ******/
CREATE USER [marketing] FOR LOGIN [marketing] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [marketing]
GO
/****** Object:  Table [dbo].[ClientesPotenciales]    Script Date: 29/04/2016 11:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientesPotenciales](
	[ID] [int] NOT NULL CONSTRAINT [DF_ClientesPotenciales_ID]  DEFAULT ((100)),
	[Nombre] [nvarchar](100) NULL,
	[Apellido] [nvarchar](100) NULL,
	[Correo] [nvarchar](200) NULL,
	[Edad] [int] NULL,
 CONSTRAINT [PK_ClientesPotenciales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CriteriosBusqueda]    Script Date: 29/04/2016 11:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CriteriosBusqueda](
	[ID] [int] NOT NULL CONSTRAINT [DF_CriteriosBusqueda_ID]  DEFAULT ((1)),
	[Criterio] [varchar](50) NULL,
 CONSTRAINT [PK_CriteriosBusqueda] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (100, N'Pedro', N'Pérez', N'pperez@gmail.com', 35)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (101, N'Dennys', N'Reyes', N'dennysreyes2@outlook.com', 49)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (102, N'Cristina', N'Arroyo', N'cristina206@gmail.com', 20)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (103, N'Luis', N'Pichardo', N'luizignacio03@outlook.com', 45)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (104, N'Tom', N'Simon', N'tomsimon50@outlook.com', 62)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (105, N'Beatriz', N'Monasterios', N'bea.monasterios@gmail.com', 34)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (106, N'Federico', N'Paderni', N'federico_paderni@gmail.com', 40)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (107, N'Jairy', N'Vergara', N'jvergara57@outlook.com', 21)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (108, N'Jon', N'McAbe', N'jmcb@gmail.com', 18)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (109, N'José', N'Redondo', N'jose.redondo@outlook.com', 48)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (110, N'Daniel', N'González', N'daniel_gonzalez_2012@gmail.com', 40)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (111, N'Manuel Enrique', N'Reyes', N'desksnowie@gmail.com', 39)
INSERT [dbo].[ClientesPotenciales] ([ID], [Nombre], [Apellido], [Correo], [Edad]) VALUES (112, N'Andrés', N'Cedeño', N'andrescedeno@hotmail.com', 12)
INSERT [dbo].[CriteriosBusqueda] ([ID], [Criterio]) VALUES (1, N'ID')
INSERT [dbo].[CriteriosBusqueda] ([ID], [Criterio]) VALUES (2, N'Nombre')
INSERT [dbo].[CriteriosBusqueda] ([ID], [Criterio]) VALUES (3, N'Apellido')
INSERT [dbo].[CriteriosBusqueda] ([ID], [Criterio]) VALUES (4, N'Correo')
INSERT [dbo].[CriteriosBusqueda] ([ID], [Criterio]) VALUES (5, N'Edad')
/****** Object:  StoredProcedure [dbo].[spActualizarClientePotencial]    Script Date: 29/04/2016 11:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Autor: Ing. Manuel Enrique Reyes (MCP/MCPD)
-- Fecha creación: 27/04/2016
-- Descripción:	Actualiza los datos de un Cliente 
--				Potencial.
-- =================================================
CREATE PROCEDURE [dbo].[spActualizarClientePotencial]
	@ID INT,
	@Nombre NVARCHAR(100),
	@Apellido NVARCHAR(100),
	@Correo NVARCHAR(200),
	@Edad INT
AS
BEGIN
	UPDATE DBO.ClientesPotenciales SET
		Nombre = @Nombre,
		Apellido = @Apellido,
		Correo = @Correo,
		Edad = @Edad
	WHERE ID = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[spBorrarClientePotencial]    Script Date: 29/04/2016 11:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Autor: Ing. Manuel Enrique Reyes (MCP/MCPD)
-- Fecha creación: 27/04/2016
-- Descripción:	Borra a un Cliente Potencial.
-- =================================================
CREATE PROCEDURE [dbo].[spBorrarClientePotencial]
	@ID INT
AS
BEGIN
	DELETE FROM DBO.ClientesPotenciales 
	WHERE ID = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[spBuscarClientesPotenciales]    Script Date: 29/04/2016 11:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Autor: Ing. Manuel Enrique Reyes (MCP/MCPD)
-- Fecha creación: 27/04/2016
-- Descripción:	Busca a Clientes Potenciales por:
--				1) ID
--				2) Nombre
--				3) Apellido
--				4) Correo
--				5) Edad
-- =================================================
CREATE PROCEDURE [dbo].[spBuscarClientesPotenciales]
	@Criterio NVARCHAR(200),
	@Valor NVARCHAR(10)
AS
BEGIN
	IF @Criterio = 'ID'
		SELECT ID, Nombre, Apellido, Correo, Edad
		FROM DBO.ClientesPotenciales
		WHERE ID = @Valor
		ORDER BY ID ASC
	IF @Criterio = 'Nombre'
		SELECT ID, Nombre, Apellido, Correo, Edad
		FROM DBO.ClientesPotenciales
		WHERE Nombre LIKE '%' + @Valor + '%'
		ORDER BY ID ASC
	IF @Criterio = 'Apellido'
		SELECT ID, Nombre, Apellido, Correo, Edad
		FROM DBO.ClientesPotenciales
		WHERE Apellido LIKE '%' + @Valor + '%'
		ORDER BY ID ASC
	IF @Criterio = 'Correo'
		SELECT ID, Nombre, Apellido, Correo, Edad
		FROM DBO.ClientesPotenciales
		WHERE Correo LIKE '%' + @Valor + '%'
		ORDER BY ID ASC
	IF @Criterio = 'Edad'
		SELECT ID, Nombre, Apellido, Correo, Edad
		FROM DBO.ClientesPotenciales
		WHERE Edad = @Valor
		ORDER BY ID ASC
END

GO
/****** Object:  StoredProcedure [dbo].[spCrearClientePotencial]    Script Date: 29/04/2016 11:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Autor: Ing. Manuel Enrique Reyes (MCP/MCPD)
-- Fecha creación: 27/04/2016
-- Descripción:	Crea los datos de un Cliente 
--				Potencial.
-- =================================================
CREATE PROCEDURE [dbo].[spCrearClientePotencial]
	@ID INT,
	@Nombre NVARCHAR(100),
	@Apellido NVARCHAR(100),
	@Correo NVARCHAR(200),
	@Edad INT
AS
BEGIN
	INSERT INTO ClientesPotenciales (ID, Nombre, Apellido, Correo, Edad)
	VALUES (@ID, @Nombre, @Apellido, @Correo, @Edad)
END

GO
/****** Object:  StoredProcedure [dbo].[spCrearSiguienteID]    Script Date: 29/04/2016 11:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================
-- Autor: Ing. Manuel Enrique Reyes (MCP/MCPD)
-- Fecha creación: 28/04/2016
-- Descripción:	Lista todos los Criterios de Búsqueda.
-- ====================================================
CREATE PROCEDURE [dbo].[spCrearSiguienteID]
AS
BEGIN
	SELECT MAX(ID) + 1 AS SiguienteID
	FROM DBO.ClientesPotenciales
END

GO
/****** Object:  StoredProcedure [dbo].[spListarClientesPotenciales]    Script Date: 29/04/2016 11:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================
-- Autor: Ing. Manuel Enrique Reyes (MCP/MCPD)
-- Fecha creación: 27/04/2016
-- Descripción:	Lista todos los Clientes Potenciales
--				para el Departamento de Marketing.
-- =================================================
CREATE PROCEDURE [dbo].[spListarClientesPotenciales]
AS
BEGIN
	SELECT ID, Nombre, Apellido, Correo, Edad
	FROM DBO.ClientesPotenciales
	ORDER BY ID ASC
END

GO
/****** Object:  StoredProcedure [dbo].[spListarCriteriosBusqueda]    Script Date: 29/04/2016 11:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================
-- Autor: Ing. Manuel Enrique Reyes (MCP/MCPD)
-- Fecha creación: 27/04/2016
-- Descripción:	Lista todos los Criterios de Búsqueda.
-- ====================================================
CREATE PROCEDURE [dbo].[spListarCriteriosBusqueda]
AS
BEGIN
	SELECT ID, Criterio
	FROM DBO.CriteriosBusqueda
	ORDER BY ID ASC
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del Cliente Potencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ClientesPotenciales', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Cliente Potencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ClientesPotenciales', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellido del Cliente Potencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ClientesPotenciales', @level2type=N'COLUMN',@level2name=N'Apellido'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Correo del Cliente Potencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ClientesPotenciales', @level2type=N'COLUMN',@level2name=N'Correo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Edad del Cliente Potencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ClientesPotenciales', @level2type=N'COLUMN',@level2name=N'Edad'
GO
