package controllers.admins.contact;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ContactDAO;
import models.Contact;
import utils.AuthUtil;
import utils.DefineUtil;
public class AdminIndexContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexContactController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		if(!AuthUtil.checkLogin(request, response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		ContactDAO contactDAO=new ContactDAO();
		int currentPage=1;
		try {
			
			currentPage=Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage=1;
		}
		int numberOfItems= contactDAO.findAll().size();
		int numberOfPages=(int) Math.ceil((float) numberOfItems/DefineUtil.NUMBER_PER_PAGE);
		if(currentPage>numberOfPages||currentPage<1) {	
			currentPage=1;
		}
		int offset=(currentPage-1)*DefineUtil.NUMBER_PER_PAGE;
		
		List<Contact> contList=contactDAO.getItemPagination(offset);
		request.setAttribute("contList", contList);
		request.setAttribute("numberOfPages", numberOfPages);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher("/views/admin/contact/index.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
