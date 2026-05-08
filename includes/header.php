<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$username = $_SESSION['username'] ?? 'Gast';
$role     = $_SESSION['role'] ?? '';
$isLogged = isset($_SESSION['user_id']);

// BELANGRIJK: vaste base url
if (!defined('BASE_URL')) {
    define('BASE_URL', '/projecten/00-Staijen.eu');
}
?>

<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>FamiliePortaal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- GLOBAL CSS -->
    <link rel="stylesheet" href="<?= BASE_URL ?>/public/css/style.css">

</head>

<body>

<header class="site-header">

    <div class="header-left">
        <h1>FamiliePortaal</h1>
    </div>

    <div class="header-center">
        <?php if ($isLogged): ?>
            Welkom, <strong><?= htmlspecialchars($username) ?></strong>
        <?php else: ?>
            Welkom, gast
        <?php endif; ?>
    </div>

    <div class="header-right">
        <?php if ($isLogged): ?>
            Rol: <strong><?= htmlspecialchars($role) ?></strong> |
            <a href="<?= BASE_URL ?>/public/logout.php">Logout</a>
        <?php endif; ?>
    </div>

</header>

<nav class="main-nav">
    <a href="<?= BASE_URL ?>/public/index.php">Home</a>
    <a href="<?= BASE_URL ?>/modules/muziek/index.php">Muziek</a>
    <a href="<?= BASE_URL ?>/modules/puzzels/index.php">Puzzels</a>
    <a href="<?= BASE_URL ?>/modules/gereedschap/index.php">Gereedschap</a>
    <a href="<?= BASE_URL ?>/modules/stamboom/index.php">Stamboom</a>
</nav>

<main class="content">