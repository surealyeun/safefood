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
	<div class="container al_body">
		<c:if test="${!empty isDanger }">
			<h1 style="margin-left:160px; display: inline-block; color:red">알러지&nbsp </h1>
			<h2 class="form-signin-heading" style="display: inline-block; color:black"> 유발 음식을 골라 </h2>
			<h1 class="form-signin-heading" style="display: inline-block; color:yellow"> 몸을</h1>
			<h1 class="form-signin-heading" style="display: inline-block; color:yellow"> 보호</h1>
			<h2 class="form-signin-heading" style="display: inline-block; color:black"> 하세요! </h2>
			
			<h3 class="myallergy">${IsLogin }님이가진 알러지</h3>
			<c:forEach items="${sessionScope.allergy }" var="al">
		${al } 
		</c:forEach>
		<h2>1번</h2>
		<img src="${safe1.img }" style='width: 150px; height: 150px;'>
			${safe1.name }
			<button id="1btn">1번</button>
		<h2>2번</h2>
		<img src="${safe2.img }" style='width: 150px; height: 150px;'>
			${safe2.name }
			<button id="2btn">2번</button>
		<h2>3번</h2>	
		<img src="${danger.img }" style='width: 150px; height: 150px;'>
			${danger.name }
			<button id="3btn">3번</button>

		<div id="msg"></div>
		</c:if>
		<c:if test="${empty isDanger }">
			<h1 class="text-center">알러지를 유발하는 음식이 없어요ㅜ</h1>
		</c:if>
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