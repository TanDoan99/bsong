package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
import models.Song;

public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicIndexController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		SongDAO songDAO=new SongDAO();
		List<Song> listSong=songDAO.findAll();
		request.setAttribute("listSong", listSong);
		
		request.getRequestDispatcher("/views/public/index.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
