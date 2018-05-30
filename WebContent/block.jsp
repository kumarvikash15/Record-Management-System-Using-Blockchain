<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility

String opName=(String)session.getAttribute("opName");
String oid="";
if(opName==null){ 
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
Statement statement = null;
ResultSet result = null;

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
//statement=connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
PreparedStatement ps1 = connection.prepareStatement("select * from patients where bloc_status=? OR bloc_status=?");
ps1.setInt(1, 0);
ps1.setInt(2,2);
result= ps1.executeQuery();

PreparedStatement ps = connection.prepareStatement("SELECT oid FROM operator where USERNAME=?");
ps.setString(1,opName);
ResultSet rs1 = ps.executeQuery();
while(rs1.next()){
	oid = rs1.getString("oid");
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
    <script src="node_modules/web3/dist/web3.min.js"></script>
<style>
body{
background:linear-gradient(to right,#23074d,#cc5333);
}
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
              <a class="nav-link " href="register.jsp">DATABASE</a>
            </li>
            <li class="nav-item active">
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
      
<div class="container text-center">
<h2>Welcome <span id="opName"><%=opName %></span></h2>

        <div class="row">
            <div class="col-md-3 ">
            <h3 class="text-light">BLOCKHAIN ENTRY</h3>
            <p class="text-primary">Entry of patients record to Blockchain.<br>Data will be fetched from database.<p>
            
            </div>
            <div class="col-md-6 bg-light" style="padding:50px; border-radius:15px;">

         <div id="res" class="text-center"></div>
                  <form action="#">
               
                      <h3>Entry to Blockchain</h3>
 
                  <div class="form-group"> 
                    <label for="pname">Name of Patient:</label>
                    <select name="pname" id="pname" class="form-control">
                    <option value="null">---Select Name----</option>
                     <% while(result.next()){%>
                      
                      <option value="<%=result.getString("pid") %>"><%=result.getString("name") %>-><%=result.getString("pid") %></option>
                      <%} %>
                       </select>
                  </div><br/>
                  
                  <div class="form-group">
                    <input type="submit" value="Submit" class="form-control btn btn-danger">
                  </div>
               </form>
  
          </div>
        <div class="col-md-3"></div>  
       </div> 
 </div> <br><br>
       
  <div class="container">
  <div class="row">
  <div class="col-md-3"></div>
  <div class="col-md-6">
  
            
 <%
 ResultSet rs =null;
 String pname = request.getParameter("pname");
 PreparedStatement stmt = connection.prepareStatement("SELECT * FROM patients WHERE pid=?");
 stmt.setString(1,pname);
 rs = stmt.executeQuery();
 %>
  <%
 while(rs.next()){
%>
<div class="bg-light" style="padding:10px; border-radius:15px;">
<h3 class="text-center text-danger">Data to be entered !!</h3>
<p class="text-center text-danger">Ready Only!</p>
<div class="form-row">
  <div class="col-md-6">
    <input type="text" value="<%=rs.getString("pid") %>" id="patient_id" class="form-control" readonly>
  </div>
  <div class="col-md-6">
    <input type="text" value="<%=rs.getString("name") %>" id="patient_name" class="form-control" readonly>
  </div>
  </div> 
  <div class="form-row">
  <div class="col-md-6">
    <input type="text" value="<%=rs.getString("age") %>" id="patient_age" class="form-control" readonly>
  </div>
  <div class="col-md-6">
    <input type="text" value="<%=rs.getString("disease") %>" id="patient_disease" class="form-control" readonly>
  </div>
  </div>
  <div class="form-row">
  <div class="col-md-12">
    <input type="text" value="<%=rs.getString("medicine") %>" id="patient_medicine" class="form-control"  readonly>
  </div>
</div>
  <div class="form-row">
  <div class="col-md-12">
    <button type="button" id="button" class="btn btn-primary form-control">Push</button>
  </div>
  </div>
</div><br><br>
 <% 
 }
 connection.close();
 } catch (Exception e) {
 e.printStackTrace();
 }
 %>
               
   </div>
   <div class="col-md-3"></div>
  </div>
</div>

<%
try{
Connection conn = DriverManager.getConnection(connectionUrl+database, userid, password);
PreparedStatement ps_1 = conn.prepareStatement("select * from patients where bloc_status=0");
ResultSet result_1= ps_1.executeQuery();
PreparedStatement ps_2 = conn.prepareStatement("select * from patients where bloc_status=1");
ResultSet result_2= ps_2.executeQuery();
PreparedStatement ps_3 = conn.prepareStatement("select * from patients where bloc_status=2");
ResultSet result_3= ps_3.executeQuery();
%>

<div class="container text-center" style="padding:15px; border-radius:15px; margin-top:40px;">
<h3 class="text-info">Status For Entry In Blockchain:</h3><br><br>
  <div class="row">
    <div class="col-md-4">

        <div class="card">
          <a data-toggle="collapse" href="#card_1" role="button" aria-expanded="false"  aria-controls="collapseExample"><div class="card-header">New Users:</div></a>
          <div id="card_1" class="collapse">
          <div class="card-body">
            <div class="card-title">New Users for Entry:</div>
             
           <div class="table-responsive" style="height:300px; overflow:scroll;">
          <table class="table table-striped">
          <thead>
           <tr>
           <th scope="col">P_ID</th>
           <th scope="col">P_NAME</th>
           </tr>
           
         </thead>
         <tbody>
         <%while(result_1.next()){ %>
           <tr>
           <td><%=result_1.getString("pid") %></td>
           <td><%=result_1.getString("name") %></td>
           </tr>
           <%} %>
        </tbody>
       </table>
       </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4">
        <div class="card">
          <a data-toggle="collapse" href="#card_2" role="button" aria-expanded="false"  aria-controls="collapseExample"><div class="card-header">Already Pushed Data </div></a>
          <div id="card_2" class="collapse">
          <div class="card-body">
            <div class="card-title">New Users for Entry:</div>
            <div class="table-responsive" style="height:300px; overflow:scroll;">
          <table class="table table-striped">
          <thead>
           <tr>
           <th scope="col">P_ID</th>
           <th scope="col">P_NAME</th>
           </tr>
           
         </thead>
         <tbody>
         <%while(result_2.next()){ %>
           <tr>
           <td><%=result_2.getString("pid") %></td>
           <td><%=result_2.getString("name") %></td>
           </tr>
           <%} %>
        </tbody>
       </table>
       </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4">
    <div id="card_2">
      <div class="card">
        <a data-toggle="collapse" href="#card_3" role="button" aria-expanded="false"  aria-controls="collapseExample"><div class="card-header">Updated Users for Entry:</div></a>
        <div id="card_3" class="collapse">
        <div class="card-body">
          <div class="card-title">New Users for Entry:</div>
          <div class="table-responsive" style="height:300px; overflow:scroll;">
          <table class="table table-striped">
          <thead>
           <tr>
           <th scope="col">P_ID</th>
           <th scope="col">P_NAME</th>
           </tr>
           
         </thead>
         <tbody>
         <%while(result_3.next()){ %>
           <tr>
           <td><%=result_3.getString("pid") %></td>
           <td><%=result_3.getString("name") %></td>
           </tr>
           <%}
         conn.close();
         } catch (Exception e) {
         e.printStackTrace();
         }
            %>
        </tbody>
       </table>
       </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>

  <div class="footer text-center" style="background:black; padding:30px; margin-top:50px; color:#f1f1f1;">
    <p>Copyright (c) 2017 Copyright Holder All Rights Reserved.</p>
  </div>

    <script>
      
    
        if (typeof web3 !== 'undefined') {
            web3 = new Web3(web3.currentProvider);
          } else {
         // set the provider you want from Web3.providers
         web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
       }
        web3.eth.defaultAccount = web3.eth.accounts[0];
        var HospitalContract = web3.eth.contract([
        	{
        		"constant": true,
        		"inputs": [
        			{
        				"name": "_pid",
        				"type": "uint256"
        			}
        		],
        		"name": "getValue",
        		"outputs": [
        			{
        				"name": "",
        				"type": "uint256"
        			},
        			{
        				"name": "",
        				"type": "string"
        			},
        			{
        				"name": "",
        				"type": "uint256"
        			},
        			{
        				"name": "",
        				"type": "string"
        			},
        			{
        				"name": "",
        				"type": "string"
        			}
        		],
        		"payable": false,
        		"stateMutability": "view",
        		"type": "function"
        	},
        	{
        		"constant": false,
        		"inputs": [
        			{
        				"name": "_pid",
        				"type": "uint256"
        			},
        			{
        				"name": "_fName",
        				"type": "string"
        			},
        			{
        				"name": "_age",
        				"type": "uint256"
        			},
        			{
        				"name": "_disease",
        				"type": "string"
        			},
        			{
        				"name": "_medicine",
        				"type": "string"
        			}
        		],
        		"name": "setValue",
        		"outputs": [
        			{
        				"name": "",
        				"type": "uint256"
        			}
        		],
        		"payable": false,
        		"stateMutability": "nonpayable",
        		"type": "function"
        	},
        	{
        		"constant": true,
        		"inputs": [
        			{
        				"name": "",
        				"type": "uint256"
        			}
        		],
        		"name": "recordArray",
        		"outputs": [
        			{
        				"name": "pid",
        				"type": "uint256"
        			},
        			{
        				"name": "fName",
        				"type": "string"
        			},
        			{
        				"name": "age",
        				"type": "uint256"
        			},
        			{
        				"name": "disease",
        				"type": "string"
        			},
        			{
        				"name": "medicine",
        				"type": "string"
        			}
        		],
        		"payable": false,
        		"stateMutability": "view",
        		"type": "function"
        	},
        	{
        		"constant": true,
        		"inputs": [],
        		"name": "getRecordCount",
        		"outputs": [
        			{
        				"name": "",
        				"type": "uint256"
        			}
        		],
        		"payable": false,
        		"stateMutability": "view",
        		"type": "function"
        	}
        ]);     //ABI of the smart contract
        var Hospital = HospitalContract.at('0x223c52fa87c297e0863ff2755a2ab6e2fc69279b');         //Contract address


       $("#button").click(function() {
    	   var pid= $("#patient_id").val();
    	   var name= $("#patient_name").val();
    	   var age= $("#patient_age").val();
    	    var disease= $("#patient_disease").val();
    	    var medicine= $("#patient_medicine").val();
    	    var oid = <%=oid%>;
    	    var opName=$("#opName").html(); 
    	   
    	   console.log(name+age+disease+medicine);
         if(Hospital.setValue(pid,name,age,disease,medicine,{from:web3.eth.accounts[0],gas:1000000})){
        	$.alert("success");
        	$.ajax({
        		url:"BlockLog",
        		type:"POST",
        		data:{
        			oid:oid,
        			opName:opName,
        			pid:pid,
        		    name:name
        		},
        		success:function(result){
        			$("#res").html(result);
        			$("#res").addClass("alert alert-success");
        		}
        	});
         }else{
        	 $.alert("failed");
         }
           
       });

    </script>
    

</body>
</html>