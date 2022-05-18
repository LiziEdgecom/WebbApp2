package com.workout.registration;

import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteUserServlet", value = "/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("val1"));
        System.out.println(id);
        RequestDispatcher dispatcher = null;
        UserController userController = new UserController();
        int rows = 0;
        try {
            rows = userController.deleteUser(id);
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }


        if (rows > 0) {
            request.setAttribute("status", "success");
            request.setAttribute("reload", "true");
        } else {
            request.setAttribute("status", "failed");

        }
        System.out.println("deleted");
        System.out.println(rows);
        response.sendRedirect("GetAllUsersServlet");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
