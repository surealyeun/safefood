<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaScript Crossword</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="lib/jScrollPane.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript" src="lib/jquery.min.js"></script>
<script type="text/javascript" src="lib/jquery.em.js"></script>
<script type="text/javascript" src="lib/jquery.mousewheel.js"></script>
<script type="text/javascript" src="lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="lib/jquery.cookie.js"></script>
<script type="text/javascript" src="crossword.js"></script>
<link rel="stylesheet" href="css/main.css" media="all">

<script type="text/javascript">
  let crossw1rd1;
  //let crossw1rd2;
  $(document).ready(function() {
    crossw1rd1 = new Crossw1rd('container1');
    crossw1rd1.init('puzzle');
  });
</script>
</head>

<body class="yellow_body">
	<header id="header">
		<nav class="navbar navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<ul class="navbar-nav">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					     </button>
					     <a class="navbar-brand" href="main.do"><img src="cssimg/safefood_logo.png" width="150px" height="30px"></a>
					</ul>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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
	
	<div class="container m-t-70">
		<h1 class="m-l-450" style="display: inline-block; color:red">가</h1>
        <h1 class="form-signin-heading" style="display: inline-block; color:orange">로</h1>
        <h1 class="form-signin-heading" style="display: inline-block; color:green">세</h1>
        <h1 class="form-signin-heading" style="display: inline-block; color:#0096ff">로</h1>
        <h1 class="form-signin-heading" style="display: inline-block; color:black"> 게</h1>
        <h1 class="form-signin-heading" style="display: inline-block; color:black">임</h1>
		<img src="cssimg/flying_abo.png" style="position : absolute; left:180px; top:550px;">
		<img src="cssimg/flying_pmang.png" style="position : absolute; left:1250px; top:100px;">
		<div id="container1">
			
		</div>
		<br/>
		<div id="container2"></div>
	</div>
</body>
</html>
