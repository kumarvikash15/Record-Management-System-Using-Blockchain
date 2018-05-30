package com.jwt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ContactForm
 */
@WebServlet("/ContactForm")
public class ContactForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("plain/text");
		PrintWriter out = response.getWriter();
		String name =request.getParameter("name");
        String email =request.getParameter("email");
        String phone =request.getParameter("phone");
        String query =request.getParameter("query");
        
        	 
     	String driver = "com.mysql.jdbc.Driver";
  		String connectionUrl = "jdbc:mysql://localhost:3306/";
  		String database = "hospital";
  		String userid = "root";
  		String dbpassword = "";
  		Connection connection = null;
  		try {
  		Class.forName(driver);
  		} catch (ClassNotFoundException e) {
  		e.printStackTrace();
  		}
  		
  		try{
  	   
  	   connection = DriverManager.getConnection(connectionUrl+database, userid, dbpassword);
  	   
  	   PreparedStatement ps = connection.prepareStatement("INSERT INTO contact_us VALUES(?,?,?,?)");
  	   ps.setString(1, name);
  	   ps.setString(2, phone);
  	   ps.setString(3, email);
  	   ps.setString(4, query);
  	   int i =ps.executeUpdate();
  	   if(i>0) {
  		out.print("You query submitted successfully. We will get back to you shortly.");   
  	   }else {
  		   out.print("Error Occured. Try AGAIN!!!");
  	   }
  	   }catch(Exception e) {
  		   out.print(e);
  	   }
  	   
	}

}
