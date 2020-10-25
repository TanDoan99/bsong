package controllers.admins.cat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CatDAO;
import models.Category;
import utils.AuthUtil;
public class AdminEditCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminEditCatController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		int id=0;
		try {
			id= Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/admin/cat/edit?err=3");
			return;
		}
		CatDAO catDao = new CatDAO();
		Category cat = catDao.findEdit(id);
		request.setAttribute("cat", cat);
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/cat/edit.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		CatDAO catDAO=new CatDAO();
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		request.setAttribute("name",name );
		Category cat=new Category(id, name);
		int edit=catDAO.edit(cat);
		if(edit>0) {
			//sua thanh cong
			response.sendRedirect(request.getContextPath()+"/admin/cat/index?msg=2");
			return;
		}
		//sua that bai
		request.setAttribute("cat", cat);
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/cat/edit.jsp?err=2");
		rd.forward(request, response);
		
	}

}
