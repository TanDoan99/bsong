package controllers.admins.song;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
public class AdminDelSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminDelSongController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SongDAO songDAO=new SongDAO();
		int id=Integer.parseInt(request.getParameter("id"));
		int dele=songDAO.del(id);
		if(dele>0) {
			//xóa thành công
			response.sendRedirect(request.getContextPath()+"/admin/song?msg=1");
			return;
		}
		//thất bại
		response.sendRedirect(request.getContextPath()+"/admin/song?err=0");
		return;
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
