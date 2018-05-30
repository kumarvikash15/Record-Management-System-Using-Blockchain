<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
</head>
<body>
<div class="jumbotron">
  <div class="Container text-center">
    <h1 class="display-4 text-danger">Forgot Password !!!</h1><br>   
    <a class="btn btn-lg btn-primary" href="index.jsp">HOME</a>
  </div>
  </div>
  <div class="container text-center">
  
     <div class="row">
    <div class="col-md-4">
      <h3>Request Admin to change your password!!!</h3><br>
    
    <h2 class="blockquote-footer text-danger">By RMS Team</h2><br>
    
    </div>
    <div class="col-md-4">
      <form action="" style="background:#f1f1f1; padding:30px;">
        <div class="form-group">
          <input type="text" name="username" class="form-control" placeholder="username" required>
        </div>
        <div class="form-group">
          <input type="email" name="email" class="form-control" placeholder="email" required>
        </div>
        <div class="form-group">
          <input type="submit" name="submit" class="form-control btn btn-danger" value="Submit" >
        </div>
      </form>
    </div>
    <div class="col-md-4"></div>   
  </div>
  </div>
  
  <script>
  $(document).ready(function(){
	  $("form").submit(function(e){
		  e.preventDefault();
		  $.ajax({
			  type:"POST",
			  url:"ForgotPassword",
			  data:$("form").serialize(),
			  success:function(result){
				  $.alert(result);
			  }
		  });
	  });
  });
  
  </script>
</body>
</html>