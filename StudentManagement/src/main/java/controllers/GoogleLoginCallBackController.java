package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.Collections;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpHeaders;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.JsonObjectParser;
import com.google.api.client.json.gson.GsonFactory;
import com.google.gson.JsonObject;

import daos.UserDAO;
import entities.User;

@WebServlet("/callback")
public class GoogleLoginCallBackController extends HttpServlet {
	private static final String CLIENT_ID = "175111022103-d4ns2chvckgrp4d8u5krb6madefknip1.apps.googleusercontent.com"; // Replace
	private static final String CLIENT_SECRET = "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"; // Replace with your Client
	private static final String REDIRECT_URI = "http://localhost:8080/StudentManagement/callback"; // Change accordingly

	private GoogleAuthorizationCodeFlow flow;
	private final JsonFactory jsonFactory = GsonFactory.getDefaultInstance();

	@Override
	public void init() {
		flow = new GoogleAuthorizationCodeFlow.Builder(new NetHttpTransport(), jsonFactory, CLIENT_ID, CLIENT_SECRET,
				Collections.singleton("profile email")).setAccessType("offline").build();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String code = req.getParameter("code");
		GoogleTokenResponse tokenResponse = flow.newTokenRequest(code).setRedirectUri(REDIRECT_URI).execute();

		String accessToken = tokenResponse.getAccessToken();

		HttpRequestFactory requestFactory = new NetHttpTransport().createRequestFactory(
				request -> request.setHeaders(new HttpHeaders().set("Authorization", "Bearer " + accessToken)));

		HttpRequest userInfoRequest = requestFactory
				.buildGetRequest(new GenericUrl("https://www.googleapis.com/oauth2/v3/userinfo"));
		HttpResponse response = userInfoRequest.execute();

		UserDAO dao = new UserDAO();

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> userInfo = mapper.readValue(response.getContent(), Map.class);

		User user = dao.selectByEmail((String) userInfo.get("email"));

		if (user == null) {
			resp.sendRedirect(req.getContextPath()+"/login");
			return;
		}

		req.getSession().setAttribute("user", user);
		
		if (user.isBoss()) {
			resp.sendRedirect("admin/users");
		} else {
			resp.sendRedirect("user/news");
		}
	}

}

class UserInfo {
	private String sub; // User's unique ID
	private String name;
	private String given_name;
	private String family_name;
	private String picture;
	private String email;
	private boolean email_verified;

	// Getters and setters
	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGiven_name() {
		return given_name;
	}

	public void setGiven_name(String given_name) {
		this.given_name = given_name;
	}

	public String getFamily_name() {
		return family_name;
	}

	public void setFamily_name(String family_name) {
		this.family_name = family_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public boolean isEmail_verified() {
		return email_verified;
	}

	public void setEmail_verified(boolean email_verified) {
		this.email_verified = email_verified;
	}
}
