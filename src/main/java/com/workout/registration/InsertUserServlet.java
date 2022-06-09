package com.workout.registration;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "InsertUserServlet", urlPatterns = "/insertUser")
public class InsertUserServlet extends HttpServlet {
    boolean isNickInDatabase = false;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        HttpSession sessionHTTP = request.getSession();
        sessionHTTP.setAttribute("isWorking", true);

        RequestDispatcher dispatcher = null;
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String re_pass = request.getParameter("re_pass");
        String weight = request.getParameter("weight");
        String height = request.getParameter("height");

        if (name != null && !name.isEmpty() &&  !name.equals("admin")&&

                email != null && !email.isEmpty() &&
                password != null && !password.isEmpty() &&
                re_pass != null && !re_pass.isEmpty()

        ) {

            try {
                if((re_pass.equals(password)) && UserController.isUserInDatabase(email)==false)
                {
                    User user = new User(0,name, email, password, re_pass, weight, height,"1","1");
                    System.out.println(user);
                    UserController userController = new UserController();

                    int rows = userController.insertUser(user);
                    dispatcher = request.getRequestDispatcher("registration.jsp");
                    if (rows > 0) {
                        request.setAttribute("status", "success");
                        request.setAttribute("reload", "true");
                    } else {
                        request.setAttribute("status", "failed");

                    }
                    dispatcher.forward(request, response);
                }
                else{

                    request.setAttribute("status", "failed");
                    dispatcher = request.getRequestDispatcher("registration.jsp");
                    dispatcher.forward(request, response);

                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (NamingException e) {
                throw new RuntimeException(e);
            }


        } else {
            System.out.println("Nesprávne vyplnené údaje");

        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
