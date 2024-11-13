-- -- Exercicio 7 - item b) Crie uma tabela pessoa com codigo_pessoa (PK) com 
-- incremento automático e nome).
CREATE TABLE pessoa (
	codigo_pessoa SERIAL PRIMARY KEY,
	nome VARCHAR(100)
);

-- Exercicio 7 - item c) Crie uma tabela postagem com codigo_postagem (PK) com 
-- incremento automático, conteúdo e codigo_pessoa (FK - pessoa).
CREATE TABLE postagem (
	codigo_postagem SERIAL PRIMARY KEY,
	conteudo VARCHAR(1000),
	codigo_pessoa INTEGER,
	FOREIGN KEY(codigo_pessoa) REFERENCES pessoa(codigo_pessoa)
);

-- Exercicio 7 - item d) Crie uma tabela comentario com codigo_comentario (PK) 
-- com incremento automático,  conteúdo, codigo_pessoa (FK - pessoa), 
-- comentario_respondido (FK -  comentario) e postagem_comentada (FK – postagem)

CREATE TABLE comentario (
	codigo_comentario SERIAL PRIMARY KEY,
	conteudo VARCHAR(1000),
	codigo_pessoa INTEGER,
	comentario_respondido INTEGER,
	postagem_comentada INTEGER,
	FOREIGN KEY(codigo_pessoa) REFERENCES pessoa(codigo_pessoa),
	FOREIGN KEY(comentario_respondido) REFERENCES comentario(codigo_comentario),
	FOREIGN KEY(postagem_comentada) REFERENCES postagem(codigo_postagem)
);

-- Exercicio 7 - item e) Insira na tabela pessoa 
-- três instâncias diferentes: Pedro, Ana e Gabriel.
INSERT INTO pessoa(nome) VALUES ('Pedro');
INSERT INTO pessoa(nome) VALUES ('Ana');
INSERT INTO pessoa(nome) VALUES ('Gabriel');

-- Exercicio 7 - item f) Selecione todas as colunas da tabela pessoa.
SELECT codigo_pessoa, nome FROM pessoa;
SELECT * FROM pessoa;

-- Exercicio 7 - item g) Insira uma nova postagem com o conteúdo 
-- ‘Hoje eu acordei feliz =)’ associada ao usuario ‘Pedro’.
INSERT INTO postagem(conteudo, codigo_pessoa) VALUES ('Hoje eu acordei feliz =)', 1);

-- Exercicio 7 - item h) Selecione todas as postagens realizadas.
SELECT * FROM postagem;

-- Exercicio 7 - item i) Selecione as postagens de uma pessoa 
-- onde é possível recuperar o nome e o conteúdo da postagem.
SELECT * FROM postagem, pessoa WHERE postagem.codigo_pessoa = pessoa.codigo_pessoa;

-- Exercicio 7 - item j) Insira um comentário da Ana como 
-- resposta à postagem de Pedro realizada no item g). Esta resposta deve ter o 
-- conteúdo “O que houve para tanta felicidade?”
INSERT INTO comentario(conteudo, codigo_pessoa, postagem_comentada) 
VALUES ('O que houve para tanta felicidade?', 2, 1);

-- Exercicio 7 - item k) Selecione as postagens e os comentários realizados até o momento. 
SELECT * FROM postagem, comentario 
WHERE postagem.codigo_postagem = comentario.postagem_comentada;

-- Exercicio 7 - item l) Selecione as postagens que foram respondidas bem como que mostre
-- informações da pessoa que respondeu.
SELECT * FROM pessoa, postagem, comentario 
WHERE postagem.codigo_postagem = comentario.postagem_comentada 
AND pessoa.codigo_pessoa = comentario.codigo_pessoa;

-- Exercicio 7 - item m) Insira um comentário (“Hoje é aula de BD!”) do Pedro como 
-- resposta ao comentário feito por Ana.
INSERT INTO comentario(conteudo, codigo_pessoa, comentario_respondido)
VALUES ('Hoje é dia de aula de Banco de Dados!', 1, 1);

