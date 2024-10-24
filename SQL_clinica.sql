USE Clinica_Morvan_Odonto

-- TABELA DOS MÉDICOS:
CREATE TABLE Médico (
	CRM INT PRIMARY KEY,
	NomeCompleto VARCHAR(100)
)

-- adicionando chaves que se tornarão estrangeiras para a tabela médico:
ALTER TABLE Médico
ADD ID_Funcionários INT

ALTER TABLE Médico
ADD ID_Especialidade VARCHAR(5)


-- adicionando chaves estrangeiras para a tabela médico:
ALTER TABLE Médico
ADD CONSTRAINT FK_ID_Funcionário FOREIGN KEY (ID_Funcionários)
REFERENCES Funcionários(ID_Funcionários);

ALTER TABLE Médico
ADD CONSTRAINT FK_ID_Especialidade FOREIGN KEY (ID_Especialidade)
REFERENCES Especialidade(ID_Especialidade);


-- alterando nome de uma coluna para a tabela médico:
-- EXEC sp_rename 'NomeTabela.NomeColunaAntigo', 'NomeColunaNovo', 'COLUMN';

EXEC sp_rename 'Médico.NomeCompleto', 'NomeMédico', 'COLUMN';


-- TABELA DOS FUNCIONÁRIOS:
CREATE TABLE Funcionários (
	ID_Funcionários INT PRIMARY KEY,
	Nome VARCHAR(20),
	Sobrenome VARCHAR(80),
	Idade INT,
	Gênero BIT,
	CPF VARCHAR(11),
	[Status] BIT,
	DataContratação DATETIME,
	DataDemissão DATETIME,
	Telefone VARCHAR(11),
	Email VARCHAR(50),
	ContatoEmergencia VARCHAR(11),
	ContatoNomeEmergencia VARCHAR(80)
)

-- alterando nome de 4 colunas:
EXEC sp_rename 'Funcionários.Nome', 'NomeFuncionário', 'COLUMN';
EXEC sp_rename 'Funcionários.Sobrenome', 'SobrenomeFuncionário', 'COLUMN';
EXEC sp_rename 'Funcionários.Idade', 'IdadeFuncionário', 'COLUMN';
EXEC sp_rename 'Funcionários.Gênero', 'GêneroFuncionário', 'COLUMN';


-- TABELA DOS PACIENTES:
CREATE TABLE Paciente (
	ID_Paciente INT PRIMARY KEY,
	Nome VARCHAR(20),
	Sobrenome VARCHAR(80),
	Idade INT,
	Gênero BIT,
	CPF VARCHAR(11),
	RG VARCHAR(11)
)

-- alterando nome de 4 colunas:
EXEC sp_rename 'Paciente.Nome', 'NomePaciente', 'COLUMN';
EXEC sp_rename 'Paciente.Sobrenome', 'SobrenomePaciente', 'COLUMN';
EXEC sp_rename 'Paciente.Idade', 'IdadePaciente', 'COLUMN';
EXEC sp_rename 'Paciente.Gênero', 'GêneroPaciente', 'COLUMN';


CREATE TABLE Especialidade (
	ID_Especialidade VARCHAR(5) PRIMARY KEY,
	Especialidade VARCHAR(50),
	Formação VARCHAR(80)
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

