package Minh.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Minh.Config.DatabaseConfig;
import model.Employee;

public class EmployeeModel {
	public List<Employee> listEmployee() { 
		List<Employee> ls = new ArrayList<Employee>();
		Connection connect = DatabaseConfig.getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select * from employee";
		try {
			stmt = connect.createStatement();
			//Execute query	
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				String accountID = rs.getString("idAccount");
				String employeeID = rs.getString("idEmployee");
				String employeeName = rs.getString("employeeName");
				String employeeCitizenID = rs.getString("employeeCitizenID");
				String employeeGender = rs.getString("employeeGender");
				int employeeAge = rs.getInt("employeeAge");
				String employeeAddress = rs.getString("employeeAddress");
				String employeePhoneNumber = rs.getString("employeePhoneNumber");
				String employeeEmail = rs.getString("employeeEmail");
				
				Employee new_account = new Employee(employeeID, employeeName, accountID, employeeCitizenID, employeeGender, employeeAge, employeeAddress, employeePhoneNumber, employeeEmail);
				ls.add(new_account);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ls;
	}

	public Employee selectById(String id) {
		Employee result = null;
		try {
			//Tạo kết nối đến CSDL
			Connection connection = DatabaseConfig.getConnection();
			// Tạo ra đối tượng statement
			String sql = "SELECT * FROM employee WHERE idEmployee = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, id);
			//Thực thi câu lệnh sql
			ResultSet rs = statement.executeQuery();
			//Xử lí kết quả:
			while(rs.next()) {
				String accountID = rs.getString("idAccount");
				String employeeID = rs.getString("idEmployee");
				String employeeName = rs.getString("employeeName");
				String employeeCitizenID = rs.getString("employeeCitizenID");
				String employeeGender = rs.getString("employeeGender");
				int employeeAge = rs.getInt("employeeAge");
				String employeeAddress = rs.getString("employeeAddress");
				String employeePhoneNumber = rs.getString("employeePhoneNumber");
				String employeeEmail = rs.getString("employeeEmail");
				
				result = new Employee(employeeID, employeeName, accountID, employeeCitizenID, employeeGender, employeeAge, employeeAddress, employeePhoneNumber, employeeEmail);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertAll(ArrayList<Employee> list) {
		return 1;
	}

	public boolean delete(String id) {
		Connection connect = null;
		PreparedStatement statement = null;
		boolean check = false;
		int result = 0;
		try {
			Connection connection = DatabaseConfig.getConnection();
			String sql = "DELETE from employee WHERE idAccount = ?";
			statement = connection.prepareStatement(sql);
			statement.setString(1, id);
			statement.execute();
			result = statement.executeUpdate();
			System.out.println("Có " + 1 + " dòng bị xóa!");
			check = true;
			//Ngắt kết nối với cơ sở dữ liệu
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}

	public int deleteAll(ArrayList<Employee> list) {
		int count = 0;
		return count;
	}

	public void update(Employee e) {
		Connection connect = null;
		PreparedStatement stmt = null;
		String employeeId = e.getEmployeeID();
		String name = e.getEmployeeName();
		String gender = e.getEmployeeGender();
		int age = e.getEmployeeAge();
		String address = e.getEmployeeAddress();
		String phone = e.getEmployeePhoneNumber();
		String email = e.getEmployeeEmail();
		try {
			connect = DatabaseConfig.getConnection();
			String query = "update employee set employeeName= ?, employeeGender = ?, employeeAge = ? ,employeeAddress = ? ,employeePhoneNumber = ? , employeeEmail = ? "
					+ "where idEmployee = ?";
			stmt = connect.prepareStatement(query);
			stmt.setString(1, name );
			stmt.setString(2, gender);
			stmt.setInt(3, age);
			stmt.setString(4, address);
			stmt.setString(5, phone);
			stmt.setString(6, email);
			stmt.setString(7, employeeId);
			stmt.execute();
			
		} catch (SQLException ee) {
			ee.printStackTrace();
		}
	}

	public boolean insert(Employee employee) {
		int result = 0;
		boolean check = false;
		try {
			//Tạo kết nối đến CSDL
			Connection connection = DatabaseConfig.getConnection();
			// Tạo ra đối tượng statement
			String sql = "INSERT INTO employee (idEmployee, employeeName, idAccount, employeeCitizenID, employeeGender, employeeAge, employeeAddress, employeePhoneNumber, employeeEmail) "
							+ "VALUE (?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, employee.getEmployeeID());
			statement.setString(2, employee.getEmployeeName());
			statement.setString(3, employee.getAccountID());
			statement.setString(4, employee.getEmployeeCitizenID());
			statement.setString(5, employee.getEmployeeGender());
			statement.setInt(6, employee.getEmployeeAge());
			statement.setString(7, employee.getEmployeeAddress());
			statement.setString(8, employee.getEmployeePhoneNumber());
			statement.setString(9, employee.getEmployeeEmail());
			//Thực thi câu lệnh sql
			statement.execute();
			result = statement.executeUpdate(sql);
			//Xử lí kết quả:
			System.out.println("Có " + 1 + "nhân viên được thêm");

			//Ngắt kết nối với cơ sở dữ liệu
			check = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}
	public List<Employee> listAfterSearch(String id) {
		List<Employee> ls = new ArrayList<Employee>();
		Connection connect = DatabaseConfig.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String query = "select * from employee where idEmployee =?";
		try {
			stmt = connect.prepareStatement(query);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while(rs.next()) {
				String accountID = rs.getString("idAccount");
				String employeeID = rs.getString("idEmployee");
				String employeeName = rs.getString("employeeName");
				String employeeCitizenID = rs.getString("employeeCitizenID");
				String employeeGender = rs.getString("employeeGender");
				int employeeAge = rs.getInt("employeeAge");
				String employeeAddress = rs.getString("employeeAddress");
				String employeePhoneNumber = rs.getString("employeePhoneNumber");
				String employeeEmail = rs.getString("employeeEmail");
				
				Employee new_account = new Employee(employeeID, employeeName, accountID, employeeCitizenID, employeeGender, employeeAge, employeeAddress, employeePhoneNumber, employeeEmail);
				ls.add(new_account);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ls;
	}
}
	
