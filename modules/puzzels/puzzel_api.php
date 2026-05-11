<?php
/*
|--------------------------------------------------------------------------
| MODULE: Puzzels
| TYPE: API (JSON)
| BESTAND: puzzel_api.php
|--------------------------------------------------------------------------
*/

require_once __DIR__ . '/../../config/bootstrap.php';

global $pdo;

$id = (int)($_GET['id'] ?? 0);

/* lege nieuwe puzzel */
if ($id === 0) {
    echo json_encode([
        "id" => 0,
        "titel" => "",
        "uitgever" => "",
        "aantal_stukjes" => "",
        "jaar" => ""
    ]);
    exit;
}

/* bestaande puzzel */
$stmt = $pdo->prepare("SELECT * FROM puzzels WHERE id = ?");
$stmt->execute([$id]);

$data = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode($data);