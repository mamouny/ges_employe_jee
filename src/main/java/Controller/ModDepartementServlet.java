package Controller;
import entity.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import services.*;
import java.io.*;
import java.util.*;

@WebServlet("/modDep")
public class ModDepartementServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        departementServices dep = new departementServices();
        int id = Integer.parseInt(req.getParameter("idDepartement"));
        Departement d = dep.getById(id);
        req.setAttribute("dep",d);
        req.getRequestDispatcher("views/modDepartement.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("idDepartement"));
        String nom = req.getParameter("nomDepartement");
        departementServices dep = new departementServices();
        Departement d = dep.getById(id);
        d.setDepartement_id(id);
        d.setNomDepartement(nom);
        dep.update(d);
        List<Departement> listesDep = dep.getAllDepartements();
        req.setAttribute("listesDep", listesDep);
        req.getRequestDispatcher("views/departement.jsp").forward(req,resp);

    }
}