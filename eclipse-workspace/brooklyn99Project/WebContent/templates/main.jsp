<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  String name=(String)session.getAttribute("name");
%>
<html>
<head>
    <link rel="stylesheet" href="main.css">
</head>
<body  topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
    <ul id="menu">

        <%if(name==null){%><li><a href="login.jsp">Login</a></li><%} 
        else{ %><li><a href="logout.jsp">Logout</a></li><%} %>
        <li><a href="orderlist.jsp">Order</a>
        <li><a href="cartlist.jsp">Cart</a></li>
        <li><a href="shop.jsp">Shop</a></li>
        <li><a href="introduction.jsp">Introduction</a></li>
        <li><a href="main.jsp">Main</a></li>
        <%if(name!=null){if(name.equals("admin")){ %><li><a href="memberList.jsp">Admin</a></li><%}} %>
   </ul>
    
  <div class="main">
    <img class="mainimg" src="image/Mainpage-image.jpg">
    <%if(name!=null){ %>
    <h1>WELCOME TO THE PRECINCT,<br><%=name%></h1> <%}
    else{%>
    <h1>Login First!</h1><%} %>
    <div class="button">
        <button id="signin" onclick="location.href='login.jsp'">LOGIN!</button>
        <button id="join" onclick="location.href='join.jsp'">JOIN THE SQUAD</button>
  
    </div>
</div>
</body>
</html>