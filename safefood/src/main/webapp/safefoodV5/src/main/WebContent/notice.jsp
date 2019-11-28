<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	body {
		padding-top: 70px;
	}
	
	#head {
		color: white;
		background: purple;
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
					<li class="active"><a href="listBoard.jsp">공지사항<span class="sr-only">(current)</span></a></li>
					<li><a href="login.jsp">Login</a></li>  
					<li><a href="signup.jsp">SignUp</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container" class="table-responsive">
		<table class="table table-condensed">
			<thead>
				<tr>
					<td id="head">번호</td>
					<td id="head">제목</td>
					<td id="head">조회수</td>
					<td id="head"></td>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>1</td>
					<td>공지사항</td>
					<td>3</td>
					<td><input type="button" value="조회">
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>