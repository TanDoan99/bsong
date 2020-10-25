package controllers.admins.song;

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
import utils.AuthUtil;
import utils.DefineUtil;

public class AdminIndexSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminIndexSongController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		SongDAO songDAO=new SongDAO();
		CatDAO catDAO=new CatDAO();
		String name="";
		int cat=0;
		if(request.getParameter("name")!=null) {
			//người dùng có nhập => muốn tìm kiếm
			name=request.getParameter("name");
		}
		if (request.getParameter("cat")!=null) {
			cat=Integer.parseInt(request.getParameter("cat"));
		}
		if(cat>0) {
			//người dùng muốn tìm kiếm danh mục 
			cat=Integer.parseInt(request.getParameter("cat"));
		}
		Song song = new Song(name, new Category(cat));
		List<Song> ListSearch=songDAO.findAllByIdAndNameOrderByNewsId(song); 
		
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
		List<Song> songList=songDAO.getItemPagination(offset);
		List<Category> catList=catDAO.findAll();
		if(cat>0|| !"".equals(name)) {
			songList=ListSearch;
		}
		
		request.setAttribute("songList", songList);
		request.setAttribute("catList", catList);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher("/views/admin/song/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
