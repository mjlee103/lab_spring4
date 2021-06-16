<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<script type="text/javascript">
	    function loginAction(){
	        $.ajax({
	  	      url:'loginAccount.jsp',
	  	      success:function(data){
	  	        alert("11");
	  	        //$("#login").css("display","none");
	  	        //console.log("data:"+data);
	  	          
	  	          $("#login2").html("김유신");
	  	      },
	  	      error:function(e){
	  	    	  $("#login").text(e.responseText);
	  	      }
	        });
	      }   
	</script>
	<div id="login">하나</div>
	<div id="login2">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="javascript:loginModal()"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>  
	<button onclick="loginAction()">로그인</button>
</body>
</html>