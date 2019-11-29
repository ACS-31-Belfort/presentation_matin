$(function () {

    // Ajout d'événement lors de l'envoi du formulaire
    $('#contact-form').submit(function (e) {

        // Enlever le comportement par défaut lors de l'envoi
        e.preventDefault();

        // Mettre à zéro les messages d'erreur
        $('.error').empty();

        // Récupérer le contenu du formulaire dans une variable
        let postdata = $('#contact-form').serialize();

        // AJAX
        $.ajax({
            // type de requête (get ou post)
            type: 'POST',
            // url vers lequel on envoie les données : fichier ciblé
            url: 'contact.php',
            // type de données à recevoir
            data: postdata,
            dataType: 'json',
            // si succès -> fonction à exécuter
            success: function(result) {
                // Si nous n'avons pas de messages d'erreur
                if (result.isSuccess) {
                    $("#contact-form").append("<p class='msg'>Votre message a été envoyé.</p>");
                    // Remettre les valeurs à zéro
                    $("#contact-form")[0].reset();
                }
                else {
                    // Afficher les messages d'erreur
                    $("#firstname + .error").html(result.firstnameError);
                    $("#lastname + .error").html(result.lastnameError);
                }

            }

        });


    });


})