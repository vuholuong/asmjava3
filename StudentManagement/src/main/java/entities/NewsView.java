package entities;

import java.text.SimpleDateFormat;
import java.util.Date;

public class NewsView {
	private int id;
	private String title;
	private String description;
	private String content;
	private Date createdAt;
	private String user; // Nullable
	private String createdAtString;
	private String authorString;

	public NewsView(int id, String title, String description, String content, Date createdAt, String user) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.content = content;
		this.createdAt = createdAt;
		this.user = user;
		this.setCreatedAtString();
		this.setAuthorString();
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getDescription() {
		return description;
	}

	public String getContent() {
		return content;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public String getUser() {
		return user;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public void setUser(String user) {
		this.user = user;
	}
	
	public void setAuthorString() {
		this.authorString = this.user.split("-ID:")[0];
	}
	
	public void setCreatedAtString() {
		SimpleDateFormat formatter = new SimpleDateFormat("dd 'tháng' MM 'năm' yyyy");
		this.createdAtString = formatter.format(this.createdAt);
	}

	public String getCreatedAtString() {
		return this.createdAtString;
	}
	
	public String getAuthorString() {
		return this.authorString;
	}

}
