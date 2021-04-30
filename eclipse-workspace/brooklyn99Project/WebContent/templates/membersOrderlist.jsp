<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*,product.*,order.*" %>
    <jsp:useBean id="orderManager" class="order.OrderManager"/>
    <jsp:useBean id="productManager" class="product.ProductManager"/>
    <%
  String name=(String)session.getAttribute("name");
    String orderName=request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="orderList.css?after" >
<link rel="stylesheet" href="/brooklyn99Project/css/bootstrap.css">
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
<h2 style="font-family:Helvetica,sans-serif;text-align:center;
   font-style:italic; font-weight:bold;"><%=orderName %>'s Orderlist</h2>
<table class="table table-striped" style=" margin-left: 10%;width:80%; text-align: center; color:#000000; border: 1px solid #fffff">
<tr ><td>No</td><td>Product</td><th>Price</td><td>Quantity</td><td>Date</td></td>
<%
 
  ArrayList<OrderBean>list=orderManager.getOrder(orderName);
  if(list.size()==0){%>
  <tr>
			<td colspan="5"> 주문한 상품이 없습니다.</td>
		</tr>
	<%
		} else {
			for(OrderBean order:list){
				ProductBean product = productManager.getProduct(order.getProduct_no());
	%>
				<tr>
					<td><%=order.getNo() %></td>
					<td><%=product.getName() %></td>
					<td><%= order.getQuantity()*product.getPrice() %></td>
					<td><%=order.getQuantity() %></td>
					<td><%=order.getDate() %></td>
					</tr>
					<%}} %>
</table>
<a style="display:block; text-align:center; font-size:15px;" href="memberList.jsp">Back To List!</a>
</body>
</html>