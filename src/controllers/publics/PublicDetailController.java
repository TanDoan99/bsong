package controllers.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.CatDAO;
import daos.SongDAO;
import models.Comment;
import models.Song;

public class PublicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PublicDetailController() {
		super();
	}

	// add lombok vào đi à ok có rồi mà dũng, add vô eclipse ấy chỗ nào ông. chọn đến cái chỗ lưu echipse
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SongDAO songDAO = new SongDAO();
		List<Comment> listCmt=null;
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		// tăng view
		HttpSession session = request.getSession();
		String hasVisited = (String) session.getAttribute("hasVisited: " + id);
		if (hasVisited == null) {
			session.setAttribute("hasVisited: " + id, "yes");
			session.setMaxInactiveInterval(3);
			// increase page view
			songDAO.increaseView(id);
		}
//		System.out.println(id);
		Song songDetail = songDAO.getDetail(id);
		int cat_id = songDetail.getCat().getId();
//		System.out.println(songDetail.getCat().getId());
		CatDAO catDAO = new CatDAO();
		List<Song> listDetail = catDAO.getItemDetail(cat_id);
		listCmt=songDAO.findCmt(id);
		session.setAttribute("listCmt", listCmt);

		request.setAttribute("songDetail", songDetail);
		request.setAttribute("listDetail", listDetail);

		request.getRequestDispatcher("/views/public/detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
