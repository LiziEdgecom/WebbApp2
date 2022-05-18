package com.workout.registration;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "getUser", value = "/getUser")
public class GetUserServlet extends HttpServlet {

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
            ArrayList list = UserController.getUser(email);
            String name = (String) list.get(0);
            String weight = (String) list.get(1);
            String height = (String) list.get(2);

            request.setAttribute("name",name);
            request.setAttribute("weight",weight);
            request.setAttribute("height",height);
            request.setAttribute("reload","false");

            if (session.getAttribute("status") != null && session.getAttribute("status").equals("yes") ){
                request.setAttribute("status", "success");
                RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
                session.setAttribute("status", "no");
                if(dispatcher != null){
                    dispatcher.forward(request,response);
                }

            }
            else{
                RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
                if(dispatcher != null){
                    dispatcher.forward(request,response);
                }
                return;
            }
            request.setAttribute("status","failed");
            RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
            if(dispatcher != null){
                dispatcher.forward(request,response);
            }





        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }


}
