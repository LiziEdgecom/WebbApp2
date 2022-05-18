package com.workout.registration;

import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetAllUsersServlet", value = "/GetAllUsersServlet")
public class GetAllUsersServlet extends HttpServlet {

    private ServletConfig config;



    public void init(ServletConfig config)

            throws ServletException{
        this.config=config;
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        try {
            List<User> listUser = UserController.GetAllUsers();
            request.setAttribute("listUser",listUser);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }






            RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
            if(dispatcher != null){
                dispatcher.forward(request,response);
            }


        }
    }

