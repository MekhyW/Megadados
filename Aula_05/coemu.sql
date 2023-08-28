DROP DATABASE IF EXISTS coemu;
CREATE DATABASE coemu;
USE coemu;

DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario (
	id_usuario INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    nickname VARCHAR(30) NOT NULL,
    data_cadastro DATETIME NOT NULL,
    ativo TINYINT NOT NULL,
    PRIMARY KEY (id_usuario)
);
ALTER TABLE coemu.usuario MODIFY COLUMN nickname VARCHAR(30) NOT NULL UNIQUE;
ALTER TABLE coemu.usuario MODIFY COLUMN id_usuario INT NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS comunidade;
CREATE TABLE comunidade (
	id_comunidade INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(50) NOT NULL,
    descricao LONGTEXT,
    data_criacao DATETIME NOT NULL,
    ativo TINYINT NOT NULL,
    PRIMARY KEY (id_comunidade)
);
ALTER TABLE coemu.comunidade ADD COLUMN id_usuario_dono INT NOT NULL;
ALTER TABLE coemu.comunidade ADD FOREIGN KEY (id_usuario_dono) REFERENCES usuario(id_usuario);