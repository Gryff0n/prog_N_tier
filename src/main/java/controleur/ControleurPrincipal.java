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
    public final static String MATCHS_OUVERTS = "matchsOuverts";
    public final static String PARIER = "parier";
    public final static String ANNULER_PARI = "annulerPari";

    private static final String PAGE_ACCUEIL = "/WEB-INF/jsp/accueil.jsp";
    private static final String PAGE_MENU = "/WEB-INF/jsp/menu.jsp";
    private static final String PAGE_MES_PARIS = "/WEB-INF/jsp/mesparis.jsp";
    private static final String PAGE_MATCHS_OUVERTS = "/WEB-INF/jsp/matchsouverts.jsp";
    private static final String PAGE_PARIER = "/WEB-INF/jsp/parier.jsp";

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String destination = PAGE_DEFAULT;
        String[] chemin = req.getRequestURI().split("/");
        String cleNavigation=chemin[chemin.length - 1];
        switch(cleNavigation) {
            case DECONNEXION : {
                FacadeParis facadeParis = new FacadeParisStaticImpl();
                facadeParis.deconnexion(req.getParameter("login"));
                destination =PAGE_DEFAULT;
                break;
            }
            case CONNEXION: {
                FacadeParis facadeParis = new FacadeParisStaticImpl();
                String erreur = "";

                String login = req.getParameter("login");
                String password = req.getParameter("mdp");
                if(login.length()<2 || password.length()<2) {
                    erreur = "le login et le password doivent être  plus long que 2 caractères.";
                }
                else {


                    destination = PAGE_MENU;

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
                }
                req.setAttribute("erreur",erreur);
                break;
            }
            case MESPARIS: {
                FacadeParis facadeParis = new FacadeParisStaticImpl();
                Utilisateur utilisateur = (Utilisateur) req.getSession().getAttribute("utilisateur");
                if (utilisateur != null) {
                    req.setAttribute("mesParis", facadeParis.getMesParis(utilisateur.getLogin()));
                }
                destination = PAGE_MES_PARIS;
                break;
            }
            case PARIER: {
                FacadeParis facadeParis = new FacadeParisStaticImpl();
                String idMatch = req.getParameter("idMatch");
                if(idMatch!=null) {
                    req.setAttribute("idMatch", idMatch);
                    req.setAttribute("matchChoisi", facadeParis.getMatch(Long.parseLong(idMatch)));
                    destination=PAGE_PARIER;
                }
                else {
                    destination=PAGE_DEFAULT;
                }
                break;
            }
            case MENU: {
                destination = PAGE_MENU;
                break;
            }
            case MATCHS_OUVERTS: {
                FacadeParis facadeParis = new FacadeParisStaticImpl();
                req.setAttribute("matchsOuverts", facadeParis.getMatchsPasCommences());
                destination = PAGE_MATCHS_OUVERTS;
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