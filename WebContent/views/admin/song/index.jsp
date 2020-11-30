<%@page import="models.Song"%>
<%@page import="daos.SongDAO"%>
<%@page import="models.Category"%>
<%@page import="java.net.URI"%>
<%@page import="java.awt.Desktop"%>
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
                                    <a href="<%=request.getContextPath()%>/admin/song/add" class="btn btn-success btn-md">Thêm</a>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <form method="get" action="<%=request.getContextPath()%>/admin/song">
                                        <input value="<%if(request.getParameter("sname")!=null) out.print(request.getParameter("sname"));%>" type="search" class="form-control input-sm" placeholder="Nhập tên bài hát" name="sname" style="float:right; width: 200px;" />
                                        <select  name="scat"  class="btn-sm" style="float:right; margin-right:20px;" >
                                        	<option value="0">-- Chọn danh mục --</option>
                                        	<%
                                        		int scat = 0;
                                        	                                        	                                        	if(request.getAttribute("scat")!=null){
                                        	                                        	                                        		scat =(Integer) request.getAttribute("scat");
                                        	                                        	                                        	}
                                        	                                        	                                        	if(request.getAttribute("catList")!=null){
                                        	                                        	                                        		List<Category> listCat=(List<Category>)request.getAttribute("catList");
                                        	                                        	                                        		if(listCat.size()>0){
                                        	                                        	                                        			for(Category cat:listCat){
                                        	%>
	                                       				 <option <%if(scat==cat.getId()) out.print("selected");%> 
	                                       				 value="<%=cat.getId()%>"><%=cat.getName()%></option>
	                                   		<%
	                                   			}
	                                   			                                   		                                        		}
	                                   			                                   		                                        	}
	                                   		%>
                                        </select>
                                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right;  margin-right:20px;" />
                                        <div style="clear:both"></div>
                                    </form><br />
                                </div>
                            </div>
							<%
								String msg = (String) request.getParameter("msg");
																						if("OK".equals(msg)) {
							%>
							<div class="alert alert-success" role="alert">
	 							 Thêm thành công!
							</div>
							<%
								}
							%>
							<%
								if("ok".equals(msg)) {
							%>
							<div class="alert alert-success" role="alert">
	 							 Sửa thành công!
							</div>
							<%
								}
							%>
							<%
								if("1".equals(msg)) {
							%>
							<div class="alert alert-warning"  role="alert">
 								Xóa thành công!
							</div>
							<%
								}
							%>
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
                                		SongDAO songDAO=new SongDAO();
						List<Song> songList=null;
                 	if(request.getAttribute("songList")!=null){
          			songList=(List<Song>)request.getAttribute("songList");
           	        if(songList.size()>0){
						for(Song songs:songList){
       					    String urlDel=request.getContextPath()+"/admin/song/del?sid="+songs.getId();
         					String urlEdit=request.getContextPath() +"/admin/song/edit?id="+songs.getId();
     	 					int count=songDAO.countId(songs.getCounter());
                                	%>
                                    <tr>
                                        <td><%=songs.getId() %></td>
                                        <td class="center"><%=songs.getName() %></td>
                                        <td class="center"><%=songs.getCat().getName() %></td>
                                        <td class="center"><%=count%></td>
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
                               <%
                           		int numberOfPages=(Integer)request.getAttribute("numberOfPages");
                           		int currentPage=(Integer)request.getAttribute("currentPage");
                           		if(songList != null && songList.size() > 0 && numberOfPages > 1){
                           		
                          	 	
                            %>
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin-top:27px">Trang <%=currentPage%>  của <%=numberOfPages %> </div>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                               
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                        <ul class="pagination">
                                <%
    							 	if (currentPage > 1) {
     								int back = currentPage - 1;
    							 %>
                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="<%=request.getContextPath()%>/admin/song?page=<%=back%>">Trang trước</a></li>
                                <%
                                  }
                                %>
                                 	<%
                                        for(int i=1;i<=numberOfPages;i++){
                                    		if(currentPage==i){
                                 	 %>
                                            <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/song?page=<%=i%>"><%=i %></a></li>
									<%
                                    		}else{
                                    %>
                                            <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/song?page=<%=i%>"><%=i %></a></li>
                                    		
                                    <%
                                    		}
                                    	}
                                 	if (currentPage < numberOfPages) {
                                		int next = currentPage + 1;
									%>		
                                            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="<%=request.getContextPath()%>/admin/song?page=<%=next%>">Trang tiếp</a></li>
                                     <%
    										}
   									  %>
                                        </ul>
                                    </div>
                                </div>
                                <%}%>
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