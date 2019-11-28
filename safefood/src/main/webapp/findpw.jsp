<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" id="loginScreen">

      <form class="form-signin" method="post" action="findpw.do">
        <h2 class="form-signin-heading"> 비밀번호 찾기</h2>
       	<label for="id" class="sr-only">아이디</label>
        <input type="text" id="id" name="id" class="form-control" placeholder="아이디" required="required">
        <label for="email" class="sr-only">email</label>
        <input type="email" id="email" name="email" class="form-control" placeholder="email" required="required">
        <input type="hidden" id="pw" name="pw">
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="find password">
      </form>

    </div>
</body>
</html>