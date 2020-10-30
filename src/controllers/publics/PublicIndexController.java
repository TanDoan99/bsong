package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
import models.Song;
import utils.DefineUtil;

public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicIndexController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		System.out.println(request.getServletContext().getRealPath(""));
		SongDAO songDAO=new SongDAO();
		
		int currentPage=1;
		try {
			
			currentPage=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage=1;
		}
		
		int numberOfItems= songDAO.findAll().size();
		int numberOfPages=(int) Math.ceil((float) numberOfItems/DefineUtil.NUMBER_PER_PAGE);
		if(currentPage>numberOfPages||currentPage<1) {	
			currentPage=1;
		}
		int offset=(currentPage-1)*DefineUtil.NUMBER_PER_PAGE;
		List<Song> listSong=songDAO.getItemPagination(offset);
		request.setAttribute("listSong", listSong);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher("/views/public/index.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
