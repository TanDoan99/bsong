package controllers.admins.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.UserDAO;
import models.User;
import utils.StringUtil;
public class AdminAddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminAddUserController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/user/add.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserDAO userDAO=new UserDAO();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String fullname=request.getParameter("fullname");
		//validate dữ liệu
		if(userDAO.hasUser(username)) {
			RequestDispatcher rd=request.getRequestDispatcher("/views/admin/user/add.jsp?err=1");
			rd.forward(request, response);
		}
		if(username.equals("")) {
			RequestDispatcher rd=request.getRequestDispatcher("/views/admin/user/add.jsp?err=2");
			rd.forward(request, response);
		}
		if(password.equals("")) {
			RequestDispatcher rd=request.getRequestDispatcher("/views/admin/user/add.jsp?err=3");
			rd.forward(request, response);
		}
		if(fullname.equals("")) {
			RequestDispatcher rd=request.getRequestDispatcher("/views/admin/user/add.jsp?err=4");
			rd.forward(request, response);
		}
		//mã hóa MD5
		password=StringUtil.md5(password);//sau khi mã hóa sẽ thành chuỗi kí tự
		User user=new User(username, password, fullname);
		int add=userDAO.add(user);
		if(add>0) {
			//them thanh cong
			response.sendRedirect(request.getContextPath()+"/admin/user?msg=OK");
			return;
		}
		//that bai
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/user/add.jsp?err=0");
		rd.forward(request, response);
		
	}

}
