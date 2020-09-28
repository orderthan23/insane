package com.kh.insane.common.model.view;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.kh.insane.common.model.vo.Attachment;

public class DownloadView extends AbstractView {

	public DownloadView() {
		//setContentType("application/download; utf-8");
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//Attachment attach = null;
		
		//attach = ()model.get("downloadFile");
		
		try {
				BufferedInputStream buf = null;
				
				ServletOutputStream downOut = null;
			
				downOut = response.getOutputStream();
				
				//File downFile = new File(attach.getFilePath() + attach.getChangeName());
				
				File downFile = (File)model.get("downloadFile");
				
				response.setContentType("text/plain; charset=UTF-8");
				
				//response.setHeader("content-Disposition", "attachement; fileName=\"" + new String(attach.getOriginName().getBytes("UTF-8"), "ISO-8859-1") + "\"");
				response.setHeader("content-Disposition", "attach; fileName=\"" + new String(downFile.getName().getBytes("UTF-8"), "ISO-8859-1") + "\"");

				response.setContentLength((int)(downFile.length()));				
				
				FileInputStream fin = new FileInputStream(downFile);
				
				buf = new BufferedInputStream(fin);
				
				int readBytes = 0;
				
				while((readBytes = buf.read()) != -1) {
					downOut.write(readBytes);
				}
				
				downOut.close();
				buf.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
