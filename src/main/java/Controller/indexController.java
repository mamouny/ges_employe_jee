package Controller;

import entity.Employe;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.employeServices;
import services.loginServices;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/acceuil")
public class indexController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Employe> listEmployee = employeServices.getAllEmployees();
        req.setAttribute("listEmployee", listEmployee);
        req.getRequestDispatcher("views/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
