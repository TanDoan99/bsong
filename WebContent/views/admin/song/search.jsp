<%@page import="models.Category"%>
<%@page import="java.net.URI"%>
<%@page import="java.awt.Desktop"%>
<%@page import="models.Song"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/assets/inc/header.jsp" %>
<%@ include file="/templates/admin/assets/inc/leftbar.jsp" %>

<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý bài hát</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="<%=request.getContextPath() %>/admin/song/add" class="btn btn-success btn-md">Thêm</a>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <form method="get" action="<%=request.getContextPath()%>/admin/song/search">
                                        <input type="search" class="form-control input-sm" placeholder="Nhập tên bài hát"name="name" style="float:right; width: 200px;" />
                                        
                                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right;  margin-right: 20px;" />
                                        <div style="clear:both"></div>
                                    </form><br />
                                </div>
                            </div>
						
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên bài hát</th>
                                        <th>Danh mục</th>
                                        <th>Lượt đọc</th>
                                        <th>Hình ảnh</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<%
                                		List<Song> songList=null;
                                		if(request.getAttribute("arrSong")!=null){
                                			songList=(List<Song>)request.getAttribute("arrSong");
                                			if(songList.size()>0){
                                				for(Song songs:songList){
                                					String urlDel=request.getContextPath()+"/admin/song/del?sid="+songs.getId();
                                					String urlEdit=request.getContextPath() +"/admin/song/edit?id="+songs.getId();
                                	%>
                                    <tr>
                                        <td><%=songs.getId() %></td>
                                        <td class="center"><%=songs.getName() %></td>
                                        <td class="center"><%=songs.getCat().getName() %></td>
                                        <td class="center"><%=songs.getCounter() %></td>
                                        <td class="center">
                                        	
                                        	<%
                                        		if(!"".equals(songs.getPicture())){
                                        	%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/uploads/images/<%=songs.getPicture() %>" alt="<%=songs.getPicture() %>"/>
                                        	<%}else{%>
											<img width="200px" height="200px" src="<%=request.getContextPath()%>/templates/admin/assets/img/no-img.jpg" alt="Đổi thay"/>
                                      		<%} %>
                                        </td>
                                        <td class="center">
                                            <a href="<%=urlEdit %>" title="" class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a>
                                            <a href="<%=urlDel%>" onclick="return confirm('Bạn có chắc chắn muốn xóa bài hát không?')" title="" class="btn btn-danger"><i class="fa fa-pencil"></i> Xóa</a>
                                        </td>
                                    </tr>
                                    <%
                                				}
                                			}
                                		}
                                    %>
									
                                </tbody>
                            </table>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px">Hiển thị từ 1 đến 5 của 24 truyện</div>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                        <ul class="pagination">
                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="#">Trang trước</a></li>
                                            <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="">1</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">2</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">3</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">4</a></li>
											<li class="paginate_button" aria-controls="dataTables-example" tabindex="0"><a href="">5</a></li>
                                            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="#">Trang tiếp</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById("song").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/assets/inc/footer.jsp" %>