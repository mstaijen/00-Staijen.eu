<?php
require_once '../../config/database.php';
require_once '../../includes/auth.php';

requireLogin();

$id = $_GET['id'];

$stmt = $pdo->prepare("SELECT * FROM albums WHERE id = ?");
$stmt->execute([$id]);
$album = $stmt->fetch();

$stmt = $pdo->prepare("SELECT * FROM tracks WHERE album_id = ? ORDER BY positie");
$stmt->execute([$id]);
$tracks = $stmt->fetchAll();
?>

<h1>Stamkaart</h1>

<h2><?= $album['artiest'] ?> - <?= $album['titel'] ?></h2>

<p><b>CatalogusNr:</b> <?= $album['catalogus_nr'] ?></p>
<p><b>DiscogsID:</b> <?= $album['discogs_id'] ?></p>
<p><b>Jaar:</b> <?= $album['jaar'] ?></p>
<p><b>Label:</b> <?= $album['label'] ?></p>
<p><b>Genre:</b> <?= $album['genre'] ?></p>
<p><b>Status:</b> <?= $album['status'] ?></p>

<hr>

<h3>Tracks</h3>

<table border="1">
    <tr>
        <th>#</th>
        <th>Artiest</th>
        <th>Titel</th>
        <th>Duur</th>
    </tr>

    <?php foreach ($tracks as $track): ?>
        <tr>
            <td><?= $track['positie'] ?></td>
            <td><?= $track['artiest'] ?></td>
            <td><?= $track['titel'] ?></td>
            <td><?= $track['duur'] ?></td>
        </tr>
    <?php endforeach; ?>
</table>