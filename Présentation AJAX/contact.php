<?php

$values = array("firstname" => "", "lastname" => "", "firstnameError" => "", "lastnameError" => "", "isSuccess" => false);


if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $values["firstname"] = $_POST["firstname"];
    $values["lastname"] = $_POST["lastname"];
    $values["isSuccess"] = true;

    if (empty($values["firstname"])) {
        $values["firstnameError"] = "Veuillez renseigner votre prénom";
        $values["isSuccess"] = false;
    }

    if (empty($values["lastname"])) {
        $values["lastnameError"] = "Veuillez renseigner votre nom";
        $values["isSuccess"] = false;
    } 

    echo json_encode($values);
}

?>


