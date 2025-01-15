package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.Course;
import entities.User;
import utils.Jdbc;

public class UserDAO implements DAO<User,Integer>  {

	 public List<User> selectContainsName(String name) {
	        List<User> users = new ArrayList<>();
	        String sql = "SELECT * FROM Users where name like ?";

	        try (ResultSet rs = Jdbc.executeQuery(sql, "%" + name + "%")) {
	            while (rs.next()) {
	                User user = new User();
	                user.setUserId(rs.getInt("user_id"));
	                user.setName(rs.getString("name"));
	                user.setEmail(rs.getString("email"));
	                user.setPassword(rs.getString("password"));
	                user.setRole(rs.getString("role"));
	                users.add(user);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return users;
	    }
	
    @Override
    public List<User> selectAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM Users";

        try (ResultSet rs = Jdbc.executeQuery(sql)) {
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public User selectById(Integer id) {
        User user = null;
        String sql = "SELECT * FROM Users WHERE user_id = ?";

        try (ResultSet rs = Jdbc.executeQuery(sql, id)) {
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public User selectByEmail(String email) {
        User user = null;
        String sql = "SELECT * FROM Users WHERE email = ?";

        try (ResultSet rs = Jdbc.executeQuery(sql, email)) {
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    

    @Override
    public void insert(User record) {
        String sql = "INSERT INTO Users (name, email, password, role) VALUES (?, ?, ?, ?)";
        try {
            Jdbc.executeUpdate(sql, record.getName(), record.getEmail(), record.getPassword(), record.getRole());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Integer id) {
        String sql = "DELETE FROM Users WHERE user_id = ?";
        try {
            Jdbc.executeUpdate(sql, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(User record) {
        String sql = "UPDATE Users SET name = ?, email = ?, password = ?, role = ? WHERE user_id = ?";
        try {
            Jdbc.executeUpdate(sql, record.getName(), record.getEmail(), record.getPassword(), record.getRole(), record.getUserId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void userUpdate(User record) {
    	 String sql = "UPDATE Users SET name = ?, password = ? WHERE user_id = ?";
         try {
             Jdbc.executeUpdate(sql, record.getName(), record.getPassword(), record.getUserId());
         } catch (SQLException e) {
             e.printStackTrace();
         }
    }
    
    public void adminUpdate(User record) {
        String sql = "UPDATE Users SET name = ?, role = ? WHERE user_id = ?";
        try {
            Jdbc.executeUpdate(sql, record.getName(), record.getRole(), record.getUserId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
