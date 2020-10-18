<%@page import="models.Contact"%>
<%@page import="java.util.List"%>
<%@page import="models.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/assets/inc/header.jsp" %>
<%@ include file="/templates/admin/assets/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý người dùng</h2>
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
                                    <a href="<%=request.getContextPath() %>" class="btn btn-success btn-md">Thêm</a>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <form method="post" action="">
                                        <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right" />
                                        <input type="search" class="form-control input-sm" placeholder="Nhập tên bài hát" style="float:right; width: 300px;" />
                                        <div style="clear:both"></div>
                                    </form><br />
                                </div>
                            </div>
                            <%
								String msg = (String) request.getParameter("msg");
								String err = (String) request.getParameter("err");
								if("OK".equals(msg)) {
							%>
							<div class="alert alert-success" role="alert">
	 							 Thêm liên hệ thành công!
							</div>
							
							<% }
								if("2".equals(msg)) {
							%>
							<div class="alert alert-success" role="alert">
	 							 Xóa liên hệ thành công!
							</div>
							<%
								}
							%>
							
                            <%
							if("1".equals(err)) {
							%>
							<div class="alert alert-danger" role="alert">
	 							 ID không tồn tại!
							</div>
							<%
								}
							%>
                            <%
							if("2".equals(err)) {
							%>
							<div class="alert alert-danger" role="alert">
	 							 Xảy ra lỗi khi xóa!
							</div>
							<%
								}
							%>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên liên hệ</th>
                                        <th>Email</th>
                                        <th>Website</th>
                                        <th>Nội dung</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                	if(request.getAttribute("contList")!=null){
                                		List<Contact> listCont= (List<Contact>)request.getAttribute("contList");
                                		if(listCont.size()>0){
                                			for(Contact cont:listCont){
                                				
                                		
                                	
                                %>
                                    <tr>
                                        <td class="center"><%=cont.getId()%></td>
                                        <td class="center"><%=cont.getName() %></td>
                                        <td class="center"><%=cont.getEmail() %></td>
                                        <td class="center"><%=cont.getWebsite()%></td>
                                        <td class="center"><%=cont.getMessage()%></td>
                                         <td class="center"><a href="" title="" class="btn btn-danger"onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng không?')"><i class="fa fa-pencil"></i> Xóa</a></td>
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
    document.getElementById("contact").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/assets/inc/footer.jsp" %>