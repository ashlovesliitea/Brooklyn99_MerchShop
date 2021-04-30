<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login!</title>
    <meta charset="UTF-8">
    <link href="login.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<div id="login">
     <img src="image/loginimage.png">
     <h2>Welcome, Officer!</h2>
     <form action="<%=request.getContextPath() %>/login" method="POST">
         <span>ID</span>  <input type="text" name="id" id="id"><br>
         <span>PW</span> <input type="password" name="pw" id="pw"><br>
         <input class="button" type="submit" value="login">
         <input class="button" onclick="location.href='join.jsp'" type="button" value="join">
           <input class="button" type="button" onclick="location.href='main.jsp'" value="main">
    </form>
</div>
</body>
</html>