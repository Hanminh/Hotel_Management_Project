package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Order;
import DAO.OrderDAO;
import java.sql.Date;

/**
 * Servlet implementation class EditOrder
 */
@WebServlet("/EditOrder")
public class EditOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		//
		String OID= request.getParameter("edit-order-id");
		String newName = request.getParameter("customer-name");
		String newPhone = request.getParameter("customer-telephone");
		Date newTimeStart = Date.valueOf(request.getParameter("time-start"));
		Date newTimeEnd = Date.valueOf(request.getParameter("time-end"));

		String newStatus = request.getParameter("status");
		
		OrderDAO dao= new OrderDAO();
		Order UpOrder = dao.selectById(OID);
		
		UpOrder.setCustomerName(newName);
		UpOrder.setCustomerPhoneNumber(newPhone);
		UpOrder.setTimeStart(newTimeStart);
		UpOrder.setTimeEnd(newTimeEnd);
		UpOrder.setOrderStatus(newStatus);
		
		
		dao.update(UpOrder);
		
		response.sendRedirect("FindOrder");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
