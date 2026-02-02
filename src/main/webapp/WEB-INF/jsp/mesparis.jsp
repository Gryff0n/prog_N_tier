<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Mes Paris - PEL</title>
</head>
<body>

<jsp:useBean id="utilisateur" type="modele.Utilisateur" scope="session"/>
<jsp:useBean id="mesParis" type="java.util.Collection" scope="request"/>

<h1>PEL - Paris En Ligne</h1>
<p>Connecté en tant que <strong>${utilisateur.login}</strong></p>

<a href="${pageContext.request.contextPath}/pel/menu">Menu</a> |
<a href="${pageContext.request.contextPath}/pel/deconnexion">Déconnexion</a>

<hr>

<h2>Mes paris</h2>

<c:if test="${empty mesParis}">
    <p>Aucun pari effectué.</p>
    <a href="${pageContext.request.contextPath}/pel/matchsOuverts">Parier</a>
</c:if>

<c:forEach var="pari" items="${mesParis}">
    <hr>

    <h3>
            ${pari.match.equipe1} VS ${pari.match.equipe2}
    </h3>

    <p>
        <strong>Sport :</strong>
        <c:choose>
            <c:when test="${pari.match.sport == 'foot'}">⚽ Football</c:when>
            <c:when test="${pari.match.sport == 'rugby'}">🏉 Rugby</c:when>
            <c:when test="${pari.match.sport == 'basket'}">🏀 Basketball</c:when>
            <c:when test="${pari.match.sport == 'tennis'}">🎾 Tennis</c:when>
            <c:otherwise>${pari.match.sport}</c:otherwise>
        </c:choose>
    </p>

    <p>
        <strong>Date :</strong>
        <fmt:parseDate value="${pari.match.quand}" pattern="yyyy-MM-dd'T'HH:mm" var="d"/>
        <fmt:formatDate value="${d}" pattern="dd/MM/yyyy HH:mm"/>
    </p>

    <p><strong>Pronostic :</strong> ${pari.vainqueur}</p>
    <p><strong>Mise :</strong> ${pari.montant} €</p>

    <!-- PARI EN COURS -->
    <c:if test="${!pari.match.commenceOuFini}">
        <p><strong>Statut :</strong> En cours</p>
        <a href="${pageContext.request.contextPath}/pel/annulerPari?idPari=${pari.idPari}"
           onclick="return confirm('Annuler ce pari ?');">
            Annuler
        </a>
    </c:if>

    <!-- PARI TERMINÉ -->
    <c:if test="${pari.match.commenceOuFini}">
        <p><strong>Statut :</strong>
            <c:choose>
                <c:when test="${pari.gain.present && pari.gain.get() > 0}">
                    ✅ Gagné
                </c:when>
                <c:when test="${pari.match.resultat.present}">
                    ❌ Perdu
                </c:when>
                <c:otherwise>
                    ⏳ En attente
                </c:otherwise>
            </c:choose>
        </p>

        <c:if test="${pari.match.resultat.present}">
            <p><strong>Résultat :</strong> ${pari.match.resultat.get()}</p>
        </c:if>

        <c:if test="${pari.gain.present}">
            <p><strong>Gain :</strong>
                <fmt:formatNumber value="${pari.gain.get()}" pattern="#0.00"/> €
            </p>
        </c:if>
    </c:if>

</c:forEach>

<hr>
<p>&copy; 2024 PEL</p>

</body>
</html>
