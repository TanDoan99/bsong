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
public class AdminAddCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminAddCatController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/cat/add.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		CatDAO catDAO=new CatDAO();
		String name=request.getParameter("name");
		if("".equals(name)) {
			RequestDispatcher rd=request.getRequestDispatcher("/views/admin/cat/add.jsp?err=3");
			rd.forward(request, response);
			return;
		}
		Category cat=new Category(name);
		int add=catDAO.add(cat);
		if(add>0) {
			//them thanh cong
			response.sendRedirect(request.getContextPath()+"/admin/cat/index?msg=OK");
			return;
		}
		//that bai
		request.setAttribute("cat", cat);
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/cat/add.jsp?err=0");
		rd.forward(request, response);
	}

}
