<?php

$config = require __DIR__ . '/config.php';
$db = $config['db'];

$env = $config['env'];

if ($env === 'live') {
    $host = $db['host_live'];
    $user = $db['user_live'];
    $pass = $db['pass_live'];
} else {
    $host = $db['host_local'];
    $user = $db['user_local'];
    $pass = $db['pass_local'];
}

$name = $db['name'];

$dsn = "mysql:host=$host;dbname=$name;charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false
    ]);
} catch (PDOException $e) {
    die("Database connectie mislukt.");
}