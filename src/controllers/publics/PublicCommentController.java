package controllers.publics;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.SongDAO;
import models.Comment;


public class PublicCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Comment> listCmt=new ArrayList<>();

	public PublicCommentController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int song_id = 0;
		try {
			song_id = Integer.parseInt(request.getParameter("song_id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		String fullname = request.getParameter("fullname");
		String cmt = request.getParameter("cmt");
		SongDAO songDAO = new SongDAO();
		Comment objCmt= new Comment(fullname, cmt, null, song_id);
		int	Cmt = songDAO.addCmt(objCmt);
		
		if(Cmt>0) {
			listCmt=songDAO.findCmt(song_id);
			System.out.println(listCmt.size());
			HttpSession session=request.getSession();
			session.setAttribute("listCmt", listCmt);
		}
	
	}

}
