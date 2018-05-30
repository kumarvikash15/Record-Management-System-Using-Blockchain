package com.jwt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class ShowTable
 */
@WebServlet("/ShowTable")
public class ShowTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowTable() {
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
	

         String	sortBy = request.getParameter("sortBy");
         String	sortOrder =request.getParameter("sortOrder");
         int    sortLow = Integer.parseInt(request.getParameter("sortLow"));
         int	sortHigh = Integer.parseInt(request.getParameter("sortHigh"));

		try {
		Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		try{
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "");
        String sql = "SELECT * FROM patients ORDER BY "+sortBy+" "+sortOrder+" LIMIT "+sortLow+","+sortHigh;

		//PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
        Statement st = (Statement) conn.createStatement();
        ResultSet rs =st.executeQuery(sql);
		
		
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
			out.print(">");
		}
	
		} catch (Exception e) {
		e.printStackTrace();
		}

		
		
		
		
//		PreparedStatement ps = (PreparedStatement) conn.prepareStatement("select * from operator");
//		ResultSet rs = ps.executeQuery();
//		JSONArray jsonArray = new JSONArray();
//        while (rs.next()) {
//            int total_rows = rs.getMetaData().getColumnCount();
//            JSONObject obj = new JSONObject();
//            for (int i = 0; i < total_rows; i++) {
//                obj.put(rs.getMetaData().getColumnLabel(i +1).toLowerCase(), rs.getObject(i +1));
//            }
//          jsonArray.add(obj);
//        }
//        out.print(jsonArray);
//		
		
		
		
		
		
		
	}

}
