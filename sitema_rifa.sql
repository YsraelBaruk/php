/* sitema_rifa: */

CREATE TABLE Usuario (
    id INT PRIMARY KEY,
    email VARCHAR(150),
    senha INT,
    nome VARCHAR(150),
    foto VARCHAR(150),
    tel VARCHAR(150),
    cpf BIGINT UNIQUE
)ENGINE=InnoDB;

CREATE TABLE Rifa (
    id INT PRIMARY KEY,
    titulo VARCHAR(150),
    descricao VARCHAR(150),
    quant_num INT,
    valor DOUBLE,
    data_criacao DATE,
    data_termino DATE,
    tempo_reserva TIME,
    fk_Usuario_id INT
)ENGINE=InnoDB;

CREATE TABLE Pedido (
    id INT PRIMARY KEY,
    fk_Usuario_id INT,
    fk_Rifa_id INT,
    valor DOUBLE,
    status BOOL
)ENGINE=InnoDB;

CREATE TABLE Colaborador (
    id INT PRIMARY KEY,
    fk_Usuario_id INT,
    fk_Rifa_id INT,
    url VARCHAR(150),
    saque BOOL
)ENGINE=InnoDB;

CREATE TABLE Numero (
    numero INT,
    fk_Rifa_id INT,
    fk_Pedido_id INT,
    PRIMARY KEY (numero, fk_Rifa_id)
)ENGINE=InnoDB;

CREATE TABLE Tags (
    nome VARCHAR(150) PRIMARY KEY
)ENGINE=InnoDB;

CREATE TABLE Pedido_Colaborador (
    fk_Colaborador_id INT,
    fk_Pedido_id INT
)ENGINE=InnoDB;

CREATE TABLE Rifa_Tags (
    fk_Tags_nome VARCHAR(150),
    fk_Rifa_id INT
)ENGINE=InnoDB;

CREATE TABLE Imagens (
    fk_Rifa_id INT,
    link_img VARCHAR(150)
)ENGINE=InnoDB;
 
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