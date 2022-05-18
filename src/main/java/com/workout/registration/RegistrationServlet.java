package com.workout.registration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "register", value = "/register")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String re_pass = request.getParameter("re_pass");
        String weight = request.getParameter("weight");
        String height = request.getParameter("height");
        PrintWriter out = response.getWriter();
        out.println(name);
        out.println(email);
        out.println(pass);
        out.println(weight);
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (Exception e){

        }

    }

}
