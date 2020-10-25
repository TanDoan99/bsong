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
  			if(request.getAttribute("arrSong") != null){
  				arr = (ArrayList)request.getAttribute("arrSong");
  				for(Song s : arr){
  					String urlSlug=request.getContextPath()+"/chi-tiet/"+StringUtil.makeSlug(s.getName())+"-"+s.getId() + "-" + s.getCat().getId() + ".html";
		%>
	<div class="article">
      <h2><a href="" title="<%=s.getName()%>"><%=s.getName()%></a></h2>
      <p class="infopost">Ngày đăng: <%=s.getCreateAt() %>. Lượt xem: <%=s.getCounter()%> <a href="#" class="com"><span><%=s.getId()%></span></a></p>
      <div class="clr"></div>
      <div class="img"><img src="<%=request.getContextPath()%>/uploads/images/<%=s.getPicture()%>" width="177" height="213" alt="<%=s.getPicture()%>" class="fl" /></div>
      <div class="post_content">
        <p><%=s.getDescription()%></p>
        <p class="spec"><a href="<%=urlSlug%>" class="rm">Chi tiết &raquo;</a></p>
      </div>
      <div class="clr"></div>
  	</div>
  	<%			
  		}
 	 }else {
 	%>
  	<div class="article">
  				Không có bài hát cần tìm!
  				
    </div>
  		<%
  		System.out.print("k có bài cần tìm");
  			}
  		%>
  	
</div>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
