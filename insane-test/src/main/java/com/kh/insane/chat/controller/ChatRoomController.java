package com.kh.insane.chat.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.time.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.insane.chat.model.exception.ChatException;
import com.kh.insane.chat.model.service.ChatRoomService;
import com.kh.insane.chat.model.vo.ChatRoomVo;
import com.kh.insane.chat.model.vo.ChatUser;
import com.kh.insane.employee.model.vo.Employee;

@Controller
public class ChatRoomController {
	
	//private ArrayList<ChatRoomVo> roomList;
	
	@Autowired
	ChatRoomService chrs;
	
//	@RequestMapping("create.ch")
//	public String createRoom(HttpServletRequest request) {
//		/*if(roomList == null) {
//			roomList = new ArrayList<ChatRoomVo>();
//		}*/
//		
//		String roomName = request.getParameter("roomName");
//		int seq = Integer.parseInt(request.getParameter("num"));
//		
//		ChatRoomVo newRoom = new ChatRoomVo();
//		newRoom.setChatRoomName(roomName);
//		newRoom.setChatSeq(seq);
//		
//		Room.getRooms().add(newRoom);
//		
//		request.setAttribute("list", Room.getRooms());
//		return "chat/chatRoomList";
//	}
	
	@RequestMapping("createRoom.ch")
	public String createMove() {
		return "chat/chatRoomCreate";
	}
	
	@RequestMapping("insertRoom.ch")
	public String insertRoom(HttpServletRequest request) {
		String roomName = request.getParameter("roomName");
		String password = request.getParameter("password");
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		//private String password; //비밀번호는 생성시에만.
		
		ChatRoomVo newRoom = new ChatRoomVo();
		newRoom.setChatRoomName(roomName);
		newRoom.setMakeUserSeq(emp.getEmpNoSeq());
		if(password != null && password.length() > 0) {
			newRoom.setPassword(password);
		}
		newRoom.setCompanyNo(emp.getCompanyNo());
		
		try {
			chrs.insertRoom(newRoom);
			
			int roomSeq = chrs.selectLastRoomSeq();
			ChatRoomVo crv = chrs.selectOneRoom(roomSeq);
			if(roomSeq <= 0) {
				Room.getRooms().add(newRoom);
				//request.setAttribute("list", Room.getRooms());
			}
			
			return "redirect:selectOne.ch?num=" + roomSeq + "&userNum=" + emp.getEmpNoSeq();
		} catch (ChatException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			
			return "redirect:selectList.ch";
		}
		
		//return "redirect:selectList.ch";
		//return "redirect:selectOne.ch?num=" + roomSeq + "&userNum=" + userSeq;
	}
		
	@RequestMapping("selectList.ch")
	public String selectList(HttpServletRequest request) {
		Init();
		
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		ArrayList<ChatRoomVo> list = chrs.selectCompanyChatList(emp.getCompanyNo());
		
		if(list != null && list.size() > 0) {
			request.setAttribute("list", list);
		}
		
		request.setAttribute("user", emp);
		
		return "chat/chatRoomList";
	}
	
//	@RequestMapping("insertUser.ch")
//	public String insertUser(HttpServletRequest request) {
//		int roomSeq = Integer.parseInt(request.getParameter("roomSeq"));
//		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
//		return "chat/chatRoom";
//	}
	@RequestMapping("inputPwd.ch")
	public String inputPwd(HttpServletRequest request) {
		int roomSeq = Integer.parseInt(request.getParameter("num"));
		
		ChatRoomVo crv = chrs.selectOneRoom(roomSeq);
		
		request.setAttribute("chatRoom", crv);
		
		return "chat/chatRoomInputPwd";
	}
	
	@RequestMapping("selectOnePwd.ch")
	public String selectOneRoomPwd(HttpServletRequest request) {
		int roomSeq = Integer.parseInt(request.getParameter("num"));
		String roomPwd = request.getParameter("password");
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		ChatUser uv = new ChatUser();
		uv.setRoomSeq(roomSeq);
		uv.setUserSeq(emp.getEmpNoSeq());
		
		ChatUser user = chrs.selectUser(uv);
		
		if(user == null) {
			try {				
				chrs.insertJoinUser(uv);
			} catch (ChatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			user = chrs.selectUser(uv);
		} else if(user.getStatus().equals("N")) {
			try {				
				chrs.updateJoinUser(uv);
			} catch (ChatException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				request.setAttribute("msg", "채팅방 입장 실패");
				return "common/errorPage";
			}
			user = chrs.selectUser(uv);
		}
		user.setUserNo(emp.getEmpNo());
		
		ChatRoomVo temp = new ChatRoomVo();
		temp.setChatSeq(roomSeq);
		temp.setPassword(roomPwd);
		
		ChatRoomVo crv = null;
		
		if(Room.getRooms().size() > 0) {
			for(int i = 0; i < Room.getRooms().size(); i++) {
				if(Room.getRooms().get(i).getChatSeq() == roomSeq) {
					crv = Room.getRooms().get(i);
					break;
				}
			}
		}
		
		if(crv == null) {
			crv = chrs.selectOneRoomPwd(temp);
			Room.getRooms().add(crv);
		}
		
		if(crv.getUserList() == null) {
			crv.InitUserList();
		}
		
		if(!crv.getPassword().equals(roomPwd)) {
			return "redirect:selectList.ch";
		}
		
		int idx = 0;
		if(crv.getUserList() != null && crv.getUserList().size() > 0) {
			for(idx = 0; idx < crv.getUserList().size(); idx++) {
				if(crv.getUserList().get(idx).getUserSeq() == user.getUserSeq()) {
					break;
				}
			}
			
		}
		
		if(idx == crv.getUserList().size()) {
			crv.getUserList().add(user);
		}
		
		request.setAttribute("room", crv);
		request.setAttribute("user", user);
		
		return "chat/chatRoom";
	}
	
	@RequestMapping("selectOne.ch")
	public String selectOneRoom(HttpServletRequest request) {
		int roomSeq = Integer.parseInt(request.getParameter("num"));
		Employee emp = (Employee) request.getSession().getAttribute("loginUser");
		
		ChatUser uv = new ChatUser();
		uv.setRoomSeq(roomSeq);
		uv.setUserSeq(emp.getEmpNoSeq());
		//"yyyy-MM-dd hh:mm:ss"
		//SimpleDateFormat format = new SimpleDateFormat();
		//String timeStr = format.format(new java.util.Date());
		//java.sql.Date date= new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		//java.sql.Date date= new java.sql.Date(new java.util.Date().getTime());
		//uv.setJoinDate(date);
		
		ChatUser user = chrs.selectUser(uv);
		
		if(user == null) {
			
			try {				
				chrs.insertJoinUser(uv);
			} catch (ChatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			user = chrs.selectUser(uv);
		} else if(user.getStatus().equals("N")) {
			
			try {
				
				chrs.updateJoinUser(uv);
			} catch (ChatException e) {
				// TODO Auto-generated catch block
				request.setAttribute("msg", "채팅방 입장 실패");
				return "common/errorPage";
			}
			
			user = chrs.selectUser(uv);
		}
		user.setUserNo(emp.getEmpNo());
		
		ChatRoomVo crv = null;
		
		if(Room.getRooms().size() > 0) {
			for(int i = 0; i < Room.getRooms().size(); i++) {
				if(Room.getRooms().get(i).getChatSeq() == roomSeq) {
					crv = Room.getRooms().get(i);
					break;
				}
			}
		}
		
		if(crv == null) {
			crv = chrs.selectOneRoom(roomSeq);
			Room.getRooms().add(crv);
		}
		
		if(crv.getUserList() == null) {
			crv.InitUserList();
		}
		
		int idx = 0;
		if(crv.getUserList() != null && crv.getUserList().size() > 0) {
			for(idx = 0; idx < crv.getUserList().size(); idx++) {
				if(crv.getUserList().get(idx).getUserSeq() == user.getUserSeq()) {
					break;
				}
			}
			
		}
		
		if(idx == crv.getUserList().size()) {
			crv.getUserList().add(user);
		}
		
		request.setAttribute("room", crv);
		request.setAttribute("user", user);
		
		return "chat/chatRoom";
	}
	
	@RequestMapping("updateChatUserOut.ch")
	public String updateChatUser(HttpServletRequest request) {
		int roomSeq = Integer.parseInt(request.getParameter("num"));
		int userSeq = Integer.parseInt(request.getParameter("num2"));
		
		ChatUser uv = new ChatUser();
		uv.setRoomSeq(roomSeq);
		uv.setUserSeq(userSeq);
		
		try {
			chrs.updateChatUserOut(uv);
			int userCount = chrs.selectChatUserCount(uv);
			
			if(userCount <= 0) {
				int result = chrs.updateEmptyRoom(roomSeq);
			}
			
		} catch (ChatException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			request.setAttribute("msg", "연결 오류");
			return "common/errorPage";
		}
		
		return "redirect:selectList.ch";
	}
	
//	@RequestMapping("in.ch")
//	public String inRoom(HttpServletRequest request) {
//		
//		//String roomName = request.getParameter("roomName");
//		//int roomSeq = Integer.parseInt(request.getParameter("roomSeq"));
//		//int userSeq = Integer.parseInt(request.getParameter("userSeq"));
//		int roomSeq = Integer.parseInt(request.getParameter("num"));
//		int userSeq = Integer.parseInt(request.getParameter("userNum"));
//		
//		
//		request.setAttribute("userSeq", userSeq);
//		request.setAttribute("roomSeq", roomSeq);
//		
//		return "chat/chatRoom";
//	}
	
	public void Init() {
		if(Room.getRooms().size() > 0)
			return;
		
		ArrayList<ChatRoomVo> list = chrs.selectAll();
		
		if(list != null && list.size() > 0) {
			for(int i = 0; i < list.size(); i++) {
				Room.getRooms().add(list.get(i));
			}
		}
	}
	
}
