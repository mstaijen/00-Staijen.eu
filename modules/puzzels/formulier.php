<?php
include 'config.php';
include 'header.php';

if (!isset($user)) {
    echo "Geen gebruiker geladen";
    exit;
}

$isAdmin = ($_SESSION['role'] ?? '') === 'Admin';
?>

<style>
/* =========================
   SELF-SAME UI STYLE (zoals eigenaar/uitgever)
========================= */

.main-center {
    display: flex;
    justify-content: center;
    padding: 30px;
}

.box {
    width: 600px;
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1);
}

label {
    display: block;
    margin-top: 10px;
    font-weight: bold;
    font-size: 14px;
}

input, select {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
    border: 1px solid #ddd;
    border-radius: 6px;
    box-sizing: border-box;
}

hr {
    margin: 20px 0;
}

button {
    margin-top: 15px;
    padding: 10px 15px;
    border: none;
    border-radius: 6px;
    background: #2c3e50;
    color: white;
    cursor: pointer;
}

button:hover {
    background: #1abc9c;
}
</style>

<main class="page-content">

<div class="main-center">
<div class="box">

<h2>👤 Gebruiker bewerken</h2>

<form method="POST" action="gebruikers_update.php">

<input type="hidden" name="id" value="<?= $user['id'] ?>">

<label>Volledige naam</label>
<input type="text" name="volledigenaam"
       value="<?= htmlspecialchars($user['volledigenaam']) ?>">

<label>Email</label>
<input type="email" name="email"
       value="<?= htmlspecialchars($user['email']) ?>">

<label>Wachtwoord</label>
<input type="password" name="password" placeholder="Laat leeg = geen wijziging">

<?php if ($isAdmin): ?>

    <hr>

    <label>Username</label>
    <input type="text" name="username"
           value="<?= htmlspecialchars($user['username']) ?>">

    <label>Role</label>
    <select name="role">
        <option value="User" <?= $user['role']=='User'?'selected':'' ?>>User</option>
        <option value="Admin" <?= $user['role']=='Admin'?'selected':'' ?>>Admin</option>
        <option value="Gast" <?= $user['role']=='Gast'?'selected':'' ?>>Gast</option>
    </select>

    <label>Eigenaarscode</label>
    <input type="text" name="eigenaarscode"
           value="<?= htmlspecialchars($user['eigenaarscode']) ?>">

<?php endif; ?>

<button type="submit">Opslaan</button>

</form>

</div>
</div>

</main>

<?php include 'footer.php'; ?>