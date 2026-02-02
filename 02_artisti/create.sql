CREATE DATABASE Artisti;

use Artisti;

CREATE TABLE Artisti(
    ID_Artista INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(25) NOT NULL,
    Cognome VARCHAR(25) NOT NULL,
    Eta INT(3) NOT NULL,
    Nazionalita VARCHAR(30) NOT NULL,
    Nome_Arte VARCHAR(30) NOT NULL
);

CREATE TABLE Album(
    ID_Album INT PRIMARY KEY AUTO_INCREMENT,
    Anno INT(4) NOT NULL,
    Titolo VARCHAR(25) NOT NULL,
    id_Artista INT NOT NULL,
    FOREIGN KEY(id_Artista) REFERENCES Artisti(ID_Artista)
);

CREATE TABLE Brani(
    ID_Brani INT PRIMARY KEY AUTO_INCREMENT,
    Titolo VARCHAR(25) NOT NULL,
    Minuti INT(20) NOT NULL,
    Genere VARCHAR(25) NOT NULL,
    id_Album INT NOT NULL,
    FOREIGN KEY(id_Album) REFERENCES Album(ID_Album)
);

CREATE TABLE Abbonamento(
    ID_Abbonamento INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(25) NOT NULL,
    Mensilita INT(3) NOT NULL,
    Prezzo DECIMAL(6,2) NOT NULL
);

CREATE TABLE Utente(
    ID_Utente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(25) NOT NULL,
    Cognome VARCHAR(25) NOT NULL,
    Nazionalita VARCHAR(25) NOT NULL,
    Eta INT(3) NOT NULL,
    id_Abbonamento INT NOT NULL,
    FOREIGN KEY(id_Abbonamento) REFERENCES Abbonamento(ID_Abbonamento)
);

CREATE TABLE Brano_Utente(
    id_Brano INT NOT NULL,
    id_Utente INT NOT NULL,
    Numero_Riproduzioni INT(10) NOT NULL,
    Data_Ascolto DATE NOT NULL,
    FOREIGN KEY(id_Brano) REFERENCES Brani(ID_Brani),
    FOREIGN KEY(id_Utente) REFERENCES Utente(ID_Utente)
);