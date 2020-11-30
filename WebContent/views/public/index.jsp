<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
  <%
  	ArrayList<Song> listSong=null;
      	if(request.getAttribute("listSong")!=null){
      		int cat_id = 0;
      		int i = 0;
      		 listSong=(ArrayList<Song>)request.getAttribute("listSong");
      		SongDAO songDAO=new SongDAO();
      				for(Song song:listSong){
      					i++;
      					cat_id=songDAO.findCatIdIndex(song.getId());
      					String urlSlug=request.getContextPath()+"/chi-tiet/"+StringUtil.makeSlug(song.getName())+"-"+song.getId() + "-" + song.getCat().getId() + ".html";
  %>
    <div class="article">
      <h2><a href="<%=urlSlug%>" title="<%=song.getName()%>"><%=song.getName()%></a></h2>
      <p class="infopost">Ngày đăng: <%=song.getCreateAt()%>. Lượt xem: <%=song.getCounter()%> <a href="#" class="com"><span><%=i%></span></a></p>
      <div class="clr"></div>
      <div class="img"><img src="<%=request.getContextPath()%>/uploads/images/<%=song.getPicture()%>" width="177" height="213" alt="<%=song.getName()%>" class="fl" /></div>
      <div class="post_content">
        <p><%=song.getDescription()%></p>
        <p class="spec"><a href="<%=urlSlug%>" class="rm">Chi tiết &raquo;</a></p>
      </div>
      <div class="clr"></div>
    </div>
    <%
    	}
          	  	} 
           
           	int numberOfPages=(Integer)request.getAttribute("numberOfPages");
           	int currentPage=(Integer)request.getAttribute("currentPage");
           	if(listSong != null && listSong.size() > 0 && numberOfPages > 1){
    %>
    <p class="pages"><small>Trang  <%=currentPage%> của <%=numberOfPages%></small>
     <%
     	if (currentPage > 1) {
               		int back = currentPage - 1;
     %>
     <a href="<%=request.getContextPath()%>/index.jsp?page=<%=back%>">&laquo;</a>	
     <%
	     	}
	     	         	for(int i=1;i<=numberOfPages;i++){
	     	         		if(currentPage==i){
	     %>
    <span><%=i%></span>
    <%
    	} else {
    %>
    <a href="<%=request.getContextPath()%>/index.jsp?page=<%=i%>"><%=i%></a>
     <%
     	}
              	}
              	if (currentPage < numberOfPages) {
              		int next = currentPage + 1;
     %>
    <a href="<%=request.getContextPath()%>/index.jsp?page=<%=next%>">&raquo;</a></p>
    <%
    	}
    %>
    
   <%
       	}
       %>
  </div>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
