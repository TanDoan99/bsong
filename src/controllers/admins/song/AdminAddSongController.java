package controllers.admins.song;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import daos.SongDAO;
import models.Category;
import models.Song;
import utils.FileUtil;

@MultipartConfig
public class AdminAddSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminAddSongController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CatDAO catDAO=new CatDAO();
		List<Category> catList=catDAO.findAll();
		request.setAttribute("catList", catList);
		request.getRequestDispatcher("/views/admin/song/add.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		SongDAO songDAO=new SongDAO();
		String name=request.getParameter("name");
		String des=request.getParameter("preview");
		String detail=request.getParameter("detail");
		int catId=Integer.parseInt(request.getParameter("category"));
		//Upload file
		String fileName=FileUtil.upload("picture", request);
		Song song=new Song(name, des, detail, fileName,new Category(catId));
		if(songDAO.add(song)>0) {
			//them thanh cong
			response.sendRedirect(request.getContextPath()+"/admin/song?msg=OK");
			return;
		}
		//that bai
		request.setAttribute("song", song);
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/song/add.jsp?err=0");
		rd.forward(request, response);
		
		
	}

}
