<?php
require_once __DIR__ . '/../config/bootstrap.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

/* ===== STATS ===== */
$musicCount = $pdo->query("SELECT COUNT(*) as t FROM albums")->fetch()['t'];
$lpCount    = $pdo->query("SELECT COUNT(*) as t FROM albums WHERE drager LIKE '%LP%'")->fetch()['t'];
$cdCount    = $pdo->query("SELECT COUNT(*) as t FROM albums WHERE drager LIKE '%CD%'")->fetch()['t'];

$puzzleCount = $pdo->query("SELECT COUNT(*) as t FROM puzzels")->fetch()['t'];
$toolCount   = 0;
$personCount = $pdo->query("SELECT COUNT(*) as t FROM people")->fetch()['t'];
?>


     <a href="<?= BASE_URL ?>/modules/puzzels/index.php" class="card">
        <h2>🎵 Muziek</h2>
        <p class="big"><?= $musicCount ?></p>
        <p>LP: <?= $lpCount ?></p>
        <p>CD: <?= $cdCount ?></p>
    </a>

 <a href="<?= BASE_URL ?>/modules/puzzels/index.php" class="card">
        <h2>🧩 Puzzels</h2>
        <p class="big"><?= $puzzleCount ?></p>
    </a>

    <a href="<?= BASE_URL ?>/modules/gereedschap/index.php" class="card">
        <h2>🛠️ Gereedschap</h2> 
        <p class="big">–</p>
<p><i>nog leeg</i></p>
    </a>

    <a href="<?= BASE_URL ?>/modules/stamboom/index.php" class="card">
        <h2>🌳 Stamboom</h2>
        <p class="big"><?= $personCount ?></p>
    </a>

</div>