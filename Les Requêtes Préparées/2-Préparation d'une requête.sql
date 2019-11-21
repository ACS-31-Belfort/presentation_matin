PREPARE nom_requete
FROM 'requete_preparable';

exemples;

-- Sans paramètre
PREPARE select_table
FROM 'SELECT * FROM table';

-- Avec un paramètre
PREPARE select_client
FROM 'SELECT * FROM Client WHERE email = ?';

-- Avec deux paramètres
PREPARE select_adoption
FROM 'SELECT * FROM Adoption WHERE client_id = ? AND animal_id = ?';

--Plusieurs choses importantes;

--Le nom de la requête préparée ne doit pas être entre guillemets. Par contre, la requête à préparer doit l'être. 
--La requête à préparer doit être passée comme une chaîne de caractères.
--Que le paramètre soit un nombre (client_id = ?) ou une chaîne de caractères (email = ?), 
--cela ne change rien. On ne met pas de guillemets autour du ? à l'intérieur de la requête à préparer.
--La chaîne de caractères contenant la requête à préparer ne peut contenir qu'une seule requête (et non plusieurs séparées par un ;).
--Les paramètres ne peuvent représenter que des données, des valeurs, pas des noms de tables ou de colonnes ni des morceaux de commandes SQL.

--Comme la requête à préparer est donnée sous forme de chaîne de caractères, 
--il est également possible d'utiliser une variable utilisateur dans laquelle on enregistre tout ou partie de la requête à préparer.


exemple;

SET @req = 'SELECT * FROM Racetable';
PREPARE select_table
FROM @req;

SET @colonne = 'nom';
SET @req_animal = CONCAT('SELECT ', @colonne, ' FROM Animal WHERE id = ?');
PREPARE select_col_animal
FROM @req_animal;

--Par contre, il n'est pas possible de mettre directement la fonction CONCAT()  dans la clause FROM.
--Si vous donnez à une requête préparée le nom d'une requête préparée déjà existante, cette dernière sera supprimée et remplacée par la nouvelle.