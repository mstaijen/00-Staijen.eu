<?php
$config = require __DIR__ . '/../config/config.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title><?= $config['app_name']; ?></title>
    <link rel="stylesheet" href="css/main.css">
</head>

<body>

<header class="header">

    <!-- LINKS: LOGO -->
    <div class="header-left">
        <div class="logo">
            LOGO
        </div>
    </div>

    <!-- RECHTS -->
    <div class="header-right">

        <!-- RIJ 1: TITEL -->
        <div class="header-title">
            <?= $config['app_name']; ?>
        </div>

        <!-- RIJ 2: MENU + LOGOUT -->
        <div class="header-nav">

            <nav class="menu">
                <a href="index.php">Home</a>
                <a href="dashboard.php">Dashboard</a>
                <a href="modules/muziek/index.php">Muziek</a>
                <a href="modules/puzzels/index.php">Puzzels</a>
                <a href="modules/gereedschap/index.php">Gereedschap</a>
            </nav>

            <div class="logout">
                <?php if (isset($_SESSION['user_id'])): ?>
                    <a href="logout.php">Uitloggen</a>
                <?php endif; ?>
            </div>

        </div>
    </div>

</header>

<main class="main">