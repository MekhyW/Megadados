DROP TABLE IF EXISTS alunos;
CREATE TABLE alunos (
    id_aluno INTEGER NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    apelido VARCHAR(50) UNIQUE,
    PRIMARY KEY (id_aluno)
);

DROP TABLE IF EXISTS campeonatos;
CREATE TABLE campeonatos (
    id_campeonato INTEGER NOT NULL AUTO_INCREMENT,
    modalidade_é_dupla TINYINT NOT NULL,
    PRIMARY KEY (id_campeonato)
);

DROP TABLE IF EXISTS campeonato_modalidades;
CREATE TABLE campeonato_modalidades (
    id_campeonato_modalidades INTEGER NOT NULL AUTO_INCREMENT,
    id_campeonato_dupla INTEGER NOT NULL,
    id_campeonato_individual INTEGER NOT NULL,
    PRIMARY KEY (id_campeonato_modalidades),
    FOREIGN KEY (id_campeonato_dupla) REFERENCES campeonatos(id_campeonato),
    FOREIGN KEY (id_campeonato_individual) REFERENCES campeonatos(id_campeonato)
);

DROP TABLE IF EXISTS inscricoes;
CREATE TABLE inscricoes (
    id_inscricao INTEGER NOT NULL AUTO_INCREMENT,
    id_aluno INTEGER NOT NULL,
    id_campeonato_modalidades INTEGER NOT NULL,
    inscrito_modalidade_individual TINYINT,
    inscrito_modalidade_dupla TINYINT,
    pagou_inscricao_individual TINYINT,
    pagou_inscricao_dupla TINYINT,
    PRIMARY KEY (id_inscricao),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_campeonato_modalidades) REFERENCES campeonato_modalidades(id_campeonato_modalidades)
);

DROP TABLE IF EXISTS partidas;
CREATE TABLE partidas (
    id_partida INTEGER NOT NULL AUTO_INCREMENT,
    id_campeonato INTEGER NOT NULL,
    id_jogador_A INTEGER NOT NULL,
    id_jogador_B INTEGER NOT NULL,
    id_jogador_C INTEGER,
    id_jogador_D INTEGER,
    vencedor_AB_vs_CD TINYINT,
    PRIMARY KEY (id_partida),
    FOREIGN KEY (id_campeonato) REFERENCES campeonatos(id_campeonato),
    FOREIGN KEY (id_jogador_A) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_jogador_B) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_jogador_C) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_jogador_D) REFERENCES alunos(id_aluno)
);