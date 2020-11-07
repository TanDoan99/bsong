package controllers.admins.comment;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
import models.Comment;
import utils.AuthUtil;

public class AdminIndexCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexCommentController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		SongDAO songDAO = new SongDAO();
		List<Comment> listCmt=new ArrayList<>();
		listCmt=songDAO.findComment();
		request.setAttribute("listCmt", listCmt);
		
		request.getRequestDispatcher("/views/admin/comment/index.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
