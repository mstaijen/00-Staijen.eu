<?php
require_once '../../config/database.php';
require_once '../../includes/auth.php';

requireLogin();

$stmt = $pdo->query("
    SELECT a.*, 
           COUNT(t.id) AS track_count
    FROM albums a
    LEFT JOIN tracks t ON t.album_id = a.id
    GROUP BY a.id
    ORDER BY a.artiest, a.titel
");

$albums = $stmt->fetchAll();
?>

<h1>Muziekdatabase</h1>

<table border="1" cellpadding="5">
    <tr>
        <th>CatalogusNr</th>
        <th>Artiest</th>
        <th>Titel</th>
        <th>Jaar</th>
        <th>Tracks</th>
        <th>Status</th>
        <th>Actie</th>
    </tr>

    <?php foreach ($albums as $album): ?>
        <tr>
            <td><?= $album['catalogus_nr'] ?></td>
            <td><?= $album['artiest'] ?></td>
            <td><?= $album['titel'] ?></td>
            <td><?= $album['jaar'] ?></td>
            <td><?= $album['track_count'] ?></td>
            <td><?= $album['status'] ?></td>
            <td>
                <a href="album.php?id=<?= $album['id'] ?>">Open</a>
            </td>
        </tr>
    <?php endforeach; ?>
</table>