package controllers.publics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import daos.SongDAO;
import models.Category;
import models.Song;

public class PublicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicDetailController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		SongDAO songDAO=new SongDAO();
		Song songDetail=songDAO.getDetail(id);
		CatDAO catDAO=new CatDAO();
		Category cat= catDAO.getItem(id);
		request.setAttribute("cat", cat);

		request.setAttribute("songDetail", songDetail);
		request.getRequestDispatcher("/views/public/detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
