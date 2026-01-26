<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mes Paris - PEL</title>
    <!--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"> -->
</head>
<body>
<div class="container">
    <header>
        <h1>PEL - Paris En Ligne</h1>
        <div class="user-info">
            <p>Connecté : <strong>${sessionScope.utilisateurConnecte}</strong></p>
            <a href="controleur?action=menu" class="btn-secondary">Retour au menu</a>
        </div>
    </header>

    <main>
        <div class="content-box">
            <h2>Mes paris</h2>

            <div class="bets-list">
                <h3>Paris en cours</h3>

                <div class="bet-item active">
                    <div class="bet-header">
                        <span class="bet-id">Pari #1</span>
                        <span class="bet-status status-active">En cours</span>
                    </div>
                    <div class="bet-content">
                        <p><strong>Match :</strong> France vs Allemagne</p>
                        <p><strong>Sport :</strong> ⚽ Football</p>
                        <p><strong>Date du match :</strong> 15/03/2025 à 21h00</p>
                        <p><strong>Pronostic :</strong> France (Équipe 1)</p>
                        <p><strong>Mise :</strong> 10.00 €</p>
                    </div>
                </div>

                <div class="bet-item active">
                    <div class="bet-header">
                        <span class="bet-id">Pari #2</span>
                        <span class="bet-status status-active">En cours</span>
                    </div>
                    <div class="bet-content">
                        <p><strong>Match :</strong> Lakers vs Celtics</p>
                        <p><strong>Sport :</strong> 🏀 Basketball</p>
                        <p><strong>Date du match :</strong> 17/03/2025 à 19h30</p>
                        <p><strong>Pronostic :</strong> Lakers (Équipe 1)</p>
                        <p><strong>Mise :</strong> 25.00 €</p>
                    </div>
                </div>

                <h3>Paris terminés</h3>

                <div class="bet-item finished won">
                    <div class="bet-header">
                        <span class="bet-id">Pari #3</span>
                        <span class="bet-status status-won">Gagné 🎉</span>
                    </div>
                    <div class="bet-content">
                        <p><strong>Match :</strong> PSG vs OM</p>
                        <p><strong>Sport :</strong> ⚽ Football</p>
                        <p><strong>Date du match :</strong> 10/03/2025</p>
                        <p><strong>Pronostic :</strong> PSG (Équipe 1)</p>
                        <p><strong>Mise :</strong> 15.00 €</p>
                        <p><strong>Gain :</strong> <span class="gain">28.50 €</span></p>
                    </div>
                </div>

                <div class="bet-item finished lost">
                    <div class="bet-header">
                        <span class="bet-id">Pari #4</span>
                        <span class="bet-status status-lost">Perdu</span>
                    </div>
                    <div class="bet-content">
                        <p><strong>Match :</strong> Real Madrid vs Barcelona</p>
                        <p><strong>Sport :</strong> ⚽ Football</p>
                        <p><strong>Date du match :</strong> 08/03/2025</p>
                        <p><strong>Pronostic :</strong> Match nul</p>
                        <p><strong>Mise :</strong> 20.00 €</p>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 PEL - Paris En Ligne</p>
    </footer>
</div>
</body>
</html>