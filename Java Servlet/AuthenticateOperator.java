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
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class AuthenticateOperator
 */
@WebServlet("/AuthenticateOperator")
public class AuthenticateOperator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthenticateOperator() {
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
/* Form-Handling*/
		
		
		    response.setContentType("plain/text");
		    String username= request.getParameter("username");
		    String password= request.getParameter("password");
		    PrintWriter out = response.getWriter();
		    
/* Database Fetch */
		    String pass="";
            String role="";
            int oid=0;
		    
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
			//Statement statement = null;
			ResultSet result = null;
			try{
			connection = DriverManager.getConnection(connectionUrl+database, userid, dbpassword);
			// statement=(Statement) connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

	        PreparedStatement ps = connection.prepareStatement("select * from operator where username = ?");
	        ps.setString(1, username);
	        
	
			//String sql="select * from operator";
	          result = ps.executeQuery();
   
            
		while(result.next())
		{
	    	    oid= result.getInt("oid");
	    	    pass= result.getString("password");
	    	    role= result.getString("role");
	    	    
		}
	    	 	      
	  }
			catch (Exception e2) {      
	  	
	  }
			
        
//Hash Generator

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
	    
	   String passhash= hexString.toString();
	   

	   
	   if(passhash.equalsIgnoreCase(pass)) {
		   if(role.equals("operator")) {			   
			   HttpSession session=request.getSession();  
		       session.setAttribute("opName",username);
		       session.setAttribute("oid",oid);     
		       out.print("operator.jsp");
			   
		   }
		   else if(role.equals("employee")) {
			   HttpSession session=request.getSession();  
			   session.setAttribute("empName",username);
			   session.setAttribute("empid",oid);
			   out.print("employee.jsp");
		   }
		   else if(role.equals("admin")) {
			   HttpSession session=request.getSession();  
			   session.setAttribute("adminName",username);
			   session.setAttribute("adminId",oid);
			   out.print("Admin.jsp");
		   }
	   }else {
		   out.print("error");
		   
	   }
	   
	   
		
	}


}
