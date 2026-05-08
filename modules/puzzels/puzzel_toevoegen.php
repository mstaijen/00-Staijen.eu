<?php
require_once __DIR__ . '/../../config/bootstrap.php';
require_once __DIR__ . '/../../includes/header.php';

global $pdo;

$message = "";
$message_type = "success";

// -----------------------------
// DROPDOWNS
// -----------------------------
$eigenaars = [];
$stmt = $pdo->query("SELECT eigenaarcode FROM eigenaar ORDER BY eigenaarcode ASC");
$eigenaars = $stmt->fetchAll(PDO::FETCH_COLUMN);

$uitgevers = [];
$stmt = $pdo->query("SELECT `Naam uitgever` FROM uitgever WHERE `Naam uitgever` != '' ORDER BY `Naam uitgever` ASC");
$uitgevers = $stmt->fetchAll(PDO::FETCH_COLUMN);

// -----------------------------
// OPSLAAN
// -----------------------------
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $titel    = trim($_POST['titel'] ?? '');
    $uitgever = trim($_POST['uitgever'] ?? '');
    $eigenaar = trim($_POST['eigenaar'] ?? '');
    $aantal   = trim($_POST['aantal_stukjes'] ?? '');
    $jaar     = !empty($_POST['jaar']) ? (int)$_POST['jaar'] : null;
    $compleet = isset($_POST['compleet']) ? 1 : 0;

    $afbeelding_pad = null;

    if (!empty($_FILES['afbeelding']['name'])) {

        $map = __DIR__ . "/../../public/img/puzzels/";
        if (!is_dir($map)) mkdir($map, 0777, true);

        $ext = strtolower(pathinfo($_FILES['afbeelding']['name'], PATHINFO_EXTENSION));

        $safe = preg_replace('/[^a-zA-Z0-9_-]/', '_', $titel . "_" . $uitgever);
        $file = $safe . "." . $ext;

        move_uploaded_file($_FILES['afbeelding']['tmp_name'], $map . $file);

        $afbeelding_pad = $file;
    }

    if ($titel && $uitgever && $eigenaar && $aantal) {

        $stmt = $pdo->prepare("
            INSERT INTO puzzels 
            (titel, uitgever, eigenaar, aantal_stukjes, jaar, compleet, afbeelding)
            VALUES (:titel, :uitgever, :eigenaar, :aantal, :jaar, :compleet, :afbeelding)
        ");

        $stmt->execute([
            'titel' => $titel,
            'uitgever' => $uitgever,
            'eigenaar' => $eigenaar,
            'aantal' => $aantal,
            'jaar' => $jaar,
            'compleet' => $compleet,
            'afbeelding' => $afbeelding_pad
        ]);

        $message = "Puzzel succesvol toegevoegd!";
    } else {
        $message = "Vul alle verplichte velden in.";
        $message_type = "error";
    }
}
?>