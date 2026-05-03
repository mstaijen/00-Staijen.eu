<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: dashboard.php");
    exit;
}
?>

<h1>Welkom bij FamiliePortaal</h1>

<p>Ingelogd als: <?php echo $_SESSION['username']; ?></p>
<p>Rol: <?php echo $_SESSION['role']; ?></p>

<a href="logout.php">Logout</a>