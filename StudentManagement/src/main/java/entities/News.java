package entities;

import java.util.Date;

public class News {
    private int id;
    private String title;
    private String description;
    private String content;
    private Date createdAt;
    private Integer userId; // Nullable

    public News(int id, String title, String description, String content, Date createdAt, Integer userId) {
        this.id = id;
        this.title = title;
        this.description = description;	
        this.content = content;
        this.createdAt = createdAt;
        this.userId = userId;
    }

    // Getters and Setters
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getDescription() {
		return description;
	}
    public String getContent() { return content; }
    public Date getCreatedAt() { return createdAt; }
    public Integer getUserId() { return userId; }

    public void setId(int id) { this.id = id; }
    public void setTitle(String title) { this.title = title; }
    public void setDescription(String description) {
		this.description = description;
	}
    public void setContent(String content) { this.content = content; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public void setUserId(Integer userId) { this.userId = userId; }
}
