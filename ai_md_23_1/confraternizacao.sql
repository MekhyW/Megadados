DROP TABLE IF EXISTS eventos;
CREATE TABLE eventos (
    id_evento INTEGER NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_evento)
);

DROP TABLE IF EXISTS confraternizacoes;
CREATE TABLE confraternizacoes (
    id_confraternizacao INTEGER NOT NULL AUTO_INCREMENT,
    id_evento INTEGER NOT NULL,
    diahora DATETIME NOT NULL,
    PRIMARY KEY (id_confraternizacao),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento)
);

DROP TABLE IF EXISTS alunos;
CREATE TABLE alunos (
    id_aluno INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_aluno)
);

DROP TABLE IF EXISTS organizadores;
CREATE TABLE organizadores (
    id_organizador INTEGER NOT NULL AUTO_INCREMENT,
    id_aluno INTEGER NOT NULL,
    id_confraternizacao INTEGER NOT NULL,
    PRIMARY KEY (id_organizador),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_confraternizacao) REFERENCES confraternizacoes(id_confraternizacao)
);

DROP TABLE IF EXISTS ingressos;
CREATE TABLE ingressos (
    id_ingresso INTEGER NOT NULL AUTO_INCREMENT,
    id_confraternizacao INTEGER NOT NULL,
    id_aluno_comprador INTEGER NOT NULL,
    id_aluno_utilizador INTEGER NOT NULL,
    PRIMARY KEY (id_ingresso),
    FOREIGN KEY (id_confraternizacao) REFERENCES confraternizacoes(id_confraternizacao),
    FOREIGN KEY (id_aluno_comprador) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_aluno_utilizador) REFERENCES alunos(id_aluno)
);