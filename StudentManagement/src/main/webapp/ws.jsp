<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>WebSocket Test</title>
</head>
<body>
	<h1>WebSocket Test</h1>
	<button id="sendMessage">Send Message</button>
	<div id="messages"></div>

	<script>
        const ws = new WebSocket("ws://localhost:8080/StudentManagement/websocket");

        ws.onopen = () => {
            console.log("Connected to the server");
        };

        ws.onmessage = (event) => {
            const messagesDiv = document.getElementById("messages");
            messagesDiv.innerHTML += `<p>${event.data}</p>`;
        };

        ws.onclose = () => {
            console.log("Disconnected from the server");
        };

        document.getElementById("sendMessage").onclick = () => {
        	
            const message = "${user.name} says: Hello from client!";
            ws.send(message);
        };
    </script>
</body>
</html>
