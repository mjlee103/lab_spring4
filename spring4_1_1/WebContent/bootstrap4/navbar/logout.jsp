<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <form class="navbar-form navbar-right" action="/action_page.php">
          <div class="form-group">
            <input type="text" class="form-control" id="usrname" placeholder="아이디">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="psw" placeholder="비밀번호">
          </div>
          <button type="button" class="btn btn-dark" onclick="loginAction()">Login</button>
        </form>