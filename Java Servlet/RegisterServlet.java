package com.jwt.servlet;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class RegisterServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
 
        String name = request.getParameter("username");
        String age = request.getParameter("age");
        String disease = request.getParameter("disease");
        String medicine = request.getParameter("medicine");
 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hospital", "root", "");
 
            PreparedStatement ps = con
                    .prepareStatement("insert into patients values(?,?,?,?)");
 
            ps.setString(1, name);
            ps.setString(2, age);
            ps.setString(3, disease);
            ps.setString(4, medicine);
 
            int i = ps.executeUpdate();
            if (i > 0)
                out.print("You are successfully entered");
 
        } catch (Exception e2) {
            System.out.println(e2);
        }
 
        out.close();
    }
 
}