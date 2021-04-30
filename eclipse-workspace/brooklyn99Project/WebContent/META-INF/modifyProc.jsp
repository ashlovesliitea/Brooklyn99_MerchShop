<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
     <%@page import="java.util.*,user.*" %>
  <jsp:useBean id="joinMgr" class="user.joinMgr" scope="page"/>
<jsp:useBean id="userBean" class="user.User" />
    <jsp:setProperty property="*" name="userBean"/>  
<%
joinMgr mgr=joinMgr.getInstance();
mgr.updateMember(userBean);
%>

</head>
<body>

</body>
</html>