
package com.create;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/create")
public class Create extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        try {
            String fname = request.getParameter("FIRSTNAME");
            String lname = request.getParameter("LASTNAME");
            String rno = request.getParameter("ROLLNO");
            String cl = request.getParameter("CLASS");
            String df = request.getParameter("FEES");
            PrintWriter out = response.getWriter();
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("DBURL", "DBNAME", "PASSWORD");
            PreparedStatement st = con.prepareStatement("INSERT INTO BUNTY_STUDENTS VALUES(?,?,?,?,?)");
            st.setString(1, fname);
            st.setString(2,lname);
            st.setString(3,rno);
            st.setString(4,cl);
            st.setString(5,df);
            
            int RA = st.executeUpdate();
            if(RA > 0){
                System.out.println("Created!!!!");
                response.sendRedirect("Create.jsp");
            }
            st.close();
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
        // Log the exception details
        ex.printStackTrace();

        // Optionally, set an attribute to inform the JSP about the error
        request.setAttribute("error", "Database error occurred.");

        // Forward to an error page or handle the error in another way
        request.getRequestDispatcher("/error.jsp").forward(request, response);
    } catch (IOException ex) {
        ex.printStackTrace();
    } catch (Exception ex) {
        // Catch any other unexpected exceptions
        ex.printStackTrace();
    }
    }
}
