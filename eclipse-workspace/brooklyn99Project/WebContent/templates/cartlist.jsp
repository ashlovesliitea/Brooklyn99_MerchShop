<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.*,product.*,order.*" %>
  <jsp:useBean id="cartManager" class="order.CartManager" scope="session"/>
  <jsp:useBean id="productManager" class="product.ProductManager"/>
    <%
  String name=(String)session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="cartList.css?after">
<link rel="stylesheet" href="/brooklyn99Project/css/bootstrap.css">
<%if(name==null){ %>
<script>alert("로그인이 필요한 기능입니다!"); 
window.location.href="main.jsp";</script>
<%} %>
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
   font-style:italic; font-weight:bold;">Your Shopping Cart</h2>
<form action="cartprocess.jsp" method="get">
<div class="row">
<table class="table table-striped" style=" margin-left: 10%;width:80%; text-align: center; color:#000000; border: 1px solid #fffff">
 <tr>
    <td>Product</td><td>Price</td> <td>Quantity</td> <td>Update</td> <td>Delete</td>
 </tr>
 <%
 int totalPrice =0;
 Hashtable<Integer,OrderBean>hCart=cartManager.getCartList();
 if(hCart.size()==0){
	 %><tr><td>주문 건수가 없습니다.</td></tr><%
	 }else{
		 Enumeration<Integer>enu=hCart.keys();
		 while(enu.hasMoreElements()){
			 OrderBean order=(OrderBean)hCart.get(enu.nextElement());
			 ProductBean product=productManager.getProduct(order.getProduct_no());
			 int price=product.getPrice();
			 int quantity=order.getQuantity();
			 int subTotal=price*quantity;
			 totalPrice+=subTotal;%>
			 <tr>
			 <td><%=product.getName() %></td>
			 <td><%=subTotal %></td>
			 <td><input type="text" name="quantity" value="<%=order.getQuantity() %>"></td>
			 <td>    <input type="hidden" id="flag" name="flag">
						<input type="hidden" name="product_no" value="<%=product.getId() %>">
						<input type="button" value="update" onclick="cartUpdate(this.form)"> 

			</td>
			<td><input type="button" value="delete" onclick="cartDelete(this.form)"></td>
			 </tr>
			 <% 
		 }
	 }%>

</table>
<h5 style="text-align:center;">총 결제 금액 : <%=totalPrice %></h3>
<a href="orderprocess.jsp">주문하기</a>
<a href="shop.jsp">More Shopping!</a>
<script>
function cartUpdate(form){
document.getElementById("flag").value="update";

 alert("업데이트 하시겠습니까?");
 
	form.submit();

}

function cartDelete(form){
	document.getElementById("flag").value="delete";
	alert("삭제하시겠습니까?");

	form.submit();

}


</script>
</form>
</body>
</html>