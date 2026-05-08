<?php

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

if (!defined('BASE_PATH')) {
    define('BASE_PATH', dirname(__DIR__));
}

if (!defined('PUBLIC_PATH')) {
    define('PUBLIC_PATH', BASE_PATH . '/public');
}

/* CONFIG laden */
$config = require __DIR__ . '/config.php';

/* DATABASE laden (zelfde map!) */
require_once __DIR__ . '/database.php';