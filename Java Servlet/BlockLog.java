package com.jwt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class BlockLog
 */
@WebServlet("/BlockLog")
public class BlockLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlockLog() {
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
		String oid = request.getParameter("oid");
		String opName = request.getParameter("opName");
		String pid = request.getParameter("pid");
		String name = request.getParameter("name");
		String status ="";
	
		
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
		   
		   PreparedStatement ps3 = connection.prepareStatement("SELECT bloc_status FROM patients WHERE pid=?");
		   ps3.setString(1,pid);
		   ResultSet rs = ps3.executeQuery();
		   while(rs.next()) {
			 status = rs.getString("bloc_status");
		   }
		   out.print(status);
		   
		   PreparedStatement ps = connection.prepareStatement("INSERT INTO block_log(oid, opname, patient_id, patient_name) VALUES(?,?,?,?)");
		   ps.setString(1, oid);
		   ps.setString(2,opName);
		   ps.setString(3,pid);
		   ps.setString(4,name);
		   int i= ps.executeUpdate();
	       if(i>0) {
	    	   out.print("successfully pushed");
	    	   if(status.equals("0")) {
	    		   PreparedStatement ps1 = connection.prepareStatement("UPDATE patients SET bloc_status=? WHERE pid=?");
		    	   ps1.setInt(1, 1);
		    	   ps1.setString(2, pid);
		    	   ps1.executeUpdate();
	    	   }
	    	   
	       }else {
	    	   out.print("Error in Log generation !!");
	       }
	       
	       
	      
	       
	   } catch (Exception e2) {      
	   	out.print(e2);
	   }		

	}

}
