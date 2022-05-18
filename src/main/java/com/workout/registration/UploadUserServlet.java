package com.workout.registration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "uploadUser", value = "/uploadUser")
public class UploadUserServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        HttpSession sessionHTTP = request.getSession();


        RequestDispatcher dispatcher = null;
        String name = request.getParameter("name");
        String email = (String) sessionHTTP.getAttribute("email");
        String weight = request.getParameter("weight");
        String height = request.getParameter("height");
        if (name != null && !name.isEmpty() ) {

            try {
//


                UserController userController = new UserController();

                int rows = userController.UploadUser(name, email, weight, height);
                sessionHTTP.setAttribute("status","yes");
                sessionHTTP.setAttribute("name",name);


                if (rows > 0) {

                    response.sendRedirect("getUser");
                } else {

                    response.sendRedirect("getUser");
                }
                dispatcher.forward(request, response);
            }catch (Exception ee){
                System.out.println(ee);
            }
        }else{

            request.setAttribute("status", "failed");
            response.sendRedirect("getUser");

        }
    }


}
