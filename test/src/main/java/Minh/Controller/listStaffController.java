package Minh.Controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;
import Minh.Model.EmployeeModel;
import model.Employee;

/**
 * Servlet implementation class listStaffController
 */
@WebServlet("/listStaffController")
public class listStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public listStaffController() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action").toLowerCase();
		switch (action) {
		case "delete": {
			deleteUser(request, response);
			break;
		}
		case "edit" : {
			request.getRequestDispatcher("listStaff.jsp").forward(request, response);
			break;
		}
		case "liststaff" : {
			listUser(request, response);
			break;
		}
		
	}
}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "addStaff": {
			addStaff(request, response);
			break;
		}
		case "searchStaff" : {
			searchUser(request, response);
			break;
		}
		}
	}
	
	protected void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empId = request.getParameter("id");
		new EmployeeModel().delete(empId);
		listUser(request, response);
		
	}
	protected void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Employee> list = new ArrayList<Employee>();
		list = new EmployeeModel().listEmployee();
		request.setAttribute("list", list);
		request.getRequestDispatcher("listStaff.jsp").forward(request, response);
	}
protected void addStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String staffId = request.getParameter("staff-id");
    String staffName = request.getParameter("staff-name");
    String staffGender = request.getParameter("staff-gender");
    String staffDate = request.getParameter("staff-date");
    String staffAddress = request.getParameter("staff-address");
    String staffPhone = request.getParameter("staff-phone");
    String staffEmail = request.getParameter("staff-email");
    LocalDate dob = LocalDate.parse(staffDate);
    Period age = Period.between(dob, LocalDate.now());
    int year = age.getYears();
    int staffAge = year;
    Employee e = new Employee(staffId, staffName, staffGender, staffAge, staffAddress,staffPhone,staffEmail);
    new EmployeeModel().insert(e);
    listUser(request, response);
	}
	
	protected void searchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		String employeeId = request.getParameter("searchInput");
		List<Employee> list = new ArrayList<Employee>();
		list = new EmployeeModel().listAfterSearch(employeeId);
		request.setAttribute("list", list);
		request.getRequestDispatcher("listStaff.jsp").forward(request, response);
	}

}
