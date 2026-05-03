<?php
require __DIR__ . '/config/database.php';

$username = "mstaijen";
$passwordHash = password_hash("CCG6a4o201905!", PASSWORD_DEFAULT);

$stmt = $pdo->prepare("INSERT INTO users (username, password, role) VALUES (?, ?, ?)");
$stmt->execute([$username, $passwordHash, 'admin']);

echo "Admin gebruiker aangemaakt!";