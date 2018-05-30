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
 * Servlet implementation class UpdateEntry
 */
@WebServlet("/UpdateEntry")
public class UpdateEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEntry() {
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
		   String oid= request.getParameter("oid");
		   String opName= request.getParameter("opName");         
		   String update_pid= request.getParameter("update_pid");
		   String update_age= request.getParameter("update_age");
		   String update_disease= request.getParameter("update_disease");
		   String update_medicine= request.getParameter("update_medicine");
		   PrintWriter writer = response.getWriter();
		   if(update_pid.equals("none")) {
			   writer.print("Select Username First !!!!");
		   }else {
		  
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
		   PreparedStatement ps = connection.prepareStatement("update patients set bloc_status=? where pid=? ");
	       ps.setInt(1, 2);
	       ps.setString(2, update_pid);
	       ps.executeUpdate();
		       if(!update_age.equals("")){
		    	   PreparedStatement ps1 = connection.prepareStatement("update patients set age=? where pid=? ");
			       ps1.setString(1, update_age);
			       ps1.setString(2, update_pid);
			       ps1.executeUpdate();
			       writer.print("Updated:Age");
		     }
		       if(!update_disease.equals("")){
		       PreparedStatement ps2 = connection.prepareStatement("update patients set disease=? where pid=? ");
		       ps2.setString(1, update_disease);
		       ps2.setString(2, update_pid);
		       ps2.executeUpdate();
		       writer.print("Updated:Disease");
		    }
		     if(!update_medicine.equals("")){
		      PreparedStatement ps3 = connection.prepareStatement("update patients set medicine=? where pid=? ");
		      ps3.setString(1, update_medicine);
		      ps3.setString(2, update_pid);
		      ps3.executeUpdate();
		      writer.print("Updated:Medicines");
		   }
		     PreparedStatement ps1 = connection.prepareStatement("insert into log_operator(id, username, action, patient_id, patient_username, patient_age, patient_disease, patient_medicine) values(?,?,?,?,?,?,?,?)");
		        ps1.setString(1, oid);
		        ps1.setString(2, opName);
		        
		        ps1.setString(3, "update");
		        ps1.setString(4, update_pid);
		        ps1.setString(5, "Relative-ID");
		        ps1.setString(6, update_age);
		        ps1.setString(7, update_disease);
		        ps1.setString(8, update_medicine);

		        int a = ps1.executeUpdate();
		        if (a > 0){ 
		        	writer.print(" & Log generated !");
		        }
		     

		   } catch (Exception e2) {
             writer.print("Custom exception:"+e2);
		   }
	}
	}

}
