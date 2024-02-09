/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.calculate;

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
@WebServlet("/calculate")
public class Calculate extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        try {
            int bal = Integer.parseInt(request.getParameter("BALANCE"));
            int am = Integer.parseInt(request.getParameter("AMOUNT"));
            String rollno = request.getParameter("ROLLNO");
           
            PrintWriter out = response.getWriter();
            int newbal = bal-am;
            String ans = "";
            if(newbal < 0){
                ans = "INVALID";
            }else{
                ans = newbal+"";
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.24:1521:orclnew1", "C##TRAINEES_DATABASE", "system123#");
                PreparedStatement st = con.prepareStatement("UPDATE BUNTY_STUDENTS SET DUE = ? WHERE ROLLNO = ?");
                st.setString(1, ans);
                st.setString(2, rollno);
                
                int RA = st.executeUpdate();
                if(RA <= 0){
                    ans = "rollno";
                }
            }
            
            out.println(ans);
        } catch (Exception ex) {
            Logger.getLogger(Calculate.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
