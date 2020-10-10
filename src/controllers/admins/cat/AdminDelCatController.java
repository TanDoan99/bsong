package controllers.admins.cat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
public class AdminDelCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminDelCatController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CatDAO catDAO=new CatDAO();
		int id=Integer.parseInt(request.getParameter("id"));
		int dele=catDAO.del(id);
		if(dele>0) {
			//them thanh cong
			response.sendRedirect(request.getContextPath()+"/admin/cat/index?msg=1");
			return;
		}
		//that bai
		response.sendRedirect(request.getContextPath()+"/admin/cat/index?err=0");
		return;
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
