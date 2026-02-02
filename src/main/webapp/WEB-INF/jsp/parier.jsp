<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parier sur un match - PEL</title>
</head>
<body>
<div class="container">
    <h1>Placer un pari</h1>
    <p>Choisissez votre pronostic et misez</p>

    <!-- Affichage du match -->
    <div class="match-info">
        <div class="match-sport">${matchChoisi.sport}</div>
        <div class="match-teams">
            <span>${matchChoisi.equipe1}</span>
            <span class="vs">vs</span>
            <span>${matchChoisi.equipe2}</span>
        </div>
        <div class="match-date">
            <fmt:formatDate value="${matchChoisi.quand}" pattern="dd/MM/yyyy 'à' HH:mm" />
        </div>
    </div>

    <!-- Message d'erreur -->
    <c:if test="${not empty erreur}">
        <div class="error-message">
                ${erreur}
        </div>
    </c:if>

    <!-- Formulaire de pari -->
    <form action="${pageContext.request.contextPath}/pel/validerPari" method="post">
        <input type="hidden" name="idMatch" value="${Choisi.idMatch}">

        <div class="form-group">
            <label>Votre pronostic :</label>
            <div class="radio-group">
                <label>
                    <input type="radio" name="vainqueur" value="equipe 1" required>
                    <span>Victoire de ${matchChoisi.equipe1}</span>
                </label>

                <label>
                    <input type="radio" name="vainqueur" value="nul" required>
                    <span>Match nul</span>
                </label>

                <label>
                    <input type="radio" name="vainqueur" value="equipe 2" required>
                    <span>Victoire de ${matchChoisi.equipe2}</span>
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="montant">Montant de votre mise (€) :</label>
            <input
                    type="number"
                    id="montant"
                    name="montant"
                    min="0.01"
                    step="0.01"
                    placeholder="Ex: 10.00"
                    required>
            <div>Montant minimum : 0,01 €</div>
        </div>

        <div class="button-group">
            <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/pel/matchsOuverts'">
                Annuler
            </button>
            <button type="submit">
                Valider le pari
            </button>
        </div>
    </form>
</div>
</body>
</html>
