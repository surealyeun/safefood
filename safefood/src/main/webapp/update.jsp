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

<body>
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

	<div class="container" id="container3">
	<div id="main_contents5">
      <form class="form-signup" method="post" action="updateUser">
      	<h3>${message }</h3><br>
      	<!-- <img src="cssimg/signup_img2.png" style="display:inline-block;padding-bottom:14px;" />
     	<h2 class="form-signin-heading" style="display: inline-block; color:red">회</h2>
        <h2 class="form-signin-heading" style="display: inline-block; color:orange">원</h2>
        <h2 class="form-signin-heading" style="display: inline-block; color:green">가</h2>
        <h2 class="form-signin-heading" style="display: inline-block; color:#0096ff">입</h2> -->
        <ul id="signup_list">
        	<li><h3><label>아이디 <input type="text" name="id" placeholder="아이디" class="form-control2" value="${user.id }" readonly="readonly"></label></h3></li>
	        <li><h3><label>비밀번호 </label><input type="password" name="password" class="form-control2" value="${user.password }" placeholder="비밀번호" required="required"></h3></li>
	        <li><h3><label>이름 </label><input type="text" name="name" class="form-control2" value="${user.name }" placeholder="이름" required="required"></h3></li>
	        <li><h3><label>이메일주소 </label><input type="email" name="email" class="form-control2" value="${user.email }" placeholder="이메일주소" required="required"></h3></li>
	        <li><h3><label>전화번호 </label><input type="tel" name="phone" class="form-control2" value="${user.phone }" placeholder="전화번호" required="required"></h3></li>
	        <li><h3><label>주소 </label><input type="text" name="address" class="form-control2" value="${user.address }" placeholder="주소" required="required"></h3></li>
	        <li class="ab"><h3><label for="allergy">알레르기</label></h3>
	        <h4>
		        <fieldset style="position:absolute;left : 740px; top : 610px; padding-right : 520px;">
		        	<div class="checkbox form-group" id="allergy">
		        		<div class="allergy-checkbox-set">
		        		</div>
		        	</div>
	        	</fieldset>
	        	</h4>
        	</li>
        </ul>
        <br><br><br>
              
        <button class="btn_signup" type="submit">정보수정</button>
      </form>
      	<br><br><br>
        
      <form class="form-signin" method="post" action="removeUser">
      	<label for="id" class="sr-only">아이디</label>
        <input type="text" class="input_signup" id="id" name="id" value=${user.id } readonly="readonly" style="background-color:#ccc;">
      	<input class="btn_signup2" id="id" type="submit" value="회원탈퇴">
      </form>
    </div>

    </div>
</body>

<script>
    let allergyArr = ["대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레", "계란흰자"];
    let inputAllergyHtml = "";
    let idx = 0;
    allergyArr.forEach((allergy) => {
        let inputStr = '<label class="checkbox-inline">' +
            '<input type="checkbox" id="allergy-checkbox" name="allergy" value="' + idx + '">' +
            allergy + '</label>';
        inputAllergyHtml += inputStr;
        idx++;
    });
    $(".allergy-checkbox-set").empty().html(inputAllergyHtml);
</script>
</html>