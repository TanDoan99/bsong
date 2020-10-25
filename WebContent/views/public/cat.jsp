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
    	ArrayList<Song> listCatSong=null;
    	if(request.getAttribute("listCatSongPage")!=null&&request.getAttribute("cat_id")!=null){
    		int cat_id=(int)request.getAttribute("cat_id");
    		 listCatSong=(ArrayList<Song>)request.getAttribute("listCatSongPage");
    		if(listCatSong!=null&listCatSong.size()>0){
    			for(Song catSong:listCatSong){
    				String urlSlug=request.getContextPath()+"/chi-tiet/"+StringUtil.makeSlug(catSong.getName())+"-"+catSong.getId() + "-" + catSong.getCat().getId() + ".html";
    	
    %>
    <div class="article">
      <h2><a href="" title="<%=catSong.getName()%>"><%=catSong.getName()%></a></h2>
      <p class="infopost">Ngày đăng:<%=catSong.getCreateAt() %>. Lượt xem: <%=catSong.getCounter() %> <a href="#" class="com"><span><%=catSong.getId() %></span></a></p>
      <div class="clr"></div>
      <div class="img"><img src="<%=request.getContextPath()%>/templates/public/images/<%=catSong.getPicture() %>" width="177" height="213" alt="Đổi thay" class="fl" /></div>
      <div class="post_content">
        <p><%=catSong.getDescription()%>.</p>
        <p class="spec"><a href="<%=urlSlug%>" class="rm">Chi tiết &raquo;</a></p>
      </div>
      <div class="clr"></div>
    </div>
   <%
    			}
    		}
    	}
   %>
   <%
   	int numberOfPages=(Integer)request.getAttribute("numberOfPages");
   	int currentPage=(Integer)request.getAttribute("currentPage");
   	if(listCatSong!=null&&listCatSong.size()>0){
   %>
    <p class="pages"><small>Trang  <%=currentPage %> của <%=numberOfPages %></small>
    <%
    	for(int i=1;i<=numberOfPages;i++){
    		if(currentPage==i){
    %>
    <span><%=i%></span>
    <%}else{%>
    	    <%
   		if( request.getAttribute("cat")!=null){
   		Category cat=(Category)request.getAttribute("cat");
    %>
    	
   		
    <a href="<%=request.getContextPath()%>/cat?id=<%=cat.getId()%>&page=<%=i%>"><%=i%></a>
    <%
   				}
    		}
    	}
    %>
    <a href="#">&raquo;</a></p>
    <% } %>
  </div>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>