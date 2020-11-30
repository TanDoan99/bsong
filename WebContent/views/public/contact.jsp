<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
    <div class="article">
      <h2><span>Liên hệ</span></h2>
      <div class="clr" ></div>
      						 <%
      						 	String msg = (String) request.getParameter("msg");
      						       						 						String err = (String) request.getParameter("err");
      						       						 						
      						       						 						String name=request.getParameter("name");
      						       						 						String email=request.getParameter("email");
      						       						 						String website=request.getParameter("website");
      						       						 						String message=request.getParameter("message");
      						       						 						
      						       						 						if("ok".equals(msg)) {
      						 %>
							<div class="alert alert-success" role="alert"Style="color: green;">
	 							<b>Thêm liên hệ thành công!</b>
							</div>
							<%
								}
																		if("off".equals(err)) {
							%>
							<div class="alert alert-danger" role="alert"Style="color: red;">
	 							 <b>Có lỗi khi thêm liên hệ!</b>
							</div>
							<%
								}
							%>
      <p>Khi bạn có thắc mắc, vui lòng gửi liên hệ, chúng tôi sẽ phản hồi trong thời gian sớm nhất.</p>
    </div>
    <div class="article">
    	
      <h2>Gửi liên hệ đến chúng tôi</h2>
      <h3 style="color: red">${error}</h3>
      <div class="clr"></div>
      <form action="" method="post" id="sendemail">
        <ol>
          <li>
            <label for="name">Họ tên (required)</label>
            <input id="name" value="<%if(name!=null)out.print(name);%>" name="name" class="text" />
          </li>
          <li>
            <label for="email">Email (required)</label>
            <input id="email" value="<%if(email!=null)out.print(email);%>" name="email" class="text" />
          </li>
          <li>
            <label for="website">Website</label>
            <input id="website" value="<%if(website!=null)out.print(website);%>" name="website" class="text" />
          </li>
          <li>
            <label for="message">Nội dung</label>
            <textarea id="message" name="message" rows="8" cols="50"><%
            	if(message!=null)out.print(message);
            %></textarea>
          </li>
          <li>
            <input type="image" name="imageField" id="imageField" src="<%=request.getContextPath()%>/templates/public/images/submit.gif" class="send" />
            <div class="clr"></div>
          </li>
        </ol>
      </form>
    </div>
  </div>
  <div class="sidebar">
  <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
