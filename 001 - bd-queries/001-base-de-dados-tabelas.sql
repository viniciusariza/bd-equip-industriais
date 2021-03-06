CREATE DATABASE db_manutencaoei
GO
USE [db_manutencaoei]
GO

CREATE TABLE [dbo].[tb_unidade](
	[id_unidade] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[login_unidade] [varchar](30) NOT NULL,
	[senha_unidade] [varchar](12) NOT NULL,
	[nome_unidade] [varchar](80) NOT NULL,
	[morada_unidade] [varchar](100) NOT NULL,
	[status_unidade] [bit] NOT NULL,
	[data_cadastro] [date] NOT NULL)
GO

CREATE TABLE [dbo].[tb_cliente](
	[id_cliente] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[nome_cliente] [varchar](80) NOT NULL,
	[telefone_cliente] [varchar](9) NOT NULL,
	[morada_cliente] [varchar](100) NOT NULL,
	[doc_cliente] [varchar](11) NOT NULL)
GO

CREATE TABLE [dbo].[tb_funcionario](
	[id_funcionario] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[nome_funcionario] [varchar](80) NOT NULL,
	[telefone_funcionario] [varchar](9) NOT NULL,
	[morada_funcionario] [varchar](100) NOT NULL,
	[doc_funcionario] [varchar](11) NOT NULL,
	[situacao_funcionario] [bit] NOT NULL,
	[id_unidade] [int] NOT NULL)
GO

CREATE TABLE [dbo].[tb_marca](
	[id_marca] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[nome_marca] [varchar](80) NOT NULL)
GO

CREATE TABLE [dbo].[tb_modelo](
	[id_modelo] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[nome_modelo] [varchar](80) NOT NULL,
	[id_marca] [int] NOT NULL)
GO
 
CREATE TABLE [dbo].[tb_equipamento](
	[id_equipamento] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[cor_equipamento] [varchar](30) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_modelo] [int] NOT NULL)
GO

CREATE TABLE [dbo].[tb_servico](
	[id_servico] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[nome_servico] [varchar](100) NOT NULL)
GO

CREATE TABLE [dbo].[tb_atendimento](
	[id_atendimento] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[data_entrada] date  NOT NULL,
	[data_atendimento] [date] NULL,
	[id_cliente] [int] NOT NULL,
	[id_equipamento] [int] NOT NULL,
	[id_unidade] [int] NOT NULL)
GO

CREATE TABLE [dbo].[tb_item_atendimento](
	[id_item] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[valor_item] [decimal](10, 2) NOT NULL,
	[id_servico] [int] NOT NULL,
	[id_funcionario] [int] NOT NULL,
	[id_atendimento] [int] NOT NULL)
GO

ALTER TABLE [dbo].[tb_funcionario]  WITH CHECK ADD  CONSTRAINT [tb_funcionario_tb_unidade] FOREIGN KEY([id_unidade])
REFERENCES [dbo].[tb_unidade] ([id_unidade])
GO

ALTER TABLE [dbo].[tb_modelo]  WITH CHECK ADD  CONSTRAINT [tb_modelo_tb_marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[tb_marca] ([id_marca])
GO

ALTER TABLE [dbo].[tb_equipamento]  WITH CHECK ADD  CONSTRAINT [tb_equipamento_tb_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[tb_cliente] ([id_cliente])
GO

ALTER TABLE [dbo].[tb_equipamento]  WITH CHECK ADD  CONSTRAINT [tb_equipamento_tb_modelo] FOREIGN KEY([id_modelo])
REFERENCES [dbo].[tb_modelo] ([id_modelo])
GO

ALTER TABLE [dbo].[tb_atendimento]  WITH CHECK ADD  CONSTRAINT [tb_atendimento_tb_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[tb_cliente] ([id_cliente])
GO

ALTER TABLE [dbo].[tb_atendimento]  WITH CHECK ADD  CONSTRAINT [tb_atendimento_tb_equipamento] FOREIGN KEY([id_equipamento])
REFERENCES [dbo].[tb_equipamento] ([id_equipamento])
GO

ALTER TABLE [dbo].[tb_atendimento]  WITH CHECK ADD  CONSTRAINT [tb_atendimento_tb_unidade] FOREIGN KEY([id_unidade])
REFERENCES [dbo].[tb_unidade] ([id_unidade])
GO

ALTER TABLE [dbo].[tb_item_atendimento]  WITH CHECK ADD  CONSTRAINT [tb_item_atendimento_tb_atendimento] FOREIGN KEY([id_atendimento])
REFERENCES [dbo].[tb_atendimento] ([id_atendimento])
GO

ALTER TABLE [dbo].[tb_item_atendimento]  WITH CHECK ADD  CONSTRAINT [tb_item_atendimento_tb_funcionario] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[tb_funcionario] ([id_funcionario])
GO

ALTER TABLE [dbo].[tb_item_atendimento]  WITH CHECK ADD  CONSTRAINT [tb_item_atendimento_tb_servico] FOREIGN KEY([id_servico])
REFERENCES [dbo].[tb_servico] ([id_servico])
GO