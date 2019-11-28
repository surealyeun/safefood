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
<style>
	body {
		padding-top: 70px;
	}
	
	#searchBox {
		position: absolute;
		left: 40%;
	}
	
	.row {
		top: 200px;
	}
	
	#divtop {
		padding-top: 30px;
	}
	
	#font {
		font-size: 0.85em;
	}
</style>
</head>
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
					<li class="active"><a href="information.jsp">상품 정보<span class="sr-only">(current)</span></a></li>
					<li><a href="notice.jsp">공지사항</a></li>
					<c:choose>
						<c:when test="${empty sessionScope.IsLogin }">
							<li><a href="login.jsp">로그인</a></li>
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
	
	<div class="container">
		<form method="post" action="Food.do">
			<input type="hidden" name="action" value="search">
			<div id="box" class="form-inline">
			<select id="selectname" class="form-control" name="selectname">
				<c:choose>
					<c:when test="${sessionScope.selectname == 'name'}">
						<option value="name" selected>상품명</option>
					</c:when>
					<c:otherwise>
						<option value="name">상품명</option>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${sessionScope.selectname == 'maker'}">
						<option value="maker" selected>제조사</option>
					</c:when>
					<c:otherwise>
						<option value="maker">제조사</option>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${sessionScope.selectname == 'material'}">
						<option value="material" selected>재료</option>
					</c:when>
					<c:otherwise>
						<option value="material">재료</option>
					</c:otherwise>
				</c:choose>
			</select>
			<input type="text" id="searchtext" name="searchtext" value="${sessionScope.searchtext }" class="form-control">
			<input type="submit" value="검색">
			
			<c:choose>
				<c:when test="${sessionScope.nutsort == 'name' }">
					<input type="radio" id="name" value="name" name="nutsort" checked="checked"><label for="name">이름</label>
				</c:when>
				<c:otherwise>
					<input type="radio" id="name" value="name" name="nutsort"><label for="name">이름</label>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${sessionScope.nutsort == 'calory' }">
					<input type="radio" id="calory" value="calory" name="nutsort" checked="checked"><label for="calory">칼로리</label>
				</c:when>
				<c:otherwise>
					<input type="radio" id="calory" value="calory" name="nutsort"><label for="calory">칼로리</label>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${sessionScope.nutsort == 'sugar' }">
					<input type="radio" id="sugar" value="sugar" name="nutsort" checked="checked"><label for="sugar">당류</label>
				</c:when>
				<c:otherwise>
					<input type="radio" id="sugar" value="sugar" name="nutsort"><label for="sugar">당류</label>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${sessionScope.nutsort == 'natrium' }">
					<input type="radio" id="natrium" value="natrium" name="nutsort" checked="checked"><label for="natrium">나트륨</label>
				</c:when>
				<c:otherwise>
					<input type="radio" id="natrium" value="natrium" name="nutsort"><label for="natrium">나트륨</label>
				</c:otherwise>
			</c:choose>
		</div>
		</form>
	
		<div class="row" id="divtop">
			<div class="col-md-6" id="info"></div>
			<div class="col-md-6" id="info2"></div>
		</div>
	</div>
	
	<c:forEach items="${sessionScope.foods }" var="food">
		<form method="post" action="Food.do">
			<div class='well container' style='height:250px'>
				<input type="hidden" name="action" value="detail">
				<input type="hidden" name="name" value="${food.name }">
				<strong>${food.name }</strong>
				<p id='font'>${food.material }</p>
				<p><img src="${food.img }" width="90px" height="90px"></p>
				<input type="submit" value="세부사항">
			</div>
		</form>
	</c:forEach>
</body>
</html>