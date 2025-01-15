package daos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import entities.News;
import entities.NewsView;
import utils.Jdbc;

public class NewsViewDAO {
	
	 public NewsView selectById(int id) {
	        String sql = "SELECT id, title, description, content, created_at, author FROM NEWS_VIEW where id = ?";
        	NewsView news = null;
	        try (ResultSet rs = Jdbc.executeQuery(sql, id)) {

	            if (rs.next()) {
	                news = new NewsView(
	                    rs.getInt("id"),
	                    rs.getString("title"),
	                    rs.getString("description"),
	                    rs.getString("content"),
	                    rs.getDate("created_at"),
	                    rs.getString("author")
	                );
	            }
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
	        return news;
	    }
   
    public List<NewsView> selectAll() {
        String sql = "SELECT id, title, description, content, created_at, author FROM NEWS_VIEW";
        List<NewsView> newsList = new ArrayList<>();
        try (ResultSet rs = Jdbc.executeQuery(sql)) {
            while (rs.next()) {
                NewsView news = new NewsView(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getString("content"),
                    rs.getDate("created_at"),
                    rs.getString("author")
                );
                newsList.add(news);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return newsList;
    }

}
