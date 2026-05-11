<?php

require_once __DIR__ . '/../../config/bootstrap.php';
require_once __DIR__ . '/../../includes/header.php';

global $pdo;

/* =========================
   INSTELBARE SLIDESHOW LIMIT
========================= */
$slideLimit = 6;

/* =========================
   SLIDESHOW (laatste items)
========================= */
$sqlSlides = "
    SELECT 
        p.*,
        e.eigenaar AS eigenaar_naam,
        eo.eigenaar AS uitgeleend_aan_naam
    FROM puzzels p
    LEFT JOIN eigenaar e ON p.eigenaar_id = e.eigenaar_id
    LEFT JOIN eigenaar eo ON p.uitgeleend_aan = eo.eigenaar_id
    ORDER BY p.id DESC
    LIMIT :limit
";

$stmt = $pdo->prepare($sqlSlides);
$stmt->bindValue(':limit', (int)$slideLimit, PDO::PARAM_INT);
$stmt->execute();
$slides = $stmt->fetchAll(PDO::FETCH_ASSOC);


/* =========================
   ALLE PUZZELS (SORTEER OP TITEL)
========================= */
$sqlAlle = "
    SELECT 
        p.*,
        e.eigenaar AS eigenaar_naam,
        eo.eigenaar AS uitgeleend_aan_naam
    FROM puzzels p
    LEFT JOIN eigenaar e ON p.eigenaar_id = e.eigenaar_id
    LEFT JOIN eigenaar eo ON p.uitgeleend_aan = eo.eigenaar_id
    ORDER BY p.titel ASC
";

$allePuzzels = $pdo->query($sqlAlle)->fetchAll(PDO::FETCH_ASSOC);


/* =========================
   IMAGE HELPER (BULLETPROOF)
========================= */
function puzzelAfbeelding($file)
{
    $base = BASE_URL . "/modules/puzzels/img/puzzels/";

    if (!empty($file)) {
        return $base . htmlspecialchars($file);
    }

    return $base . "no-image.png";
}

?>

<link rel="stylesheet" href="<?= BASE_URL ?>/modules/puzzels/css/puzzels.css?v=7">


<!-- =======================
     SLIDESHOW
======================= -->
<section class="slideshow-section">

    <div class="slider-wrapper">
        <div class="slider-window">
            <div class="slider-track" id="track">

                <?php foreach ($slides as $p): ?>
                    <div class="slide">

                        <img src="<?= puzzelAfbeelding($p['afbeelding']) ?>">

                        <div class="slide-info">

                            <h2><?= htmlspecialchars($p['titel'] ?? '') ?></h2>

                            <p>Eigenaar: <?= htmlspecialchars($p['eigenaar_naam'] ?? '') ?></p>

                            <p>
                                Status:
                                <span class="status-tekst <?= htmlspecialchars($p['status']) ?>">
                                    <?= ucfirst($p['status'] ?? '') ?>
                                </span>
                            </p>

                            <?php if ($p['status'] === 'uitgeleend' && !empty($p['uitgeleend_aan_naam'])): ?>
                                <p>
                                    Uitgeleend aan:
                                    <?= htmlspecialchars($p['uitgeleend_aan_naam']) ?>
                                </p>
                            <?php endif; ?>

                        </div>

                    </div>
                <?php endforeach; ?>

            </div>
        </div>
    </div>

</section>


<!-- =======================
     OVERZICHT
======================= -->
<main class="content">

    <div class="puzzel-overzicht">

        <h3>Alle puzzels</h3>

        <div class="puzzel-grid">

            <?php foreach ($allePuzzels as $p): ?>
                <div class="puzzel-card">

                    <img src="<?= puzzelAfbeelding($p['afbeelding']) ?>">

                    <h2><?= htmlspecialchars($p['titel'] ?? '') ?></h2>

                    <p>Eigenaar: <?= htmlspecialchars($p['eigenaar_naam'] ?? '') ?></p>

                    <p>
                        Status:
                        <span class="status-tekst <?= htmlspecialchars($p['status']) ?>">
                            <?= ucfirst($p['status'] ?? '') ?>
                        </span>
                    </p>

                    <?php if ($p['status'] === 'uitgeleend' && !empty($p['uitgeleend_aan_naam'])): ?>
                        <p>
                            Uitgeleend aan:
                            <?= htmlspecialchars($p['uitgeleend_aan_naam']) ?>
                        </p>
                    <?php endif; ?>

                </div>
            <?php endforeach; ?>

        </div>

    </div>

</main>


<!-- =======================
     SLIDER SCRIPT (blijft intact)
======================= -->
<script>
const track = document.getElementById('track');
const slides = document.querySelectorAll('.slide');

const visible = <?= (int)$slideLimit ?>;
let index = 0;

for (let i = 0; i < visible; i++) {
    if (slides[i]) {
        const clone = slides[i].cloneNode(true);
        track.appendChild(clone);
    }
}

function move() {

    index++;

    const slideWidth = slides[0].offsetWidth + 10;

    track.style.transition = "transform 0.6s ease";
    track.style.transform = `translateX(-${index * slideWidth}px)`;

    if (index >= slides.length) {
        setTimeout(() => {
            track.style.transition = "none";
            index = 0;
            track.style.transform = `translateX(0px)`;
        }, 600);
    }
}

setInterval(move, 3000);
</script>

<?php require_once __DIR__ . '/../../includes/footer.php'; ?>