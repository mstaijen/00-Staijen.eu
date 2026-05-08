<?php

$config = require __DIR__ . '/../../config/config.php';


if ($conn->connect_error) {
    die("Database connectie mislukt: " . $conn->connect_error);
}

$artiesten = $conn->query("SELECT artiest_id, naam FROM artiesten ORDER BY naam");
?>

<h2>Album Stamkaart</h2>

<form method="post" action="album_save.php">

<label>CatalogusNr</label>
<input type="text" name="catalogus_nr"><br>

<label>DiscogsID</label>
<input type="text" name="discogs_id"><br>

<label>Artiest</label>
<select name="artiest_id">
  <?php while($a = $artiesten->fetch_assoc()): ?>
    <option value="<?= $a['artiest_id'] ?>"><?= $a['naam'] ?></option>
  <?php endwhile; ?>
</select><br>

<label>Titel</label>
<input type="text" name="titel"><br>

<label>Jaar</label>
<input type="text" name="jaar"><br>

<label>Label</label>
<input type="text" name="label"><br>

<label>Genre</label>
<input type="text" name="genre"><br>

<label>Drager</label>
<input type="text" name="drager"><br>

<label>Aantal Dragers</label>
<input type="text" name="aantal_dragers"><br>

<label>Laatste update</label>
<input type="date" name="laatste_update"><br>

<hr>

<h3>Tracks</h3>

<div id="tracks">
  <div>
    Pos <input type="number" name="pos[]">
    Titel <input type="text" name="track_titel[]">
    Duur <input type="text" name="duur[]">
  </div>
</div>

<button type="button" onclick="addTrack()">+ track</button>

<br><br>

<button type="submit">Opslaan</button>

</form>

<script>
function addTrack() {
  const div = document.createElement("div");
  div.innerHTML =
    'Pos <input type="number" name="pos[]"> ' +
    'Titel <input type="text" name="track_titel[]"> ' +
    'Duur <input type="text" name="duur[]">';
  document.getElementById("tracks").appendChild(div);
}
</script>