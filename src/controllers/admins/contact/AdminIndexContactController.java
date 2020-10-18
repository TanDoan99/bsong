package controllers.admins.contact;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ContactDAO;
import models.Contact;
public class AdminIndexContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminIndexContactController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		ContactDAO contactDAO=new ContactDAO();
		List<Contact> contList=contactDAO.findAll();
		request.setAttribute("contList", contList);
		request.getRequestDispatcher("/views/admin/contact/index.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
