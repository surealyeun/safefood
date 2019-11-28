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
<link rel="stylesheet" href="css/main.css" media="all">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>	

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>

</style>

<body>
	<header id="header2">
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
     	 <div class="main_contents" id="main_contents">
         	 <div id="child_banner">
         	 	<c:choose>
					<c:when test="${empty sessionScope.IsLogin }">
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
					</c:when>
					<c:otherwise>
						<div id="div_signin">
							<br><br>
							<div class="logined" style="padding-top:1px;">
								<div class="m-l-40" style="margin-top:7px;">
								<h3 class="form-signin-heading" style="display: inline-block; color:#e0feea">반가워요,</h3>
							    <h3 class="form-signin-heading" style="display: inline-block; color:red;">${user.id }</h3>
							    <h3 class="form-signin-heading" style="display: inline-block; color:#e0feea;">님!</h3><br>
							    <h3 class="form-signin-heading" style="display: inline-block; color:green;">건강한 하루</h3>
							    <h3 class="form-signin-heading" style="display: inline-block; color:#e0feea;">보내세요~!</h3>
							    </div>
						    </div> 
						</div>
					</c:otherwise>
				</c:choose>
		   	</div>
   	   </div>
   	   
   	    <div class="bottom_contents" id="bottom_contents">
	   	    <div id="bottom_buttons">
	   	    	 <div id="link_search">
	   	    	 	<input type="button" class="btn_search" onclick="location.href='search.do'">
	   	    	 </div>
	   	    	 
	   	    	 <div id="link_calendar">
	   	    	 	<input type="button" class="btn_calendar" onclick="location.href='calendar.do'">
	   	    	 </div>
	   	    	 
	   	    	 <div id="link_crosswords">
	   	    	 	<input type="button" class="btn_crosswords" onclick="location.href='crossword.do'">
	   	    	 </div>
	   	    	 
	   	    	 <div id="link_allergy">
	   	    	 	<input type="button" class="btn_allergy" onclick="location.href='algame.do'">
	   	    	 </div>
   	    	 </div>
   	    </div>
  	</div>
</body>

<script>
$(document).one("click",function(){ $('#child_banner').css('background','url("cssimg/child3.png")') });
</script>
</html>