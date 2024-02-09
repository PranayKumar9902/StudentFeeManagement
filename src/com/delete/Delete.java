/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.delete;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TR080124021
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet{
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        
        try {
            String rollno = request.getParameter("ROLLNO");
            PrintWriter out = response.getWriter();
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("DBURL", "DBNAME", "PASSWORD");
            PreparedStatement st = con.prepareStatement("DELETE FROM BUNTY_STUDENTS WHERE ROLLNO = ?");
            st.setString(1, rollno);
            
            int RA = st.executeUpdate();
            if(RA > 0)
            {
                out.println("done");
            }
            
            st.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Delete.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
}
