package daos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import entities.Course;
import entities.News;
import utils.Jdbc;

public class NewsDAO implements DAO<News,Integer>  {

    // Insert a new news record
    @Override
    public void insert(News news) {
        String sql = "INSERT INTO news (title, description, content, user_id) VALUES (?, ?, ?, ?)";
        try {
            Jdbc.executeUpdate(sql, news.getTitle(), news.getDescription(), news.getContent(), news.getUserId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Get all news records
    @Override
    public List<News> selectAll() {
        String sql = "SELECT * FROM news";
        List<News> newsList = new ArrayList<>();
        try (ResultSet rs = Jdbc.executeQuery(sql)) {
            while (rs.next()) {
                News news = new News(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getString("content"),
                    rs.getTimestamp("created_at"),
                    rs.getObject("user_id", Integer.class)
                );
                newsList.add(news);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return newsList;
    }

    // Get news by ID
    @Override
    public News selectById(Integer id) {
        String sql = "SELECT * FROM news WHERE id = ?";
        try (ResultSet rs = Jdbc.executeQuery(sql, id)) {
            if (rs.next()) {
                return new News(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getString("content"),
                    rs.getTimestamp("created_at"),
                    rs.getObject("user_id", Integer.class)
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    // Update a news record
    @Override
    public void update(News news) {
        String sql = "UPDATE news SET title = ?, description=?, content = ? WHERE id = ?";
        try {
            Jdbc.executeUpdate(sql, news.getTitle(), news.getDescription(), news.getContent(), news.getId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Delete a news record by ID
    @Override
    public void delete(Integer id) {
        String sql = "DELETE FROM news WHERE id = ?";
        try {
            Jdbc.executeUpdate(sql, id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
