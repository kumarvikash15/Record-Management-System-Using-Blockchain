<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%
//HttpSession session=request.getSession(false);  

	response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility

	String opName=(String)session.getAttribute("opName");
	
	if(opName==null){ 
		response.sendRedirect("error.jsp");
		
	}  
	else{ 
		int oid=(Integer)session.getAttribute("oid");
	

//String id = request.getParameter("userid");
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
Statement statement = null;
ResultSet resultSet = null;

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
String sql ="select * from patients";
resultSet = statement.executeQuery(sql);

%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
    <style>
    input[type=text], input[type=password],input[type=number],input[type=email]{
      border:1px black solid;
      }
      select.form-control,textarea.form-control{border:1px black solid;}
    </style>

  </head>
  <body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon "></span>
      </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
        <div class="menu">
        <div id="menu-center">
          <a class="navbar-brand" href="#"><span class="logo">Record Management System</span></a>
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0" id="myDiv">
            <li class="nav-item">
              <a class="nav-link active" href="index.jsp">HOME</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="block.jsp">BLOCKCHAIN</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="stats.jsp">STATS</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="logout.jsp">LOGOUT</a>
            </li>
      </div>
      </div>
        </div>
      </nav><br><br>
      
      <div class="container">
      <h2 class="text-center text-light" style="font-family:monospace; font-weight:bold;"><span class="bg-dark text-danger" style="padding:10px; border-radius:10px;">Welcome to DB control-<span id="opName"><%=opName %></span></span></h2><br>
      <div class="row">
       <div class="col-md-12">
         <div class="card text-center">
       
           <a data-toggle="collapse" href="#entry" role="button" aria-expanded="false"  aria-controls="collapseExample"><div class="card-header">Entries</div></a>
           <div class="collapse" id="entry">
           <div class="card-body">

                 
                     <div class="card-title">Entry to DB</div>

                     
                     <div class="form-row">

                     <div class="col-md-4">
                     <div class="form-group">
                     <input type="number" name="pid" id="pid" class="form-control" placeholder="Enter ID:">
                     </div>
                     </div>
                     <div class="col-md-8">
                     <div class="form-group">
                     <input type="text" name="username" id="username" class="form-control" placeholder="Enter Name:">
                     </div>
                     </div>
                     </div>


                     <div class="form-row">
                     <div class="col-md-4">
                     <div class="form-group">
                     <input type="number" name="age" id="age" placeholder="Enter Age:" class="form-control">
                     </div>
                     </div>
                     <div class="col-md-8">
                     <div class="form-group">
                     <input type="text" name="disease" id="disease" class="form-control" placeholder="Enter Disease:" id="disease">
                     </div>
                     </div>
                     </div>


                      <div class="form-row">
                      <div class="col-md-12">

                      <div class="form-group">
                      <textarea name="medicine" id="medicine" rows="4" cols="20" class="form-control" placeholder="Enter Prescription:"></textarea>

                     </div>
                      </div>
                      </div>
                      <div class="form-row">
                      <div class="col-md-12">

                     <div class="form-group">
                     <input type="submit" value="Submit" id="entryBtn" class="form-control btn btn-danger"/>

                      </div>
                      </div>
                      </div>

                   </div>
                   </div> 
                   <div class="card-footer bg-transparent border-success text-primary">Entry only !!!!</div>
                   </div>
                   </div>
              
               </div>
               </div><br>
               
               
 <div class="container">           
    <div class="row">        
         <div class="col-md-12">
         <div class="card text-center">
           <a data-toggle="collapse" href="#update" role="button" aria-expanded="false"  aria-controls="collapseExample"><div class="card-header">Updates</div></a>
           <div class="collapse" id="update">
           <div class="card-body">
                      
                     <div class="card-title">update to db</div>                     
                       <div class="form-group">
                           <select class="form-control" id="update_pid" class="form-control" name="update_pid">
                             <option value="none" class="form-control">---------SELECT NAME-----------</option>
                             <% while(resultSet.next()){ %>
                             <option value="<%=resultSet.getString("pid") %>" class="form-control"><%=resultSet.getString("pid") %>**<%=resultSet.getString("name") %></option>
                             <%} %>
                           </select>
                        
                       </div>

                    <div class="form-row">
                      <div class="col-md-3">
                        <div class="form-group">
                          <input type="number" class="form-control" name="update_age" id="update_age" placeholder="Age:">
                        </div>
                      </div>
                      <div class="col-md-9">
                        <div class="form-group">
                          <input type="text" name="update_disease" id="update_disease" placeholder="Enter Disease:" class="form-control">
                        </div>
                      </div>
                    </div>

                    <div class="form-row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <textarea name="update_medicine" id="update_medicine" class="form-control" rows="4" cols="10" placeholder="Update Prescription"></textarea>
                        </div>
                      </div>
                    </div>
                    <div class="form-row">
                    <div class="col-md-6">
                        <div class="form-group">
                          <input type="button" id="deleteUser" class="btn btn-danger form-control" name="" value="Delete User">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <input type="button" id="updateBtn" class="btn btn-danger form-control" name="" value="Update">
                        </div>
                      </div>
                      
                    </div>
                   </div>
                 </div>
                 <div class="card-footer bg-transparent border-success text-primary">Updation !!!!</div>
                </div>
               </div>
                </div>
               </div>
             
      

                 
 

<br><br>
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="card text-center" id="statBody">
        <div class="card-header">Stats of table</div>
        <div class="card-body stat-body">
        
          <div class="card-title "><a id="refresh" href="#statBody" class="text-danger">Click to Refresh</a></div>

            <div style="overflow:scroll; height:400px;">                       
            <table class="table table-striped table-dark" >
            <tr>
            <td scope="col">ID</td>
            <td scope="col">Name</td>
            <td scope="col">Age</td>
            <td scope="col">Disease</td>
            <td scope="col">Medicines</td>
            <td scope="col">Timestamps</td>
            </tr>
            
            <%
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
            %>
            <tr>
            <td><%=resultSet.getString("pid") %></td>
            <td><%=resultSet.getString("name") %></td>
            <td><%=resultSet.getString("age") %></td>
            <td><%=resultSet.getString("disease") %></td>
            <td><%=resultSet.getString("medicine") %></td>
            <td><%=resultSet.getString("timestamp") %></td>
            </tr>
            <%
            }
            connection.close();
            } catch (Exception e) {
            e.printStackTrace();
            }
            %>

            </table>          
        </div>
      </div>
    </div>
  </div>
</div>
</div>
                




<%-- Jquery code here --%>

<script type="text/javascript">
$(function () {
            var availableTags = [
             
              "Ischemic heart disease",
              "Diarrhea",
              "Chronic obstructive pulmonary ",
              "Cancer",
              "Bronchus",
              "Lung-Cancer",
              "Alzheimer's disease",
              "Trachea",
              "Influenza ",
              "pneumonia",
              "Cholera",
              "Pox",
              "Yellow Fever",
              "Tuberculosis",
              "Perinatal Complications",
              "Ebola",
              "Avian Influenza",
              "Tetanus",
              "Chronic Obstructive Pulmonary Disease",
              "Meningitis",
              "Syphilis"
            ];
            $("#disease").autocomplete({
                source: availableTags,
                minLength: 1,
                autoFocus: true

            });
            $("#update_disease").autocomplete({
                source: availableTags,
                minLength: 1,
                autoFocus: true

            });
        });

</script>
 
  <script type="text/javascript">
  
 
     $(document).ready(function(){
    	 
    	
    	 var opName =$("#opName").html();         
         var oid = <%=oid%>;
      $("#entryBtn").click(function () {

    	var pid=$("#pid").val(); 
        var username=$("#username").val();
        var age=$("#age").val();
        var disease=$("#disease").val();
        var medicine=$("#medicine").val();
        $.ajax({
          type:"POST",
          url:"PatientEntry",
          data:{
        	    pid: pid,
        	    username: username,
        	    age: age,
        	    disease: disease,
        	    medicine: medicine,
        	    oid:oid,
        	    opName:opName
        	    
        	   },
          success:function(result){
           $.alert(result);
          }
        });
      });
      
      
      $("#updateBtn").click(function () {
    	  var update_pid=$("#update_pid").val();
    	  if(update_pid=="none"){
    		  $.alert("Select Username First !!!");
    	  }else{
    	 
          var update_age=$("#update_age").val();
          var update_disease=$("#update_disease").val();
          var update_medicine=$("#update_medicine").val();
          
          if(update_age == "" && update_disease=="" && update_medicine ==""){
        	  $.alert("Please fill something to update !!");
          }else{
          $.ajax({
            type:"POST",
            url:"UpdateEntry",
            data:{update_pid: update_pid,
         	    update_age: update_age,
         	    update_disease: update_disease,
         	    update_medicine: update_medicine,
         	    oid:oid,
       	        opName:opName
         	   },
            success:function(result){
              $.alert(result);
            }
          });
    	  }
    	  }
        });
      
      
      $("#deleteUser").click(function(){
    	  var update_pid=$("#update_pid").val();
    	  if(update_pid=="none"){
    		  $.alert("Select Username First!!");
    	  }else{
          $.confirm({
           title: 'WARNING!!',
           content: 'Do you really want to delete Id: '+update_pid,
      buttons: {
          confirm: function () {
            
            $.ajax({
            url:"Patientdelete",
            type:"POST",
            data:{
              update_pid:update_pid,
              oid:oid,
              opName:opName
            },
            success:function(result){
              $.alert(result);
            }
          });
            
              
          },
          cancel: function () {
              $.alert('Canceled!');
          },
         
      }
     }); 
      }
         });
      
      
      
      $('#refresh').click(function(e) {
  	    location.reload();
  	});
     });
   </script>
    
   <div style="background:#000000; color:#ffffff;">

     <div class="container">
       <div class="text-center">
         <h4>Copyright (c) 2017 Copyright Holder All Rights Reserved.</h4>
       </div>
       <div class="row">
         <div class="col-md-12">
           <div class="list-group">
            <a href="register.jsp"><span class="badge">1</span>Database</a>
           
            <a href="block.jsp"><span class="badge">2</span>Blockchain</a>
            <a href="#" ><span class="badge">2</span>Manager</a>
            
          </div>
         </div>
  
       </div>
     </div>
   </div>
  </body>
</html>
<% }%>