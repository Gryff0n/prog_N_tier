<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PEL - Paris En Ligne</title>
    <!--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"> -->
</head>
<body>
<div class="container">
    <header>
        <h1>Bienvenue sur PEL</h1>
        <h2>Paris En Ligne</h2>
    </header>

    <main>
        <div class="login-box">
            <h3>Connexion</h3>
            <jsp:useBean id="erreur" class="java.lang.String" scope="request"></jsp:useBean>
            <c:if test="${erreur.length()>0}">
                <c:out value="${erreur}"></c:out>
            </c:if>

            <form method="post" action="/pel/connexion">
                <div class="form-group">
                    <label for="login">Login :</label>
                    <input type="text" id="login" name="login">
                </div>

                <div class="form-group">
                    <label for="mdp">Mot de passe :</label>
                    <input type="password" id="mdp" name="mdp">
                </div>

                <div class="form-group">
                    <input type="submit" class="btn-primary" name="Se Connecter">
                </div>
            </form>
        </div>
    </main>
</div>
</body>
</html>