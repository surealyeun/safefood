<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	선택하셔야 될 상품은 : 
	<c:forEach items="${requestScope.temp }" var="food" >
		${food.name } 
	</c:forEach>
	 입니다. <br>
	총 용량: ${requestScope.value }kal
</body>
</html>