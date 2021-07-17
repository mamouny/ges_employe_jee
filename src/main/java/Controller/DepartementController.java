package Controller;
import entity.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import services.*;
import java.io.*;
import java.util.*;

@WebServlet(urlPatterns = "/departement")
public class DepartementController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        departementServices dep = new departementServices();
        List<Departement> listesDep = dep.getAllDepartements();
        req.setAttribute("listesDep", listesDep);
        req.getRequestDispatcher("views/departement.jsp").forward(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("departement_id"));
        String nom = req.getParameter("nomDepartement");

        departementServices dep = new departementServices();
        //System.out.println(nom+"hhhhhhhhhhhhhhh"+id);
        Departement dp = new Departement();
        dp.setDepartement_id(id);
        dp.setNomDepartement(nom);
        dep.save(dp);
        List<Departement> listesDep = dep.getAllDepartements();
        req.setAttribute("listesDep", listesDep);
        req.getRequestDispatcher("views/departement.jsp").forward(req,resp);
    }
}
