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

<style>
@import url('https://fonts.googleapis.com/css?family=Do+Hyeon|Lobster&display=swap');
	body {
		padding-top: 70px;
	}
	#loginScreen {
		max-width: 330px;
 		padding: 15px;
  		margin: 0 auto;
  		font-family: 'Do Hyeon', sans-serif;
	}
	h2 {
		font-family: 'Lobster', cursive !important;
	}
	.checkbox {
		float: left;
	}
	#find {
		margin:0px !important;
		float: right;
		position: relative;
		top:10px;
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
					<li><a href="information.jsp">상품 정보</a>
					<li><a href="notice.jsp">공지사항</a></li>
					<c:choose>
						<c:when test="${empty sessionScope.IsLogin }">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="signup.jsp">회원가입</a></li>
						</c:when>
						
						<c:otherwise>
							<li><a href="User.do?action=logout">로그아웃</a></li>
							<li class="active"><a href="update.jsp">정보수정<span class="sr-only">(current)</span></a></li>
						</c:otherwise>
					</c:choose> 
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container" id="loginScreen">

      <form class="form-signin" method="post" action="User.do">
      	<input type="hidden" name="action" value="update">
        <h2 class="form-signin-heading"> Sign In</h2>
        
        <c:if test="${not empty requestScope.LoginError }">
        	<b>${requestScope.LoginError }</b>
        </c:if>
        
       	<label for="inputId" class="sr-only">아이디</label>
        <input type="text" id="inputId" name="inputId" class="form-control" value=${user.id } readonly="readonly">
        <label for="inputPassword" class="sr-only">비밀번호</label>
        <input type="password" id="inputPassword" name="inputPassword" class="form-control" value="${user.password }" placeholder="비밀번호" required="required">
        <label for="inputName" class="sr-only">이름</label>
        <input type="text" id="inputName" name="inputName" class="form-control" value="${user.name }" placeholder="이름" required="required">
        <label for="inputEmail" class="sr-only">이메일주소</label>
        <input type="email" id="inputEmail" name="inputEmail" class="form-control" value="${user.email }" placeholder="이메일주소" required="required">
        <label for="inputPhone" class="sr-only">전화번호</label>
        <input type="tel" id="inputPhone" name="inputPhone" class="form-control" value="${user.phone }" placeholder="전화번호" required="required">
        <label for="inputAddress" class="sr-only">주소</label>
        <input type="text" id="inputAddress" name="inputAddress" class="form-control" value="${user.address }" placeholder="주소" required="required">
        <input type="hidden" id="inputAllergy" name="inputAllergy" value="${user.allergy }">
        <fieldset>
        	<label for="allergy" class="col-sm-2 control-label">알레르기</label>
        	<div class="checkbox form-group" id="allergy">
        		<div class="col-sm-6 allergy-checkbox-set">
        		</div>
        	</div>
        </fieldset>
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="업데이트">
      </form>
      
      <form class="form-signin" method="post" action="User.do">
      	<input type="hidden" name="action" value="remove">
      	<input class="btn btn-lg btn-primary btn-block" type="submit" value="회원탈퇴">
      </form>
    </div>
</body>

<script>
    let allergyArr = ["대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레", "계란흰자"];
    let inputAllergyHtml = "";
    let idx = 0;
    allergyArr.forEach((allergy) => {
        let inputStr = '<label class="checkbox-inline">' +
            '<input type="checkbox" id="allergy-checkbox" name="inputAllergys" value="' + idx + '">' +
            allergy + '</label>';
        inputAllergyHtml += inputStr;
        idx++;
    });
    $(".allergy-checkbox-set").empty().html(inputAllergyHtml);
</script>
</html>