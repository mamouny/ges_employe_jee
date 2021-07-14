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
        req.setAttribute("listesEmp", listesEmp);
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

        employeServices emp = new employeServices();

        Employe e = new Employe();

        e.setDateN(dateN);
        e.setNomEmp(nom);
        e.setPrenomEmp(prenom);
        e.setNationnalite(nationnalite);
        e.setSituat_F(situat_F);
        e.setSalaire(salaire);
        e.setVille(ville);
        e.setDepartement_id(1);
        //System.out.println(e.getDateN()+ "kkkkkkkkk"+ e.getSalaire());
        emp.save(e);

        employeServices sn = new employeServices();
        List<Employe> listesEmp = sn.getAllEmployees();
        req.setAttribute("listesEmp", listesEmp);
        req.getRequestDispatcher("views/index.jsp").forward(req,resp);
    }
}
