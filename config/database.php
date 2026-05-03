<?php

$config = require __DIR__ . '/config.php';

$env = $config['env'];
$db  = $config['db'][$env];

$dsn = "mysql:host={$db['host']};dbname={$db['name']};charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $db['user'], $db['pass'], [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    echo "<p style='color:green;'>✅ Database verbonden ($env)</p>";

} catch (PDOException $e) {
    die("<p style='color:red;'>❌ Database fout ($env): " . $e->getMessage() . "</p>");
}