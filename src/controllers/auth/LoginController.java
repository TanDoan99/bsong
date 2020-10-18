package controllers.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.UserDAO;
import models.User;
import utils.StringUtil;
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		//thong tin dang nhap
		String username = request.getParameter("username");
		String password = StringUtil.md5(request.getParameter("password"));
		//kiem tra thong tin dang nhap
		User userInfo =userDAO.findUsernameAndPassword(username, password);
		
		if(userInfo!=null) {
			//
			//
			HttpSession session=request.getSession();
			session.setAttribute("userInfo", userInfo);
			response.sendRedirect(request.getContextPath()+"/admin/index");
		}else {
			request.getRequestDispatcher("/views/auth/login.jsp?msg=err").forward(request, response);
		}
		
		
	}

}
