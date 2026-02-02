SELECT B.Titolo,B.Minuti,B.Genere,A.Titolo,AR.Nome_Arte
FROM Brani B
JOIN Album A ON B.id_Album=A.ID_Album
JOIN Artisti AR ON A.id_Artista=AR.ID_Artista;

SELECT U.Nome,U.Cognome,U.Nazionalita,U.Eta,A.Tipo,A.Prezzo
FROM Utente U
JOIN Abbonamento A ON U.id_Abbonamento=A.ID_Abbonamento;

SELECT B.Titolo,B.Genere,B.Minuti,BU.Numero_Riproduzioni,BU.Data_Ascolto
FROM Brani B
LEFT JOIN Brano_Utente BU ON B.ID_Brani=BU.id_Brano
LEFT JOIN Utente U ON BU.id_Utente=U.ID_Utente;

SELECT A.Nome,A.Cognome,A.Nome_Arte,A.Eta,A.Nazionalita,AL.Anno,AL.Titolo
FROM Artisti A
JOIN ALBUM AL ON A.ID_Artista=AL.id_Artista;

SELECT A.Nome_Arte,AL.Anno,AL.Titolo
FROM Artisti A
JOIN Album AL ON A.ID_Artista=AL.id_Artista;

SELECT B.Titolo,B.Genere,B.Minuti,BU.Numero_Riproduzioni
FROM Brani B
JOIN Brano_Utente BU ON B.ID_Brani=BU.id_Brano
JOIN Utente U ON BU.id_Utente=U.ID_Utente
AND BU.Numero_Riproduzioni>10;