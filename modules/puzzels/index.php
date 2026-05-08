<?php

require_once __DIR__ . '/../../config/bootstrap.php';
require_once __DIR__ . '/../../includes/header.php';

global $pdo;

/*
|--------------------------------------------------------------------------
| Puzzels + eigenaar
|--------------------------------------------------------------------------
*/

$sql = "
    SELECT 
        p.*,
        e.eigenaar AS eigenaar_naam
    FROM puzzels p
    LEFT JOIN eigenaar e 
        ON p.eigenaar_id = e.eigenaar_id
    ORDER BY p.id DESC
";

$puzzels = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);

/*
|--------------------------------------------------------------------------
| Slideshow (laatste 5)
|--------------------------------------------------------------------------
*/

$slides = array_slice($puzzels, 0, 5);

?>

<link rel="stylesheet" href="<?= BASE_URL ?>/modules/puzzels/puzzels.css">

<div class="container">

    <h1>🧩 Puzzels</h1>

    <!-- SLIDESHOW -->
    <div class="slideshow">

        <?php foreach ($slides as $i => $p): ?>

            <?php
                $isUitgeleend = (int)$p['is_uitgeleend'] === 1;
                $status = $isUitgeleend ? 'Uitgeleend' : 'Beschikbaar';
                $kleur = $isUitgeleend ? '#d32f2f' : '#2e7d32';
            ?>

            <div class="slide <?= $i === 0 ? 'active' : '' ?>">

                <img src="<?= BASE_URL ?>/modules/puzzels/img/puzzels/<?= htmlspecialchars($p['afbeelding'] ?? 'no-image.png') ?>">

                <div class="caption">

                    <strong><?= htmlspecialchars($p['titel'] ?? '-') ?></strong><br>

                    Eigenaar: <?= htmlspecialchars($p['eigenaar_naam'] ?? 'Onbekend') ?><br>

                    <?php if (!empty($p['jaar'])): ?>
                        Jaar: <?= htmlspecialchars($p['jaar']) ?><br>
                    <?php endif; ?>

                    <span style="color: <?= $kleur ?>; font-weight:bold;">
                        Status: <?= $status ?>
                    </span>

                </div>

            </div>

        <?php endforeach; ?>

        <button class="prev" onclick="moveSlide(-1)">‹</button>
        <button class="next" onclick="moveSlide(1)">›</button>

    </div>

    <!-- LIJST -->
    <div class="puzzel-strip">

        <?php foreach ($puzzels as $p): ?>

            <?php
                $isUitgeleend = (int)$p['is_uitgeleend'] === 1;
                $status = $isUitgeleend ? 'Uitgeleend' : 'Beschikbaar';
                $kleur = $isUitgeleend ? '#d32f2f' : '#2e7d32';
            ?>

            <div class="puzzel-card">

                <img src="<?= BASE_URL ?>/modules/puzzels/img/puzzels/<?= htmlspecialchars($p['afbeelding'] ?? 'no-image.png') ?>">

                <div class="info">

                    <div class="titel"><?= htmlspecialchars($p['titel'] ?? '-') ?></div>

                    <div>Eigenaar: <?= htmlspecialchars($p['eigenaar_naam'] ?? 'Onbekend') ?></div>

                    <?php if (!empty($p['jaar'])): ?>
                        <div>Jaar: <?= htmlspecialchars($p['jaar']) ?></div>
                    <?php endif; ?>

                    <div class="status" style="color: <?= $kleur ?>;">
                        <?= $status ?>
                    </div>

                </div>

            </div>

        <?php endforeach; ?>

    </div>

</div>

<script>
let currentSlide = 0;
const slides = document.querySelectorAll(".slide");

function showSlide(i) {
    if (i >= slides.length) currentSlide = 0;
    if (i < 0) currentSlide = slides.length - 1;

    slides.forEach(s => s.classList.remove("active"));
    slides[currentSlide].classList.add("active");
}

function moveSlide(step) {
    currentSlide += step;
    showSlide(currentSlide);
}

showSlide(0);
</script>

<?php require_once __DIR__ . '/../../includes/footer.php'; ?>