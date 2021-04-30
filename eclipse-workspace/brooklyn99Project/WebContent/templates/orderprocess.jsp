<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="order.OrderBean,product.*,java.util.*" %>
    <jsp:useBean id="cartManager" class="order.CartManager" scope="session"/>
    <jsp:useBean id="productManager" class="product.ProductManager"/>
    <jsp:useBean id="orderManager" class="order.OrderManager"/>
    <%
    Hashtable<Integer,OrderBean>hCart=cartManager.getCartList();
    Enumeration enu=hCart.keys();
    if(hCart.size()==0){
    %><script>alert("주문 내역이 없습니다!");
    location.href="orderlist.jsp";</script><%}
    else{while(enu.hasMoreElements()){

		OrderBean order = (OrderBean)hCart.get(enu.nextElement());

		orderManager.insertOrder(order);  //주문추가

		productManager.reduceProduct(order);  //재고감소

		cartManager.deleteCart(order);  //장바구니에서 삭제

	}

%>

<script>

	alert("주문처리가 완료되었습니다 \n 감사합니다");

	location.href = "orderlist.jsp";

</script>

<%

}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>