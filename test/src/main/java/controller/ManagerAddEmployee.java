package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManagerController
 */
@WebServlet("/ManagerAddEmployee")
public class ManagerAddEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManagerAddEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("staff-name");
		String gender = request.getParameter("staff-gender"); 
		String birth = request.getParameter("staff-date");
		String address = request.getParameter("staff-address");
		String phone = request.getParameter("staff-phone");
		String email = request.getParameter("staff-email");
		
	}

}
