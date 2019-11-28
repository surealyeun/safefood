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

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
@import url('https://fonts.googleapis.com/css?family=Parisienne&display=swap');
@import url('https://fonts.googleapis.com/css?family=Hi+Melody&display=swap');
	#best {
        font-family: 'Hi Melody', cursive;
        padding-top: 70px;
    }
    
	#head {
		font-family: 'Parisienne', cursive;
	}
	
	#box {
		position: absolute;
		top: 320px;
		left: 40%;
	}
	
	body {
		padding-top: 70px;
	}
	
	
	.form-control {
		width: auto !important;
	}
	
	#divtop {
		padding-top: 100px;
	}
	
	.divstyle {
		width: 130px;
		height: 130px;
		display: inline-block;
		margin-right: 80px;
	}
	
	.wrap {
		white-space: nowrap;
		overflow-x: auto;
		padding: 10px 10px 5px;
		height: 300px
	}
	
	.formstyle {
		display: inline-block;
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
					<li><a href="listBoard.jsp">공지사항</a></li>
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
	
	<div class="jumbotron">
		<div class="container">
		
		<h1 class="text-center" id = "head">Ssafy's food world</h1>
		<p class="text-center" id = "head">nyam nyam...</p>
		
			<form method="post" action="Food.do">
				<input type="hidden" name="action" value="search">
				<div id="box" class="form-inline">
				<select id="selectname" class="form-control" name="selectname">
					<option value="name">상품명</option>
					<option value="maker">제조사</option>
					<option value="material">재료</option>
				</select>
				<input type="text" id="searchtext" name="searchtext" class="form-control">
				<input type="hidden" name="nutsort" value="name">
				<input type="submit" value="검색">
			</div>
			</form>
		</div>
	</div>
	<div id="best">
		<div class="container">
			<c:choose>
				<c:when test="${empty sessionScope.IsLogin }">
					<h2>당신을 위한 추천상품</h2>
					<div class="wrap">
						<form method="post" action="Food.do" class="formstyle">
							<div class="divstyle">
								<input type="hidden" name="action" value="detail">
								<input type="hidden" name="name" value="신라면큰사발">
								<p><img class="img-responsive" src="img/신라면큰사발.jpg" width="200px" height="200px"></p>
								<h4><strong>신라면 큰사발</strong></h4>
								<input type="submit" value="세부사항">
							</div>
						</form>

						<form method="post" action="Food.do" class="formstyle">
							<div class="divstyle">
								<input type="hidden" name="action" value="detail">
								<input type="hidden" name="name" value="수박바">
								<p><img class="img-responsive" src="img/수박바.jpg" width="200px" height="200px"></p>
								<h4><strong>수박바</strong></h4>
								<input type="submit" value="세부사항">
							</div>
						</form>
	
						<form method="post" action="Food.do" class="formstyle">
							<div class="divstyle">
								<input type="hidden" name="action" value="detail">
								<input type="hidden" name="name" value="서울우유바나나">
								<p><img class="img-responsive" src="img/서울우유바나나.jpg" width="200px" height="200px"></p>
								<h4><strong>서울우유 바나나</strong></h4>
								<input type="submit" value="세부사항">
							</div>
						</form>

						<form method="post" action="Food.do" class="formstyle">
							<div class="divstyle">
								<input type="hidden" name="action" value="detail">
								<input type="hidden" name="name" value="아카페라아메리카노">
								<p><img class="img-responsive" src="img/아카페라아메리카노.jpg" width="200px" height="200px"></p>
				        		<h4><strong>아카페라 아메리카노</strong></h4>
								<input type="submit" value="세부사항">
							</div>
						</form>
					</div>
				</c:when>
				
				<c:otherwise>
					<h2>${sessionScope.IsLogin }님의 선택상품</h2>
					<div class="wrap">
						<c:forEach items="${sessionScope.quantity }" var="food">
							<form method="post" action="Food.do" class="formstyle">
								<div class="divstyle">
									<input type="hidden" name="action" value="detail">
									<input type="hidden" name="name" value="${food.name }">
									<p><img class="img-responsive" src="		${food.img }" width="200px" height="200px"></p>
									<h4><strong>${food.name }</strong></h4>
									<input type="submit" value="세부사항">
								</div>
							</form>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="container">
			원하는 칼로리를 입력하세요 : <input type="text" name="wantcal" id="wantcal">kal &nbsp;&nbsp;
			<input type="button" name="wantbtn" id="wantbtn" value="제출">
			
			<div id="wantres"></div>
			
			<form method="post" action="Food.do" class="formstyle">
				<input type="hidden" name="action" value="intakeData"> 
				<input type="submit" value="섭취 내역">
			</form>
		</div>
		
		<br>
		<br>
		<div class="container">
			<c:forEach items="${sessionScope.quantityList }" var="quantitylist">
				${quantitylist.name }의 총 선택된 갯수는 ${quantitylist.total }입니다.
				<br>
			</c:forEach>
	</div>
</body>

<script>	
	$("#wantbtn").on("click", function() {
		$.ajax({
			url: "Food.do",
			type: "post",
			data: "action=want&wantcal="+$("#wantcal").val(),
			success: function(resData) {
				$("#wantres").html(resData);
			},
			error: function() {
				$("#wantres").html("error");
			}
		});
	});
</script>
<script>
	$(function () {		
          var autocomplete_text = ["신라면큰사발","진라면컵매운맛","큰컵삼양라면","새우탕큰사발","육개장큰사발면","메로나","누크바","비비빅","수박바","죠스바","서울우유바나나","맛있는우유GT","칠성사이다","비타500칼슘","비타파워","칸타타아메리카노","칸타타프리미엄라떼","맥심티오피스위트아메리카노","맥심티오피마스터라떼","아카페라아메리카노"];
        	$("#searchtext").autocomplete({
        		source: autocomplete_text,
        		minLength:1,
        	});
    });
</script>
</html>