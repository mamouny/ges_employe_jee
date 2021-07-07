package account;

import entity.Employe;
import entity.User;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import services.employeServices;
import services.loginServices;

import java.io.IOException;
import java.util.List;

@WebServlet("/")
public class loginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().println("login ");
        req.getRequestDispatcher("login.jsp").forward(req,resp);
   }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nom = req.getParameter("nom");
        String password = req.getParameter("password");
        loginServices userService = new loginServices();
        boolean logged = userService.login(nom,password);
        if (logged){
            req.getSession().setAttribute("login",nom);
            resp.sendRedirect(req.getContextPath()+"/acceuil");
        }else {
            req.setAttribute("error","login ou password incorrectes");

            req.getRequestDispatcher("/login.jsp").forward(req,resp);
        }
    }
}
