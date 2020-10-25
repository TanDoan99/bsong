package controllers.admins.song;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
import models.Song;

public class AdminSearchSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminSearchSongController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		ArrayList<Song> arrSong = new ArrayList<Song>();
		arrSong = new SongDAO().searchSongAdmin(search);
		System.out.println(arrSong);
		request.setAttribute("arrSong", arrSong);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/song/search.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
