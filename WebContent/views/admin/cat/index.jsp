<%@page import="models.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/assets/inc/header.jsp" %>
<%@ include file="/templates/admin/assets/inc/leftbar.jsp" %>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Quản lý Danh Mục</h2>
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
                                <div class="col-sm-6" style="margin-bottom: 10px;">
                                    <a href="<%=request.getContextPath()%>/admin/cat/add" class="btn btn-success btn-md">Thêm</a>
                                </div>
                                 <form method="get" action="<%=request.getContextPath()%>/admin/cat/index">
                                
                            	<input value="<%if(request.getParameter("snames")!=null) out.print(request.getParameter("snames")); %>" type="search" class="form-control input-sm" placeholder="Nhập tên danh mục" name="snames" style="float:right; width: 200px;" />
							    <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right;  margin-right:20px;" />
                                </form>
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
															if("1".equals(msg)) {
														%>
							<div class="alert alert-warning"  role="alert">
 								Xóa thành công!
							</div>
							<%
								}
							%>
							<%
								if("2".equals(msg)) {
							%>
							<div class="alert alert-warning"  role="alert">
 								Sửa thành công!
							</div>
							<%
								}
							%>
							<%
								String err = (String) request.getParameter("err");
													if("0".equals(err)) {
							%>
							<div class="alert alert-danger" role="alert">
 								 xóa thất bại!
							</div>
							<%
								}
							%>
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên danh mục</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody >
                                <%
                                ArrayList<Category> catList=null; 
                                	if(request.getAttribute("catList")!=null){
                                       catList=(ArrayList<Category>)request.getAttribute("catList");
                                       if(catList.size()>0){
                                             for(Category cat:catList){
                                             	String name =cat.getName();
                                %>
                                    <tr>
                                        <td><%=cat.getId() %></td>
                                        <td class="center"><%=name %></td>
                                        <td class="center">
                                            <a href="<%=request.getContextPath()%>/admin/cat/edit?id=<%=cat.getId()%>" title="" class="btn btn-primary"><i class="fa fa-edit "></i> Sửa</a>
                                            <a href="<%=request.getContextPath()%>/admin/cat/del?id=<%=cat.getId() %>" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục không?')"><i class="fa fa-pencil"></i> Xóa</a>
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
                           		if(catList != null && catList.size() > 0 && numberOfPages > 1){
                           		
                          	 	
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
                                            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="<%=request.getContextPath()%>/admin/cat/index?page=<%=back%>">Trang trước</a></li>
                                <%
                                  }
                                %>
                                 	<%
                                        for(int i=1;i<=numberOfPages;i++){
                                    		if(currentPage==i){
                                 	 %>
                                            <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/cat/index?page=<%=i%>"><%=i %></a></li>
									<%
                                    		}else{
                                    %>
                                            <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="<%=request.getContextPath()%>/admin/cat/index?page=<%=i%>"><%=i %></a></li>
                                    		
                                    <%
                                    		}
                                    	}
                                 	if (currentPage < numberOfPages) {
                                		int next = currentPage + 1;
									%>		
                                            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="<%=request.getContextPath()%>/admin/cat/index?page=<%=next%>">Trang tiếp</a></li>
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
    document.getElementById("category").classList.add('active-menu');
</script>
<!-- /. PAGE INNER  -->
<%@ include file="/templates/admin/assets/inc/footer.jsp" %>