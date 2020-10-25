package controllers.admins.contact;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ContactDAO;
import utils.AuthUtil;
public class AdminDelContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminDelContactController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		ContactDAO contDAO=new ContactDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		int dele=contDAO.del(id);
		if(dele>0) {
			//xóa thành công
			response.sendRedirect(request.getContextPath()+"/admin/contact?msg=1");
			return;
		}
		//thất bại
		response.sendRedirect(request.getContextPath()+"/admin/contact?err=0");
		return;
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
