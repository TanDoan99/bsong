<%@page import="daos.SongDAO"%>
<%@page import="models.Song"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
  <%
  	if(request.getAttribute("listSong")!=null){
  		int cat_id = 0;
  		ArrayList<Song> listSong=(ArrayList<Song>)request.getAttribute("listSong");
  		SongDAO songDAO=new SongDAO();
  			if(listSong.size()>0){
  				for(Song song:listSong){
  					cat_id=songDAO.findCatIdIndex(song.getId());
  					
  	
  %>
    <div class="article">
      <h2><a href="" title="<%=song.getName() %>"><%=song.getName() %></a></h2>
      <p class="infopost">Ngày đăng: <%=song.getCreateAt()%>. Lượt xem: <%=song.getCounter() %> <a href="#" class="com"><span><%=song.getId() %></span></a></p>
      <div class="clr"></div>
      <div class="img"><img src="<%=request.getContextPath()%>/uploads/images/<%=song.getPicture()%>" width="177" height="213" alt="<%=song.getName() %>" class="fl" /></div>
      <div class="post_content">
        <p><%=song.getDescription() %></p>
        <p class="spec"><a href="<%=request.getContextPath()%>/detail?id=<%=song.getId()%>&&cat_id=<%=cat_id %>" class="rm">Chi tiết &raquo;</a></p>
      </div>
      <div class="clr"></div>
    </div>
    <%
  				}
  	  		}
  	  	} 
    %>
    <p class="pages"><small>Trang 1 của 5</small>
    <span>1</span>
    <a href="">2</a>
    <a href="">3</a>
    <a href="">4</a>
    <a href="">5</a>
    <a href="#">&raquo;</a></p>
  </div>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
