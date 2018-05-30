<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%
response.setContentType("text/html");  
  
request.getSession().invalidate();  
   
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="jumbotron">
  <div class="Container text-center">
    <h1 class="display-2 text-danger">Logged Out !!!</h1><br>
    <h3>You have been successfully logged out. Go to Home. </h3><br>
    <h2 class="blockquote-footer text-danger">By RMS Team</h2><br>
    <a class="btn btn-lg btn-primary" href="index.jsp">HOME</a>
    
  </div>
  </div>
</body>
</html>