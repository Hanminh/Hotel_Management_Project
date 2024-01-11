package Minh.Model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Minh.Config.DatabaseConfig;
import model.Room;

public class RoomModel {
	public List<Room> selectAll() {
		List<Room> result = new ArrayList<Room>();
		Connection connection = DatabaseConfig.getConnection();
		String sql = "SELECT * FROM room";
		Statement stmt = null;
		ResultSet rs = null;
		try {
			//Thực thi câu lệnh sql
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			//Xử lí kết quả:
			while(rs.next()) {
				String roomID = rs.getString("idRoom");
				String roomName = rs.getString("roomName");
				int roomAmount = rs.getInt("roomAmount");
				String roomType = rs.getString("roomType");
				Double roomPrice = rs.getDouble("roomPrice");
				String roomStatus = rs.getString("roomStatus");
				String roomDescription = rs.getString("roomDescription");
				Room new_room = new Room(roomID, roomName, roomAmount, roomType, roomPrice, roomStatus, roomDescription);
				result.add(new_room);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public Room selectById(String id) {
		Room result = null;
		try {
			//Tạo kết nối đến CSDL
			Connection connection = DatabaseConfig.getConnection();
			// Tạo ra đối tượng statement
			String sql = "SELECT * FROM room WHERE idRoom = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, id);
			//Thực thi câu lệnh sql
			ResultSet rs = statement.executeQuery();
			//Xử lí kết quả:
			while(rs.next()) {
				String roomID = rs.getString("idRoom");
				String roomName = rs.getString("roomName");
				int roomAmount = rs.getInt("roomAmount");
				String roomType = rs.getString("roomType");
				Double roomPrice = rs.getDouble("roomPrice");
				String roomStatus = rs.getString("roomStatus");
				String roomDescription = rs.getString("roomDescription");
				
				result = new Room(roomID, roomName, roomAmount, roomType, roomPrice, roomStatus, roomDescription);
			}
			//Ngắt kết nối với cơ sở dữ liệu
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean checkRoom(String id) {
		boolean ketQua = false;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = DatabaseConfig.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM room WHERE idRoom = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				ketQua = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	public boolean insert(Room room) {
		int result = 0;
		boolean check = false;
		try {
			//Tạo kết nối đến CSDL
			Connection connection = DatabaseConfig.getConnection();
			// Tạo ra đối tượng statement
			String sql = "INSERT INTO room(idRoom, roomName, roomAmount, roomType, roomPrice, roomStatus, roomDescription)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, room.getRoomID());
			statement.setString(2, room.getRoomName());
			statement.setInt(3, room.getRoomAmount());
			statement.setString(4, room.getRoomType());
			statement.setDouble(5, room.getRoomPrice());
			statement.setString(6, room.getRoomStatus());
			statement.setString(7, room.getRoomDescription());
			//Thực thi câu lệnh sql
			result = statement.executeUpdate();
			//Xử lí kết quả:
			System.out.println("Có " + result + " dòng bị thay đổi!");
			check = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}

	public int insertAll(ArrayList<Room> list) {
		int count = 0;
		for(Room check : list) {
			if(this.insert(check)) {
				count++;
			}
		}
		return count;
	}

	public boolean delete(Room room) {
		return true;
	}

	public int deleteAll(ArrayList<Room> list) {
		int count = 0;
		for(Room check : list) {
			if(this.delete(check)) {
				count++;
			}
		}
		return count;
	}

	public boolean update(Room room) {
		return false;
	}
}
