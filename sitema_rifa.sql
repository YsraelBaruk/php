/* sitema_rifa: */

CREATE TABLE Usuario (
    id INT PRIMARY KEY,
    email VARCHAR,
    senha INT,
    nome VARCHAR,
    foto VARCHAR,
    tel VARCHAR,
    cpf BIGINT UNIQUE
);

CREATE TABLE Rifa (
    id INT PRIMARY KEY,
    titulo VARCHAR,
    descricao VARCHAR,
    quant_num INT,
    valor DOUBLE,
    data_criacao DATE,
    data_termino DATE,
    tempo_reserva TIME,
    fk_Usuario_id INT
);

CREATE TABLE Pedido (
    id INT PRIMARY KEY,
    fk_Usuario_id INT,
    fk_Rifa_id INT,
    valor DOUBLE,
    status BOOL
);

CREATE TABLE Colaborador (
    id INT PRIMARY KEY,
    fk_Usuario_id INT,
    fk_Rifa_id INT,
    url VARCHAR,
    saque BOOL
);

CREATE TABLE Numero (
    numero INT,
    fk_Rifa_id INT,
    fk_Pedido_id INT,
    PRIMARY KEY (numero, fk_Rifa_id)
);

CREATE TABLE Tags (
    nome VARCHAR PRIMARY KEY
);

CREATE TABLE Pedido_Colaborador (
    fk_Colaborador_id INT,
    fk_Pedido_id INT
);

CREATE TABLE Rifa_Tags (
    fk_Tags_nome VARCHAR,
    fk_Rifa_id INT
);

CREATE TABLE Imagens (
    fk_Rifa_id INT,
    link_img VARCHAR
);
 
ALTER TABLE Rifa ADD CONSTRAINT FK_Rifa_2
    FOREIGN KEY (fk_Usuario_id)
    REFERENCES Usuario (id);
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_2
    FOREIGN KEY (fk_Usuario_id)
    REFERENCES Usuario (id);
 
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_3
    FOREIGN KEY (fk_Rifa_id)
    REFERENCES Rifa (id);
 
ALTER TABLE Colaborador ADD CONSTRAINT FK_Colaborador_2
    FOREIGN KEY (fk_Usuario_id)
    REFERENCES Usuario (id);
 
ALTER TABLE Colaborador ADD CONSTRAINT FK_Colaborador_3
    FOREIGN KEY (fk_Rifa_id)
    REFERENCES Rifa (id);
 
ALTER TABLE Numero ADD CONSTRAINT FK_Numero_1
    FOREIGN KEY (fk_Pedido_id)
    REFERENCES Pedido (id);
 
ALTER TABLE Numero ADD CONSTRAINT FK_Numero_2
    FOREIGN KEY (fk_Rifa_id)
    REFERENCES Rifa (id);
 
ALTER TABLE Pedido_Colaborador ADD CONSTRAINT FK_Pedido_Colaborador_1
    FOREIGN KEY (fk_Colaborador_id)
    REFERENCES Colaborador (id);
 
ALTER TABLE Pedido_Colaborador ADD CONSTRAINT FK_Pedido_Colaborador_2
    FOREIGN KEY (fk_Pedido_id)
    REFERENCES Pedido (id);
 
ALTER TABLE Rifa_Tags ADD CONSTRAINT FK_Rifa_Tags_1
    FOREIGN KEY (fk_Tags_nome)
    REFERENCES Tags (nome);
 
ALTER TABLE Rifa_Tags ADD CONSTRAINT FK_Rifa_Tags_2
    FOREIGN KEY (fk_Rifa_id)
    REFERENCES Rifa (id);
 
ALTER TABLE Imagens ADD CONSTRAINT FK_Imagens_1
    FOREIGN KEY (fk_Rifa_id)
    REFERENCES Rifa (id);