<%@page import="models.Song"%>
<%@page import="java.util.List"%>
<%@page import="models.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/assets/inc/header.jsp" %>
<%@ include file="/templates/admin/assets/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Thêm danh mục</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                            <%
                            	String err = (String) request.getParameter("err");
                                                        						if("1".equals(err)) {
                            %>
							<div class="alert alert-danger" role="alert">
 								 Vui lòng nhập tên danh mục!
							</div>
							<%
								}
							%>
                            <%
                            	if("2".equals(err)) {
                            %>
							<div class="alert alert-danger" role="alert">
 								 Sửa thất bại!
							</div>
							<%
								}
							%>
							<%
								if("3".equals(err)) {
							%>
							<div class="alert alert-danger" role="alert">
 								 Không tìm thấy id để sửa!
							</div>
							<%
								}
							%>
                                <form action="<%=request.getContextPath()%>/admin/song/edit" role="form" method="post"  id="form" enctype="multipart/form-data">
                                	<%
                                		if(request.getAttribute("song")!=null){
                                	                                			Song song=(Song) request.getAttribute("song");
                                	                                			if(song!=null){
                                	%>
                                	
                                   <div class="form-group">
                                   
                                        <input type="hidden" id="name" value="<%=song.getId()%>" name="id" class="form-control" />
                                    </div>
                                   <div class="form-group">
                                   
                                        <label for="name">Tên bài hát</label>
                                        <input type="text" id="name" value="<%=song.getName() %>" name="name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="category">Danh mục bài hát</label>
                                        <select id="category" name="category" class="form-control">
                                         <%
                                        	if(request.getAttribute("listCat")!=null){
                                        		List<Category> listCat=(List<Category>)request.getAttribute("listCat");
                                        		if(listCat.size()>0){
                                        			for(Category cat:listCat){
                                        				%>
	                                       				 <option value="<%=cat.getId()%>"
	                                       				 <%
	                                       				 	if(song.getCat().getId()==cat.getId())
	                                       					 out.print("selected");
	                                       				 %>
	                                       				 ><%=cat.getName() %></option>
	                                       				 <%
                                        			}
                                        		}
                                        	}
                                        %>
											
                                        </select>
                                    </div>
                                    <div class="form-group">
                                    <img alt="<%=request.getContextPath() %>/uploads/images/main_bg.gif" src="<%=request.getContextPath() %>/uploads/images/<%=song.getPicture()%>"><br/>
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture" />
                                    </div>
                                    <div class="form-group">
                                        <label for="preview">Mô tả</label>
                                        <textarea id="preview" class="form-control" rows="3" name="preview"><%=song.getDescription() %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="detail">Chi tiết</label>
                                        <textarea id="detail" class="form-control" id="detail" rows="5" name="detail"><%=song.getDetail() %></textarea>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                      <%
                                				
                                			}
                                		}
                                    %>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>
        <!-- /. ROW  -->
    </div>
    <!-- /. PAGE INNER  -->
</div>
<script>
    document.getElementById("cat").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/assets/inc/footer.jsp" %>