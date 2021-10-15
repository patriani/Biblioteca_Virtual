CREATE TABLE USUARIO(
    cpf VARCHAR(11) NOT NULL,
    primeiro_nome VARCHAR(20),
    ultimo_nome VARCHAR(20),
    email VARCHAR(320),
    senha VARCHAR(20),
    PRIMARY KEY(cpf)
);
CREATE TABLE TELEFONE(
    cpf_usuario VARCHAR(11) NOT NULL,
    residencial CHAR(10),
    movel CHAR(11),
    FOREIGN KEY(cpf_usuario) REFERENCES USUARIO (cpf)
);
CREATE TABLE ENDERECO(
    cpf_usuario VARCHAR(11) NOT NULL,
    estado CHAR(2),
    cep CHAR(8),
    bairro TEXT,
    rua TEXT,
    numero INT,
    complemento TEXT,
    FOREIGN KEY(cpf_usuario) REFERENCES USUARIO (cpf)
);
CREATE TABLE EDITORA(
    id_editora VARCHAR(4) NOT NULL,
    nome_editora VARCHAR(20),
    PRIMARY KEY (id_editora)
);
CREATE TABLE POSTAGEM(
    id_postagem VARCHAR(4) NOT NULL,
    cpf_usuario VARCHAR(11),
    id_editora VARCHAR(4),
    capa OID,
    titulo TEXT,
    descricao TEXT,
    data_publicacao DATE,
    tamanho_arquivo INT,
    arquivo OID,
    PRIMARY KEY(id_postagem),
    FOREIGN KEY(cpf_usuario) REFERENCES USUARIO (cpf),
    FOREIGN KEY(id_editora) REFERENCES EDITORA (id_editora)
);
CREATE TABLE CATEGORIA(
    id_categoria VARCHAR(4) NOT NULL,
    nome_categoria VARCHAR(20),
    PRIMARY KEY(id_categoria)
);
CREATE TABLE AUTOR(
    id_autor VARCHAR(4) NOT NULL,
    primeiro_nome VARCHAR(20),
    ultimo_nome VARCHAR(20),
    PRIMARY KEY(id_autor)
);
CREATE TABLE AUTOR_POSTAGEM(
	id_postagem VARCHAR(4) NOT NULL,
	id_autor VARCHAR(4) NOT NULL,
    FOREIGN KEY(id_postagem) REFERENCES POSTAGEM (id_postagem),
    FOREIGN KEY(id_autor) REFERENCES AUTOR (id_autor)
);
CREATE TABLE CATEGORIA_POSTAGEM(
    id_postagem VARCHAR(4) NOT NULL,
	id_categoria VARCHAR(4) NOT NULL,
    FOREIGN KEY(id_postagem) REFERENCES POSTAGEM (id_postagem),
    FOREIGN KEY(id_categoria) REFERENCES CATEGORIA (id_categoria)
);

/*TABELAS DE LOG------------------------------------------------------------------*/

CREATE TABLE log_usuario(
    usuario VARCHAR(20),
    cpf VARCHAR(11),
    email VARCHAR(320),
    senha VARCHAR(20),
    data_hora TIMESTAMP,
    comando CHAR(6)
);
CREATE TABLE log_telefone_usuario(
    usuario VARCHAR(20),
    data_hora TIMESTAMP,
    comando CHAR(6),
    cpf VARCHAR(11),
    residencial CHAR(10),
    movel CHAR(11)
); 
CREATE TABLE log_endereco_usuario(
    cpf_usuario VARCHAR(11),
    usuario VARCHAR(20),
    data_hora TIMESTAMP,
    comando CHAR(6),
    estado CHAR(2),
    cep CHAR(8),
    bairro TEXT,
    rua TEXT,
    numero INT,
    complemento TEXT
);
CREATE TABLE log_postagem(
    usuario VARCHAR(20),
    data_hora TIMESTAMP,
    comando CHAR(6),
    id_postagem VARCHAR(4) NOT NULL,
    capa OID,
    titulo TEXT,
    descricao TEXT,
    data_publicacao DATE,
    tamanho_arquivo INT,
    arquivo OID
);

CREATE TABLE log_autor_postagem(
    usuario VARCHAR(20),
    data_hora TIMESTAMP,
    comando CHAR(6),
	id_postagem VARCHAR(4),
	id_autor VARCHAR(4)
);
CREATE TABLE log_categoria_postagem(
    usuario VARCHAR(20),
    data_hora TIMESTAMP,
    comando CHAR(6),
    id_postagem VARCHAR(4),
	id_categoria VARCHAR(4)
);
CREATE TABLE log_editora(
    usuario VARCHAR(20),
    data_hora TIMESTAMP,
    comando CHAR(6),
    id_editora VARCHAR(4) ,
    nome_editora VARCHAR(20)
);
CREATE TABLE log_autor(
    usuario VARCHAR(20),
    data_hora TIMESTAMP,
    comando CHAR(6),
    id_autor VARCHAR(4) ,
    primeiro_nome_autor VARCHAR(20),
    ultimo_nome_autor VARCHAR(20)
);
CREATE TABLE log_categoria(
    usuario VARCHAR(20),
    data_hora TIMESTAMP,
    comando CHAR(6),
    id_categoria VARCHAR(4) ,
    nome_categoria VARCHAR(20)
);
