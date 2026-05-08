<?php
require_once __DIR__ . '../config/config.php';

$config = require __DIR__ . '../config/config.php';
$db = $config['db'][$config['env']];

$conn = new mysqli(
    $db['host'],
    $db['user'],
    $db['pass'],
    $db['name']
);

if ($conn->connect_error) {
    die("DB connectie mislukt: " . $conn->connect_error);
}

// artiesten ophalen
$artiesten = $conn->query("SELECT artiest_id, naam FROM artiesten ORDER BY naam");
?>

<!DOCTYPE html>
<html lang="nl">
<head>
<meta charset="UTF-8">
<title>Album Stamkaart</title>

<style>
body { font-family: Arial; padding: 20px; }
label { display:block; margin-top:10px; font-weight:bold; }
input, select { width: 300px; padding:5px; }
.track-row { margin-bottom:5px; }
button { margin-top:10px; }
hr { margin:20px 0; }
</style>

<script>
function addTrack() {
    const container = document.getElementById("tracks");

    const div = document.createElement("div");
    div.className = "track-row";

    div.innerHTML =
        'Pos <input type="number" name="pos[]" style="width:60px"> ' +
        'Titel <input type="text" name="track_titel[]" style="width:200px"> ' +
        'Duur <input type="text" name="duur[]" style="width:80px">';

    container.appendChild(div);
}
</script>

</head>
<body>

<h2>🎵 Album Stamkaart</h2>

<form method="post" action="album_save.php">

<label>CatalogusNr</label>
<input type="text" name="catalogus_nr">

<label>DiscogsID</label>
<input type="text" name="discogs_id">

<label>Artiest</label>
<select name="artiest_id">
    <?php while ($a = $artiesten->fetch_assoc()): ?>
        <option value="<?= $a['artiest_id'] ?>">
            <?= htmlspecialchars($a['naam']) ?>
        </option>
    <?php endwhile; ?>
</select>

<label>Titel</label>
<input type="text" name="titel">

<label>Jaar</label>
<input type="text" name="jaar">

<label>Label</label>
<input type="text" name="label">

<label>Genre</label>
<input type="text" name="genre">

<label>Drager</label>
<input type="text" name="drager">

<label>Aantal Dragers</label>
<input type="number" name="aantal_dragers">

<label>Laatste update</label>
<input type="date" name="laatste_update">

<hr>

<h3>🎼 Tracks</h3>

<div id="tracks">
    <div class="track-row">
        Pos <input type="number" name="pos[]" style="width:60px">
        Titel <input type="text" name="track_titel[]" style="width:200px">
        Duur <input type="text" name="duur[]" style="width:80px">
    </div>
</div>

<button type="button" onclick="addTrack()">+ track</button>

<hr>

<button type="submit">💾 Opslaan</button>

</form>

</body>
</html>