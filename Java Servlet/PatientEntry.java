package com.jwt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PatientEntry
 */
@WebServlet("/PatientEntry")
public class PatientEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientEntry() {
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
		response.setContentType("plain/txt");
		String oid= request.getParameter("oid");
		String opName= request.getParameter("opName");
		String pid= request.getParameter("pid");
		String username= request.getParameter("username");
		String age= request.getParameter("age");
		String disease= request.getParameter("disease");
		String medicine= request.getParameter("medicine");
//Printwriter		
		PrintWriter writer = response.getWriter();
//Database Connection
		
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String database = "hospital";
		String userid = "root";
		String password = "";
		try {
		Class.forName(driver);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		Connection connection = null;
		try{
		connection = DriverManager.getConnection(connectionUrl+database, userid, password);
		
//Patients Data entry
        PreparedStatement ps = connection.prepareStatement("insert into patients(pid,name,age,disease,medicine) values(?,?,?,?,?)");
        ps.setString(1, pid);
        ps.setString(2, username);
        ps.setString(3, age);
        ps.setString(4, disease);
        ps.setString(5, medicine);

        int i = ps.executeUpdate();
        if (i > 0){ 
        	writer.print("Success");
        }
        
//Operator log Entry   
 
        PreparedStatement ps1 = connection.prepareStatement("insert into log_operator(id, username, action, patient_id, patient_username, patient_age, patient_disease, patient_medicine) values(?,?,?,?,?,?,?,?)");
        ps1.setString(1, oid);
        ps1.setString(2, opName);
        
        ps1.setString(3, "insert");
        ps1.setString(4, pid);
        ps1.setString(5, username);
        ps1.setString(6, age);
        ps1.setString(7, disease);
        ps1.setString(8, medicine);

        int a = ps1.executeUpdate();
        if (a > 0){ 
        	writer.print("Log");
        }
        
    } catch (Exception e2) {      
    	
    }
}
}
