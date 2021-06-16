<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script>
    function loginModal(){
      $("#myModal").modal();
    }
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
</head>
<body>
    <style>
        .jumbotron {
            background-image: url('../../images/code6.jpeg');
            background-size: cover;
            text-shadow: black 0.2em 0.2em 0.2em;
            color: white;
        }
    </style>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.html">코딩놀이</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index2.jsp">Home</a></li>
      <li><a href="index2.jsp">소개</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="front-note.jsp">Front-End노트<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="lecture.html?lectureName=html5">HTML5</a></li>
          <li><a href="lecture.html?lectureName=css">CSS</a></li>
          <li><a href="lecture.html?lectureName=javascript">JavaScript</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Back-End노트<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Java</a></li>
          <li><a href="#">서블릿</a></li>
          <li><a href="#">JSP</a></li>
          <li><a href="#">Spring</a></li>
          <li><a href="#">안드로이드</a></li>
        </ul>
      </li>
      <form class="navbar-form navbar-left" action="/action_page.php">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search" name="search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
    </ul>
    <div id="login2">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="javascript:loginModal()"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>  
  </div>
</nav>
  
<div class="container">
    <div class="jumbotron">
      <h1 class="text-center">부트스트랩을 소개합니다.</h1>
      <p class="text-center">부트 스트랩을 이용하여 화면을 디자인해 봅시다.
      <p class="text-center"><a class="btn-primary btn-lg" href="lecture.html" role="button">강의 들어 볼까?</a></p>
    </div>
      <!-- =========================== 메인 이미지 다음 사이트 소개=====================-->
      <div class="row">
          <div class="col-sm-4">
              <h4>코딩놀이의 특징</h4>
              <p>코딩놀이는 프로그래밍 언어를 사용하여 자신이 상상하는 것들을 소프트웨어로 만들어 보는 놀이들로 구성되었습니다.</p>
              <p><a class="btn btn-default" data-target="#modal" data-toggle="modal">자세히 알아보기</a></p>
          </div>
           <div class="col-sm-4">
              <h4>코딩놀이의 특징</h4>
              <p>코딩놀이는 프로그래밍 언어를 사용하여 자신이 상상하는 것들을 소프트웨어로 만들어 보는 놀이들로 구성되었습니다.</p>
              <p><a class="btn btn-default" href="instructor.html">자세히 알아보기</a></p>
          </div>
          <div class="col-sm-4">
              <h4>코딩놀이의 특징</h4>
              <p>코딩놀이는 프로그래밍 언어를 사용하여 자신이 상상하는 것들을 소프트웨어로 만들어 보는 놀이들로 구성되었습니다.</p>
              <p><a class="btn btn-default" href="lecture.html">자세히 알아보기</a></p>
          </div>                       
      </div>
      <hr>
      <!-- =========================== 메인 이미지 다음 사이트 소개=====================-->
      <div class="pannel pannel-primary">
          <div class="pannel-heading">
              <h3 class="pannel-title"><span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;최신 강의 목록</h3>
          </div>
          <div class="pannel-body">
              <div class="col-sm-4">
                  <div class="media-left">
                      <a href="lecture.html?lectureName=C"><img src="../../images/c.jpeg" width="50px" height="50px" alt="c언어"></a>
                  </div>
                  <div class="media-body">
                      <h4 class="media-heading"><a href="lecture.html?lectureName=C">C언어 강의</a>&nbsp;<span class="badge">New</span></h4>
                          C언어 프로그래밍 강의
                  </div>
              </div>
               <div class="col-sm-4">
                  <div class="media-left">
                      <a href="lecture.html?lectureName=java"><img src="../../images/java.png" width="50px" height="50px" alt="c언어"></a>
                  </div>
                  <div class="media-body">
                      <h4 class="media-heading"><a href="lecture.html?lectureName=C">JAVA 강의</a>&nbsp;<span class="badge">New</span></h4>
                          JAVA 프로그래밍 강의
                  </div>
              </div>
              <div class="col-sm-4">
                  <div class="media-left">
                      <a href="lecture.html?lectureName=oracle"><img src="../../images/oracle.png" width="50px" height="50px" alt="c언어"></a>
                  </div>
                  <div class="media-body">
                      <h4 class="media-heading"><a href="lecture.html?lectureName=oracle">Oracle 강의</a>&nbsp;<span class="badge">New</span></h4>
                          Oracle 데이터베이스 강의
                  </div>
              </div>      
              <br><br><hr>     
          </div>
      </div>
  </div>
  <footer style="background-color: #000000; color: #ffffff;">
      <div class="container">
          <br>
          <div class="row">
          <!-- 12개 범위에서 맞추어 준다. -->
              <div class="col-sm-2" style="text-align: center;"><h5>Copyright &copy; 2019</h5><h5>김유신</h5></div>
              <div class="col-sm-4"><h4>대표자 소개</h4><p>한국소프트인재개발원에서 자바과정을 담당하고 있습니다.</p></div>
              <div class="col-sm-2"><h4 style="text-align: center;">내비게이션</h4>
                <div class="list-group">
                   <a href="#" class="list-group-item">소개</a>   
                   <a href="#" class="list-group-item">강사진</a>
                   <a href="#" class="list-group-item">강의</a>
                  </div>
              </div>
              <div class="col-sm-2"><h4 style="text-align: center;">SNS</h4>
                  <div class="list-group">
                   <a href="#" class="list-group-item">페이스북</a>   
                   <a href="#" class="list-group-item">유튜브</a>
                   <a href="#" class="list-group-item">네이버 TV</a>
                  </div>
               </div>
                <div class="col-sm-2"><h4 style="text-align: center;"><span class="glyphicon glyphicon-ok" ></span>by &nbsp;김유신</h4></div>
          </div>
      </div>
  </footer>
  <!-- Modal -->
  <div class="row">
    <div class="modal" id="modal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            코딩 놀이의 특징
            <button class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body" style="text-align: center;">
            이 놀이의 특징은 바로 그림으로 코딩을 배우며 강의를 들을 수 있다는 점 입니다.<br>
            다양한 무료 강의가 유튜브와 연동되어 제공됩니다.<br><br>
            <img src="../../images/java_red.png">
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
      
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">로그인</h4>
          </div>
          <div class="modal-body">
              <form role="form">
                    <div class="form-group">
                      <label for="usrname"><span class="glyphicon glyphicon-user"></span> 아이디</label>
                      <input type="text" class="form-control" id="mem_id" placeholder="아이디">
                    </div>
                    <div class="form-group">
                      <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> 비밀번호</label>
                      <input type="text" class="form-control" id="mem_pw" placeholder="비밀번호">
                    </div>
                    <div class="checkbox">
                      <label><input type="checkbox" value="" checked>Remember me</label>
                    </div>
                    <button onclick="loginAction()" class="btn btn-default btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
                  </form>
          </div>
        </div>
      </div>
    </div>
  </div>  
</body>
</html>
