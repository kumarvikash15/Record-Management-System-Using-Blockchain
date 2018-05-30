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
 * Servlet implementation class OperatorDelete
 */
@WebServlet("/OperatorDelete")
public class OperatorDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperatorDelete() {
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
		PrintWriter out = response.getWriter();
		response.setContentType("plain/text");
		String username =request.getParameter("username");
		
		if(username.equals("")) {
			out.print("Please Select username !!");
		}else {
			String driver = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String database = "hospital";
			String userid = "root";
			String dbpassword = "";
			try {
			Class.forName(driver);
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			}
			Connection connection = null;
			try{
		   connection = DriverManager.getConnection(connectionUrl+database, userid, dbpassword);
		   
		   //check if username exist
		   
		   PreparedStatement ps = connection.prepareStatement("delete from operator where username=?");
		   ps.setString(1, username);
		       int i = ps.executeUpdate();
		       if (i > 0){ 
		       	out.print("Successfully Deleted");

		       }    
	   } catch (Exception e2) {      
	   	
	   }
		}
		
	}

}
