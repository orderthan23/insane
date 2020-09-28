package com.kh.insane.notice.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import static com.kh.insane.common.CustomUtil.Inst;

import com.kh.insane.common.CommonUtils;
import com.kh.insane.common.model.vo.Attachment;
import com.kh.insane.common.model.vo.PageInfo;
import com.kh.insane.employee.model.vo.Employee;
import com.kh.insane.notice.model.exception.NoticeException;
import com.kh.insane.notice.model.service.NoticeService;
import com.kh.insane.notice.model.vo.NoticeVo;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService ns;
	
	//@RequestMapping("/temp.cr")
	//@RequestMapping("/insert.no")
	
	@RequestMapping("move.no")
	public String moveNotice(HttpServletRequest request) {
		//type=공지
		String type = request.getParameter("type");
		//type="소식";
		String path = "notice/";
		if(type.equals("공지")) {
			path += "noticeInsert";
		} else {
			path += "informInsert";
		}
		
		if(type == null || type.length() <= 0) {
			request.setAttribute("msg", "입력 페이지 이동 실패");
			return "common/errorPage";
		}
		
		return path;
		//return null;
	}
	
	@RequestMapping(value="insert.no")
	public String insertNotice(Model model, HttpServletRequest request, MultipartFile uploadFile) {
		
		String boardTitle = request.getParameter("boardTitle");
		String access = request.getParameter("access");
		String boardDetail = request.getParameter("txtHistory");
		String boardType = request.getParameter("type");
		
		Employee emp = (Employee)request.getSession().getAttribute("loginUser");
		
		//request.setAttribute("txt", iii);
		
		//서버를 여러대 두고 하게 되면..
		String root = request.getSession().getServletContext().getRealPath("resources");
				
		//String filePath = root + "\\boardDetails\\test.txt";
		
		//File boardContents = new File(filePath + "test.txt");
		
		//Inst().UpdateFile(filePath, boardDetail);
		
		String originName = null;
		String ext = null;
				
		String changeName = null;
		
		String filePath = null;
		
		NoticeVo nv = new NoticeVo();
		
		File boardContents = null;
		
		String attachFile = null;
		
		if(request.getParameter("attachFile") != null) {
			attachFile = request.getParameter("attachFile");
		}
		
		int boardSeq = 0;
		
		try {			
			NoticeVo temp = new NoticeVo();
			temp.setCompanyNo(emp.getCompanyNo());
			temp.setBoardType(boardType);
			int boardNum = ns.selectListCount(temp) + 1;
			
			nv.setBoardTitle(boardTitle);
			//nv.setBoardContent(boardDetail);
			nv.setBoardContent("-");
			nv.setBoardType(boardType);
			nv.setWriterEmpNo(emp.getEmpNoSeq());
			nv.setCompanyNo(emp.getCompanyNo());
			nv.setBoardNo(boardNum);
			nv.setStatus(access);
			
			int result = ns.insertNotice(nv);
			
			boardSeq = ns.selectCurrentBoardSeq();
			
			//Attach
			Attachment content = new Attachment();
			
			String contentFilePath = root + "\\boardDetails";
			String contentExt = ".txt";
			String fileName = "" + boardSeq;
			String fullPath = contentFilePath + "\\" + fileName + contentExt;
			String saveFilePath = "\\boardDetails";
			
			boardContents = new File(fullPath);
			
			Inst().UpdateFile(fullPath, boardDetail);
			
			content.setBoardSeq(boardSeq);
			content.setChangeName(fileName);
			content.setOriginName(fileName);
			content.setCompanyNo(emp.getCompanyNo());
			
			//content.setFilePath(contentFilePath);
			content.setFilePath(saveFilePath);
			content.setEmpNoSeq(emp.getEmpNoSeq());
			content.setStatus("Y");
			
			ns.insertAttachment(content);
			int length = attachFile.length();
			if(attachFile != null && attachFile.length() > 0) {
				originName = uploadFile.getOriginalFilename();
				ext = originName.substring(originName.lastIndexOf("."));
						
				changeName = CommonUtils.getRandomString() + ext;
				
				filePath = root + "\\attach\\";
				
				uploadFile.transferTo(new File(filePath + changeName));
				
				Attachment attFile = new Attachment();
				attFile.setBoardSeq(boardSeq);
				attFile.setChangeName(changeName);
				attFile.setOriginName(originName);
				attFile.setCompanyNo(emp.getCompanyNo());
				
				String saveAttachFilePath = "\\attach";
				//attFile.setFilePath(filePath);
				attFile.setFilePath(saveAttachFilePath);
				attFile.setEmpNoSeq(emp.getEmpNoSeq());
				attFile.setStatus("Y");
				ns.insertAttachment(attFile);
			}
			
			request.setAttribute("board", nv);
			
			String contents = Inst().readFile(boardContents);
			request.setAttribute("contents", contents);
			
			if(uploadFile != null) {
				File attachmentFile = new File(filePath + "\\" + changeName + ext);
				
				request.setAttribute("attachmentFile", attachmentFile);
			}
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("msg", "게시글 입력 실패");
			return "common/errorPage";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("msg", "게시글 입력 실패");
			return "common/errorPage";
		} catch (NoticeException e) {
			// TODO Auto-generated catch block
			if(uploadFile != null) {
				new File(filePath + "\\" + changeName + ext).delete();			
			}
			if(boardContents != null) {
				boardContents.delete();
			}
			
			request.setAttribute("msg", "게시글 입력 실패");
			return "common/errorPage";
			
			//e.printStackTrace();
		}
				
		//return "notice/eduInsert";
		//return "forward:select.no";
		//return "forward:update.no";
		//return "forward:selectOne.no";
		//return selectOne
		//return "notice/noticeDetail";
		return "redirect:selectOne.no?num=" + boardSeq;
	}
	
	@RequestMapping("selectOne.no")
	public String selectOne(HttpServletRequest request, HttpServletResponse response) {
		//String root = request.getSession().getServletContext().getRealPath("resources");
		
		//String filePath = root + "\\boardDetails\\";
		//test.txt
		
//		File file = new File(filePath);
//		String boardDetail = Inst().readFile(file);
//		
//		request.setAttribute("boardDetail", boardDetail);
		
		//Attachment attch = ns.selectAttach();
		//Attachment attach = new Attachment();//ns.selectAttach();
		//int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		int boardSeq = Integer.parseInt(request.getParameter("num"));
		
		Attachment boardContents = null;			
		String path = "notice/";
		/*String path = "notice/";
		if(boardType.equals("공지")) {
			path += "noticeInsert";
		} else {
			path += "informInsert";
		}
		return path;*/
		String root = request.getSession().getServletContext().getRealPath("resources");
		try {
			
			NoticeVo nv = ns.selectOneNotice(boardSeq);
			
			if(nv.getBoardType().equals("공지")) {
				path += "noticeDetail";
			} else {
				path += "informDetail";
			}
			
			request.setAttribute("notice", nv);
			
			if(nv.getAttachList() != null && nv.getAttachList().size() > 0) {
				boardContents = nv.getAttachList().get(0);
			}
			
			if(boardContents != null) {
				String fullPath = root + boardContents.getFilePath() + "\\" + boardContents.getOriginName() + ".txt";
				String contents = Inst().readFile(new File(fullPath));
				request.setAttribute("contents", contents);
			}

			if(nv.getAttachList() != null && nv.getAttachList().size() > 1) {
				Attachment att = nv.getAttachList().get(1);
				String fullPath = root + att.getFilePath() + "\\" + att.getChangeName();
//				request.setAttribute("attachment", fullPath);
//				request.setAttribute("fileName", att.getOriginName());
				request.setAttribute("fullpath", fullPath);
				request.setAttribute("attachment", att);
			}
						
		} catch (NoticeException e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg", "게시글 선택 실패");
			return "common/errorPage";
		}
		
		return path;
	}	
	
	@RequestMapping("download.no")
	public ModelAndView downLoad(HttpServletRequest request, HttpServletResponse response) {
		int attachSeq = Integer.parseInt(request.getParameter("num"));
		
		Attachment attach = ns.selectOneAttachment(attachSeq);
		String root = request.getSession().getServletContext().getRealPath("resources");
		String fullpath = root + attach.getFilePath() + "\\" + attach.getChangeName();		
		
		
		File downloadFile = new File(fullpath);
		
		return new ModelAndView("download", "downloadFile", downloadFile);
	}
	
	@RequestMapping("select.no")
	public String select(HttpServletRequest request, HttpServletResponse response) {
		
//		String boardTitle = request.getParameter("boardTitle");
//		String access = request.getParameter("access");
//		
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		
//		String filePath = root + "\\boardDetails\\test.txt";
//		
//		File file = new File(filePath);
//		String boardDetail = Inst().readFile(file);
//		
//		request.setAttribute("boardDetail", boardDetail);
		int boardSeq = Integer.parseInt(request.getParameter("num"));
		
		Attachment boardContents = null;			
		
		String path = "notice/";
		String root = request.getSession().getServletContext().getRealPath("resources");
		try {
			
				NoticeVo nv = ns.selectOneNotice(boardSeq);
				
				if(nv.getBoardType().equals("공지")) {
					path += "noticeUpdate";
				} else {
					path += "informUpdate";
				}
				
				request.setAttribute("notice", nv);
			
				if(nv.getAttachList() != null && nv.getAttachList().size() > 0) {
					boardContents = nv.getAttachList().get(0);
				}
			
				if(boardContents != null) {
					String fullPath = root + boardContents.getFilePath() + "\\" + boardContents.getOriginName() + ".txt";
					String contents = Inst().readFile(new File(fullPath));
					request.setAttribute("contents", contents);
				}
			//
				if(nv.getAttachList() != null && nv.getAttachList().size() > 1) {
					Attachment att = nv.getAttachList().get(1);
					String fullPath = root + att.getFilePath() + "\\" + att.getChangeName();
//					request.setAttribute("attachment", fullPath);
//					request.setAttribute("fileName", att.getOriginName());
					request.setAttribute("fullpath", fullPath);
					request.setAttribute("attachment", att);
				}				
			} catch (NoticeException e) {
			// TODO Auto-generated catch block
				request.setAttribute("msg", "수정 페이지 이동 실패");
				return "common/errorPage";
			}
		
		
		return path;
		//return "notice/noticeUpdate";
	}
	
	@RequestMapping("update.no")
	public String update(Model model, HttpServletRequest request, MultipartFile uploadFile) {
		
		String boardTitle = request.getParameter("boardTitle");
		String access = request.getParameter("access");
		String boardDetail = request.getParameter("txtHistory");
		String boardType = request.getParameter("type");
		String boardStatus = request.getParameter("access");
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		
		//서버를 여러대 두고 하게 되면..
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String originName = null;
		String ext = null;
				
		String changeName = null;
		
		String filePath = null;
		
		NoticeVo nv = new NoticeVo();
		
		File boardContents = null;
		String attachFile = null;
		if(request.getParameter("attachFile") != null) {
			attachFile = request.getParameter("attachFile");
		}
		
		try {			
			
			nv.setBoardSeq(boardSeq);
			nv.setBoardTitle(boardTitle);
			//nv.setBoardContent(boardDetail);
			nv.setBoardContent("-");
			nv.setBoardType(boardType);
			nv.setStatus(access);
			
			//int result = ns.insertNotice(nv);
			int result = ns.updateNotice(nv);
			
			//Attach
			Attachment content = new Attachment();
			
			String contentFilePath = root + "\\boardDetails";
			String contentExt = ".txt";
			String fileName = "" + boardSeq;
			String fullPath = contentFilePath + "\\" + fileName + contentExt;
			
			boardContents = new File(fullPath);
			
			Inst().UpdateFile(fullPath, boardDetail);
			
			//content.setBoardSeq(boardSeq);
			//content.setStatus("Y");
			
			//ns.updateAttachment(content);
			
			if(attachFile != null && attachFile.length() > 0) {
				//NoticeVo noticeFind = ns.selectOneNotice(boardSeq);
				nv = ns.selectOneNotice(boardSeq);
				int attachSeq = 0;
				if(nv.getAttachList() != null && nv.getAttachList().size() > 1) {
					Attachment att = nv.getAttachList().get(1);
					//String fullPath = att.getFilePath() + "\\" + att.getChangeName();
					attachSeq = att.getAttachSeq();
					
					originName = uploadFile.getOriginalFilename();
					if(originName.length() > 0) {
						ext = originName.substring(originName.lastIndexOf("."));
						
						changeName = CommonUtils.getRandomString() + ext;
						
						filePath = root + "\\attach";
						
						uploadFile.transferTo(new File(filePath + "\\" + changeName));
						
						Attachment attFile = new Attachment();
						//attFile.setBoardSeq(boardSeq);
						attFile.setAttachSeq(attachSeq);
						attFile.setChangeName(changeName);
						attFile.setOriginName(originName);
						
						String saveAttachFilePath = "\\attach";
						//attFile.setFilePath(filePath);
						attFile.setFilePath(saveAttachFilePath);
						attFile.setStatus("Y");
						ns.updateAttachment(attFile);
					}
				} else {
					originName = uploadFile.getOriginalFilename();
					ext = originName.substring(originName.lastIndexOf("."));
							
					changeName = CommonUtils.getRandomString() + ext;
					
					filePath = root + "\\attach\\";
					
					uploadFile.transferTo(new File(filePath + changeName));
					
					Attachment attFile = new Attachment();
					attFile.setBoardSeq(boardSeq);
					attFile.setChangeName(changeName);
					attFile.setOriginName(originName);
					attFile.setCompanyNo(nv.getCompanyNo());
					String saveAttachFilePath = "\\attach";
					//attFile.setFilePath(filePath);
					attFile.setFilePath(saveAttachFilePath);
					attFile.setEmpNoSeq(nv.getWriterEmpNo());
					attFile.setStatus("Y");
					ns.insertAttachment(attFile);
				}
			}
			
			request.setAttribute("board", nv);
			
			String contents = Inst().readFile(boardContents);
			request.setAttribute("contents", contents);
			
			if(uploadFile != null) {
				File attachmentFile = new File(filePath + "\\" + changeName + ext);
				
				request.setAttribute("attachmentFile", attachmentFile);
			}
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg", "게시글 수정 실패");
			return "common/errorPage";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg", "게시글 수정 실패");
			return "common/errorPage";
		} catch (NoticeException e) {
			// TODO Auto-generated catch block
			if(uploadFile != null) {
				new File(filePath + "\\" + changeName + ext).delete();			
			}
//			if(boardContents != null) {
//				boardContents.delete();
//			}
			request.setAttribute("msg", "게시글 수정 실패");
			return "common/errorPage";
			
		}
		
		return "redirect:selectOne.no?num=" + boardSeq;
	}
	
	@RequestMapping("selectList.no")
	public String selectList(HttpServletRequest request, MultipartFile photo) {
		String type = request.getParameter("type");
		Employee emp = (Employee)request.getSession().getAttribute("loginUser");
		
		///임시로 만든 타입
		//type="공지";
		String path = "notice/";

        if(type.equals("공지")) {
            path += "noticeList";
        } else {
            path += "informList";
        }
		
		NoticeVo nv = new NoticeVo();
		nv.setBoardType(type);
		nv.setCompanyNo(emp.getCompanyNo());
		
		int currentPage = 1;
		int limits = 15;
		
		if(request.getParameter("currentPage") != null) {	
			String str = request.getParameter("currentPage");
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = 0;
		
		listCount = ns.selectListCount(nv);
		
		int totalCount = listCount;
		int btnCount = 10;
		
		PageInfo pi = Inst().getPageInfo(limits, currentPage, totalCount, btnCount);
		
		ArrayList<NoticeVo> list = ns.selectList(nv, pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		//return "notice/noticeList";
		return path;
	}
	
	@RequestMapping("deleteList.no")
	public String deleteList(HttpServletRequest request, HttpServletResponse response) {
		
		String[] list = request.getParameterValues("selected");
		String type = request.getParameter("type");
		String path = "forward:selectList.no?type=" + type;
		if(list.length > 0) {
			int[] seqList = new int[list.length];
			
			for(int i = 0; i < list.length; i++) {
				seqList[i] = Integer.parseInt(list[i]);
			}
			
			try {
				int result = ns.deleteList(seqList);
			} catch (NoticeException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
				request.setAttribute("msg", "게시글 삭제 실패");
				return "common/errorPage";
			}
		}
		
		return path;
	}
	
	@RequestMapping("delete.no")
	public String deleteOne(HttpServletRequest request, HttpServletResponse response) {
		
		String boardSeq = request.getParameter("num");
		String type = request.getParameter("type");
		String path = "forward:selectList.no?type=" + type;
		try {
			int result = ns.deleteOne(boardSeq);
		} catch (NoticeException e) {
			// TODO Auto-generated catch block
			request.setAttribute("msg", "게시글 삭제 실패");
			return "common/errorPage";
			//e.printStackTrace();
		}
		
		return path;
	}
	
}
