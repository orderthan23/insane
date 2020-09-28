package com.kh.insane.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.kh.insane.chat.model.vo.ChatRoomVo;

@ServerEndpoint("/chat/{userId}/{roomId}")
public class ChatController {
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
	}
	
	@OnMessage
	public void onMessage(String msg, Session session) throws IOException {
		
		synchronized (clients) {
			for(Session client : clients) {
				client.getBasicRemote().sendText(msg);
			}
		}
	}
	
	@OnError
	public void onError(Throwable e) {
		e.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
}
