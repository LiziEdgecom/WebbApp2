package com.workout.registration;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BanServlet", value = "/BanServlet")
public class BanServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("val1"));
        System.out.println(id);
        RequestDispatcher dispatcher = null;
        UserController userController = new UserController();
        int rows = 0;
        if(userController.isBanned(id)){
            rows = userController.unBanuser(id);
        }else {
             rows = userController.banuser(id);
        }


        if (rows > 0) {
            request.setAttribute("status", "success");
            request.setAttribute("reload", "true");
        } else {
            request.setAttribute("status", "failed");

        }
        System.out.println("banned");
        System.out.println(rows);
        response.sendRedirect("GetAllUsersServlet");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
