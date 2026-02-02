--1)Query che restituisce l’elenco di tutti i brani, mostrando per ciascuno il titolo del brano, il titolo dell’album a cui appartiene e il nome d’arte dell’artista.

SELECT B.Titolo,B.Minuti,B.Genere,A.Titolo,AR.Nome_Arte
FROM Brani B
JOIN Album A ON B.id_Album=A.ID_Album
JOIN Artisti AR ON A.id_Artista=AR.ID_Artista;

--2)Query che restituisce l’elenco degli utenti con il relativo tipo di abbonamento e il prezzo mensile associato.

SELECT U.Nome,U.Cognome,U.Nazionalita,U.Eta,A.Tipo,A.Prezzo
FROM Utente U
JOIN Abbonamento A ON U.id_Abbonamento=A.ID_Abbonamento;

--3)Query che restituisce i brani ascoltati dagli utenti, indicando il nome e il cognome dell’utente, il titolo del brano e il numero di riproduzioni.

SELECT B.Titolo,B.Genere,B.Minuti,BU.Numero_Riproduzioni,BU.Data_Ascolto
FROM Brani B
LEFT JOIN Brano_Utente BU ON B.ID_Brani=BU.id_Brano
LEFT JOIN Utente U ON BU.id_Utente=U.ID_Utente;

--4)Query che restituisce tutti gli artisti e, se presenti, i rispettivi album, includendo anche gli artisti che non hanno pubblicato alcun album.

SELECT A.Nome,A.Cognome,A.Nome_Arte,A.Eta,A.Nazionalita,AL.Anno,AL.Titolo
FROM Artisti A
JOIN ALBUM AL ON A.ID_Artista=AL.id_Artista;

--5)Query che restituisce il nome d'arte dell'artista,il titolo e l'anno di produzione dell'album

SELECT A.Nome_Arte,AL.Anno,AL.Titolo
FROM Artisti A
JOIN Album AL ON A.ID_Artista=AL.id_Artista;

--6)Query che restituisce i titoli dei brani e il numero di riproduzioni quando il numero di riproduzioni è maggiore di 10.

SELECT B.Titolo,B.Genere,B.Minuti,BU.Numero_Riproduzioni
FROM Brani B
JOIN Brano_Utente BU ON B.ID_Brani=BU.id_Brano
JOIN Utente U ON BU.id_Utente=U.ID_Utente
AND BU.Numero_Riproduzioni>10;