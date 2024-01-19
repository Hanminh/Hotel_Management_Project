package Minh.Controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Random;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import DAO.OrderDAO;


/**
 * Servlet implementation class RoomOrderController
 */
@WebServlet("/RoomOrderController")
public class RoomOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "delete": {
			deleteOrder(request, response);
			break;
		}
		case"listOrder" : {
			listOrder(request, response);
			break;
		}
		case "edit" : {
			request.getRequestDispatcher("editOrder.jsp").forward(request, response);
			break;
		}
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		switch (action) {
		case "update": {
			updateOrder(request, response);    
			break;
		}
		case "search" : {
			searchOrder(request, response);
			break;
		}
		case "insert" : {
			insertOrder(request, response);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
	}
	protected void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		new OrderDAO().deleteOrder(id);
		listOrder(request, response);
	}
	protected void updateOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String orderId = request.getParameter("id");
        String roomId = request.getParameter("room-id");
        String customerName = request.getParameter("customer-name");
        String cccd = request.getParameter("cccd");
        String phone = request.getParameter("phone");
        Date indate = Date.valueOf(request.getParameter("indate"));
        Date outdate = Date.valueOf(request.getParameter("outdate"));
        Float price = Float.parseFloat(request.getParameter("price"));
        String orderStatus = request.getParameter("orderStatus");
        Order o = new Order(orderId, roomId, customerName, phone, cccd, indate, outdate, price, orderStatus);
        new OrderDAO().update(o);
        request.getRequestDispatcher("listBookRoom.jsp").forward(request, response);
               
	}
	protected void listOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Order> list = new ArrayList<Order>();
		list = new OrderDAO().selectAll();
		request.setAttribute("list", list);
        request.getRequestDispatcher("listBookRoom.jsp").forward(request, response);
               
	}	
	protected void searchOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Order> list = new ArrayList<Order>();
		list = new OrderDAO().listAfterSearch(request.getParameter("search"));
//		list.add(new OrderDAO().selectById(request.getParameter("search")));
		request.setAttribute("list", list);
        request.getRequestDispatcher("listBookRoom.jsp").forward(request, response);       
	}
	protected void insertOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String name = request.getParameter("name");
		    String phone = request.getParameter("phone");
		    String email = request.getParameter("email");
		    Date indate = Date.valueOf(request.getParameter("indate"));
		    Date outdate = Date.valueOf(request.getParameter("outdate"));
		    String roomId = request.getParameter("id");
		    int randomInteger = generateRandomInteger(1000, 2000);
		    String idOrder = "ORDER" + String.valueOf(randomInteger);
		    Order o = new Order(idOrder, roomId, name, phone, email, indate, outdate, 200, "Pending" );
		    new OrderDAO().insert(o);
		    RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/room.jsp");
		    dispatcher.forward(request, response);
		    
	}
	
	
	
	private static int generateRandomInteger(int min, int max) {
        // Tạo một đối tượng Random
        Random random = new Random();

        // Sử dụng phương thức nextInt để tạo số nguyên ngẫu nhiên trong phạm vi [min, max]
        return random.nextInt((max - min) + 1) + min;
    }

}
