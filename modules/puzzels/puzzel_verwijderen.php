<?php
session_start();
include 'config.php';

if (!isset($_SESSION['user_logged_in'])) {
    header("Location: login.php");
    exit;
}

$id = (int)$_GET['id'];

$stmt = $conn->prepare("DELETE FROM puzzels WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();

header("Location: puzzels_overzicht.php");
exit;