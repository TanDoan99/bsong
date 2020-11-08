<%@page import="models.Comment"%>
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
    		Song songDetail=(Song)request.getAttribute("songDetail");
    		if(songDetail!=null){
    		idSong=songDetail.getId();
    %>
     	<h1><%=songDetail.getName() %></h1>
      <div class="clr"></div>
      <p>Ngày đăng: <%=songDetail.getCreateAt()%>. Lượt xem: <%=songDetail.getCounter() %></p>
      <div class="vnecontent">
         <%=songDetail.getDetail() %>
      </div>
		 <%
    		}
        }
		 %>
		<script type="text/javascript">
					function getComment(){
						var fullname=$("#fullname").val();
						var cmt=$("#cmt").val();
						var song_id=$("#song_id").val();
					$.ajax({
					url: '<%=request.getContextPath()%>/comment',
					type : 'POST',
					cache : false,
					data : {
						fullname : fullname,
						cmt : cmt,
						song_id : song_id
					},
					success : function(data) {
						$("#ajax-data").load(" #ajax-data");
					},
					error : function() {
						alert('Có lỗi xảy ra');
					}
				});
				return false;
			}
		</script>
    	<div id="ajax-data">
			<%
				if (session.getAttribute("listCmt") != null) {
				ArrayList<Comment> listCmt = (ArrayList<Comment>) session.getAttribute("listCmt");
				if(listCmt.size()>0){
			%>
				<p style='color: green;'> Lượt bình luận : <%=listCmt.size()%></p>
				<span style='color: blue;'>Bình luận đã có </span></br>
			<%
				for (Comment objCmt : listCmt) {
			%>
			<div class="item-cmt">
				<span><%=objCmt.getName()%></span>&nbsp;&nbsp;&nbsp;
				<span style="color: #FE2EC8;"><%=objCmt.getCmt()%></span>&nbsp;&nbsp;&nbsp;
				<span style="color: green;"><%=objCmt.getDate_send()%></span>
			</div>
			<%
				}
				}else{
			%>
			<p>Hãy là người bình luận đầu tiên</p>
			<%
				}}else{
			%>
			<p>Hãy là người bình luận đầu tiên</p>
			<%} %>
		</div></br>
    	<form class="form-cmt"action="javascript:void(0)" method="get">
			<div class="form-item">
				<input type="text" value="" name="fullname" id="fullname" placeholder="Nhập tên của bạn" />
			</div>
			<div class="form-item">
				<input type="text" value="" name="cmt" id="cmt"
					placeholder="Nhập bình luận" />&nbsp; 
					<input type="hidden" value="<%=idSong %>" name="song_id" id="song_id"
					 />&nbsp; 
					<button  onclick="getComment()">Bình luận</button>
			</div>
			
			<br />
		</form>
    </div>
      <h2>Bài viết liên quan</h2>
      
    <%
    
    	if(request.getAttribute("listDetail")!=null){
    List<Song> listDetail = (ArrayList<Song>)request.getAttribute("listDetail");
    for(Song objDet : listDetail){
    	idDetSong = objDet.getId();
  	  if( idSong!=idDetSong ){
  		  SongDAO sD=new SongDAO();
  		  Song song=sD.findOne(idDetSong);
    %>
    <div class="article">
      <div class="clr"></div>
      <div class="comment"> <a href=""><img src="<%=request.getContextPath()%>/uploads/images/<%=objDet.getPicture()%>" width="40" height="40" alt="" class="userpic" /></a>
        <h2><a href="<%=request.getContextPath()+"/chi-tiet/"+StringUtil.makeSlug(song.getName())+"-"+song.getId() + "-" + song.getCat().getId() + ".html"%>"><%=objDet.getName()%></a></h2>
        <p><%=objDet.getDescription() %></p>
      </div>
    </div>
  <%
  		}
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
