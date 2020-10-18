package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import daos.SongDAO;
import models.Category;
import models.Song;
import utils.DefineUtil;
public class PublicCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PublicCatController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=0;
		int cat_id=0;
		try {
			id=Integer.parseInt(request.getParameter("id"));
			cat_id=Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/404");
			return;
		}
		int currentPage=1;
		try {
			
			currentPage=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage=1;
		}
		SongDAO songDAO=new SongDAO();
		CatDAO catDAO=new CatDAO();
		Category cat= catDAO.getItem(id);
		
		int numberOfItems= songDAO.numberOfItems(id);
		int numberOfPages=(int) Math.ceil((float) numberOfItems / DefineUtil.NUMBER_PER_PAGE);
		if(currentPage>numberOfPages||currentPage<1) {	
			currentPage=1;
		}
		int offset=(currentPage-1)*DefineUtil.NUMBER_PER_PAGE;
		List<Song> listCatSongPage=songDAO.getItemIdCatPagination(offset,id);
		List<Song> listCatSong=songDAO.getItemIdCat(id);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("cat_id", cat_id);
		request.setAttribute("cat", cat);
		request.setAttribute("listCatSongPage", listCatSongPage);
		request.setAttribute("listCatSong", listCatSong);
		request.getRequestDispatcher("/views/public/cat.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
