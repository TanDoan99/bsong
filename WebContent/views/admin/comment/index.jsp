<%@page import="models.Comment"%>
<%@page import="java.util.List"%>
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
                <h2>Quản lý bình luận</h2>
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
                            <div class="row" style='margin-right: 10px;'>
                                 <form method="get" action="<%=request.getContextPath()%>/admin/">
                                
                            	<input value="<%if(request.getParameter("snames")!=null) out.print(request.getParameter("snames")); %>" type="search" class="form-control input-sm" placeholder="Nhập tên người bình luận" name="snames" style="float:right; width: 200px;" />
							    <input type="submit" name="search" value="Tìm kiếm" class="btn btn-warning btn-sm" style="float:right;  margin-right:20px;" />
                                </form>
                            </div></br>
							<%
								String msg = (String) request.getParameter("msg");
								if("1".equals(msg)) {
							%>
							<div class="alert alert-success"  role="alert">
 								Xóa thành công!
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
                                        <th>Tên người bình luận</th>
                                        <th>Bình luận</th>
                                        <th>Ngày bình luận</th>
                                        <th width="160px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody >
                               	<%
                               		List<Comment> listCmt=null;
                               		if(request.getAttribute("listCmt")!=null){
                               			listCmt=(ArrayList<Comment>)request.getAttribute("listCmt");
                               			for(Comment objCmt: listCmt){
                               				if(listCmt.size()>0){
                               	%>
                                    <tr>
                                        <td><%=objCmt.getId()%></td>
                                        <td class="center"><%=objCmt.getName()%></td>
                                        <td class="center"><%=objCmt.getCmt()%></td>
                                        <td class="center"><%=objCmt.getDate_send()%></td>
                                        <td class="center">
                                            <a href="<%=request.getContextPath()%>/admin/comment/del?id=<%=objCmt.getId()%>" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa bình luận không?')"><i class="fa fa-pencil"></i> Xóa</a>
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