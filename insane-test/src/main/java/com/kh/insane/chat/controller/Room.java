package com.kh.insane.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.insane.chat.model.exception.ChatException;
import com.kh.insane.chat.model.service.ChatHistoryService;
import com.kh.insane.chat.model.service.ChatHistoryServiceImpl;
import com.kh.insane.chat.model.vo.ChatRoomVo;
import com.kh.insane.chat.model.vo.ChatUser;
import com.kh.insane.chat.model.vo.HistoryVo;

@ServerEndpoint("/room/{roomId}/{userSeq}")
public class Room {

	private static List<ChatRoomVo> rooms = Collections.synchronizedList(new ArrayList<ChatRoomVo>());
	
	private ChatRoomVo currentChat = null;
	private ChatUser currentUser = null;
	
	ChatHistoryService chs = new ChatHistoryServiceImpl();
	
	
	public static List<ChatRoomVo> getRooms(){
		return rooms;
	}
	
	public static ChatUser findUser(int roomIdx, int userSeq) {
		
		for(ChatUser user : rooms.get(roomIdx).getUserList()) {
			if(user.getUserSeq() == userSeq) {
				return user;
			}
		}
		
		return null;
	}
	
	@OnOpen
	public void onOpen(Session session, @PathParam("roomId") String roomId, @PathParam("userSeq") String userSeq) {
		int num = Integer.parseInt(roomId);
		int userSeqNo = Integer.parseInt(userSeq);
		
		//ChatUser newUser = new ChatUser();
		//newUser.setUserSeq(userSeqNo);
		//newUser.setUserSession(session);
		
		for(int i = 0; i < rooms.size(); i++) {
			if(rooms.get(i).getChatSeq() == num) {
				currentChat = rooms.get(i);
				break;
			}
		}
		
		for(int i = 0; i < currentChat.getUserList().size(); i++) {
			if(currentChat.getUserList().get(i).getUserSeq() == userSeqNo) {
				currentUser = currentChat.getUserList().get(i);
				break;
			}
		}
		currentUser.setUserSession(session);
		
		//히스토리에서 유저의 입장일보다 이전의 기록을 다 꺼내와야 함.
		//session.getBasicRemote().sendText(msg);
		
//		HistoryVo hv = new HistoryVo();
//		hv.setEmpSeq(currentUser.getUserSeq());
//		int chatRoomSeq = Integer.parseInt(roomId);
//		hv.setChatRoomSeq(chatRoomSeq);
		
		//ArrayList<HistoryVo> historyList = chs.selectChatHistory(hv);
		ArrayList<HistoryVo> historyList = chs.selectChatHistory(currentUser);
		
		if(historyList != null && historyList.size() > 0) {
			
			try {
				for(int i = 0; i < historyList.size(); i++) {
					String msg = historyList.get(i).getEmpName() + ": " + historyList.get(i).getChatMsg();
					currentUser.getUserSession().getBasicRemote().sendText(msg);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//currentUser.getUserSession().getBasicRemote().sendText(text);
		}
		
	}
	
	@OnMessage
	public void onMessage(String msg, Session session, @PathParam("roomId") String roomId, @PathParam("userSeq") String userSeq) throws IOException {
		int num = Integer.parseInt(roomId);
		
		List<ChatUser> users = null;
		//List<ChatUser> clients = rooms.get(num).getUserList();
		if(currentChat != null) {
			users = currentChat.getUserList();
		}
		//ChatUser sendUser = null;
		synchronized (users) {
		for(ChatUser user : users) {
				if(user.getUserSession() != null) {
					user.getUserSession().getBasicRemote().sendText(msg);
				}
		}
					String[] msgDetail = msg.split(":");
					
					if(msgDetail.length > 1) {
						HistoryVo hv = new HistoryVo();
						hv.setEmpSeq(currentUser.getUserSeq());
						int chatRoomSeq = Integer.parseInt(roomId);
						hv.setChatRoomSeq(chatRoomSeq);
						
						hv.setChatMsg(msgDetail[1]);
						hv.setCompanyNo(currentChat.getCompanyNo());
//						java.sql.Date date= new java.sql.Date(new GregorianCalendar().getTimeInMillis());
//						hv.setMsgTime(date);
						
						try {
							chs.insertChatHistory(hv);
						} catch (ChatException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						

						currentUser.setMessage(msg);
					}
		}
		
		
//		synchronized (rooms.get(num).getUserList()) {
//			for(ChatUser user : clients) {
//				user.getUserSession().getBasicRemote().sendText(msg);
//				
//				HistoryVo hv = new HistoryVo();
//				hv.setEmpSeq(user.getUserSeq());
//				int chatRoomSeq = Integer.parseInt(roomId);
//				hv.setChatRoomSeq(chatRoomSeq);
//				hv.setChatMsg(msg);
//
//				user.setMessage(msg);
//			}
//		}
	}
	
	@OnError
	public void onError(Throwable e) {
		e.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session session, @PathParam("roomId") String roomId, @PathParam("userSeq") String userSeq) {
		//int roomIdx = Integer.parseInt(roomId);
		//int seq = Integer.parseInt(userSeq);
		
		//ChatUser outUser = findUser(roomIdx, seq);
		
		//rooms.get(roomIdx).getUserList().remove(outUser);
		currentChat.getUserList().remove(currentUser);
		//clients.remove(session);
	}
}
