package com.jwt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class FilterResult
 */
@WebServlet("/FilterResult")
public class FilterResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterResult() {
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
	

         String medicine = request.getParameter("medicine");
         String disease	 =request.getParameter("disease");     
         String toDate = request.getParameter("toDate");
         String fromDate=request.getParameter("fromDate");
         int fromAge =0;
         int toAge =0;
         
         try {
        	fromAge = Integer.parseInt(request.getParameter("fromAge"));
            toAge = Integer.parseInt(request.getParameter("toAge"));
         }catch(NumberFormatException nfe) {
        	 fromAge = 0;
        	 toAge =1000;
         }
         
        
  try {    
      if(medicine.equals("")) {
     	    medicine="%%";
     	   
      }else {
     	    medicine = "%"+medicine+"%";
     	  
      }

      if(disease.equals("")) {
       	  disease="%%";
        }else {
       	  disease = "%"+disease+"%";
        }

     

      if(fromDate.equals("")) {
              fromDate="2018-01-01 00:00:00";
      
           }else{
             fromDate = fromDate+" 00:00:00";
      
           }

      if(toDate.equals("")) {
              toDate="2020-01-01 23:59:59";

           }else{
             toDate = toDate+" 23:59:59";

         }
      
    
  }catch(Exception e) {
	  out.print(e);
  }


  String query="SELECT * FROM patients WHERE (disease LIKE ?) AND (age BETWEEN ? and ?) AND (medicine LIKE ?) AND (timestamp BETWEEN ? and ?)";

  System.out.println(query);
  try {
 Class.forName("com.mysql.jdbc.Driver");
 } catch (ClassNotFoundException e) {
 e.printStackTrace();
 }
 try{
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");


  PreparedStatement ps = (PreparedStatement) conn.prepareStatement(query);

ps.setString(1, disease);
ps.setInt(2, fromAge);
ps.setInt(3, toAge);
ps.setString(4, medicine);
ps.setString(5, fromDate);
ps.setString(6, toDate);

      ResultSet rs =ps.executeQuery();


 while(rs.next()) {
   out.print(rs.getInt("pid"));
   out.print("+");
   out.print(rs.getString("name"));
   out.print("+");
   out.print(rs.getInt("age"));
   out.print("+");
   out.print(rs.getString("disease"));
   out.print("+");
   out.print(rs.getString("medicine"));
   out.print("+");
   out.print(rs.getString("timestamp"));
   out.print(">");
 }

 } catch (Exception e) {
 e.printStackTrace();
 }

	
	
	
	}


}
