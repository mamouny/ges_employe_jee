package Controller;
import entity.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import services.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/supEmp")
public class SupEmployeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        employeServices emp = new employeServices();
        int id = Integer.parseInt(req.getParameter("idemploye"));
        Employe e = emp.getById(id);
        emp.delete(e.getIdemploye());
        List<Employe> listesEmp = emp.getAllEmployees();
        req.setAttribute("listesEmp", listesEmp);
        req.getRequestDispatcher("views/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
