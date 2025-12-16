/* select the name of the place where there are more than
100 consumptions for each day */
SELECT Locale.nome, Consumazione.data, COUNT(Consumazione.ID) FROM Locale JOIN Consumazione ON Locale.nome = Consumazione.locale GROUP BY Locale.nome, Consumazione.data HAVING COUNT(Consumazione.ID) > 100;
/* select the songs played by the students which 
have reached the maximum level */
SELECT nome, cognome, CF, canzone.ID, canzone.titolo FROM
(SELECT nome, cognome, CF, livello FROM Studente JOIN conseguimento ON Studente.ID = conseguimento.studente WHERE livello = (SELECT MAX(livello) FROM livello) GROUP BY nome, cognome, CF, livello ORDER BY livello DESC LIMIT 1) AS profilo_studente JOIN
(SELECT ID, titolo, studente FROM esibizione WHERE dataEsibizione = '2012-01-29') as canzone ON profilo_studente.CF = canzone.studente;
/* How many songs have been played by the students
on a specific room in a specific day */
SELECT CF, nome, cognome, COUNT(brano) FROM esibizione JOIN Studente ON esibizione.studente = Studente.ID WHERE aula = 'X' AND dataEsibizione = 'Y' GROUP BY CF, nome, cognome;