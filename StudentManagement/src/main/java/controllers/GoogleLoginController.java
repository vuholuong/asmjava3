package controllers;

import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;

@WebServlet("/google-login")
public class GoogleLoginController extends HttpServlet {
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
		String redirectUrl = flow.newAuthorizationUrl().setRedirectUri(REDIRECT_URI).build();
		resp.sendRedirect(redirectUrl);
	}

}
