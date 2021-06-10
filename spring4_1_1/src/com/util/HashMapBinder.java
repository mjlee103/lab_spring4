package com.util;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

//Enumeration은 순서를 가지고 있는 배열의 종류라고 생각하면 된다.
//Eunumeration의 가장 중요한 개념은 커서라는 것이다.
//커서는 현재의 위치를 가리키고 있는 것인데 최초 0부터 시작한다.
//hasMoreElement()는 커서 바로 앞에 데이터가 들어있는지 ㅊ크한다. 
public class HashMapBinder {
	Logger logger = Logger.getLogger(HashMapBinder.class);
	HttpServletRequest request = null;
//	public HashMapBinder() {}
	public HashMapBinder(HttpServletRequest request) {
		this.request = request;
	}
	public void bind(Map<String,Object> target) { //객체 주입 받는다. 
		//내장 객체 request의 메소드 getparameterNames()는 
		//반환 값이 Enumeration유형으로 요청 페이지의 모든 인자 이름이 저장된 목록을 반환한다
		Enumeration en = request.getParameterNames(); //이름을 가져오는 메소드
		//<input type="text" name="mem_id"
		while(en.hasMoreElements()) { //while (true) 주면 무한 루프 
			//nextElement()는 현재 커서가 가리키고 있는 데이타-객체(Object)-를 리턴해주고 
			//커서의 위치를 다음 칸으로 옮긴다.
			String key = (String)en.nextElement(); //(String) casting 연산자 -> 강제 형변환
			logger.info("value:"+request.getParameter(key));
			target.put(key,  HangulConversion.toUTF(request.getParameter(key)));
			logger.info("value:"+target);
		}
	}//////// end of bind
}
