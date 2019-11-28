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
	
	<div id="container"> 
     	 <div id="main_contents">
         	 <div id="child_banner">
         	 	<div id="div_signin">
			      <form class="form-signin" method="post" action="login.do">
			      <h3>${LoginError}</h3>
			      <div class="login_font">
			        <h2 class="form-signin-heading" style="display: inline-block; color:red">로</h2>
			        <h2 class="form-signin-heading" style="display: inline-block; color:orange">그</h2>
			        <h2 class="form-signin-heading" style="display: inline-block; color:green">인</h2>
			        <h2 class="form-signin-heading" style="display: inline-block; color:#0096ff">하</h2>
			        <h2 class="form-signin-heading" style="display: inline-block; color:purple">기</h2>
			        </div>
			        
			        <c:if test="${not empty requestScope.LoginError }">
			        	<b>${requestScope.LoginError }</b>
			        </c:if>
			        
				       	<label for="id" class="sr-only">아이디</label>
				        <input type="text" id="id" name="id" class="form-control" placeholder="아이디" style="margin-right:5px;margin-bottom:3px;float:left;width:150px;" required="required">
				        <label for="password" class="sr-only">비밀번호</label>
				        <input type="password" id="password" name="password" class="form-control" style="margin-right:5px;float:left;width:150px;" placeholder="비밀번호" required="required">
					<input class="btn btn-lg btn-primary btn-block" type="submit" style="padding:5px;left;font-size:15px;width:50px; height:70px;" value="로그인">
			        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="remember-me"> 내 정보 저장하기
			          </label>
			        </div>
			        <p id="find"><a href="find.jsp">아이디 / 비밀번호 찾기</a></p>
			      </form>
				</div>
		   	</div>
   	   </div>
 	</div>
 
<!-- 	
	<div id="div_signin">
      <form class="form-signin" method="post" action="login.do">
      <h3>${LoginError}</h3>
      <div class="login_font">
        <h2 class="form-signin-heading" style="display: inline-block; color:red">로</h2>
        <h2 class="form-signin-heading" style="display: inline-block; color:orange">그</h2>
        <h2 class="form-signin-heading" style="display: inline-block; color:green">인</h2>
        <h2 class="form-signin-heading" style="display: inline-block; color:#0096ff">하</h2>
        <h2 class="form-signin-heading" style="display: inline-block; color:purple">기</h2>
        </div>
        
        <c:if test="${not empty requestScope.LoginError }">
        	<b>${requestScope.LoginError }</b>
        </c:if>
        <div>
	       	<label for="id" class="sr-only">아이디</label>
	        <input type="text" id="id" name="id" class="form-control" placeholder="아이디" style="margin-right:5px;margin-bottom:3px;float:left;width:150px;" required="required">
	        </div>
	        <label for="password" class="sr-only">비밀번호</label>
	        <input type="password" id="password" name="password" class="form-control" style="margin-right:5px;float:left;width:150px;" placeholder="비밀번호" required="required">
		<input class="btn btn-lg btn-primary btn-block" type="submit" style="padding:5px;left;font-size:15px;width:50px; height:70px;" value="로그인">
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 내 정보 저장하기
          </label>
        </div>
        <p id="find"><a href="find.jsp">아이디 / 비밀번호 찾기</a></p>
      </form>
	</div>
	
	 -->
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
					<li><a href="information.jsp">상품 정보</a></li>
					<li><a href="notice.jsp">공지사항</a></li>
					<c:choose>
						<c:when test="${empty sessionScope.IsLogin }">
							<li class="active"><a href="login.jsp">로그인<span class="sr-only">(current)</span></a></li>
							<li><a href="signup.jsp">회원가입</a></li>
						</c:when>
						
						<c:otherwise>
							<li><a href="logout.do">로그아웃</a></li>
							<li><a href="update.jsp">정보수정</a>
						</c:otherwise>
					</c:choose> 
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container" id="loginScreen">

      <form class="form-signin" method="post" action="login.do">
      <h3>${LoginError}</h3>
        <h2 class="form-signin-heading"> Sign In</h2>
        
        <c:if test="${not empty requestScope.LoginError }">
        	<b>${requestScope.LoginError }</b>
        </c:if>
        
       	<label for="id" class="sr-only">아이디</label>
        <input type="text" id="id" name="id" class="form-control" placeholder="아이디" required="required">
        <label for="password" class="sr-only">비밀번호</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호" required="required">
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 내 정보 저장하기
          </label>
        </div>
        <p id="find"><a href="find.jsp">아이디 / 비밀번호 찾기</a></p>
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="로그인">
      </form>

    </div>

 -->