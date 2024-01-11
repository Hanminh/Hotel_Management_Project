package Minh.Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConfig {
	public static Connection getConnection() {
		String dbURL = "jdbc:mysql://localhost:3306/hotelmanagenment?useSSL=false";
		String dbUsername = "root";
		String dbPassword = "Minhhan100919@";
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
