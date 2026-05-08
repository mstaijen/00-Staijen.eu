function scrollLeft() {
    const el = document.getElementById('puzzelTrack');
    if (!el) {
        console.error("puzzelTrack niet gevonden");
        return;
    }
    el.scrollBy({ left: -220, behavior: 'smooth' });
}

function scrollRight() {
    const el = document.getElementById('puzzelTrack');
    if (!el) {
        console.error("puzzelTrack niet gevonden");
        return;
    }
    el.scrollBy({ left: 220, behavior: 'smooth' });
}