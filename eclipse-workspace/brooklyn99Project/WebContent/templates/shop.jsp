<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,product.*" %>
  <%@page import="product.ProductBean" %>
  <jsp:useBean id="productManager" class="product.ProductManager"/>
  <%
  String name=(String)session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="shop.css">
<meta charset="UTF-8">
<title>Shop & Merch!</title>

</head>
<body>

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
 <img style="width:70%; margin-left:15%;"src="image/boardheader.jpg">
 <h1 style="background-color: yellow; font-family:Helvetica,sans-serif;text-align:center;
   font-style:italic;">Brooklyn nine-nine Merch</h2>
<table style="margin-left:15%;"border=0>
   <%
   ArrayList <ProductBean> list=productManager.getProductAll();
   int size=list.size();
   for(int i=0;i<size;i++){
	   if(i%3==0){out.println("<tr>");}
	   ProductBean pro=list.get(i);
	   %>
	   <form action="cartprocess.jsp">
	   <td style="padding:10px; text-align:center;">
	   <img style="width:80%; height:70%; "src="productImg/<%=pro.getImg() %>">
	   <input type="hidden" name="product_no" value="<%=i+1%>">
	   <div style="color:white; font-style:Helvetica,sans-serif;"><%=pro.getName() %></div>
	   <div  style="color:white; font-style:Helvetica,sans-serif;"><%=pro.getPrice() %></div>
	   <input type="text" name="quantity" placeholder="수량 입력" style="width:20%;">
	   <input class="myButton" type="submit" value="Go To Cart">
	   </form>
	   </td><%
   }
   %>

</table>
</body>
</html>