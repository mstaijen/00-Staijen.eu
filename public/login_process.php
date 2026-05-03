<?php
require_once '../config/database.php';
require_once '../config/config.php';

session_start();

// Alleen POST toestaan
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: /public/login.php");
    exit;
}

// Input veilig ophalen
$username = trim($_POST['username'] ?? '');
$password = $_POST['password'] ?? '';

// Basis validatie
if ($username === '' || $password === '') {
    header("Location: /public/login.php?error=empty");
    exit;
}

// User ophalen uit database
$stmt = $pdo->prepare("SELECT * FROM users WHERE username = :username LIMIT 1");
$stmt->execute(['username' => $username]);
$user = $stmt->fetch();

// Login check
if (!$user || !password_verify($password, $user['password'])) {
    header("Location: /public/login.php?error=invalid");
    exit;
}

// Session hardening (belangrijk tegen session fixation)
session_regenerate_id(true);

// Session data opslaan
$_SESSION['user_id']   = $user['id'];
$_SESSION['username']  = $user['username'];
$_SESSION['role']      = $user['role'];
$_SESSION['family_id'] = $user['family_id'] ?? null;

// Optioneel: laatste login tijd bijhouden
$stmt = $pdo->prepare("UPDATE users SET created_at = created_at WHERE id = ?");
$stmt->execute([$user['id']]);

// Redirect naar start van app
header("Location: /public/index.php");
exit;