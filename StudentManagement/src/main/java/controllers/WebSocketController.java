package controllers;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class WebSocketController {
	private static Set<Session> connectedSessions = ConcurrentHashMap.newKeySet();
	
    @OnOpen
    public void onOpen(Session session) {
        System.out.println("Connected: " + session.getId());
	    connectedSessions.add(session);

    }

    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("Message from client: " + message);
        try {
            session.getBasicRemote().sendText("Server received: " + message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @OnClose
    public void onClose(Session session) {
    	 connectedSessions.remove(session);
        System.out.println("Disconnected: " + session.getId());
    }
}
