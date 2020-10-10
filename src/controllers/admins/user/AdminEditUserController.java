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

public class AdminEditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminEditUserController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		int id=0;
		try {
			id=Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin/user?err=1");
			return;
		}
		UserDAO userDAO=new UserDAO();
		User user=userDAO.getItem(id);
		request.setAttribute("user", user);
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/user/edit.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		int id=0;
		try {
			id=Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin/user?err=1");
			return;
		}
		//lay lai du lieu cu
		UserDAO userDAO=new UserDAO();
		User user=userDAO.getItem(id);
		//get data
		String password=request.getParameter("password");
		if("".equals(password)) {
			password=user.getPassword();
		}else {
			password=StringUtil.md5(password);
		}
		String fullname=request.getParameter("fullname");
		//lam them : validate du lieu dau vao
		
		if(fullname.equals("")) {
			RequestDispatcher rd=request.getRequestDispatcher("/views/admin/user/edit.jsp?err=2");
			rd.forward(request, response);
		}
		//du lieu moi
		
		User users=new User(id,password, fullname);
		int edit=userDAO.editItem(users);
		if(edit>0) {
			//thanh cong
			response.sendRedirect(request.getContextPath()+"/admin/user?msg=1");//k chuyen du lieu
			return;
		}
		request.setAttribute("users", users);
		//that bai
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/user/edit.jsp?err=0");//co chuyen du lieu
		rd.forward(request, response);
	}

}
