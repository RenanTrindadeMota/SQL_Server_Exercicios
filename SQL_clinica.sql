USE Clinica_Morvan_Odonto

-- TABELA DOS M�DICOS:
CREATE TABLE M�dico (
	CRM INT PRIMARY KEY,
	NomeCompleto VARCHAR(100)
)

-- adicionando chaves que se tornar�o estrangeiras para a tabela m�dico:
ALTER TABLE M�dico
ADD ID_Funcion�rios INT

ALTER TABLE M�dico
ADD ID_Especialidade VARCHAR(5)


-- adicionando chaves estrangeiras para a tabela m�dico:
ALTER TABLE M�dico
ADD CONSTRAINT FK_ID_Funcion�rio FOREIGN KEY (ID_Funcion�rios)
REFERENCES Funcion�rios(ID_Funcion�rios);

ALTER TABLE M�dico
ADD CONSTRAINT FK_ID_Especialidade FOREIGN KEY (ID_Especialidade)
REFERENCES Especialidade(ID_Especialidade);


-- alterando nome de uma coluna para a tabela m�dico:
-- EXEC sp_rename 'NomeTabela.NomeColunaAntigo', 'NomeColunaNovo', 'COLUMN';

EXEC sp_rename 'M�dico.NomeCompleto', 'NomeM�dico', 'COLUMN';


-- TABELA DOS FUNCION�RIOS:
CREATE TABLE Funcion�rios (
	ID_Funcion�rios INT PRIMARY KEY,
	Nome VARCHAR(20),
	Sobrenome VARCHAR(80),
	Idade INT,
	G�nero BIT,
	CPF VARCHAR(11),
	[Status] BIT,
	DataContrata��o DATETIME,
	DataDemiss�o DATETIME,
	Telefone VARCHAR(11),
	Email VARCHAR(50),
	ContatoEmergencia VARCHAR(11),
	ContatoNomeEmergencia VARCHAR(80)
)

-- alterando nome de 4 colunas:
EXEC sp_rename 'Funcion�rios.Nome', 'NomeFuncion�rio', 'COLUMN';
EXEC sp_rename 'Funcion�rios.Sobrenome', 'SobrenomeFuncion�rio', 'COLUMN';
EXEC sp_rename 'Funcion�rios.Idade', 'IdadeFuncion�rio', 'COLUMN';
EXEC sp_rename 'Funcion�rios.G�nero', 'G�neroFuncion�rio', 'COLUMN';


-- TABELA DOS PACIENTES:
CREATE TABLE Paciente (
	ID_Paciente INT PRIMARY KEY,
	Nome VARCHAR(20),
	Sobrenome VARCHAR(80),
	Idade INT,
	G�nero BIT,
	CPF VARCHAR(11),
	RG VARCHAR(11)
)

-- alterando nome de 4 colunas:
EXEC sp_rename 'Paciente.Nome', 'NomePaciente', 'COLUMN';
EXEC sp_rename 'Paciente.Sobrenome', 'SobrenomePaciente', 'COLUMN';
EXEC sp_rename 'Paciente.Idade', 'IdadePaciente', 'COLUMN';
EXEC sp_rename 'Paciente.G�nero', 'G�neroPaciente', 'COLUMN';


CREATE TABLE Especialidade (
	ID_Especialidade VARCHAR(5) PRIMARY KEY,
	Especialidade VARCHAR(50),
	Forma��o VARCHAR(80)
)

CREATE TABLE Tratamento (
	ID_Tratamento INT PRIMARY KEY,
	Tratamento VARCHAR(50),
	Valor FLOAT
)

CREATE TABLE Consulta (
	ID_Consulta INT PRIMARY KEY,
	DataAtendimento DATETIME
)

CREATE TABLE Diagnostico (
	ID_Diagnostico INT PRIMARY KEY
)

