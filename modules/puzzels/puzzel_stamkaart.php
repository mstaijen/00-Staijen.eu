<?php
include 'config.php';
include 'header.php';

$id = (int)($_GET['id'] ?? 0);

/* =========================
   PUZZEL OPHALEN
========================= */
$stmt = $conn->prepare("
    SELECT *
    FROM puzzels
    WHERE id = ?
");
$stmt->bind_param("i", $id);
$stmt->execute();
$puzzel = $stmt->get_result()->fetch_assoc();

if (!$puzzel) die("Puzzel niet gevonden");

/* =========================
   EIGENAARS
========================= */
$eigenaars = $conn->query("
    SELECT id, eigenaarcode
    FROM eigenaar
    ORDER BY eigenaarcode
")->fetch_all(MYSQLI_ASSOC);

/* =========================
   STATUS
========================= */
$status = $puzzel['status'] ?? 'beschikbaar';

/* =========================
   OPSLAAN
========================= */
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $titel = $_POST['titel'];
    $uitgever = $_POST['uitgever'];
    $jaar = $_POST['jaar'] ?: null;
    $aantal = $_POST['aantal_stukjes'];
    $statusPOST = $_POST['status'];
    $eigenaar_id = $_POST['eigenaar_id'];

    $uitgeleend_aan = $_POST['gebruiker_id'] ?? null;

    /* =========================
       LOGICA
    ========================== */
    if ($statusPOST === 'beschikbaar') {
        $uitgeleend_aan = null;
    }

    /* =========================
       UPDATE PUZZELS
    ========================== */
    $upd = $conn->prepare("
        UPDATE puzzels
        SET titel=?,
            uitgever=?,
            jaar=?,
            aantal_stukjes=?,
            status=?,
            eigenaar_id=?,
            uitgeleend_aan=?,
            uitgeleend_datum=CASE
                WHEN ?='uitgeleend' THEN NOW()
                ELSE uitgeleend_datum
            END,
            mutatie_datum=NOW()
        WHERE id=?
    ");

    $upd->bind_param(
        "sssissisi",
        $titel,
        $uitgever,
        $jaar,
        $aantal,
        $statusPOST,
        $eigenaar_id,
        $uitgeleend_aan,
        $statusPOST,
        $id
    );

    $upd->execute();

    /* =========================
       LOG (ALLEEN GELEGD)
    ========================== */
    if ($statusPOST === 'gelegd') {

        $log = $conn->prepare("
    INSERT INTO puzzel_log (puzzel_id, eigenaar_id, status, start_datum)
    VALUES (?, ?, ?, NOW())
");

$log->bind_param("iis", $id, $eigenaar_id, $statusPOST);
$log->execute();
    }

    header("Location: puzzel_stamkaart.php?id=$id");
    exit;
}

/* =========================
   IMAGE
========================= */
$img = "img/puzzels/" . ($puzzel['afbeelding'] ?? '');
if (!$puzzel['afbeelding'] || !file_exists($img)) {
    $img = "img/placeholder.png";
}
?>

<style>
.container {
    max-width: 900px;
    margin: 20px auto;
    background: #fff;
    padding: 20px;
    border-radius: 10px;
}

.layout {
    display: flex;
    gap: 25px;
}

.img-box {
    flex: 0 0 350px;
}

.img-box img {
    width: 100%;
    border-radius: 10px;
}

.info {
    flex: 1;
}

.row {
    margin-bottom: 10px;
    display: flex;
    align-items: center;
}

.label {
    width: 150px;
    font-weight: bold;
}

input, select {
    flex: 1;
    padding: 6px;
}

/* dynamisch veld */
#extraBox {
    margin-top: 10px;
    padding: 10px;
    border-left: 4px solid #3498db;
    background: #f8f9fa;
    border-radius: 6px;
}

.bottom-actions {
    margin-top: 20px;
    display: flex;
    justify-content: flex-end;
    gap: 10px;
}

.btn {
    padding: 8px 12px;
    border-radius: 5px;
    color: white;
    border: none;
    cursor: pointer;
}

.green { background:#2ecc71; }
.red { background:#e74c3c; }
</style>

<main>
<div class="container">

<h2><?= htmlspecialchars($puzzel['titel']) ?></h2>

<div class="layout">

<!-- AFBEELDING -->
<div class="img-box">
    <img src="<?= $img ?>">
</div>

<div class="info">

<form method="POST">

<!-- TITEL -->
<div class="row">
    <div class="label">Titel</div>
    <input name="titel" value="<?= htmlspecialchars($puzzel['titel']) ?>">
</div>

<!-- UITGEVER -->
<div class="row">
    <div class="label">Uitgever</div>
    <input name="uitgever" value="<?= htmlspecialchars($puzzel['uitgever']) ?>">
</div>

<!-- JAAR -->
<div class="row">
    <div class="label">Jaar</div>
    <input name="jaar" value="<?= htmlspecialchars($puzzel['jaar']) ?>">
</div>

<!-- STUKJES -->
<div class="row">
    <div class="label">Stukjes</div>
    <input name="aantal_stukjes" value="<?= htmlspecialchars($puzzel['aantal_stukjes']) ?>">
</div>

<!-- EIGENAAR -->
<div class="row">
    <div class="label">Eigenaar</div>
    <select name="eigenaar_id">
        <?php foreach ($eigenaars as $e): ?>
            <option value="<?= $e['id'] ?>"
                <?= $puzzel['eigenaar_id'] == $e['id'] ? 'selected' : '' ?>>
                <?= htmlspecialchars($e['eigenaarcode']) ?>
            </option>
        <?php endforeach; ?>
    </select>
</div>

<!-- STATUS -->
<div class="row">
    <div class="label">Status</div>
    <select name="status" id="status">
        <option value="beschikbaar" <?= $status=='beschikbaar'?'selected':'' ?>>Beschikbaar</option>
        <option value="uitgeleend" <?= $status=='uitgeleend'?'selected':'' ?>>Uitgeleend</option>
        <option value="gelegd" <?= $status=='gelegd'?'selected':'' ?>>Gelegd</option>
    </select>
</div>

<!-- EXTRA BOX -->
<div class="row" id="extraBox" style="display:none;">
    <div class="label" id="extraLabel">Gebruiker</div>

    <select name="gebruiker_id">
        <option value="">-- kies --</option>
        <?php foreach ($eigenaars as $e): ?>
            <option value="<?= $e['id'] ?>"
                <?= ($puzzel['uitgeleend_aan'] ?? null) == $e['id'] ? 'selected' : '' ?>>
                <?= htmlspecialchars($e['eigenaarcode']) ?>
            </option>
        <?php endforeach; ?>
    </select>
</div>

<!-- KNOPPEN -->
<div class="bottom-actions">
    <button class="btn green">Opslaan</button>
    <a href="puzzels_overzicht.php" class="btn red">Terug</a>
</div>

</form>

</div>
</div>

</div>
</main>

<script>
function toggleExtra() {

    const status = document.getElementById('status').value;
    const box = document.getElementById('extraBox');
    const label = document.getElementById('extraLabel');

    if (status === 'uitgeleend') {
        box.style.display = 'flex';
        label.innerText = 'Uitgeleend aan:';
    }
    else if (status === 'gelegd') {
        box.style.display = 'flex';
        label.innerText = 'Gelegd door:';
    }
    else {
        box.style.display = 'none';
    }
}

document.getElementById('status').addEventListener('change', toggleExtra);
toggleExtra();
</script>

<?php include 'footer.php'; ?>