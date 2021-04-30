<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="join.css" rel="stylesheet">
</head>
<body>
<div id="join">
    <img src="image/loginimage.png">
     <h2>Join the Squad!</h2>
     <form action="<%=request.getContextPath() %>/join" method="post">
         <span>ID&nbsp;&nbsp;&nbsp;&nbsp;</span> <input type="text" id="id" name="user_id"><br>
         <span>PW&nbsp;&nbsp;&nbsp;&nbsp;</span> <input type="password" id="pw" name="user_pw"><br>
         <span>EMAIL &nbsp;</span><input type="email" id="email" name="user_email"><br>
         <span>NICKNAME &nbsp;</span><input type="text" id="name" name="user_name"><br>
         <input id="button" type="submit" value="join">
    </form>
</div>
</body>
</html>