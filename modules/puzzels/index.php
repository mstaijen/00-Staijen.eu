<?php
/*
|--------------------------------------------------------------------------
| MODULE: Puzzels
| TYPE: Index
| BESTAND: index.php
|--------------------------------------------------------------------------
*/

require_once __DIR__ . '/../../config/bootstrap.php';
require_once __DIR__ . '/../../includes/header.php';

global $pdo;

$slideLimit = 8;

/* SLIDESHOW */
$sqlSlides = "
    SELECT
        p.*,
        e.eigenaar AS eigenaar_naam,
        eo.eigenaar AS uitgeleend_aan_naam
    FROM puzzels p
    LEFT JOIN eigenaar e ON p.eigenaar_id = e.eigenaar_id
    LEFT JOIN eigenaar eo ON p.uitgeleend_aan = eo.eigenaar_id
    ORDER BY p.id DESC
    LIMIT $slideLimit
";

$slides = $pdo->query($sqlSlides)->fetchAll(PDO::FETCH_ASSOC);

/* ALLE PUZZELS */
$sqlAlle = "
    SELECT *
    FROM puzzels
    ORDER BY titel ASC
";

$allePuzzels = $pdo->query($sqlAlle)->fetchAll(PDO::FETCH_ASSOC);

/* AFBEELDING HELPER */
function puzzelAfbeelding($bestand)
{
    $pad = __DIR__ . '/img/puzzels/';
    $url = BASE_URL . '/modules/puzzels/img/puzzels/';

    if (!empty($bestand) && file_exists($pad . $bestand)) {
        return $url . rawurlencode($bestand);
    }

    return BASE_URL . '/modules/puzzels/img/geen-afbeelding.png';
}
?>

<link rel="stylesheet" href="<?= BASE_URL ?>/modules/puzzels/css/puzzels.css?v=22">

<!-- ================= SLIDESHOW ================= -->
<section class="slideshow-section">

    <div class="slider-wrapper">
        <div class="slider-window">
            <div class="slider-track" id="track">

                <?php foreach ($slides as $p): ?>
                    <?php $img = puzzelAfbeelding($p['afbeelding']); ?>

                    <div class="slide">

                        <img src="<?= $img ?>" class="popup-image" alt="<?= htmlspecialchars($p['titel']) ?>">

                        <div class="slide-info">
                            <h2><?= htmlspecialchars($p['titel']) ?></h2>

                            <p>Status: <?= htmlspecialchars($p['status'] ?? '-') ?></p>
                        </div>

                    </div>

                <?php endforeach; ?>

            </div>
        </div>
    </div>

</section>

<!-- ================= OVERZICHT ================= -->
<main class="content">

    <div class="overzicht-header">
        <h2>Alle puzzels</h2>

        <a href="puzzel_edit_data.php" class="btn-toevoegen">
            + Toevoegen
        </a>
    </div>

    <div class="puzzel-grid">

        <?php foreach ($allePuzzels as $p): ?>
            <?php $img = puzzelAfbeelding($p['afbeelding']); ?>

            <div class="puzzel-card">

                <img src="<?= $img ?>" class="popup-image" alt="<?= htmlspecialchars($p['titel']) ?>">

                <div class="puzzel-info">
                    <h2><?= htmlspecialchars($p['titel']) ?></h2>

                    <p>Status: <?= htmlspecialchars($p['status'] ?? '-') ?></p>
                </div>
<p>Eigenaar: <?= htmlspecialchars($p['eigenaar_naam'] ?? '-') ?></p>

<p>
<?= !empty($p['uitgeleend_aan_naam'])
    ? 'Uitgeleend aan: ' . htmlspecialchars($p['uitgeleend_aan_naam'])
    : '&nbsp;' ?>
</p>


                <div class="card-buttons">
                    <a href="puzzel_edit_data.php?id=<?= $p['id'] ?>" class="btn-edit">Muteren</a>

                    <a href="puzzel_verwijderen.php?id=<?= $p['id'] ?>"
                       class="btn-delete"
                       onclick="return confirm('Weet je het zeker?')">
                        Verwijderen
                    </a>
                </div>

            </div>
        <?php endforeach; ?>

    </div>

</main>

<!-- POPUP -->
<div id="imagePopup" class="popup-overlay">
    <span class="popup-close">&times;</span>
    <img id="popupImage" class="popup-content">
</div>
<script>
const track = document.getElementById('track');
const slides = document.querySelectorAll('.slide');

const visible = 5;
let index = 0;

/* clones (exact zoals jij het had in werkende fase) */
for (let i = 0; i < visible; i++) {
    if (slides[i]) {
        track.appendChild(slides[i].cloneNode(true));
    }
}

const allSlides = document.querySelectorAll('.slide');

function moveSlider() {

    const slideWidth = allSlides[0].offsetWidth;

    index++;

    track.style.transition = "transform 0.6s ease";
    track.style.transform = `translateX(-${index * slideWidth}px)`;

    // simpele reset op originele set
    if (index >= slides.length) {

        setTimeout(() => {
            track.style.transition = "none";
            index = 0;
            track.style.transform = "translateX(0)";
        }, 600);
    }
}

setInterval(moveSlider, 3000);
</script>

<?php require_once __DIR__ . '/../../includes/footer.php'; ?>