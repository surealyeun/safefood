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
<link rel="stylesheet" href="css/main.css" media="all">
<style>

</style>

<body class="yellow_body">
	<header id="header">
		<nav class="navbar navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<ul class="navbar-nav">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="main.do"><img
							src="cssimg/safefood_logo.png" width="150px" height="30px"></a>
					</ul>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li style="opacity: 1.0;"><a href="listBoard.do">공지사항</a></li>
						<c:choose>
							<c:when test="${empty sessionScope.IsLogin }">
								<li><a href="login.jsp">로그인</a></li>
								<li><a href="signup.jsp">회원가입</a></li>
							</c:when>

							<c:otherwise>
								<li><a href="logout.do">로그아웃</a></li>
								<li><a href="update.do">정보수정</a>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	
	<div class="container m-t-70 " id="loginScreen">
	<br><br>
      <form class="form-signin text-center finds col-md-offset-2 col-md-8" action="User.do">
      <div style="margin-top:120px">
      	<input type="hidden" name="action" value="find">
        <h2 class="form-signin-heading"> 비밀번호 찾기</h2><br>
         	<p>아이디를 입력하세요</p>
        	 <label for="inputId" class="sr-only">아이디</label>
       		 <input type="text" id="inputId" name="inputId" class="form-control" placeholder="아이디" required="required" style="margin-left:38%">
       		 <br>
        	<p>이메일을 입력하세요</p>
        	<label for="inputEmail" class="sr-only">이메일주소</label>
        	<input type="email" id="inputEmail" name="inputEmail" class="form-control" placeholder="Email" required="required"style="margin-left:38%">
        	<button class=" btn-lg " id="finds_button" type="submit" style="font-size:16px; margin-top:30px; width:100px;"> 찾기</button>        	
    	</div>
     </form>
		<c:if test="${not empty password}" >
	    	<p>비밀번호는 ${password}입니다.</p> <a href="/webfood/login.jsp">로그인하러 가기</a>
	    </c:if>
	    </div>
</body>
</html>