package Controller;
import entity.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import services.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/supDep")
public class SupDepartementServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        departementServices dep = new departementServices();
        int id = Integer.parseInt(req.getParameter("idDepartement"));
        Departement d = dep.getById(id);
        System.out.println(d.getDepartement_id());
        dep.delete(d.getDepartement_id());
        List<Departement> listesDep = dep.getAllDepartements();
        req.setAttribute("listesDep", listesDep);
        req.getRequestDispatcher("views/departement.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
