<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
     <%@page import="java.util.*,user.*,order.*" %>
  <jsp:useBean id="joinMgr" class="user.joinMgr" scope="page"/>
  <jsp:useBean id="orderManager" class="order.OrderManager"/>
<jsp:useBean id="userBean" class="user.User" />
    <jsp:setProperty property="*" name="userBean"/>  
<%
String formername=request.getParameter("formername");
joinMgr.updateMember(userBean);
orderManager.updateOrderList(userBean,formername);
response.sendRedirect("memberList.jsp");
%>

</head>
<body>

</body>
</html>