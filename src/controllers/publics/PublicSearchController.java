package controllers.publics;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
import models.Song;

public class PublicSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicSearchController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String editbox_search = request.getParameter("editbox_search");
		ArrayList<Song> arrSong = new ArrayList<Song>();
		arrSong = new SongDAO().searchSong(editbox_search);
		request.setAttribute("arrSong", arrSong);
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/search.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
