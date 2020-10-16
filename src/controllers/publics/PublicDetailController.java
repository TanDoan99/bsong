package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import daos.SongDAO;
import models.Song;

public class PublicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicDetailController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/404");
		}
		int cat_id = Integer.parseInt(request.getParameter("cat_id"));
		SongDAO songDAO = new SongDAO();
		List<Song> songDetail = songDAO.getDetail(id);
		CatDAO catDAO = new CatDAO();
		List<Song> listDetail= catDAO.getItemDetail(cat_id);
		
		request.setAttribute("songDetail", songDetail);
		request.setAttribute("listDetail", listDetail);
		
		request.getRequestDispatcher("/views/public/detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
