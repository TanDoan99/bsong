package controllers.admins.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.SongDAO;
import utils.AuthUtil;
public class AdminDelCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminDelCommentController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		SongDAO songDAO = new SongDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		int dele=songDAO.delCmt(id); 
		if(dele>0) {
			//xóa thành công
			response.sendRedirect(request.getContextPath()+"/admin/comment?msg=1");
			return;
		}
		//thất bại
		response.sendRedirect(request.getContextPath()+"/admin/comment?err=0");
		return;
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
