<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.*,user.*" %>
   <jsp:useBean id="joinMgr" class="user.joinMgr" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="modifyMember.css?after" rel="stylesheet">
 <%String Formerid=request.getParameter("id");
     String Formername=request.getParameter("name");
     User userBean=joinMgr.getUserInfo(Formerid);%>
</head>
<body>
<body>
<div id="modify">
    <img src="image/loginimage.png">
     <h2>Modify your Information!</h2>
     <form action="modifyProc.jsp?formername=<%=Formername %>" method="post">
         <div style="display:flex; margin-left:25%; margin-bottom:0;"><span>ID (변경불가)&nbsp;</span><div id="id"><%=userBean.getUser_id()%></div></div><br>
         <input type="hidden" name="user_id" value="<%=userBean.getUser_id() %>">
         <span>PW&nbsp;&nbsp;&nbsp;&nbsp;</span> <input type="password" id="pw" name="user_pw"><br>
         <span>EMAIL &nbsp;</span><input type="email" id="email" name="user_email"><br>
         <span>NICKNAME &nbsp;</span><input type="text" id="name" name="user_name"><br>
         <input id="button" type="submit" value="Modify">
           <input id="button" type="button" value="Go Back" onclick="location.href='memberList.jsp'">              
    </form>
    
</div>

</body>
</html>