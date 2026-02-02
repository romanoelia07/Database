CREATE DATABASE Videogioco;

USE Videogioco;

CREATE TABLE Videogioco(
    ID_videogioco INT PRIMARY KEY AUTO_INCREMENT,
    Data_rilascio Date NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Genere VARCHAR(30) NOT NULL
);


CREATE TABLE Azienda(
    ID_azienda INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Nazionalita VARCHAR(30) NOT NULL
);


CREATE TABLE Amministratore(
    ID_amministratore INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Eta INT(3) NOT NULL,
    id_Azienda INT NOT NULL,
    FOREIGN KEY(id_Azienda) REFERENCES Azienda(ID_Azienda)
);


CREATE TABLE Dipendente(
    ID_dipendente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
    Cognome VARCHAR(30) NOT NULL,
    Incarico VARCHAR(30) NOT NULL,
    Nazionalita VARCHAR(30) NOT NULL,
    Stipendio DECIMAL(5,2) NOT NULL,
    Eta INT(3) NOT NULL,
    id_azienda INT NOT NULL,
    FOREIGN KEY(id_azienda) REFERENCES Azienda(ID_azienda)
);


CREATE TABLE Videogioco_Azienda(
    id_videogioco INT NOT NULL,
    id_azienda INT NOT NULL,
    FOREIGN KEY(id_videogioco) REFERENCES videogioco(ID_videogioco),
    FOREIGN KEY(id_azienda) REFERENCES Azienda(ID_azienda)
);