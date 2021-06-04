package com.util;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

public class HashMapBinder {
	Logger logger = Logger.getLogger(HashMapBinder.class);
	HttpServletRequest request = null;
	public HashMapBinder() {}
	public HashMapBinder(HttpServletRequest request) {
		this.request = request;
	}
	public void bind(Map<String,Object> target) { //객체 주입 받는다. 
		Enumeration en = request.getParameterNames(); //이름을 가져오는 메소드
		//<input type="text" name="mem_id"
		while(en.hasMoreElements()) { //while (true) 주면 무한 루프 
			String key = (String)en.nextElement(); //(String) casting 연산자 -> 강제 형변환
			logger.info("value:"+request.getParameter(key));
			target.put(key,  HangulConversion.toUTF(request.getParameter(key)));
			logger.info("value:"+target);
		}
	}//////// end of bind
}
