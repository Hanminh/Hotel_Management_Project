package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DBO.JDBCconnection;
import model.Order;

public class OrderDAO implements DAOInterface<Order> {
	
	@Override
	public ArrayList<Order> selectAll() {
		ArrayList<Order> result = new ArrayList<Order>();
		try {
			//Tạo kết nối đến CSDL
			Connection connection = JDBCconnection.getConnection();
			// Tạo ra đối tượng statement
			String sql = "SELECT * FROM hotelmanagenment.order";
			Statement statement = connection.createStatement();
			//Thực thi câu lệnh sql
			ResultSet rs = statement.executeQuery(sql);
			//Xử lí kết quả:
			while(rs.next()) {
				String orderID = rs.getString("idOrder");
				String roomID = rs.getString("idRoom");
				String customerName = rs.getString("customerName");
				String customerPhoneNumber = rs.getString("customerPhoneNumber");
				String customerCitizenID = rs.getString("customerCitizenID");
				Date timeStart = rs.getDate("timeStart");
				Date timeEnd = rs.getDate("timeEnd");
				double orderPrice = rs.getDouble("orderPrice");
				String orderStatus = rs.getString("orderStatus");
				Order new_order = new Order(orderID, roomID, customerName, customerPhoneNumber, customerCitizenID, timeStart, timeEnd, orderPrice, orderStatus);
				result.add(new_order);
			}
			//Ngắt kết nối với cơ sở dữ liệu
			JDBCconnection.closeConnection(connection);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Order selectById(String id) {
		Order result = null;
		try {
			//Tạo kết nối đến CSDL
			Connection connection = JDBCconnection.getConnection();
			// Tạo ra đối tượng statement
			String sql = "SELECT * FROM hotelmanagenment.order WHERE idOrder like ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			String idd = "%" + id + "%";
			statement.setString(1, idd);
			//Thực thi câu lệnh sql
			ResultSet rs = statement.executeQuery();
			//Xử lí kết quả:
			while(rs.next()) {
				String orderID = rs.getString("idOrder");
				String roomID = rs.getString("idRoom");
				String customerName = rs.getString("customerName");
				String customerPhoneNumber = rs.getString("customerPhoneNumber");
				String customerCitizenID = rs.getString("customerCitizenID");
				Date timeStart = rs.getDate("timeStart");
				Date timeEnd = rs.getDate("timeEnd");
				double orderPrice = rs.getDouble("orderPrice");
				String orderStatus = rs.getString("orderStatus");
				
				result = new Order(orderID, roomID, customerName, customerPhoneNumber, customerCitizenID, timeStart, timeEnd, orderPrice, orderStatus);
			}
			//Ngắt kết nối với cơ sở dữ liệu
			JDBCconnection.closeConnection(connection);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean insert(Order order) {
		int result = 0;
		boolean check = false;
		try {
			//Tạo kết nối đến CSDL
			Connection connection = JDBCconnection.getConnection();
			// Tạo ra đối tượng statement
			String sql = "INSERT INTO hotelmanagenment.order (idOrder, idRoom, customerName, customerPhoneNumber, customerCitizenID, timeStart, timeEnd, orderPrice, orderStatus) "
							+ "VALUE (?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, order.getOrderID());
			statement.setString(2, order.getRoomID());
			statement.setString(3, order.getCustomerName());
			statement.setString(4, order.getCustomerPhoneNumber());
			statement.setString(5, order.getCustomerCitizenID());
			statement.setDate(6, order.getTimeStart());
			statement.setDate(7, order.getTimeEnd());
			statement.setDouble(8, order.getOrderPrice());
			statement.setString(9, order.getOrderStatus());
			//Thực thi câu lệnh sql

			result = statement.executeUpdate();
			//Xử lí kết quả:
			System.out.println("Có " + result + " dòng bị thay đổi!");

			//Ngắt kết nối với cơ sở dữ liệu
			JDBCconnection.closeConnection(connection);
			check = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public int insertAll(ArrayList<Order> list) {
		int count = 0;
		for(Order check : list) {
			if(this.insert(check)) {
				count++;
			}
		}
		return count;
	}
	

	@Override
	public boolean delete(Order t) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean deleteOrder(String id) {
		boolean check = false;
		int result = 0;
		try {
			//Tạo kết nối đến CSDL
			Connection connection = JDBCconnection.getConnection();
			// Tạo ra đối tượng statement
			String sql = "DELETE from  hotelmanagenment.order" + " WHERE idOrder = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, id );
			//Thực thi câu lệnh
			result = statement.executeUpdate();
			//Xử lí kết quả:
			System.out.println("Có " + result + " dòng bị thay đổi!");
			check = true;
			//Ngắt kết nối với cơ sở dữ liệu
			JDBCconnection.closeConnection(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public int deleteAll(ArrayList<Order> list) {
		int count = 0;
		for(Order check : list) {
			if(this.delete(check)) {
				count++;
			}
		}
		return count;
	}

	@Override
    public boolean update(Order order) {
        String sql = "UPDATE hotelmanagenment.order SET idRoom=?, customerName=?, customerPhoneNumber=?, " +
                "customerCitizenID=?, timeStart=?, timeEnd=?, orderPrice=?, orderStatus=? WHERE idOrder=?";
        Connection connection = JDBCconnection.getConnection();
        try { 
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
        	preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, order.getRoomID());
            preparedStatement.setString(2, order.getCustomerName());
            preparedStatement.setString(3, order.getCustomerPhoneNumber());
            preparedStatement.setString(4, order.getCustomerCitizenID());
            preparedStatement.setDate(5, new java.sql.Date(order.getTimeStart().getTime()));
            preparedStatement.setDate(6, new java.sql.Date(order.getTimeEnd().getTime()));
            preparedStatement.setDouble(7, order.getOrderPrice());
            preparedStatement.setString(8, order.getOrderStatus());
            preparedStatement.setString(9, order.getOrderID());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception or log it as needed
            return false;
        }
    }
	
	public ArrayList<Order> listAfterSearch(String id) {
	    ArrayList<Order> result = new ArrayList<Order>();
	    try {
	        // Tạo kết nối đến CSDL
	        Connection connection = JDBCconnection.getConnection();
	        // Tạo ra đối tượng statement
	        String sql = "SELECT * FROM hotelmanagenment.order where idOrder like ? ";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        String idd = "%" + id + "%";
	        statement.setString(1, idd);

	        // Thực thi câu lệnh sql
	        ResultSet rs = statement.executeQuery(); // Fix here

	        // Xử lí kết quả:
	        while (rs.next()) {
	            String orderID = rs.getString("idOrder");
	            String roomID = rs.getString("idRoom");
	            String customerName = rs.getString("customerName");
	            String customerPhoneNumber = rs.getString("customerPhoneNumber");
	            String customerCitizenID = rs.getString("customerCitizenID");
	            Date timeStart = rs.getDate("timeStart");
	            Date timeEnd = rs.getDate("timeEnd");
	            double orderPrice = rs.getDouble("orderPrice");
	            String orderStatus = rs.getString("orderStatus");
	            Order new_order = new Order(orderID, roomID, customerName, customerPhoneNumber, customerCitizenID,
	                    timeStart, timeEnd, orderPrice, orderStatus);
	            result.add(new_order);
	        }

	        // Ngắt kết nối với cơ sở dữ liệu
	        JDBCconnection.closeConnection(connection);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return result;
	}

	
}
