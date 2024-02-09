/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.add;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TR080124021
 */
@WebServlet("/add")
public class AddAuthor extends HttpServlet{
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        try {
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.24:1521:orclnew1", "C##TRAINEES_DATABASE", "system123#");
            PreparedStatement st = con.prepareStatement("INSERT INTO BUNTY_AUTHORS VALUES(?,?)");
            st.setString(1,uname);
            st.setString(2, pass);
            
            int RA = st.executeUpdate();
            if(RA > 0){
                System.out.println("ADDED!!!!");
                response.sendRedirect("Create.jsp");
            }
            st.close();
            con.close();
            
        } catch (Exception ex) {
            
        }
     
    }
}
