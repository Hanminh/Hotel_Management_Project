package Minh.Controller;

import java.io.IOException;
import java.util.ArrayList;

import DAO.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/homeController")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "post": {
			request.getRequestDispatcher("post.jsp").forward(request, response);
			break;
		}
		case "admin": {
			request.getRequestDispatcher("admin.jsp").forward(request, response);
			break;
		}
		case "listStaff": {
			response.sendRedirect("listStaffController?action=listStaff");
			break;
		}
		case "listRoom": {
			request.getRequestDispatcher("listRoom.jsp").forward(request, response);
			break;
		}
		case "listBookRoom" : {
			ArrayList<Order> list = new OrderDAO().selectAll();
			request.setAttribute("list", list);
			request.getRequestDispatcher("listBookRoom.jsp").forward(request, response);
			break;
		}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
