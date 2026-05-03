<?php
session_start();

if (isset($_SESSION['user_id'])) {
    header("Location: dashboard.php");
    exit;
}
?>

<h2>FamiliePortaal Login</h2>

<form method="post" action="login_process.php">
    <input type="text" name="username" placeholder="Gebruiker" required><br><br>
    <input type="password" name="password" placeholder="Wachtwoord" required><br><br>
    <button type="submit">Login</button>
</form>

<?php if (isset($_GET['error'])): ?>
<p style="color:red;">Login mislukt</p>
<?php endif; ?>