<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(){
		document.f_test.commit();
	}
</script>
</head>
<body>
	<form name="f_test" action="./getBoardList.sp4" method="post" onSubmit="send()">
		<input type="text" name="mem_name">
		<button onClick="sned()">전송</button>
	</form>
</body>
</html>