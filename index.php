<!DOCTYPE html>
<html lang="nl">
<head>
<meta charset="UTF-8">
<title>Update - FamiliePortaal</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
html, body {
    margin: 0;
    height: 100%;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg,#e9eef7,#f7f9fc);
    overflow: hidden;
}

/* =========================
   CARD
========================= */
.card {
    position: relative;
    width: 100%;
    max-width: 650px;
    padding: 40px;
    background: rgba(255,255,255,0.75);
    backdrop-filter: blur(10px);
    border-radius: 18px;
    text-align: center;
    box-shadow: 0 10px 40px rgba(0,0,0,0.1);
    margin: auto;
    top: 50%;
    transform: translateY(-50%);
    z-index: 2;
}

h1 {
    margin: 0 0 10px;
    font-size: 2.2rem;
    color: #2b2b2b;
}

p {
    color: #555;
    font-size: 1.1rem;
}

/* =========================
   GIF + KRAAN
========================= */
.scene {
    position: relative;
    width: 320px;
    margin: 25px auto;
}

.maintenance-img {
    width: 100%;
    display: block;
}

/* KRAAN */
.crane {
    position: absolute;
    top: 8%;
    left: 50%;
    transform: translateX(-50%);
    animation: craneMove 6s ease-in-out infinite;
}

/* TOUW */
.rope {
    width: 4px;
    height: 60px;
    background: #333;
    margin: auto;
    animation: ropeMove 3s ease-in-out infinite;
}

/* LAST */
.load {
    background: #f4b400;
    padding: 6px 10px;
    border-radius: 10px;
    width: 150px;
    text-align: center;
    transform-origin: top center;
    animation: swing 3s ease-in-out infinite;
}

/* TEKST */
.banner {
    font-size: 13px;
    font-weight: bold;
    color: #222;
}

.website {
    margin-top: 4px;
    background: #2b6cff;
    color: white;
    padding: 5px;
    border-radius: 6px;
    font-weight: bold;
    font-size: 12px;
}

/* =========================
   STATUS
========================= */
.status {
    margin-top: 15px;
    font-size: 0.95rem;
    color: #777;
}

.dot {
    animation: blink 1.5s infinite;
}

.dot:nth-child(2){animation-delay:.2s;}
.dot:nth-child(3){animation-delay:.4s;}

@keyframes blink {
    0%,100%{opacity:0.2;}
    50%{opacity:1;}
}

/* =========================
   FALLING ICONS
========================= */
#fallLayer {
    position: fixed;
    inset: 0;
    overflow: hidden;
    z-index: 9999;
    pointer-events: none;
}

.piece {
    position: fixed;
    top: -40px;
    width: 64px;
    height: 64px;
    opacity: 0.95;
    object-fit: contain;
}

/* =========================
   ANIMATIES
========================= */
@keyframes craneMove {
    0%,100% { transform: translateX(-50%) translateX(-30px); }
    50%     { transform: translateX(-50%) translateX(30px); }
}

@keyframes ropeMove {
    0%,100% { height: 50px; }
    50%     { height: 90px; }
}

@keyframes swing {
    0%   { transform: rotate(-6deg); }
    50%  { transform: rotate(6deg); }
    100% { transform: rotate(-6deg); }
}
</style>
</head>

<body>

<div id="fallLayer"></div>

<div class="card">

<h1>We zijn even bezig 🔧</h1>

<p>
De website wordt momenteel verbeterd.<br>
Even geduld, we zijn binnenkort terug!
</p>

<!-- SCENE -->
<div class="scene">

    <!-- ⚠️ BESTAND NAAM AANPASSEN (geen spaties!) -->
    <img src="img/onderhoud.png" class="maintenance-img" alt="Onderhoud">

    <div class="crane">
        <div class="rope"></div>

       <div class="load">
            <div class="banner">In onderhoud</div>
            <div class="website">staijen.eu</div>
        </div>
    </div>

</div>



</div>

<script>

/* ICONS */
const items = [
    "img/puzzle.png",
    "img/music.png",
    "img/tools.png"
];

function spawn() {

    const el = document.createElement("img");
    el.className = "piece";
    el.src = items[Math.floor(Math.random() * items.length)];

    const startX = Math.random() * window.innerWidth;
    const driftX = Math.random() * 200 - 100;

    el.style.left = startX + "px";

    document.getElementById("fallLayer").appendChild(el);

    const duration = 4000 + Math.random() * 2000;

    el.animate([
        { transform: "translate(0,0)", opacity: 0.9 },
        { transform: `translate(${driftX}px, ${window.innerHeight + 100}px)`, opacity: 0.3 }
    ], {
        duration: duration,
        easing: "linear",
        fill: "forwards"
    });

    setTimeout(() => el.remove(), duration);
}

setInterval(spawn, 300);

</script>

</body>
</html>