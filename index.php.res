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

/* CARD */
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

/* CONTENT BOVEN ANIMATIE */
.card {
    position: relative;
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

/* SPINNER */
.spinner {
    margin: 20px auto;
    width: 42px;
    height: 42px;
    border: 4px solid rgba(0,0,0,0.1);
    border-top: 4px solid #4a90e2;
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

/* STATUS DOTS */
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

/* FALL LAYER */
#fallLayer {
    position: fixed;
    inset: 0;
    overflow: hidden;
    z-index: 9999; /* 🔥 boven alles */
    pointer-events: none;
}

/* VALLENDE ICONS */
.piece {
    position: fixed;
    top: -40px;
    width: 64px;  /* 34 px standaard klein */
    height: 64px;
    opacity: 0.95;
    object-fit: contain;
    pointer-events: none;
}

</style>
</head>

<body>

<div id="fallLayer"></div>

<div class="card">

<h1>We zijn even bezig 🔧</h1>

<p>
De website wordt momenteel verbeterd.<br>
Even geduld, we zijn zo terug!
</p>

<img src="img/onderhoud.gif" class="maintenance-img" alt="Onderhoud">
<div class="spinner"></div>

<p class="status">
Modules laden<span class="dot">.</span><span class="dot">.</span><span class="dot">.</span>
</p>

</div>

<script>

/* ICONS (PNG uit /img/) */
const items = [
    "img/puzzle.png",
    "img/music.png",
    "img/tools.png"
];

/* SPAWN */
function spawn() {

    const el = document.createElement("img");
    el.className = "piece";

    el.src = items[Math.floor(Math.random() * items.length)];

    const startX = Math.random() * window.innerWidth;
    const driftX = Math.random() * 200 - 100;

    el.style.left = startX + "px";

    document.getElementById("fallLayer").appendChild(el);

    const duration = 3500 + Math.random() * 2000;

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

/* LANGZAMERE SPAWN */
setInterval(spawn, 300);

</script>

</body>
</html>