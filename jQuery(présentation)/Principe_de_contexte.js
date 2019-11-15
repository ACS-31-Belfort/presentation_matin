


let sideBar = $("#sideBar");
sideBar.find("input");



$("#sideBar").find("input"); // 16% moins efficace
$("input", $("#sideBar")); // 23% moins efficace
$("#sideBar").children("input"); // 50% moins efficace
$("#sideBar > input"); // 70% moins efficace
$("#sideBar input"); // 77% moins efficace

// Utilisation du cache
let sideBar = $("#sideBar");
$("input", sideBar); // 5 à 10% moins efficace

