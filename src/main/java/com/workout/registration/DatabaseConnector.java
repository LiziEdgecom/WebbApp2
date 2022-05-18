package com.workout.registration;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DatabaseConnector {
    //private static Connection con = null;
    /**
     * Helper for get connection from Pool
     * @return Connection
     * @throws NamingException
     * @throws SQLException
     */
    public static Connection getCon() throws NamingException, SQLException, ClassNotFoundException {
        DataSource ds;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url= "jdbc:mysql://localhost:3306/jsp-project";
        String user = "root";
        String pass = "";

        Connection connection = DriverManager.getConnection(url,user,pass);
/*
        Context initContext;
        Connection con = null;

        initContext = new InitialContext();
        Context envContext = (Context) initContext.lookup("java:/comp/env");
        ds = (DataSource) envContext.lookup("jsp-project");

        //con = DatabaseConnector.getConnection();
*/
        return connection;
    }

}
