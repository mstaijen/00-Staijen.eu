<?php
include 'config.php';

$id = (int)$_GET['id'];

$stmt = $conn->prepare("SELECT * FROM puzzels WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();

$result = $stmt->get_result();
$data = $result->fetch_assoc();

// opties ophalen
$eigenaren = [];
$uitgevers = [];

$res = $conn->query("SELECT DISTINCT eigenaar FROM puzzels");
while($r = $res->fetch_assoc()){
    $eigenaren[] = $r['eigenaar'];
}

$res = $conn->query("SELECT DISTINCT uitgever FROM puzzels");
while($r = $res->fetch_assoc()){
    $uitgevers[] = $r['uitgever'];
}

echo json_encode([
    "id" => $data['id'],
    "titel" => $data['titel'],
    "uitgever" => $data['uitgever'],
    "eigenaar" => $data['eigenaar'],
    "aantal_stukjes" => $data['aantal_stukjes'],
    "jaar" => $data['jaar'],
    "eigenaren" => $eigenaren,
    "uitgevers" => $uitgevers
]);