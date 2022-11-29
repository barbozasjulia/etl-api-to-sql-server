CREATE DATABASE StarWars;
GO

USE StarWars;
GO

CREATE TABLE Planetas(
	IdPlaneta int NOT NULL,
	Nome varchar(50) NOT NULL,
	Rotacao float NOT NULL,
	Orbita float NOT NULL,
	Diametro float NOT NULL, 
	Clima varchar(50) NOT NULL,
	Populacao bigint NOT NULL
);
GO
ALTER TABLE Planetas ADD CONSTRAINT PK_Planetas PRIMARY KEY (IdPlaneta);
GO

CREATE TABLE Pilotos(
	IdPiloto int NOT NULL,
	Nome varchar(200) NOT NULL,
	AnoNascimento varchar(10) NOT NULL,
	IdPlaneta int NOT NULL
)
GO
ALTER TABLE Pilotos ADD CONSTRAINT PK_Pilotos PRIMARY KEY (IdPiloto);
GO
ALTER TABLE	Pilotos ADD CONSTRAINT FK_Pilotos_Planetas FOREIGN KEY (IdPlaneta) REFERENCES Planetas (IdPlaneta);
GO

CREATE TABLE Naves(
	IdNave int NOT NULL,
	Nome varchar(100) NOT NULL,
	Modelo varchar(150) NOT NULL,
	Passageiro int NOT NULL,
	Carga float NOT NULL,
	Classe varchar(100) NOT NULL
);
GO
ALTER TABLE Naves ADD CONSTRAINT PK_Naves PRIMARY KEY(IdNave);
GO

CREATE TABLE Pilotos_Naves(
	IdPiloto int NOT NULL,
	IdNave int NOT NULL,
	FlagAutorizacao bit NOT NULL
);
GO
ALTER TABLE Pilotos_Naves ADD CONSTRAINT PK_Pilotos_Naves PRIMARY KEY (IdPiloto, IdNave);
GO
ALTER TABLE Pilotos_Naves ADD CONSTRAINT FK_Pilotos FOREIGN KEY (IdPiloto) REFERENCES Pilotos (IdPiloto);
GO
ALTER TABLE Pilotos_Naves ADD CONSTRAINT FK_Naves FOREIGN KEY (IdNave) REFERENCES Naves (IdNave);
GO
ALTER TABLE Pilotos_Naves ADD CONSTRAINT DF_FlagAutorizada DEFAULT(1) FOR FlagAutorizacao;

CREATE TABLE Historico_Viagens(
	IdNave int NOT NULL,
	IdPiloto int NOT NULL,
	DtSaida datetime NOT NULL,
	DtChegada datetime NULL
);
GO
ALTER TABLE Historico_Viagens ADD CONSTRAINT FK_HistoricoViagens_PilotosNaves FOREIGN KEY (IdPiloto, IdNave) REFERENCES Pilotos_Naves (IdPiloto, IdNave);
GO
ALTER TABLE Historico_Viagens CHECK CONSTRAINT FK_HistoricoViagens_PilotosNaves;