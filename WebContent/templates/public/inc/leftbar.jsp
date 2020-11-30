<%@page import="models.Song"%>
<%@page import="daos.SongDAO"%>
<%@page import="java.util.List"%>
<%@page import="utils.StringUtil"%>
<%@page import="daos.CatDAO"%>
<%@page import="models.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="searchform">
  <form id="formsearch" name="formsearch" method="get" action="<%=request.getContextPath()%>/search">
    <span>
    <input value="<%if(request.getParameter("editbox_search")!=null)out.print(request.getParameter("editbox_search"));%>" name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" placeholder="Tìm kiếm bài hát" type="text" />
    </span>
    <input name="button_search" src="<%=request.getContextPath()%>/templates/public/images/search.jpg" class="button_search" type="image" />
  </form>
</div>
<div class="clr"></div>
<div class="gadget">
  <h2 class="star">Danh mục bài hát</h2>
  <div class="clr"></div>
  <%
  	ArrayList<Category> catList= (ArrayList<Category>)new CatDAO().findAll();
             if(catList.size()>0){
            	
              for(Category objCat:catList){
              	String catName=objCat.getName();
              	String urlSlug = request.getContextPath()+"/danh-muc/"+StringUtil.makeSlug(objCat.getName())+"-"+objCat.getId()+".html";
  %>
  <ul class="sb_menu">
    <li><a href="<%=urlSlug%>"><%=catName%></a></li>
    
  </ul>
  <%
  	}
          }
  %>
</div>

<div class="gadget">
  <h2 class="star"><span>Bài hát mới</span></h2>
  <div class="clr"></div>
  <ul class="ex_menu">
    <%
    	SongDAO songDAO = new SongDAO();
          List<Song> listRecentSong = songDAO.findNewPosts(5);
          if(listRecentSong.size()>0){
        	  for(Song item : listRecentSong){
        		  String urlSlug=request.getContextPath()+"/chi-tiet/"+StringUtil.makeSlug(item.getName())+"-"+item.getId() + "-" + item.getCat().getId() + ".html";
    %>
    <li><a href="<%=urlSlug%>"><%=item.getName() %></a><br />
      <%if(item.getDescription().length()>40) out.print(item.getDescription().substring(0, 40)+"..."); else out.print(item.getDescription()); %></li>
    <%
		  }
	  }
    %>
  </ul>
</div>