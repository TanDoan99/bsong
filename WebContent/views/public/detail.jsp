<%@page import="models.Song"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
    <div class="article">
    <%
    	if(request.getAttribute("songDetail")!=null){
    		Song songDetail=(Song)request.getAttribute("songDetail");
    %>
     	<h1><%=songDetail.getName() %></h1>
      <div class="clr"></div>
      <p>Ngày đăng: <%=songDetail.getCreateAt() %>. Lượt xem: <%=songDetail.getCounter() %></p>
      <div class="vnecontent">
         <%=songDetail.getDetail() %>
      </div>
    </div>
    <div class="article">
      <h2>Bài viết liên quan</h2>
      <div class="clr"></div>
      <div class="comment"> <a href=""><img src="images/<%=songDetail.getPicture() %>" width="40" height="40" alt="" class="userpic" /></a>
        <h2><a href=""><%=songDetail.getName() %></a></h2>
        <p><%=songDetail.getDescription() %></p>
      </div>
    </div>
    <%} %>
  </div>
  <div class="sidebar">
  <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
