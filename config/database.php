<?php

$config = require __DIR__ . '/config.php';
$db = $config['db'];

$dsn = "mysql:host={$db['host']};dbname={$db['name']};charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $db['user'], $db['pass'], [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    // ✅ succesmelding (tijdelijk voor debug)
    echo "<p style='color:green;'>✅ Database connectie GELUKT</p>";

} catch (PDOException $e) {

    // ❌ foutmelding (met reden)
    die("<p style='color:red;'>❌ Database connectie MISLUKT: " . $e->getMessage() . "</p>");
}