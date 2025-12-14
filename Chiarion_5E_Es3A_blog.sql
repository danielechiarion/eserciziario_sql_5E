/* select themes of sites published after 1st September 2012  */
SELECT DISTINCT stile FROM Tema JOIN Blog ON Tema.blog = Blog.ID WHERE Blog.dataPubblicazione>'2012-09-01';
/* select the data of each user and the most popular
post with the highest number of comments received */
SELECT ID, nome, mail, p1.hash, p1.data, p1.testo, COUNT(c1.hash)
FROM Utente JOIN Pubblicazione p1 ON p1.autore = Utente.ID
LEFT JOIN Pubblicazione c1 ON c1.riferimento = p1.hash 
WHERE p1.riferimento IS NULL
GROUP BY p1.autore, p1.hash, p1.data, p1.testo, ID, nome, mail
HAVING COUNT(c1.hash) = (
    SELECT MAX(cnt) FROM (
        SELECT COUNT(c2.hash) AS cnt 
        FROM Pubblicazione p2 JOIN Pubblicazione c2 ON p2.hash = c2.riferimento
        WHERE p2.autore = p1.autore AND p2.riferimento IS NULL
        GROUP BY p2.hash
    ) counter_result
);
/* count an average of posts for each blog */
SELECT AVG(pub_count) FROM(
    SELECT COUNT(p.hash) AS pub_count FROM Pubblicazione p GROUP BY blog
) as pub_counter;