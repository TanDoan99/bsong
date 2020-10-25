package controllers.admins;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
import utils.AuthUtil;
public class AdminIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		request.setAttribute("countCat", new SongDAO().countCat());
		request.setAttribute("countSong", new SongDAO().countSong());
		request.setAttribute("countUser", new SongDAO().countUser());
		request.getRequestDispatcher("/views/admin/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
