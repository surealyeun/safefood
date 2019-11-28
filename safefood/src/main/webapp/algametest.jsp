<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css" media="all">
</head>
<body class="sky_body">
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
						<li style="opacity: 1.0;"><a href="listBoard.do">자유게시판</a></li>
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
	<div class="container m-t-70">
		<h1 style="margin-left:300px; display: inline-block; color:red">알러지&nbsp </h1>
		<h2 class="form-signin-heading" style="display: inline-block; color:black"> 유발 음식을 골라&nbsp </h2>
		<h1 class="form-signin-heading" style="display: inline-block; color:blue"> 몸을</h1>
		<h1 class="form-signin-heading" style="display: inline-block; color:blue"> 보호</h1>
		<h2 class="form-signin-heading" style="display: inline-block; color:black"> 하세요! </h2>
		<div id="al_body">
				<br>
				<div class="myallergy">
				<h3 style="display: inline-block; color:red">${IsLogin }</h3>
				<h3  style="display: inline-block; color:black">님이 가진 알러지</h3></div>
				<div class="myallergy2"><h3>
				<c:forEach items="" var="al"></c:forEach> </h3>
				</div>
			
			<div class="allergy_left col-md-offset-1 col-md-2">
				<h2>1번</h2>
				<button id="1btn" style="background:#fff; border:1px solid #ccc"><img src="" style='width: 120px; height: 120px;'></button>

			</div>
			<div class="allergy_left col-md-offset-1 col-md-2">
				<h2>2번</h2>
				<button id="2btn" style="background:#fff; border:1px solid #ccc"><img src="" style='width: 120px; height: 120px;'></button>

			</div>
			<div class="allergy_left col-md-offset-1 col-md-2">
				<h2>3번</h2>	

			</div>
			
			<div id="msg"></div>
					
			<c:if test="$">
				<h1 class="text-center">알러지를 유발하는 음식이 없어요ㅜ</h1>
			</c:if>
		</div>
	</div>
</body>
<script type="text/javascript">
$("#1btn").on("click", function() {
	console.log("1111");
	$("#msg").html("<h2>틀렸습니다. 다시 생각해보세요</h2>");
});
$("#2btn").on("click", function() {
	$("#msg").html("<h2>틀렸습니다. 다시 생각해보세요</h2>");
});
$("#3btn").on("click", function() {
	$("#msg").html("<h2>정답입니다!</h2>");
});
</script>

</html>