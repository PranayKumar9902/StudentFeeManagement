/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.read;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet("/fetch")
public class Fetch extends HttpServlet{
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        try {
            PrintWriter out = response.getWriter();
            String rollno = request.getParameter("ROLLNO");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("DBURL", "DBNAME", "PASSWORD");
            
            PreparedStatement st = con.prepareStatement("SELECT DUE FROM BUNTY_STUDENTS WHERE ROLLNO = ?");
            st.setString(1, rollno);
            
            ResultSet rs = st.executeQuery();
            String due = "";
            if(rs.next()){
                due = rs.getString("DUE");
            }else{
                due = "INVALID";
            }
            st.close();
            con.close();
            out.println(due);
        } catch (Exception ex) {
            Logger.getLogger(Fetch.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    }
}
