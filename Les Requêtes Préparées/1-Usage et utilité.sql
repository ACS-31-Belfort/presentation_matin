--PREPARE -->
--EXECUTE -->
--DEALLOCATE -->



exemple :
--l'API C MySQL, [PDO] pour le PHP.

<?php
try
{
	$email = 'jean.dupont@email.com';
	
	// On se connecte
	$bdd = new PDO('mysql:host=localhost;dbname=elevage', 'sdz', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ));
	
	// On prépare la requête
	$requete = $bdd->prepare("SELECT * FROM Client WHERE email = :email");

	// On lie la variable $email définie au-dessus au paramètre :email de la requête préparée
	$requete->bindValue(':email', $email, PDO::PARAM_STR);

	//On exécute la requête
	$requete->execute();
	
	// On récupère le résultat
	if ($requete->fetch())
	{
		echo 'Le client existe !';
	}
} catch (Exception $e)
{
	die('Erreur : ' . $e->getMessage());
}
