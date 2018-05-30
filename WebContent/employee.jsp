<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
//HttpSession session=request.getSession(false);  
String empName=(String)session.getAttribute("empName");  
if(empName==null ){ 
	response.sendRedirect("error.jsp");
	
	
}  
else{ 
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

	ResultSet rs = null;

	try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);

	PreparedStatement ps =  connection.prepareStatement("select * from patients");
	rs = ps.executeQuery();
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="node_modules/web3/dist/web3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
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
              <a class="nav-link active" href="index.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="logout.jsp">Logout</a>
            </li>

          </ul>
      </div>
      </div>
        </div>
      </nav>
      <br>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card text-center">
                <div class="card-header">Welcome <%out.print(empName); %></div>
                
                <div class="card-body">
                    <div class="card-title">Feed</div>
                    <h4>You are authorized as Employee - status-2</h4>
                    <ul class="text-dark" style="text-align:justify;">
                    <li>You can View patients individual Blockchain Data.</li>
                    <li>Enter Patient ID in below section to get Value.</li>
                    <li>You are not allowed for any write activity.</li>
                    <li>You can view data as per organization Policy.</li>                    
                    </ul>

                    <li><a href="logout.jsp">LOGOUT-EMP</a></li>
                </div>
            </div>
        </div>
    </div>
    </div><br>    
    
  <div class="container">
  <div class="bg-danger" id="outValue"></div>
  <div class="row" style="padding:30px;">
  <div class="col-md-2.5 text-light">
    <h4>Enter Patient ID:</h4>
  </div>   
  <div class="col-md-7">
  
  <input type="number" class="form-control" id="outName">
  </div>
  <div class="col-md-2.5">
    <input type="button" class="btn btn-danger" value="Show Output" id="outGo">
  </div>   
  </div>
    <br><br>
    <div class="row">
    <div class="col-md-12">
        <div class="card text-center">
           <a data-toggle="collapse" href="#down" role="button" aria-expanded="false" aria-controls="collapseExample"><div class="card-header">Statistics</div></a>
            <div class="collapse" id="down">
            <div class="card-body">
                <div class="card-title text-danger" >View Only</div>
                <div style="overflow:scroll; height:400px;">
                <table class="table table-bordered table-dark">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Timestamp</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                    <% while(rs.next()){ %>
                        
                        <tr>
                            <td><%=rs.getString("pid")%></td>
                            <td><%=rs.getString("name")%></td>
                            <td><%=rs.getString("timestamp")%></td>                            
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

    	PreparedStatement ps_new =  conn.prepareStatement("select * from contact_us");
    	ResultSet rs_new = ps_new.executeQuery();
    %>
    
    
    <div class="container">
        <div class="row">
    <div class="col-md-12">
        <div class="card text-center">
           <a data-toggle="collapse" href="#down1" role="button" aria-expanded="false" aria-controls="collapseExample"><div class="card-header">Enquiries</div></a>
            <div class="collapse" id="down1">
            <div class="card-body">
                <div class="card-title text-danger" >Enquiry created by users:-</div>
                <div style="overflow:scroll; height:400px;">
                <table class="table table-bordered table-dark">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Query</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                    <% while(rs_new.next()){ %>
                        
                        <tr>
                            <td><%=rs_new.getString("name")%></td>
                            <td><%=rs_new.getString("phone")%></td>
                            <td><%=rs_new.getString("email")%></td>
                            <td><%=rs_new.getString("query")%></td>
                        </tr>              
                        <%
                        }
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
    
    
  <div class="footer text-center" style="background:black; padding:30px; margin-top:50px; color:#f1f1f1;">
    <p>Copyright (c) 2017 Copyright Holder All Rights Reserved.</p>
  </div>



<script>
	if(typeof web3 !== 'undefined'){
		web3 = new Web3(web3.currentProvider);
	}
	else{
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
	]); //ABI
	var HospitalView = HospitalContract.at('0x223c52fa87c297e0863ff2755a2ab6e2fc69279b'); //address
	
	//Modify accordingly
	var fname = document.getElementById('outName');
	var button = document.getElementById('outGo');
	var output = document.getElementById('outValue');
	
	
	//To view the records of patients
	button.addEventListener('click',function(){
		output.innerHTML = HospitalView.getValue(fname.value);
	})
</script>





</body>
</html>
<%}   %>