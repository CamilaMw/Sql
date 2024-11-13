CREATE TABLE autor (
	codigo_autor SERIAL PRIMARY KEY,
	nome VARCHAR(100)
);

CREATE TABLE livro (
	codigo_livro SERIAL PRIMARY KEY,
	titulo VARCHAR(100),
	ano_lancamento DATE,
	edicao INTEGER,
	descricao TEXT,
	codigo_autor INTEGER,
	FOREIGN KEY(codigo_autor) REFERENCES autor(codigo_autor)
);

CREATE TABLE cliente (
	codigo_cliente SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	identidade VARCHAR (50),
	telefone VARCHAR(50)
);

CREATE TABLE livro_cliente (
	codigo_livro INTEGER,
	codigo_cliente INTEGER,
	data_compra DATE DEFAULT now(),
	valor_compra (10, 2),
	FOREIGN KEY(codigo_livro) REFERENCES livro,
	FOREIGN KEY(codigo_cliente) REFERENCES cliente
);



