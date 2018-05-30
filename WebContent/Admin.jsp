<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
    
<% 
//HttpSession session=request.getSession(false);  

	response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility


	String adminName=(String)session.getAttribute("adminName");
	if(adminName==null){ 
		response.sendRedirect("error.jsp");
		
	}  
 

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

ResultSet resultSet = null;

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);

PreparedStatement ps =  connection.prepareStatement("select * from log_operator");
resultSet = ps.executeQuery();
PreparedStatement ps1 =  connection.prepareStatement("select * from operator");
ResultSet result=ps1.executeQuery();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

    <style>
      body{
    	  background:linear-gradient(to right,#23074d,#cc5333);
      }
      a:link{
        text-decoration:none; 
      }
      input[type=text], input[type=password],input[type=number],input[type=email]{
      border:1px black solid;
      }
      select.form-control{border:1px black solid;}
   
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
              <a class="nav-link active" >Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="logout.jsp">Logout</a>
            </li>
          
          </ul>
      </div>
      </div>
        </div>
      </nav>
<br><br>


<!-- Operator update form -->

<div class="container">
<div class="row">
    <div class="col-md-12">
    <div class="text-center">
   <div class="alert alert-danger"  id="passError">Message</div>
    </div>
    <div class="card text-center">
    <a data-toggle="collapse" href="#entry" role="button" aria-expanded="false"  aria-controls="collapseExample"><div class="card-header" >Operator Entry</div></a>
    <div class="collapse show" id="entry">
    <div class="card-body text-danger">
    <h5 class="card-title">Enter operator record !!</h5>
    
    
      
 <form id="formEntry" >
    <div class="form-row">
      <div class="col-md-4">
        <input type="number" name="oid" class="form-control" placeholder="Enter ID:" required>
      </div>
      <div class="col-md-8">
        <input type="text" name="username"  minlength="3" class="form-control" placeholder="Enter Username:" required>
      </div>
      </div><br>
      <div class="form-row">
      <div class="col-md-6">
        <input type="password" name="password" id="password" minlength="6" class="form-control" placeholder="Enter Password:"  required>
      </div>
      <div class="col-md-6">
        <input type="password" name="confpassword" id="confpassword" minlength="6" class="form-control" placeholder="Confirm Password:" required>
      </div>
      </div><br>
      <div class="form-row">
      <div class="col-md-6">
        <select class="form-control" name="role" id="entrySelect">
          <option value="operator"class="form-control">operator</option>
          <option value="employee" class="form-control">employee</option>
        </select>
      </div>
      <div class="col-md-6">
        <input type="email" placeholder="Enter Email:" name="email" class="form-control">
      </div>
      </div><br>
      <div class="form-row">
          <div class="col-md-12">
              <input type="submit" name="submit" class="btn btn-danger form-control" value="submit">
            </div>
      </div>

  </form>     
  
     </div>
     </div>
     
     <div class="card-footer bg-transparent border-success text-primary">Entry is limited!!</div>
    </div>
    </div>
</div>
</div>

<!-- Operator update form -->
<br><br>
<div class="container">
<div class="row">
    <div class="col-md-12">

    <div class="card text-center">
    <a data-toggle="collapse" href="#update" role="button"aria-expanded="false"  aria-controls="collapseExample"><div class="card-header" >Operator Update</div></a>
    <div class="collapse" id="update">
    <div class="card-body text-danger">
    <h5 class="card-title">Update whatever required !!</h5>
 <div id="message" class="alert alert-danger">Message</div>
 
 
<form id="formUpdate" >
    <div class="form-row">
      <div class="col-md-12">
        <select name="update_username" id="update_username" class="form-control" >
          <option value="">-------Select Name---------</option>
          <% while(result.next()){ %>
          <option value="<%=result.getString("username")%>"><%=result.getString("username")%></option>
          <%}%>
        </select>
      </div>
    </div><br>
    <div class="form-row">
        <div class="col-md-6">
            <input type="password" name="update_password" id="update_password" minlength="6" class="form-control" placeholder="password">
          </div>
          <div class="col-md-6">
            <input type="password" name="update_confpassword" id="update_confpassword" minlength="6" class="form-control" placeholder="Confirm password">
          </div>
    </div><br>
    <div class="form-row">
        <div class="col-md-6">
            <select class="form-control" name="update_role">
              <option value="">--------------Default---------------</option>
              <option value="operator"class="form-control">operator</option>
              <option value="employee" class="form-control">employee</option>
            </select>
        </div>
        <div class="col-md-6">
          <input type="email" name="update_email" class="form-control" placeholder="Email">
        </div>
    </div><br>
    <div class="form-row">     
      <div class="col-md-12">
              <input type="submit" name="submit" class="btn btn-primary form-control" value="submit">
      </div>      
    </div><br>   
  </form>
  
  <!-- Delete Operator -->
  
  <div class="form-row">
    
        <div class="col-md-12">
            <input type="button" id="deleteUser" class="form-control btn btn-danger" value="Delete Operator">
          </div>  
    </div>
    
    
    <br>     
    
     </div>
     </div>
     <div class="card-footer bg-transparent border-success text-primary">Entry is limited!!</div>
    </div>
    </div>
</div>
</div>
  
<br><br>


<!-- LOG -->

<div class="container">
<div class="row">
    <div class="col-md-12">
    <div class="card text-center">
    <a data-toggle="collapse" href="#down" role="button" aria-expanded="false" aria-controls="collapseExample"><div class="card-header" >Log Generated For DB</div></a>
    <div class="collapse" id="down">
    <div class="card-body text-danger">
    <h5 class="card-title">Log Generated for any changes in Database.</h5>
    <div class="table-responsive">
                <table class="table table-striped ">
        <thead>
            <tr class="text-primary">
                    <td scope="col">O-ID</td>
                    <td scope="col">OP-username</td>
                    <td scope="col">Action</td>
                    <td scope="col">P-ID</td>
                    <td scope="col">P-Name</td>
                    <td scope="col">P-Age</td>
                    <td scope="col">P-Disease</td>
                    <td scope="col">P-Medicine</td>
                    <td scope="col">Timestamp</td>
            </tr>
        </thead>
        <tbody class="text-dark">
            
                <% while(resultSet.next()) { %>
                <tr>
                <td><%=resultSet.getString("id")%></td>
                <td><%=resultSet.getString("username")%></td>
                <td><%=resultSet.getString("action")%></td>
                <td><%=resultSet.getString("patient_id")%></td>
                <td><%=resultSet.getString("patient_username")%></td>
                <td><%=resultSet.getString("patient_age")%></td>
                <td><%=resultSet.getString("patient_disease")%></td>
                <td><%=resultSet.getString("patient_medicine")%></td>
                <td><%=resultSet.getString("timestamp")%></td>
                 </tr>
                <% 
                  }
                connection.close();
                }catch(Exception e){
                	
                } 
                %>
           
          </tbody>
        </table>
        </div>
     </div>
     </div>
     <div class="card-footer bg-transparent border-success text-primary">Changes are not allowed !!</div>
    </div>
    </div>
</div>
</div><br><br>

<%
try{
Connection conn = DriverManager.getConnection(connectionUrl+database, userid, password);

PreparedStatement ps_block =  conn.prepareStatement("select * from block_log");

ResultSet result_1=ps_block.executeQuery();

%>
<div class="container">
<div class="row">
    <div class="col-md-12">
    <div class="card text-center">
    <a data-toggle="collapse" href="#down1" role="button" aria-expanded="false" aria-controls="collapseExample"><div class="card-header" >Log Generated for Blockchain</div></a>
    <div class="collapse" id="down1">
    <div class="card-body text-danger">
    <h5 class="card-title">Log Generated for any changes in Blockchain.</h5>
    <div class="table-responsive">
                <table class="table  table-striped ">
        <thead>
            <tr class="text-primary">
                    <td scope="col">OP-ID</td>
                    <td scope="col">OP-name</td>
                    <td scope="col">P-ID</td>
                    <td scope="col">P-NAME</td>
                    
                    <td scope="col">Timestamp</td>
            </tr>
        </thead>
        <tbody class="text-dark">
            
                <% while(result_1.next()) { %>
                <tr>
                <td><%=result_1.getString("oid")%></td>
                <td><%=result_1.getString("opname")%></td>
                <td><%=result_1.getString("patient_id")%></td>
                <td><%=result_1.getString("patient_name")%></td>
                <td><%=result_1.getString("timestamp")%></td>
                
                 </tr>
                <% 
                  }
                conn.close();
                }catch(Exception e){
                	
                } 
                %>
           
          </tbody>
        </table>
        </div>
     </div>
     </div>
     <div class="card-footer bg-transparent border-success text-primary">Changes are not allowed !!</div>
    </div>
    </div>
</div>
</div>
<!-- Footer-->
<br><br>
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
  
 <script type="text/javascript">
    $(document).ready(function(){
    	
    	$("#formEntry").on("submit",function(e){
    		e.preventDefault();
            var password = $("#password").val();
            var confpassword = $("#confpassword").val();
            	if(password==confpassword){
                    $.ajax({
                        type:'POST',
                        url:'OperatorEntry',
                        data: $('#formEntry').serialize(),
                        success:function(output) {
                          $.alert(output);
                        }
                        
                      });
                }else{
                	$("#confpassword").css("border","2px red solid");
                	$("#confpassword").effect("shake");
                	
                	$("#passError").html("Passward not Matched !!");
                }
    	});
    	
    	
    	
    	
    	
    	$("#formUpdate").on("submit",function(e){
    		e.preventDefault();
            var password = $("#update_password").val();
            var confpassword = $("#update_confpassword").val();
  
            	if(password==confpassword){
                    $.ajax({
                        type:'POST',
                        url:'OperatorUpdate',
                        data: $('#formUpdate').serialize(),
                        success:function(output) {
                          $.alert(output);
                          
                        }
                        
                      });
                }else{
                	$("#upadate_confpassword").css("border","2px red solid");
                	$("#update_confpassword").effect("shake");
                	
                	$("#message").html("Passward not Matched !!");
                }
    	});

      $("#deleteUser").click(function(){
        var username=$("#update_username").val();
        $.confirm({
    title: 'WARNING!!',
    content: 'Do you really want to delete'+username,
    buttons: {
        confirm: function () {
          
          $.ajax({
          url:"OperatorDelete",
          type:"POST",
          data:{
            username:username
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
     
        
       });
    	
    });
  </script>
</body>
</html>
