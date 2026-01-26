package controleur;

import facade.FacadeParis;
import facade.FacadeParisStaticImpl;
import facade.exceptions.InformationsSaisiesIncoherentesException;
import facade.exceptions.UtilisateurDejaConnecteException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modele.Utilisateur;

import java.io.IOException;

@WebServlet(name = "pel", urlPatterns = {"/pel/*"})
public class ControleurPrincipal extends HttpServlet {

    // Pages JSP
    final static String PAGE_DEFAULT = "/WEB-INF/jsp/accueil.jsp";

    public final static String CONNEXION = "connexion";
    public final static String DECONNEXION = "deconnexion";
    public final static String MESPARIS = "mesParis";
    public final static String MENU = "menu";

    private static final String PAGE_ACCUEIL = "/WEB-INF/jsp/accueil.jsp";
    private static final String PAGE_MENU = "/WEB-INF/jsp/menu.jsp";
    private static final String PAGE_MES_PARIS = "/WEB-INF/jsp/mesparis.jsp";

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String destination = PAGE_DEFAULT;
        String[] chemin = req.getRequestURI().split("/");
        String cleNavigation=chemin[chemin.length - 1];
        switch(cleNavigation) {
            case DECONNEXION : {
                destination =PAGE_DEFAULT;
                break;
            }
            case CONNEXION: {
                FacadeParis facadeParis = new FacadeParisStaticImpl();
                String erreur = "";
                String login = req.getParameter("login");
                String password = req.getParameter("mdp");

                destination=PAGE_MENU;

                try {
                    Utilisateur utilisateur = facadeParis.connexion(login, password);
                    req.getSession().setAttribute("utilisateur", utilisateur);
                } catch (UtilisateurDejaConnecteException e) {
                    erreur = "utilisateur déja connecté";
                    destination = PAGE_DEFAULT;
                } catch (InformationsSaisiesIncoherentesException e) {
                    erreur = "Infos saisies incorrectes";
                    destination = PAGE_DEFAULT;
                }
                req.setAttribute("erreur",erreur);
                break;
            }
            case MESPARIS: {
                destination = PAGE_MES_PARIS;
                break;
            }
            default: {
                destination = PAGE_DEFAULT;
                break;
            }

        }
        req.getServletContext().getRequestDispatcher(destination).forward(req,resp);
    }
}