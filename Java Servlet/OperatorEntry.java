package com.jwt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
 * Servlet implementation class OperatorEntry
 */
@WebServlet("/OperatorEntry")
public class OperatorEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperatorEntry() {
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
		String oid =request.getParameter("oid");
        String username =request.getParameter("username");
        String password =request.getParameter("password");
        String confpassword =request.getParameter("confpassword");
        String role =request.getParameter("role");
        String email =request.getParameter("email");
        
        if(password.equals(confpassword)) {
        	
        MessageDigest digest = null;
		try {
			digest = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		byte[] encodedhash = digest.digest(
		password.getBytes(StandardCharsets.UTF_8));	   
		StringBuffer hexString = new StringBuffer();
	    for (int i = 0; i < encodedhash.length; i++) {
	    String hex = Integer.toHexString(0xff & encodedhash[i]);
	    if(hex.length() == 1) hexString.append('0');
	        hexString.append(hex);
	    }
	   String passHash= hexString.toString();
	   
	   
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
	   
	   PreparedStatement ps1 = connection.prepareStatement("select username from operator where username=?");
	   ps1.setString(1, username);
	   ResultSet rs= ps1.executeQuery();
	   if(!rs.next()) {
		   PreparedStatement ps = connection.prepareStatement("insert into operator(oid,username,password,role,email) values(?,?,?,?,?)");
	       ps.setString(1, oid);
	       ps.setString(2, username);
	       ps.setString(3, passHash);
	       ps.setString(4, role);
	       ps.setString(5, email);

	       

	       int i = ps.executeUpdate();
	       if (i > 0){ 
	       	out.print("Success");
	       }else {
	    	   out.print("Failed");
	       }
	   }else {
		   out.print("Username already exist !!!");
	   }
      
       
   } catch (Exception e2) {      
   	
   }		
	}else {
		out.println("Password did not matched !!");
	}
	}

}
