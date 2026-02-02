<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Matchs Ouverts - PEL</title>
</head>
<body>

<div>
    <header>
        <h1>PEL - Paris En Ligne</h1>

        <jsp:useBean id="utilisateur" type="modele.Utilisateur" scope="session"/>

        <div>
            <p>Connecté en tant que : <strong>${utilisateur.login}</strong></p>
            <a href="${pageContext.request.contextPath}/pel/menu">Retour au menu</a>
            |
            <a href="${pageContext.request.contextPath}/pel/deconnexion">Déconnexion</a>
        </div>
    </header>

    <main>
        <div>
            <h2>Matchs ouverts aux paris</h2>
            <p>Sélectionnez un match pour parier</p>

            <jsp:useBean id="matchsOuverts" type="java.util.Collection" scope="request"/>

            <c:choose>
                <c:when test="${empty matchsOuverts}">
                    <p>Aucun match disponible pour le moment.</p>
                </c:when>

                <c:otherwise>
                    <c:forEach var="match" items="${matchsOuverts}">
                        <hr>

                        <p>
                            <strong>Sport :</strong> ${match.sport}<br>
                            <strong>Match #</strong> ${match.idMatch}
                        </p>

                        <p>
                            <strong>${match.equipe1}</strong> VS <strong>${match.equipe2}</strong>
                        </p>

                        <p>
                            <strong>Date :</strong>
                            <fmt:parseDate value="${match.quand}"
                                           pattern="yyyy-MM-dd'T'HH:mm"
                                           var="parsedDate"
                                           type="both"/>
                            <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy 'à' HH:mm"/>
                        </p>

                        <p>
                            <a href="${pageContext.request.contextPath}/pel/parier?idMatch=${match.idMatch}">
                                Parier sur ce match
                            </a>
                        </p>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 PEL - Paris En Ligne</p>
    </footer>
</div>

</body>
</html>
