CREATE TABLE funcionario (
	codigo_funcionario SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(50),
	identidade VARCHAR(50)
);

CREATE TABLE departamento (
	codigo_departamento SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(50)
);

CREATE TABLE funcionario_departamento (
	carga_horaria INTEGER,
	codigo_funcionario INTEGER,
	codigo_departamento INTEGER,
	FOREIGN KEY(codigo_funcionario) REFERENCES funcionario(codigo_funcionario),
	FOREIGN KEY(codigo_departamento) REFERENCES departamento(codigo_departamento)
);