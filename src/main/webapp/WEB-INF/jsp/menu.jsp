<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Menu Principal - PEL</title>
  <!--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"> -->
</head>
<body>
<div class="container">
  <header>
    <h1>PEL - Paris En Ligne</h1>
    <jsp:useBean id="utilisateur" type="modele.Utilisateur" scope="session"></jsp:useBean>
    <div class="user-info">
      <p>Connecté en tant que : <strong>${utilisateur.login}</strong></p>
      <a href="${pageContext.request.contextPath}/pel/deconnexion" class="btn-secondary">Déconnexion</a>
    </div>
  </header>

  <main>
    <div class="menu-box">
      <h2>Menu Principal</h2>

      <nav class="menu-navigation">
        <ul>
          <li>
            <a href="${pageContext.request.contextPath}/pel/matchsOuverts" class="menu-link">
              <span class="menu-icon">⚽</span>
              <span class="menu-text">Parier sur un match</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/pel/mesParis" class="menu-link">
              <span class="menu-icon">📋</span>
              <span class="menu-text">Gérer mes paris</span>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </main>

  <footer>
    <p>&copy; 2024 PEL - Paris En Ligne</p>
  </footer>
</div>
</body>
</html>