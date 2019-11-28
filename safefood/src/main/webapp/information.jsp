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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css" media="all">
<style>

</style>
</head>
<body>
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
	
	<div class="container" id="bodies">
		<div class="search_bar">
			<form method="post" action="search.do">
				<!-- <input type="hidden" name="action" value="search"> -->
				<div id="box" class="form-inline">
				<select id="selectname" class="form-control3 select_name" name="selectname">
					<c:choose>
						<c:when test="${sessionScope.selectname == 'name'}">
							<option value="name" selected>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp상품명</option>
						</c:when>
						<c:otherwise>
							<option value="name">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp상품명&nbsp</option>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${sessionScope.selectname == 'maker'}">
							<option value="maker" selected>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제조사</option>
						</c:when>
						<c:otherwise>
							<option value="maker">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제조사&nbsp</option>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${sessionScope.selectname == 'material'}">
							<option value="material" selected>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp재료</option>
						</c:when>
						<c:otherwise>
							<option value="material">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp재료&nbsp</option>
						</c:otherwise>
					</c:choose>
				</select>
				<input type="text" id="searchtext" name="searchtext" value="${sessionScope.searchtext }" class="search-control">
				<input type="submit" id="search_button" value="검색">
				
				
			</div>
			</form>
		
			<div class="row" id="divtop">
				<div class="col-md-6" id="info"></div>
				<div class="col-md-6" id="info2"></div>
			</div>
		</div>
	</div>
	<br>
	<div class="m-rl-200">
	<c:forEach items="${sessionScope.foods }" var="food">
		<form method="post" action="detail.do">
			<div class="col-md-6 col-sm-6" style="height:250px">
				<div style="position:relative; margin-bottom:-30px; margin-left:450px; z-index:99;"><img src="cssimg/info_monkey3.png" style='no-repeat !important;'></div>
				<div class='panel m-t-15 draw_panel bs-5-5' style="height:200px; overflow:hidden;border-radius:10px;position:relative; z-index:98;">
					<input type="hidden" name="action" value="detail">
					<input type="hidden" name="name" value="${food.name }">
					<!-- <div class="panel-heading" style='height:40px; align-items: center;'><strong>${food.name }</strong></div> -->
					<div class="panel-body">
						<div class="div_wrap">
							<div class="col-md-4">
								<button type="submit" class="m-l-m15" style="background-color:#fff; border:none; border-right: 1px solid #ccc !important;"><img src="${food.img }" style='no-repeat !important; width:150px; height:150px;'></button>
							</div>
							<div class="col-md-8 m-l-m10">
								<div><strong>${food.name }</strong></div>
								<hr style="background-color:#999; margin-top : 3px">
								<div style="height:100px; overflow:hidden"><span>${food.material }</span></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</c:forEach>
	</div>
</body>
</html>

<!-- 

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
				     <a class="navbar-brand" href="main.do"><img src="img/cutlery3.png" width="30px" height="30px"></a>
				</ul>
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="information.jsp">상품 정보<span class="sr-only">(current)</span></a></li>
					<li><a href="notice.jsp">공지사항</a></li>
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
	-->