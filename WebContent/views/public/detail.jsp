<%@page import="java.util.List"%>
<%@page import="models.Song"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
    <div class="article">
    <%
    	int idSong = 0,idDetSong = 0;
    	if(request.getAttribute("songDetail")!=null){
    		List<Song> songDetail=(List<Song>)request.getAttribute("songDetail");
    		for(Song obj: songDetail){
    		idSong=obj.getId();
    %>
     	<h1><%=obj.getName() %></h1>
      <div class="clr"></div>
      <p>Ngày đăng: <%=obj.getCreateAt()%>. Lượt xem: <%=obj.getCounter() %></p>
      <div class="vnecontent">
         <%=obj.getDetail() %>
      </div>
    </div>
    <%
    	}
    }
    List<Song> listDetail = (ArrayList<Song>)request.getAttribute("listDetail");
    for(Song objDet : listDetail){
    	idDetSong = objDet.getId();
  	  if( idSong!=idDetSong ){
    %>
    <div class="article">
      <h2>Bài viết liên quan</h2>
      <div class="clr"></div>
      <div class="comment"> <a href=""><img src="images/<%=objDet.getPicture()%>" width="40" height="40" alt="" class="userpic" /></a>
        <h2><a href=""><%=objDet.getName()%></a></h2>
        <p><%=objDet.getDescription() %></p>
      </div>
    </div>
  <%
  		}
  	  } 
  %>
  </div>
  <div class="sidebar">
  <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
