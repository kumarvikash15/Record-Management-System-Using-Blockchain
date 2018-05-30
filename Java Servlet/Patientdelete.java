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
 * Servlet implementation class Patientdelete
 */
@WebServlet("/Patientdelete")
public class Patientdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Patientdelete() {
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
		String update_pid =request.getParameter("update_pid");
		String oid =request.getParameter("oid");
		String opName =request.getParameter("opName");
		if(update_pid.equals("none")) {
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
		   
		   PreparedStatement ps = connection.prepareStatement("delete from patients where pid=?");
		   ps.setString(1, update_pid);
		       int i = ps.executeUpdate();
		       if (i > 0){ 
		       	out.print("Successfully Deleted");
		       	PreparedStatement ps1 = connection.prepareStatement("INSERT INTO log_operator(id,username,action,patient_id,patient_username) VALUES(?,?,?,?,?)");
		       	ps1.setString(1, oid);
		       	ps1.setString(2, opName);
		       	ps1.setString(3, "delete");
		       	ps1.setString(4, update_pid);
		       	ps1.setString(5, "Relative-ID");
		       	ps1.executeUpdate();
		       }    
	   } catch (Exception e2) {      
	   	
	   }
		}
	}

}
