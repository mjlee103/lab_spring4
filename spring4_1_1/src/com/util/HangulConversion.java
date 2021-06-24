package com.util;

//한글 변환해 주는 파일 
public class HangulConversion {
	public static String toUTF(String en) {
		if(en == null ) return null;
		try {
			return new String(en.getBytes("8859-1"), "utf-8");
		}
		catch (Exception e) {
			return en;
		}
	}
}
