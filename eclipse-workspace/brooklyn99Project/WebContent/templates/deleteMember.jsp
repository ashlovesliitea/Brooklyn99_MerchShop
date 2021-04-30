<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.util.*,user.*" %>
  <jsp:useBean id="joinMgr" class="user.joinMgr" scope="page"/>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
 var input=confirm("회원 정보를 삭제하시겠습니까?");
 if(input==true){
	 <%
	 String deleteMember=request.getParameter("id");
	 joinMgr.Deletemember(deleteMember);
	 %>
	 window.location.href="memberList.jsp";
 }
 else{
	 window.location.href="memberList.jsp";
 }
</script>
	
</body>
</html>