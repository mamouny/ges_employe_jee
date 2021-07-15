package Controller;

import entity.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import services.*;

import java.io.*;
import java.util.*;

@WebServlet(urlPatterns = "/acceuil")
public class indexController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        employeServices sn = new employeServices();
        List<Employe> listesEmp = sn.getAllEmployees();
        List<Departement> listesDep = sn.getAllDep();
        req.setAttribute("listesEmp", listesEmp);
        req.setAttribute("listesDep", listesDep);
        req.getRequestDispatcher("views/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //int idemployee = req.getParameter("idemployee");
        String nom = req.getParameter("nom");
        String prenom = req.getParameter("prenom");
        String nationnalite = req.getParameter("nationnalite");
        String situat_F = req.getParameter("situat_F");
        String ville = req.getParameter("lieuN");
        String dateN = req.getParameter("dateN");
        Double salaire = Double.parseDouble(req.getParameter("salaire"));
        Integer departement_id = Integer.parseInt(req.getParameter("departement_id"));
        System.out.println(departement_id+"kkkkkkkkkkkkkkkkkkkkkkkkkkk");
        employeServices emp = new employeServices();

        Employe e = new Employe();
        Departement dp = new Departement();
        dp.setDepartement_id(departement_id);
        e.setDateN(dateN);
        e.setNomEmp(nom);
        e.setPrenomEmp(prenom);
        e.setNationnalite(nationnalite);
        e.setSituat_F(situat_F);
        e.setSalaire(salaire);
        e.setVille(ville);
        e.setDepartement_id(dp);
        //System.out.println(dp.getDepartement_id()+ "kkkkkkkkk");
        emp.save(e);

        employeServices sn = new employeServices();
        List<Employe> listesEmp = sn.getAllEmployees();
        req.setAttribute("listesEmp", listesEmp);
        req.getRequestDispatcher("views/index.jsp").forward(req,resp);
    }
}
