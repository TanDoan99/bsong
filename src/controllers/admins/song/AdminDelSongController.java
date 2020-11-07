package controllers.admins.song;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
import models.Song;
import utils.AuthUtil;
import utils.FileUtil;

public class AdminDelSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDelSongController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/auth/login");
			return;
		}
		SongDAO songDAO = new SongDAO();
		int id = Integer.parseInt(request.getParameter("sid"));
		// kiem tra tin neu co file thi xoa
		Song song = songDAO.findOne(id);
		String picture = song.getPicture();
		System.out.println("anr:" + picture);
		FileUtil.delFile(picture, request);

		int dele = songDAO.del(id);
		// xoa tin o data
		if (dele > 0) {
			// xóa thành công
			response.sendRedirect(request.getContextPath() + "/admin/song?msg=1");
			return;
		}
		// thất bại
		response.sendRedirect(request.getContextPath() + "/admin/song?err=0");
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
