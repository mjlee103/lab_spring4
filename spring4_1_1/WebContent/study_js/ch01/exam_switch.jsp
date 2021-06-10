<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/commonUIglobal.jsp"%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script type="text/javascript">
  	function test(){
  	  	let site = prompt('네이버, 다음, 구글 중 즐겨 사용하는 포털은?',"");
  	  	let url;
  	  	switch(site){
	  	  	case "구글": url="www.google.com";
	  	  	break;
	  	  	case "네이버": url="www.naver.com";
	  	  	break;
	  	  	case "다음": url="www.daum.net";
	  	  	break;
  	  	}////////////end of switch
  	  	if(url){
  	  		location.href="http://"+url;
  	  	}
  	}
  </script>
</head>
<body>
여기
<script type="text/javascript">test();</script>
<br>
  저기
</body>
</html>