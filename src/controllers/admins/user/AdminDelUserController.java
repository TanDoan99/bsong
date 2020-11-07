package controllers.admins.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.UserDAO;
import models.User;
import utils.AuthUtil;

public class AdminDelUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDelUserController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		UserDAO userDAO = new UserDAO();
		HttpSession session = request.getSession();
		User userInfo = (User) session.getAttribute("userInfo");
		if ("admin".equals(userInfo.getUsername())) {
			int del = userDAO.delItem(id);
			if (del > 0) {
				// thanh cong
				response.sendRedirect(request.getContextPath() + "/admin/user?msg=2");// k chuyen du lieu
				return;
			}
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/index.jsp?err=2");// co chuyen du
																										// lieu
			rd.forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/user?err=5");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
