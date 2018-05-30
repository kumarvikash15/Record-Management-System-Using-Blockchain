package com.jwt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OperatorUpdate
 */
@WebServlet("/OperatorUpdate")
public class OperatorUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperatorUpdate() {
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
        String username =request.getParameter("update_username");
        String password =request.getParameter("update_password");
        String confpassword =request.getParameter("update_confpassword");
        String role =request.getParameter("update_role");
        String email =request.getParameter("update_email");
        
        out.print(username+role);
        	 
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
  	   
//Password Update
       
  	   if(!password.equals("")) {
  		   
    //SHA 256 calculation
  		   
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
      	
     //SQL query
      	
  			 PreparedStatement ps = connection.prepareStatement("update operator set password=? where username=?");
  			 ps.setString(1, passHash);
  			 ps.setString(2, username);
  			 int i=ps.executeUpdate();
  			 if(i>0) {
  				 out.print("Password is updated !!");
  			 }else {
  				 out.print("Error in Password Updation");
  			 }
  		   }else {
  			   out.print("password did not matched");
  		   }
  	   }
  	   
  	   
 //email update
  	   
  	   if(!email.equals("")) {
  		     PreparedStatement ps = connection.prepareStatement("update operator set email=? where username=?");
  		     ps.setString(1, email);
			 ps.setString(2, username);
			 int i=ps.executeUpdate();
			 
			 if(i>0) {
				 out.print("Email is updated !!");
			 }else {
				 out.print("Error in Email Updation");
			 }
  	   }
  		  
 //role update
  	 if(!role.equals("")) {
		     PreparedStatement ps = connection.prepareStatement("update operator set role=? where username=?");
		     ps.setString(1, role);
  			 ps.setString(2, username);
		     int i=ps.executeUpdate();
		     if(i>0) {
			 out.print("Role is updated !!");
		     }else {
			 out.print("Error in Role Updation");
		    }
	    }
  	  
       
     } catch (Exception e2) {      
     	
     }		
  	
 //try catch end       	
        

	}

}
