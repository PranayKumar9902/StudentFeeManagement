/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.read;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
@WebServlet("/Read")
public class Read extends HttpServlet{
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("DBURL", "DBNAME", "PASSWORD");
            PreparedStatement st = con.prepareStatement("SELECT * FROM BUNTY_STUDENTS");
            ResultSet rs = st.executeQuery();
            PrintWriter out = response.getWriter();
            ArrayList<Student> studentlist = new ArrayList<>();
            
            while(rs.next())
            {
                String fname = rs.getString("FNAME");
                String lname = rs.getString("LNAME");
                String rollno = rs.getString("ROLLNO");
                String cl = rs.getString("CLASS");
                String due = rs.getString("DUE");
                
                Student student = new Student(fname,lname,rollno,cl,due);
                studentlist.add(student);
            }
            
            Gson gson = new Gson();
            String json = gson.toJson(studentlist);
            out.println(json);
            
            st.close();
            con.close();
        } catch (Exception ex) {
            System.out.println("Exception");;
        }
    }
    
}
