<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("utf-8"); %>
 <%@ page import="java.util.*,product.*,order.*" %>
 <jsp:useBean id="cartManager" class="order.CartManager" scope="session"/>
 <jsp:useBean id="bean" class="order.OrderBean"/>
 <jsp:setProperty property="*" name="bean"/>
 <%
 String flag=request.getParameter("flag");
 String name=(String)session.getAttribute("name");
 
 if(name==null){
	 %><script>alert("로그인이 필요한 기능입니다!");
	 location.href="login.jsp"</script><%

 }
 else{
	 if(flag==null){
		 System.out.println("주문번호:"+bean.getProduct_no());
		 System.out.println("양"+bean.getQuantity());
		 bean.setOrder_name(name);
		 cartManager.addCart(bean);
		 %><script>alert("장바구니에 담겼습니다!")
		    location.href="cartlist.jsp"</script>
		 <% 
	 }else if(flag.equals("update")){
		 bean.setOrder_name(name);
		 cartManager.updateCart(bean);
		 %><script>alert("장바구니를 업데이트 하였습니다!")
		   location.href="cartlist.jsp"</script>
		 <%} else if(flag.equals("delete")){
			 cartManager.deleteCart(bean);
			 %><script>alert("장바구니에 상품을 삭제하였습니다!")
			   location.href="cartlist.jsp"</script>
		<%  
		 }

	 }

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
  </body>
</html>