CREATE TABLE departamento (
	codigo_departamento SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	telefone VARCHAR(50),
	descricao TEXT
);

CREATE TABLE funcionario (
	codigo_funcionario SERIAL PRIMARY KEY,
	cpf VARCHAR(50),
	cnpj VARCHAR(50),
	carga_horaria INTEGER,
	nome VARCHAR(100),
	data_ingresso DATE DEFAULT now(),
	cidade VARCHAR(100),
	bairro VARCHAR(100),
	rua VARCHAR(100),
	numero INTEGER,
	codigo_departamento INT,
	FOREIGN KEY(codigo_departamento) REFERENCES departamento(codigo_departamento)
);

CREATE TABLE telefone (
	codigo_telefone SERIAL PRIMARY KEY,
	numero VARCHAR(50),
	codigo_funcionario INTEGER,
	FOREIGN KEY(codigo_funcionario) REFERENCES funcionario(codigo_funcionario)
);
