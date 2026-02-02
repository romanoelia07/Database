--1)Query che restituisce tutti i videogiochi di genere RPG.

SELECT * 
FROM Videogioco
WHERE genere='RPG';

--2)Query che restituisce tutti i videogiochi di genere RPG.

SELECT * 
FROM Azienda
WHERE Nazionalita='Giappone';

--3)Query che restituisce nome e cognome dei dipendenti con stipendio superiore a 900.

SELECT Nome,Cognome
FROM Dipendente
WHERE Stipendio>900;

--4)Query che restituisce i videogiochi usciti dopo il 2018.

SELECT * 
FROM Videogioco
WHERE YEAR(Data_rilascio)>2018;

--5)Query che restituisce tutti i videogiochi sviluppati dall’azienda “Bethesda”.

SELECT V.Nome,V.Data_rilascio,V.ID_videogioco,V.genere
FROM Videogioco V,Azienda A,Videogioco_Azienda VA
WHERE A.Nome='Bethesda' AND (V.ID_videogioco=VA.id_videogioco AND A.ID_azienda=VA.ID_azienda);

--6)Query che restituisce il nome del videogioco e il nome dell’azienda che lo ha prodotto.

SELECT V.Nome,A.Nome
FROM Videogioco V,Azienda A,Videogioco_Azienda VA
WHERE V.ID_videogioco=VA.id_videogioco AND A.ID_azienda=VA.id_azienda;

--7)Query che restituisce il numero di videogiochi per ogni genere.

SELECT COUNT(*) AS Numero_Giochi,genere 
FROM Videogioco 
GROUP BY Genere;

--8)Query che restituisce il numero di dipendenti per ogni azienda.

SELECT COUNT(*) AS Numero_Dipendenti,A.Nome
FROM Dipendente D,Azienda A
WHERE A.ID_azienda=D.id_azienda
GROUP BY A.Nome;

--9)Query che restituisce lo stipendio medio dei dipendenti per ogni azienda.

SELECT AVG(D.Stipendio) AS Stipendio_Medio,A.Nome
FROM Dipendente D,Azienda A
WHERE A.ID_azienda=D.id_azienda
GROUP BY A.Nome;

--10)Query che restituisce le aziende con stipendio medio superiore a 850.

SELECT AVG(D.Stipendio) AS Stipendio_Medio,A.Nome
FROM Dipendente D,Azienda A
WHERE A.ID_azienda=D.id_azienda
GROUP BY A.Nome
HAVING Stipendio_Medio>850;

--11)Query che restituisce il videogioco più recente.

SELECT * 
FROM Videogioco
ORDER BY Data_rilascio DESC
LIMIT 1;

--12)Query che restituisce l’azienda che ha prodotto il maggior numero di videogiochi.

SELECT COUNT(*) AS Numero_Giochi,A.Nome,A.ID_azienda,A.Nazionalita
FROM Azienda A,Videogioco V,Videogioco_Azienda VA
WHERE A.ID_azienda=VA.id_azienda AND V.ID_videogioco=VA.id_videogioco
GROUP BY A.ID_azienda
ORDER BY Numero_Giochi DESC
LIMIT 1;

--13)Query che restituisce i dipendenti ordinati per stipendio dal più alto al più basso.

SELECT * 
FROM Dipendente
ORDER BY Stipendio DESC;

--14)Query che restituisce i dipendenti italiani con il nome dell’azienda per cui lavorano.

SELECT D.Nome,D.Cognome,D.Incarico,D.Stipendio,D.Eta,A.Nome
FROM Dipendente D,Azienda A
WHERE D.Nazionalita='Italiana' AND D.id_azienda=A.ID_azienda;

--15)Query che restituisce tutti i videogiochi di genere RPG con la relativa azienda.

SELECT V.Nome,V.Data_rilascio,V.ID_videogioco,A.Nome
FROM Videogioco V,Azienda A,Videogioco_Azienda VA
WHERE V.Genere='RPG' AND (V.ID_videogioco=VA.id_videogioco AND A.ID_azienda=VA.id_azienda);

--16)Query che restituisce lo stipendio minimo tra tutti i dipendenti.

SELECT MIN(Stipendio) AS Stipendio_Minimo
FROM Dipendente D;

--17)Query che restituisce lo stipendio massimo per ogni azienda.

SELECT MAX(Stipendio) AS Stipendio_MASSIMO
FROM Dipendente D;

--18)Query che restituisce tutti i giochi che iniziano per F

SELECT Nome,Genere,Data_rilascio
FROM Videogioco
WHERE Nome LIKE 'F%';

--19)Query che restituisce tutti i giochi che hanno un nome con 10 caratteri

SELECT Nome,Genere,Data_rilascio
FROM Videogioco
WHERE Nome LIKE '__________';

--20)Query che restituisde tutti i dipendenti tra i 20 e i 35 anni

SELECT Nome,Cognome,Eta,Incarico
FROM Dipendente
WHERE Eta BETWEEN 20 AND 35
ORDER BY Eta;

--21)Query che restituisde tutti i dipendenti sotti i 30 o sopra i 40 anni

SELECT Nome,Cognome,Eta,Incarico
FROM Dipendente
WHERE Eta<30 OR Eta>40
ORDER BY Eta;

--22)Query che restituisce tutti i dipendenti che non sono italiani e che hanno meno di 35 anni

SELECT Nome,Cognome,Eta,Incarico,Nazionalita
FROM Dipendente
WHERE NOT Nazionalita='italiana' AND Eta<35;

--Query con il join

--1)Query che restituisce i videogiochi con il nome dell’azienda che li ha prodotti.

SELECT V.Nome,V.Data_rilascio,V.Genere,A.Nome,A.Nazionalita
FROM Videogioco V
JOIN Azienda A ON ID_videogioco=ID_azienda;

--2)Query che restituisce i videogiochi sviluppati da Bethesda con data di rilascio e genere.

SELECT V.Nome,V.Data_rilascio,V.Genere
FROM Videogioco V
JOIN Azienda ON ID_videogioco=ID_azienda AND Azienda.Nome="Bethesda";

--3)Query che restituisce tutti i dipendenti con il nome dell’azienda per cui lavorano.

SELECT D.Nome,D.Cognome,D.Stipendio,D.Incarico,D.Eta
FROM Dipendente D
JOIN Azienda ON ID_dipendente=Azienda.ID_azienda;

--4)Query che restituisce i dipendenti che lavorano per aziende giapponesi.

SELECT D.Nome,D.Cognome,D.Stipendio,D.Incarico,D.Eta
FROM Dipendente D
JOIN Azienda ON ID_dipendente=Azienda.ID_azienda AND Azienda.Nazionalita="Giappone";

--5)Query che restituisce i videogiochi di genere RPG con la relativa azienda.

SELECT * 
FROM Videogioco
JOIN Azienda ON ID_videogioco=ID_azienda AND Videogioco.Genere="RPG";

--6)Query che restituisce i videogiochi usciti dopo il 2018 con il nome dell’azienda.

SELECT V.Nome,V.Genere,V.Data_rilascio
FROM Videogioco V
JOIN Azienda ON ID_videogioco=ID_azienda AND YEAR(Videogioco.Data_rilascio)=2018;

--7)Query che restituisce i dipendenti con stipendio superiore a 900 indicando l’azienda.

SELECT D.Nome,D.Cognome,D.Eta,D.Stipendio,D.Incarico
FROM Dipendente D
JOIN Azienda ON D.ID_dipendente=Azienda.ID_azienda AND D.Stipendio>900;

--8)Query che restituisce il nome del videogioco, il nome dell’azienda produttrice e il nome dei dipendenti che lavorano nell’azienda che sviluppa il videogioco.

SELECT V.Nome,A.Nome,D.Nome,D.Cognome,D.Eta,D.Incarico,D.Stipendio
FROM Videogioco V
JOIN Videogioco_Azienda VA ON V.ID_videogioco=VA.id_videogioco
JOIN Azienda A ON VA.id_azienda=A.ID_azienda
JOIN Dipendente D ON A.ID_azienda=D.id_azienda;

--9)Query che restituisce per ogni videogioco il numero totale di dipendenti dell’azienda che lo sviluppa.

SELECT V.Nome,COUNT(D.ID_dipendente) AS Numero_Dipendenti
FROM Videogioco V
JOIN Videogioco_Azienda VA ON V.ID_videogioco=VA.id_videogioco
JOIN Azienda A ON VA.id_azienda=A.ID_azienda
JOIN Dipendente D ON A.ID_azienda=D.id_azienda
GROUP BY V.Nome;

--10)Query che restituisce i videogiochi sviluppati da aziende giapponesi, mostrando nome del videogioco, genere e dipendenti dell’azienda.

SELECT V.Nome,V.Genere,V.Data_rilascio
FROM Videogioco V
JOIN Videogioco_Azienda VA ON V.ID_videogioco=VA.id_videogioco 
JOIN Azienda A ON VA.id_azienda=A.ID_azienda
JOIN Dipendente D ON A.ID_azienda=D.id_azienda AND A.Nazionalita="Giappone";

