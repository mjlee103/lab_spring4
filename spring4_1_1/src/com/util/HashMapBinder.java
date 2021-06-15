package com.util;

import java.io.File;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HashMapBinder {
	Logger logger = Logger.getLogger(HashMapBinder.class);
	//첨부 파일 처리에 필요한 변수 선언
	//첨부 파일은 반드시 post 방식으로 전송해야 한다. 
	MultipartRequest multi = null;//기존의 request로는 값을 가져오지 못하게 됨.
	String realFolder = "";
	//첨부파일 한글처리
	String encType = "ucf-8";
	//첨부파일 크기 제한
	int maxSize = 5*1024*1024;//5 = 5MB			
	HttpServletRequest request = null;
	public HashMapBinder() {}
	public HashMapBinder(HttpServletRequest request) {
		this.request = request;
	}
	public void multiBind(Map<String,Object> target) {
		target.clear();
		try {
			multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		}
		catch (Exception e) {
			logger.info("Exception : "+e.toString());
		}
		Enumeration en = multi.getParameterNames();
		//<input type="text" name="mem_id"
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			logger.info("value:"+multi.getParameter(key));
			target.put(key, HangulConversion.toUTF(multi.getParameter(key)));
			logger.info("value:"+target);
		}
		//첨부파일에 대한 정보를 받아오기 
		Enumeration<String> files = multi.getFileNames();
		if(files != null) {
			File file = null;//파일명을 객체로 만들어 줄 뿐 내용이 생성되는 것은 아님. 
			while(files.hasMoreElements()) {
				String fname = files.nextElement();
				String filename = multi.getFilesystemName(fname);
				target.put("bs_file", filename);
				if(filename !=null && filename.length()>1) {
					file = new File(realFolder+"\\"+filename);
				}
			}
		}
	}	
	public void bindPost(Map<String,Object> target) {
		//배열 구조체 묶음. 
		Enumeration en = request.getParameterNames();
		//<input type="text" name="mem_id"
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			logger.info("value:"+request.getParameter(key));
			target.put(key, HangulConversion.toUTF(request.getParameter(key)));
			logger.info("value:"+target);
		}
		//<input type="text" name="mem_id"
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			logger.info("value:"+request.getParameter(key));
			target.put(key, HangulConversion.toUTF(request.getParameter(key)));
			logger.info("value:"+target);
		}
	}////////end of bind
	public void bind(Map<String,Object> target) {
		//배열 구조체 묶음. 
		Enumeration en = request.getParameterNames();
		//<input type="text" name="mem_id"
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			logger.info("value:"+request.getParameter(key));
			target.put(key, HangulConversion.toUTF(request.getParameter(key)));
			logger.info("value:"+target);
		}
	}////////end of bind
}
