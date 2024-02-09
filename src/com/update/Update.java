/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.update;

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
@WebServlet("/update")
public class Update extends HttpServlet{
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        
        try {
            String fname = request.getParameter("FIRSTNAME");
            String lname = request.getParameter("LASTNAME");
            String rollno = request.getParameter("ROLLNO");
            String cl = request.getParameter("CLASS");
            String due = request.getParameter("DUE");
            PrintWriter out = response.getWriter();
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("DBURL", "DBNAME", "PASSWORD");
            PreparedStatement st = con.prepareStatement("UPDATE BUNTY_STUDENTS SET FNAME = ? , LNAME = ? , CLASS = ? , DUE = ? WHERE ROLLNO = ?");
            st.setString(1, fname);
            st.setString(2, lname);
            st.setString(3, cl);
            st.setString(4, due);
            st.setString(5, rollno);
            
            int RA = st.executeUpdate();
            if(RA > 0 ){
                out.println("done");
            }else{
                out.println("Error in Server!!!");
            }
            st.close();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(Update.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
