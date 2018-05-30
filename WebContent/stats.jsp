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

String opName=(String)session.getAttribute("opName");

if(opName==null){ 
	response.sendRedirect("error.jsp");
	
}  else{
ArrayList<String> al = new ArrayList<String>();
//String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "hospital";
String userid = "root";
String password = "";
int count=0;
int rowcount=0;
int opInsert=0;
int opUpdate=0;
int opIns =0;
int opUp =0;


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
//String sql ="select * from patients";
//result = statement.executeQuery(sql);
PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) FROM patients");
result = ps1.executeQuery();
result.next();
rowcount = result.getInt(1);


PreparedStatement psIns = connection.prepareStatement("SELECT COUNT(*) FROM log_operator where username=? and action=?");
psIns.setString(1,opName);
psIns.setString(2,"insert");
ResultSet rsIns = psIns.executeQuery();
rsIns.next();
opInsert = rsIns.getInt(1);



PreparedStatement psUpdate = connection.prepareStatement("SELECT COUNT(*) FROM log_operator where username=? and action=?");
psUpdate.setString(1,opName);
psUpdate.setString(2,"update");
ResultSet rs1 = psUpdate.executeQuery();
rs1.next();
opUpdate = rs1.getInt(1);


PreparedStatement ps3 = connection.prepareStatement("SELECT COUNT(*) FROM log_operator where action=?");
ps3.setString(1,"insert");
ResultSet rs3 = ps3.executeQuery();
rs3.next();
opIns = rs3.getInt(1);

PreparedStatement ps4 = connection.prepareStatement("SELECT COUNT(*) FROM log_operator where action=?");
ps4.setString(1,"update");
ResultSet rs4 = ps4.executeQuery();
rs4.next();
opUp = rs4.getInt(1);



connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<style>
.scroll{
  overflow:scroll;
  width=100%;
   height:500px;
}

</style>
  </head>
  <body class="bg-light">
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
              <a class="nav-link" href="register.jsp">DB</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="logout.jsp">LOGOUT</a>
            </li>
      </div>
      </div>
        </div>
      </nav><br><br>

      <div class="container">
      <h3 class="text-center">Welcome <span class="text-danger"><%=opName %></span></h3><br>
        <div class="row">
          <div class="col-md-4">
            <div class="list-group">
            <a href="#numOfUsers" class="list-group-item list-group-item-action active">Total Patients</a>
            <a href="#sort" class="list-group-item list-group-item-action">Sort Results</a>
            <a href="#filter" class="list-group-item list-group-item-action">Advance Filters</a>
          </div>
          </div>


          <div class="col-md-8" style="padding:10px; border-radius:10px;">
            <div class="card border-dark" id="numOfUsers">
              <div class="card-header">Stats</div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-12">
                    <div class="table-responsive">
                      <table class="table table-light">
                        <thead>
                          <tr>
                            <th scope="col">Query:</th>
                            <th scope="col">Numbers:</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>Total No: of patients:</td>
                            <td><%=rowcount %></td>
                        </tr>
                         <tr>
                            <td>Total Patient Entered:</td>
                            <td><%=opIns %></td>
                          </tr>
                          <tr>
                            <td>Total Patient updated:</td>
                            <td><%=opUp %></td>
                          </tr>
                        <tr>
                        <td><mark>Your Activity:</mark></td>
                        </tr>
                          <tr>
                            <td>Number of Patients entry:</td>
                            <td><%=opInsert %></td>
                          </tr>
                          <tr>
                            <td>Number of Patient updated:</td>
                            <td><%=opUpdate %></td>
                          </tr>
                         
                        </tbody>

                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>

<br>
       <div class="card border-dark" id="sort">
         <div class="card-header">Sort</div>
         <div class="card-body">
         <div class="" style="padding:20px; border-radius:10px; background:#f1f1f1">
           <div class="card-tile">Sort By:Order:Result Limit(min):Result Limit(max)</div><br>
 <form id="tableForm">
           <div class="form-row">
             <div class="col-md-3">
              <select class="form-control" name="sortBy" id="sortBy">
              <option value="pid">ID</option>
              <option value="name">Name</option>
              <option value="age">Age</option>
              <option value="disease">Disease</option>
               </select>
          </div>
              <div class="col-md-3">

                <select class="form-control" name="sortOrder" id="sortOrder">
                  <option value="ASC">Acending</option>
                  <option value="DESC">Descending</option>
                </select>
              </div>
              
              <div class="col-md-2">
                <input type="number" class="form-control" name="sortLow" id="sortLow" value="0" max=<%=rowcount %> >
              </div>

              <div class="col-md-2">
                <input type="number" class="form-control" name="sortHigh" id="sortHigh" value="10" min="1" max=<%=rowcount %> >
              </div>

              <div class="col-md-2">
                <input type="submit" name="submit" id="sortBtn" value="Go" class="form-control btn btn-danger">
              </div>
           </div>
</form>
</div>
<br><br>

<div class="row">
  <div class="col-md-3">Total Entries:<%=rowcount%></div>

  <div class="col-md-6">
  
    
  </div>
</div>
<h3 class="text-center">Result </h3>
<hr>
<div id="scroll_sort">
       <div class="table-responsive">
         <table class="table table-light table-striped">
           <thead>
             <th scope="col">ID</th>
             <th scope="col">Name</th>
             <th scope="col">Age</th>
             <th scope="col">Disease</th>
             <th scope="col">Medicine</th>

           </thead>
           <tbody id="tdDatas">
            	
               
           </tbody>
         </table>
       </div>
 </div>


       </div>
     </div>
     
     
    <br> 

<div class="" id="filter">
  <div class="card border-dark">
    <div class="card-header">
      Advance Filtering
    </div>
    <div class="card-body">
    <div id="myProgress">
     <div id="myBar"></div>
    </div>
    <div class="" style="padding:20px; border-radius:10px; background:#f1f1f1;">
      <form id="formFilter">
        
 <div class="form-row">
   <div class="col-md-1">Age:</div>
  <div class="col-md-2">
    <input type="number" placeholder="from:" name="fromAge"  class="form-control" value="">
  </div>
  <div class="col-md-2">
    <input type="number" name="toAge" placeholder="to:" class="form-control" value="">
  </div>
  <div class="col-md-1.5">Disease:</div>
  <div class="col-md-2">
    <input type="text" class="form-control" placeholder="disease:" name="disease" id="disease" value="">
  </div>
  <div class="col-md-1.5">Medicine:</div>
  <div class="col-md-2">
    <input type="text" class="form-control" placeholder="Medicine:" name="medicine" value="">
  </div>
  </div><hr>
  <div class="form-row">
          <div class="col-md-2 ">
            Select Date:
          </div>    
          <div class="col-md-1 ">From:</div>
          
          <div class="col-md-3">
          <input type="date" name="fromDate" class="form-control" placeholder="From:" value="">
          </div>
          <div class="col-md-1 ">To:</div>
          
          <div class="col-md-3">
          <input type="date" name="toDate" class="form-control" placeholder="To:" value="">
          </div>
          <div class="col-md-2">
          <input type="submit" name="submit" class="form-control btn btn-danger" value="go">
          </div>
        </div>

      </form>
      </div>
      <br>
      <p class="text-center alert alert-danger">NOTE: Blank Input will take default value:</p>
      <hr>
      <h3 class="text-center">Results</h3><br>
      <div id="scroll_filter">
             <div class="table-responsive ">
         <table class="table table-light">
           <thead>
             <th scope="col">ID</th>
             <th scope="col">Name</th>
             <th scope="col">Age</th>
             <th scope="col">Disease</th>
             <th scope="col">Medicine</th>
             <th scope="col">Time</th>

           </thead>
           <tbody id="tdFilterData">
            	
               
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
      
      
      
      <br><br><br><br>
      
<script>
$(document).ready(function(){
	$("#tableForm").submit(function(e){
		e.preventDefault();
		$.ajax({
			type:"POST",
			url:"ShowTable",
			data:$("#tableForm").serialize(),
			success:function(result){
				var res = result.split(">");
				var i=0;
				var a=0;
				var length = res.length;
				htmlStr = "";		
				for(i=0; i<length-1;i++){
					var el = res[i].split("+");
				    
					for(a=0;a<1;a++){
						
						htmlStr += "<tr>";
						htmlStr += "<td>"+el[a]+"</td>";
						htmlStr += "<td>"+el[a+1]+"</td>";
						htmlStr += "<td>"+el[a+2]+"</td>";
						htmlStr += "<td>"+el[a+3]+"</td>";
						htmlStr += "<td>"+el[a+4]+"</td>";
						htmlStr += "</tr>";
						$("#tdDatas").html(htmlStr);
						$("#scroll_sort").addClass("scroll");
					}
				}			
			}
		
		});
	});
	
	
	$("#formFilter").submit(function(e){
		e.preventDefault();
		
		$.ajax({
			type:"POST",
			url:"FilterResult",
			data:$("#formFilter").serialize(),
			success:function(result){
				$("#myProgress").removeClass("loadergif");
				if(result==""){
					$("#tdFilterData").html("There is no result available for this query");
					$("#tdFilterData").addClass("alert text-center");
					$("#tdFilterData").effect("shake");
					$("#tdFilterData").css("padding","30px");
				}else{
				
				var res = result.split(">");
				var i=0;
				var a=0;
				var length = res.length;
				htmlStr = "";		
				for(i=0; i<length-1;i++){
					var el = res[i].split("+");
				    
					for(a=0;a<1;a++){
						
						htmlStr += "<tr>";
						htmlStr += "<td>"+el[a]+"</td>";
						htmlStr += "<td>"+el[a+1]+"</td>";
						htmlStr += "<td>"+el[a+2]+"</td>";
						htmlStr += "<td>"+el[a+3]+"</td>";
						htmlStr += "<td>"+el[a+4]+"</td>";
						htmlStr += "<td>"+el[a+5]+"</td>";
						htmlStr += "</tr>";
						$("#tdFilterData").html(htmlStr);
						$("#scroll_filter").addClass("scroll");
					}
				}
			}
			}
		});
	});
		
	});

</script>    
      
  </body>
</html>
<%} %>