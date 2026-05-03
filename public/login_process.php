<?php

session_start();

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../config/config.php';

// Alleen POST toestaan
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: login.php");
    exit;
}

// Input ophalen + trimmen
$username = trim($_POST['username'] ?? '');
$password = $_POST['password'] ?? '';

// Validatie
if ($username === '' || $password === '') {
    header("Location: login.php?error=empty");
    exit;
}

// User ophalen
$stmt = $pdo->prepare("SELECT * FROM users WHERE username = :username LIMIT 1");
$stmt->execute(['username' => $username]);
$user = $stmt->fetch();

// Check user + password
if (!$user || !password_verify($password, $user['password'])) {
    header("Location: login.php?error=invalid");
    exit;
}

// Sessiebeveiliging
session_regenerate_id(true);

// Session opslaan
$_SESSION['user_id']   = $user['id'];
$_SESSION['username']  = $user['username'];
$_SESSION['role']      = $user['role'];

// Redirect naar start van app
header("Location: index.php");
exit;