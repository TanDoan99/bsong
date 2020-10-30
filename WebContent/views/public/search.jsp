<%@page import="daos.SongDAO"%>
<%@page import="models.Song"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
  <h1>Kết quả tìm kiếm</h1>
  	<% 
  		ArrayList<Song> arr = null;
  		if(request.getAttribute("arrSong") !=null){
  				arr = (ArrayList)request.getAttribute("arrSong");
  				if(arr.size()>0){
  				for(Song song : arr){
  					String urlSlug=request.getContextPath()+"/chi-tiet/"+StringUtil.makeSlug(song.getName())+"-"+song.getId() + "-" + song.getCat().getId() + ".html";
		%>
	<div class="article">
      <h2><a href="" title="<%=song.getName()%>"><%=song.getName()%></a></h2>
      <p class="infopost">Ngày đăng: <%=song.getCreateAt() %>. Lượt xem: <%=song.getCounter()%> <a href="#" class="com"><span><%=song.getId()%></span></a></p>
      <div class="clr"></div>
      <div class="img"><img src="<%=request.getContextPath()%>/uploads/images/<%=song.getPicture()%>" width="177" height="213" alt="<%=song.getPicture()%>" class="fl" /></div>
      <div class="post_content">
        <p><%=song.getDescription()%></p>
        <p class="spec"><a href="<%=urlSlug%>" class="rm">Chi tiết &raquo;</a></p>
      </div>
      <div class="clr"></div>
  	</div>
  	<%			
  		}}else{
  				%>
  	<br/>
  	<div style='background: orange;text-align: center;border-radius: 30px/80px;padding-bottom: 7px;padding-top: 7px;line-height: 13px;'><b>Không có bài hát nào!</b></div>
  				<% 
  		} }
 	%>
</div>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
