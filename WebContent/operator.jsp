<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    <%
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
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
     <style>
     body{

     background:linear-gradient(to right,#23074d,#cc5333);
     color:white;
     }
  .box{
    padding:20px;
    text-align:center;
    background:rgba(0,0,0,0.4);
    border-radius:25px;
    font-family:monospace;
    font-weight:bold;
    overflow:hidden;
    
    
  }
 
  a:link{
  text-decoration:none;
  }
  .out{
  padding:80px;
  }
  
  
.box span {

  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.box span:after {
  content: ">>>";
  position: absolute;
  color:red;
  font-size:30px;
  opacity: 0;
  left: 50;
  top: 0;
  right: 0;
  bottom: 0;
  transition: 0.5s;
 
}

.box:hover span {
  padding-right: 100px;
}

.box:hover span:after {
  opacity: 1;
  right: 0;
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
              <a class="nav-link" href="block.jsp">Blockchain</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="register.jsp">DB</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="stats.jsp">Stats</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logout.jsp">Logout</a>
            </li>
          </ul>
      </div>
      </div>
        </div>
      </nav>
       
 <div class="container">
    <div class="text-center"><h3>Welcome <%=opName %></h3>
    <h5> Here- What you can do:-</h5></div>
  <div class="row">
    <div class="col-md-6 out">
      <a href="#" data-toggle="modal" data-target="#permission" aria-label="Left Align">
       <div class="box" >
       <span>
         <h3>Rules</h3>
         <p>Permission</p>
         <p>Requirements</p>
        </span>
       </div>
      </a>
    </div>

    <div class="col-md-6 out">
      <a href="register.jsp">
       <div class="box">
       <span>
         <h3>Database</h3>
         <p>Entry of data</p>
         <p>Update data</p>
       </span>
       </div></a>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 out">
      <a href="block.jsp">
       <div class="box" id="block">
       <span>
         <h3>Blockchain</h3>
         <p>Entry</p>
         <p>Abstract View</p>
        </span>
       </div>
    </div>
    <div class="col-md-6 out">
      <a href="stats.jsp">
       <div class="box">
       <span>
         <h3>Stats</h3>
         <p>Entire View</p>
         <p>Timestamp</p>
       </span>
       </div>
    </div>
  </div>
</div>
       
   

<!-- Modal -->
<div class="modal fade" id="permission" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <ul class="list-group">
        <li class="list-group-item">To Update</li>
        <li class="list-group-item">To Verify</li>
        <li class="list-group-item">To Secure</li>
        <li class="list-group-item">To Insert</li>
        <li class="list-group-item">To Authenticate</li>
        <li class="list-group-item">To Authorize</li>
        <li class="list-group-item">To Display</li>
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
  
 <!-- Footer-->

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
  <script>
    $(document).ready(function(){
    	$(".box").mouseover(function(){
    		
    		$(this).css({
    			
    				"border":"0px #f1f1f1 solid",
    				"background":"rgba(0,0,0,0.5)",
    				"color":"#ffffff"
    				
    	
    		});
    	}).mouseleave(function(){
    		$(this).css({
    			"border":"0px red solid",
    			"background":"rgba(0,0,0,0.4)"
    		    
    	     });
    	});
    });
  </script>
</body>
</html>
<%}%>