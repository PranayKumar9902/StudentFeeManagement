/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TR080124021
 */
@WebServlet("/login")
public class Login extends HttpServlet{
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        try {
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
            
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("DBURL", "DBNAME", "PASSWORD");
            PreparedStatement st = con.prepareStatement("SELECT * FROM BUNTY_AUTHORS WHERE USERNAME = ? AND PASSWORD = ?");
            st.setString(1,uname);
            st.setString(2, pass);
            
            int flag = 0;
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                flag = 1;
                response.sendRedirect("Create.jsp");
            }
            HttpSession session = request.getSession();
            session.setAttribute("uname", uname);
            st.close();
            con.close();
        } catch (Exception ex) {
            
        }
     
    }
}
