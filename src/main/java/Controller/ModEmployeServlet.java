package Controller;
import entity.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import services.*;
import java.io.*;
import java.util.*;

@WebServlet("/modEmp")
public class ModEmployeServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        employeServices emp = new employeServices();
        int id = Integer.parseInt(req.getParameter("idemploye"));
        Employe e = emp.getById(id);
        List<Departement> listesDep = emp.getAllDep();
        req.setAttribute("listesDep", listesDep);
        req.setAttribute("emp",e);
        req.getRequestDispatcher("views/modEmploye.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("idemploye"));
        String nom = req.getParameter("nomEmp");
        String prenom = req.getParameter("prenomEmp");
        String nationnalite = req.getParameter("nationnalite");
        String situat_F = req.getParameter("situat_F");
        String ville = req.getParameter("ville");
        String niveau = req.getParameter("niveau");
        String dateN = req.getParameter("dateN");
        Double salaire = Double.parseDouble(req.getParameter("salaire"));
        Integer departement_id = Integer.parseInt(req.getParameter("departement_id"));
        employeServices emp = new employeServices();
        Employe e = emp.getById(id);
        e.setIdemploye(id);
        Departement dp = new Departement();
        dp.setDepartement_id(departement_id);
        e.setDateN(dateN);
        e.setNomEmp(nom);
        e.setPrenomEmp(prenom);
        e.setNationnalite(nationnalite);
        e.setSituat_F(situat_F);
        e.setSalaire(salaire);
        e.setVille(ville);
        e.setNiveau(niveau);
        e.setDepartement_id(dp);
        emp.update(e);
        List<Employe> listesEmp = emp.getAllEmployees();
        req.setAttribute("listesEmp", listesEmp);
        req.getRequestDispatcher("views/index.jsp").forward(req,resp);
    }
}
