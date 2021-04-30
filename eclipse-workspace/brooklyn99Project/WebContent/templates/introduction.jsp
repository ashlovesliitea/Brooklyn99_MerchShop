<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  String name=(String)session.getAttribute("name");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
  <link rel="stylesheet" href="introduction.css">
  <script src="youtubeAPI.js"></script>
</head>
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
    <div id="header" >
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
       
        <h1>BROOKLYN<br>NINE-NINE<br>INTRODUCTION</h1>
     </div>
     <div id="body"> 
      <div class="intro">
      <h1>ABOUT THE SHOW</h1>
      <div class="introduction">
        <div id="player"></div>
        <div id="paragraph">Brooklyn Nine-Nine follows a team of detectives headed by the overly serious, newly appointed Captain Raymond Holt. The detectives include Jake Peralta, who has a high rate of successful arrests and solved cases, in spite of his relaxed, carefree and (at times) childish attitude. He eventually falls for his nerdy, by-the-book but loveable partner, Amy Santiago. The hard-working but timid Charles Boyle is partnered with the apathetic, aggressive and stern, Rosa Diaz.The detectives report to Sergeant (later Lieutenant) Terry Jeffords, a gentle giant and devoted family man.
        <div id="button"><button type="button" onclick="location.href='https://en.wikipedia.org/wiki/Brooklyn_Nine-Nine'">Want More?</button></div>
        </div>
     </div>
     <div class="Character">
         <h1>CHARACTER</h1>
         <div class="slide_wrapper">
           <ul class="slides">
             <li><img src="cast/Jakeimg.jpg">
             <span>Jake Peralta</span></li>
             <li><img src="cast/holtimg.jpg">
              <span>Raymond Holt</span></li>
             <li><img src="cast/amyimg.jpg">
              <span>Amy Santiago</span></li>
             <li><img src="cast/rosaimg.jpg">
              <span>Rosa Diaz</span></li>
             <li><img src="cast/terryimg.jpg">
              <span>Terry Jeffords</span></li>
             <li><img src="cast/ginaimg.jpg">
              <span>Gina Linetti</span></li>
             <li><img src="cast/charlesimg.jpg">
              <span>Charles Boyle</span></li>
             <li><img src="cast/Scullyimg.jpg">
              <span>Norm Scully</span></li>
             <li><img src="cast/Hitchcockimg.jpg">
              <span>Michael Hitchcock</span></li>
           </ul>
          </div>
          <p class="controls">
            <span class="prev"><br>&lt;</span>
            <span class="next"><br>&gt;</span>
            <script src="multislider.js"></script>
          </p>
     </div>

     <div class="bestscene">
       <h1>Best Scene of the Show</h1>
       <div class="bslist">
         <div class="bslist1">
          <h2>Season 7 Highlight</h2>
          <div id="player2"></div>
         </div>
         <div class="bslist2">
          <h2>Season 6 Highlight</h2>
          <div id="player3"></div>
        </div>
        </div>
     </div>

     <div class="where">
       <h1>Where to Stream LATEST B99 EPISODE?</h1>
       <div class="btn">
         <div class="btn1"><h2>HULU</h2><a href="https://www.hulu.com/series/brooklyn-nine-nine-daf48b7a-6cd7-4ef6-b639-a4811ec95232"><img src="streamlink/hulu.jpg" style="width:17rem; height:12rem;"></a></div>
         <div class="btn2"><h2>NETFLIX</h2><a href="https://www.netflix.com/title/70281562"><img src="streamlink/netflix.png" style="width:17rem; height:14rem"></a></div>
         <div class="btn3"><h2>NBC</h2><a href="https://www.nbc.com/brooklyn-nine-nine"><img src="streamlink/nbc.png"  style="width:17rem; height:12rem;"></a></div>
        </div>
        <h3>click the link!</h3>
     </div>
    </div>
  </div>
</body>
</html>