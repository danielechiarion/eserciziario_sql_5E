/* select vegetarian menu from the menu
of a specific day */
SELECT COUNT(piatto_menu_ordine.ordine) AS ordini_vegetariani FROM piatto_menu_ordine JOIN ordine ON piatto_menu_ordine.ordine = ordine.ID WHERE menu != "vegetariano" AND ordine.giorno = "2023-03-12";
/* select the dish most most served */
SELECT piatto,COUNT(ordine) AS conteggio FROM piatto_menu_ordine GROUP BY piatto ORDER BY conteggio DESC LIMIT 1;
/* ingredient most present in the dish */
SELECT ingrediente,COUNT(piatto) AS conteggio FROM piatto-menu GROUP BY ingrediente ORDER BY conteggio DESC LIMIT 1;