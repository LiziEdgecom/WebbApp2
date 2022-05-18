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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

@WebServlet(name = "Login", value = "/Login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password= request.getParameter("password");
        System.out.println(password);
        try {
            Connection connection =  DatabaseConnector.getCon();
            PreparedStatement pst = connection.prepareStatement("select * from user where email=? ");

            pst.setString(1,email);


            ResultSet rs = pst.executeQuery();

            if(rs.next()){
                System.out.println(rs.getString("password"));
                System.out.println(rs.getString("admin"));
                String pass = rs.getString("password");
                String admin = rs.getString("admin");
                String ban = rs.getString("ban");
                if(decrypt(pass).equals(password)){
                    if(admin.equals("0")){
                        session.setAttribute("name",rs.getString("name"));
                        session.setAttribute("email",rs.getString("email"));
                        response.sendRedirect("GetAllUsersServlet");
                        return;
                    }else{
                        if (ban.equals("0")){
                            request.setAttribute("status","banned");
                            dispatcher = request.getRequestDispatcher("login.jsp");
                        }else {
                            session.setAttribute("name",rs.getString("name"));
                            session.setAttribute("email",rs.getString("email"));
                            dispatcher = request.getRequestDispatcher("index.jsp");
                        }

                    }

                }
                else {
                    if (ban.equals("0")){
                        request.setAttribute("status","banned");
                    }
                    request.setAttribute("status","failed");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                }



            }else{
                request.setAttribute("status","failed");
                dispatcher = request.getRequestDispatcher("login.jsp");
            }

            dispatcher.forward(request,response);



        } catch (NamingException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }



    }
    public static String decrypt(String data){
        Base64.Decoder decoder = Base64.getDecoder();
        byte[] bytes = decoder.decode(data);
        return new String(bytes);
    }
}
