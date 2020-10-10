<%@page import="models.Song"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
    <div class="article">
    <%
   		if( request.getAttribute("cat")!=null){
   			Category cat=(Category)request.getAttribute("cat");
    %>
		<h1><%=cat.getName()%></h1>
		
	<%
		} 
	%>
    </div>
    <%
    	if(request.getAttribute("listCatSong")!=null){
    		ArrayList<Song> listCatSong=(ArrayList<Song>)request.getAttribute("listCatSong");
    		if(listCatSong!=null&listCatSong.size()>0){
    			for(Song catSong:listCatSong){
    				
    	
    %>
    <div class="article">
      <h2><a href="" title="<%=catSong.getName()%>"><%=catSong.getName()%></a></h2>
      <p class="infopost">Ngày đăng:<%=catSong.getCreateAt() %>. Lượt xem: <%=catSong.getCounter() %> <a href="#" class="com"><span><%=catSong.getId() %></span></a></p>
      <div class="clr"></div>
      <div class="img"><img src="<%=request.getContextPath()%>/templates/public/images/<%=catSong.getPicture() %>" width="177" height="213" alt="Đổi thay" class="fl" /></div>
      <div class="post_content">
        <p><%=catSong.getDescription()%>.</p>
        <p class="spec"><a href="<%=request.getContextPath()%>/detail?id=<%=catSong.getId() %>" class="rm">Chi tiết &raquo;</a></p>
      </div>
      <div class="clr"></div>
    </div>
   <%
    			}
    		}
    	}
   %>
    <p class="pages"><small>Trang 1 của 3</small>
    <span>1</span>
    <a href="">2</a>
    <a href="">3</a>
    <a href="#">&raquo;</a></p>
  </div>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>