<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.*,user.*,product.*" %>
  <jsp:useBean id="joinMgr" class="user.joinMgr" scope="page"/>
  <%@page import="product.ProductBean" %>
  <jsp:useBean id="productManager" class="product.ProductManager"/>
  <%
  String name=(String)session.getAttribute("name");
%>
  
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="memberList.css?after">
<link rel="stylesheet" href="/brooklyn99Project/css/bootstrap.css">
<meta charset="UTF-8">

<title>Member List</title>

</head>
<body >
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
<h3 style="font-family:Helvetica,sans-serif;text-align:center;
   font-style:italic;">Member List</h3>
<div class="row">
<table class="table table-striped" style=" margin-left: 10%;width:80%; text-align: center; color:#000000; border: 1px solid #fffff">
  <tr>
    <td>No</td>
    <td>ID</td>
    <td>PW</td>
    <td>EMAIL</td>
    <td>NAME</td>
    <td>DELETE</td>
    <td>MODIFY</td>
    <td>ORDER</td>
  </tr>
  <%  
  Vector<User>vlist=joinMgr.getUserList();
  int listSize=vlist.size();

  int num=1;
  for(int i=0;i<listSize;i++){
	  User userBean=vlist.get(i); %>
  <tr>
  <td><%=num %></td>
  <td><%=userBean.getUser_id() %></td>
  <td><%=userBean.getUser_pw() %></td>
  <td><%=userBean.getUser_email() %></td>
  <td><%=userBean.getUser_name() %></td>
    <td><a href="deleteMember.jsp?id=<%=userBean.getUser_id()%>">delete</a></td>
  <td><a href="modifyMember.jsp?id=<%=userBean.getUser_id()%>&name=<%=userBean.getUser_name()%>">modify</a></td>
  <td><a href="membersOrderlist.jsp?name=<%=userBean.getUser_name()%>">OrderList</a></td>
  <%num++; } %>
  </tr>
 
</table>
<br><br>
<h3 style="font-family:Helvetica,sans-serif;text-align:center;
   font-style:italic;">Product List</h3>

<table class="table table-striped" style=" margin-left: 10%;width:80%; text-align: center; color:#000000; border: 1px solid #fffff">
 <tr>
    <td>No</td>
   <td>Name</td>
   <td>Stock</td>
   <td>Price</td>
  </tr>
 <%
   ArrayList <ProductBean> list=productManager.getProductAll();
   int size=list.size();
   for(int i=0;i<size;i++){
	   ProductBean pro=list.get(i);
	   %>
	   <tr>
	   <td><%=pro.getId() %></td>
	   <td><%=pro.getName() %></td>
	   <td><%=pro.getStock() %>개 남음</td>
	   <td><%=pro.getPrice() %>
	 
	   </tr><%
   }
   %>
   </table>

  
</body>
</html>