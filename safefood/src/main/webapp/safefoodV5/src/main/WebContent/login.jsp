<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css?family=Do+Hyeon|Lobster&display=swap');
	body {
		padding-top: 70px;
	}
	#loginScreen {
		max-width: 330px;
 		padding: 15px;
  		margin: 0 auto;
  		font-family: 'Do Hyeon', sans-serif;
	}
	h2 {
		font-family: 'Lobster', cursive !important;
	}
	.checkbox {
		float: left;
	}
	#find {
		margin:0px !important;
		float: right;
		position: relative;
		top:10px;
	}
</style>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<ul class="navbar-nav">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				     </button>
				     <a class="navbar-brand" href="Food.do?action=main"><img src="img/cutlery3.png" width="30px" height="30px"></a>
				</ul>
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="information.jsp">상품 정보</a></li>
					<li><a href="notice.jsp">공지사항</a></li>
					<c:choose>
						<c:when test="${empty sessionScope.IsLogin }">
							<li class="active"><a href="login.jsp">로그인<span class="sr-only">(current)</span></a></li>
							<li><a href="signup.jsp">회원가입</a></li>
						</c:when>
						
						<c:otherwise>
							<li><a href="User.do?action=logout">로그아웃</a></li>
							<li><a href="update.jsp">정보수정</a>
						</c:otherwise>
					</c:choose> 
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container" id="loginScreen">

      <form class="form-signin" method="post" action="User.do">
      	<input type="hidden" name="action" value="login">
        <h2 class="form-signin-heading"> Sign In</h2>
        
        <c:if test="${not empty requestScope.LoginError }">
        	<b>${requestScope.LoginError }</b>
        </c:if>
        
       	<label for="inputId" class="sr-only">아이디</label>
        <input type="text" id="inputId" name="inputId" class="form-control" placeholder="아이디" required="required">
        <label for="inputPassword" class="sr-only">비밀번호</label>
        <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="비밀번호" required="required">
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 내 정보 저장하기
          </label>
        </div>
        <p id="find"><a href="find.jsp">아이디 / 비밀번호 찾기</a></p>
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="로그인">
      </form>

    </div>
</body>
</html>