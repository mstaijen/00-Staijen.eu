</main>

<footer class="site-footer">
    <div class="footer-inner">

        <div class="footer-left">
            <strong>FamiliePortaal</strong>
            <span>© <?= date('Y') ?></span>
        </div>

        <div class="footer-center">
            <a href="/projecten/00-Staijen.eu/public/index.php">Dashboard</a>
            <a href="/projecten/00-Staijen.eu/modules/muziek/index.php">Muziek</a>
            <a href="/projecten/00-Staijen.eu/modules/puzzels/index.php">Puzzels</a>
        </div>

        <div class="footer-right">
            <?php if (isset($_SESSION['username'])): ?>
                Ingelogd als: <b><?= $_SESSION['username'] ?></b>
            <?php else: ?>
                Gast
            <?php endif; ?>
        </div>

    </div>
</footer>

</body>
</html>