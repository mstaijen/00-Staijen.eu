<?php

require_once __DIR__ . '/../../config/bootstrap.php';
require_once __DIR__ . '/../../includes/header.php';

global $pdo;

$slideLimit = 6;

/* SLIDESHOW */
$stmt = $pdo->prepare("
    SELECT 
        p.*,
        e.eigenaar AS eigenaar_naam,
        eo.eigenaar AS uitgeleend_aan_naam
    FROM puzzels p
    LEFT JOIN eigenaar e ON p.eigenaar_id = e.eigenaar_id
    LEFT JOIN eigenaar eo ON p.uitgeleend_aan = eo.eigenaar_id
    ORDER BY p.id DESC
    LIMIT :limit
");
$stmt->bindValue(':limit', (int)$slideLimit, PDO::PARAM_INT);
$stmt->execute();
$slides = $stmt->fetchAll(PDO::FETCH_ASSOC);

/* ALLE PUZZELS */
$allePuzzels = $pdo->query("
    SELECT 
        p.*,
        e.eigenaar AS eigenaar_naam,
        eo.eigenaar AS uitgeleend_aan_naam
    FROM puzzels p
    LEFT JOIN eigenaar e ON p.eigenaar_id = e.eigenaar_id
    LEFT JOIN eigenaar eo ON p.uitgeleend_aan = eo.eigenaar_id
    ORDER BY p.titel ASC
")->fetchAll(PDO::FETCH_ASSOC);

function img($file)
{
    $base = BASE_URL . "/modules/puzzels/img/puzzels/";
    return !empty($file) ? $base . htmlspecialchars($file) : $base . "no-image.png";
}

?>

<link rel="stylesheet" href="<?= BASE_URL ?>/modules/puzzels/css/puzzels.css?v=9">


<section class="slideshow-section">

    <div class="slider-wrapper">
        <div class="slider-window">
            <div class="slider-track" id="track">

                <?php foreach ($slides as $p): ?>
                    <div class="slide">

                        <img src="<?= img($p['afbeelding']) ?>">

                        <div class="slide-info">
                            <h2><?= htmlspecialchars($p['titel'] ?? '') ?></h2>

                            <p>Eigenaar: <?= htmlspecialchars($p['eigenaar_naam'] ?? '') ?></p>

                            <p>Status: <span class="status-tekst <?= $p['status'] ?>">
                                <?= ucfirst($p['status']) ?>
                            </span></p>

                            <?php if ($p['status'] === 'uitgeleend' && !empty($p['uitgeleend_aan_naam'])): ?>
                                <p>Uitgeleend aan: <?= htmlspecialchars($p['uitgeleend_aan_naam']) ?></p>
                            <?php endif; ?>
                        </div>

                    </div>
                <?php endforeach; ?>

            </div>
        </div>
    </div>

</section>


<main class="content">

    <div class="puzzel-header">
        <h3>Alle puzzels</h3>
        <a class="btn-add" href="#">+ Toevoegen</a>
    </div>

    <div class="puzzel-grid">

        <?php foreach ($allePuzzels as $p): ?>

            <div class="puzzel-card">

                <img src="<?= img($p['afbeelding']) ?>">

                <div class="puzzel-info">

                    <h2><?= htmlspecialchars($p['titel'] ?? '') ?></h2>

                    <p>Eigenaar: <?= htmlspecialchars($p['eigenaar_naam'] ?? '') ?></p>

                    <p class="status-line">Status: 
                        <span class="status-tekst <?= $p['status'] ?>">
                            <?= ucfirst($p['status']) ?>
                        </span>
                    </p>

                    <?php if ($p['status'] === 'uitgeleend' && !empty($p['uitgeleend_aan_naam'])): ?>
                        <p>Uitgeleend aan:<?= htmlspecialchars($p['uitgeleend_aan_naam']) ?></p>
                    <?php endif; ?>

                </div>

                <div class="card-buttons">
                    <a class="btn-edit" href="#">Muteren</a>
                    <a class="btn-delete" href="#">Verwijderen</a>
                </div>

            </div>

        <?php endforeach; ?>

    </div>

</main>


<script>
const track = document.getElementById('track');
const slides = document.querySelectorAll('.slide');

const visible = <?= (int)$slideLimit ?>;
let index = 0;

for (let i = 0; i < visible; i++) {
    if (slides[i]) track.appendChild(slides[i].cloneNode(true));
}

function move() {
    index++;
    const w = slides[0].offsetWidth;
    track.style.transform = `translateX(-${index * w}px)`;

    if (index >= slides.length) {
        setTimeout(() => {
            track.style.transition = "none";
            index = 0;
            track.style.transform = "translateX(0)";
        }, 600);
    }
}

setInterval(move, 3000);
</script>

<?php require_once __DIR__ . '/../../includes/footer.php'; ?>