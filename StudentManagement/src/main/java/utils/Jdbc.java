package utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Jdbc {
	static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static String dburl = "jdbc:sqlserver://localhost;database=StudentManagement;trustServerCertificate=true";
	static String username = "sa";
	static String password = "123456";
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(dburl, username, password);
	}

	public static int executeUpdate(String sql, Object... values) throws SQLException {
		Connection connection = getConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		for (int i = 0; i < values.length; i++) {
			statement.setObject(i + 1, values[i]);
		}
		return statement.executeUpdate();
	}

	public static ResultSet executeQuery(String sql, Object... values) throws SQLException {
		Connection connection = getConnection();
		PreparedStatement statement = connection.prepareStatement(sql);
		for (int i = 0; i < values.length; i++) {
			statement.setObject(i + 1, values[i]);
		}
		return statement.executeQuery();
	}
}
