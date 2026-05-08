<?php

if (!isset($config)) {
    $config = require __DIR__ . '/config.php';
}

$env = $config['env'];
$db  = $config['db'][$env];

$dsn = "mysql:host={$db['host']};dbname={$db['name']};charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $db['user'], $db['pass'], [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    die("DB fout ($env): " . $e->getMessage());
}