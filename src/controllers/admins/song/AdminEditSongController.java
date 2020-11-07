package controllers.admins.song;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import daos.CatDAO;
import daos.SongDAO;
import models.Category;
import models.Song;
import utils.AuthUtil;
import utils.FileUtil;

@MultipartConfig
public class AdminEditSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminEditSongController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/admin/song/edit?err=3");
			return;
		}
		SongDAO songDAO = new SongDAO();
		Song song = songDAO.findSong(id);
		CatDAO catDAO = new CatDAO();
		List<Category> listCat = catDAO.findAll();
		request.setAttribute("song", song);
		request.setAttribute("listCat", listCat);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/song/edit.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int category = Integer.parseInt(request.getParameter("category"));
		String preview = request.getParameter("preview");
		String detail = request.getParameter("detail");

		// upload anh
		String fileName = FileUtil.upload("picture", request);
		// System.out.println(fileName);
		SongDAO songDAO = new SongDAO();
		Song itemSong = songDAO.findSong(id);
		if ("".equals(fileName)) {
			fileName = itemSong.getPicture();
		}
		Song song = new Song(id, name, preview, detail, fileName, new Category(category));

		if (songDAO.editSong(song) > 0) {
			// sua thanh cong thi xoa anh cu
			Part part = request.getPart("picture");
			String fileNameNew = part.getSubmittedFileName();
			if (!"".equals(fileNameNew)) {
//			if(!"".equals(request.getPart("picture").getSubmittedFileName())) {//nếu có chọn ảnh mới
				FileUtil.delFile(itemSong.getPicture(), request);
			}
			// System.out.println(123);
			response.sendRedirect(request.getContextPath() + "/admin/song?msg=ok");
			return;
		}

	}

}
