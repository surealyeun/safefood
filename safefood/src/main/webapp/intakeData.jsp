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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
	.heading {
		height: 50px;
		padding-top: 0.1px;
	}
	
	body {
		padding-top: 70px;
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
							<li><a href="update.jsp">정보수정</a>
						</c:otherwise>
					</c:choose> 
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<h2 class="text-center">내 섭취 정보</h2>
		<hr>
		<br>
		<div class="row">
			<div class="col-md-6">
				 <div id="series_chart_div" style="width: 500px; height: 300px;"></div>
			</div>

			<div class="col-md-6 table-responsive">
				<table class="table table-condensed">
					<tr>
						<td><strong>총 제공량</strong></td>
						<td id="daily">${supportpereat }</td>
					</tr>
					<tr>
						<td><strong>칼로리</strong></td>
						<td id="calorie">${calory }</td>
					</tr>
					<tr>
						<td><strong>탄수화물</strong></td>
						<td id="carbo">${carbo }</td>
					</tr>
					<tr>
						<td><strong>단백질</strong></td>
						<td id="protein">${protein }</td>
					</tr>
					<tr>
						<td><strong>지방</strong></td>
						<td id="fat">${fat }</td>
					</tr>
					<tr>
						<td><strong>당류</strong></td>
						<td id="sugar">${sugar }</td>
					</tr>
					<tr>
						<td><strong>나트륨</strong></td>
						<td id="natrium">${natrium }</td>
					</tr>
					<tr>
						<td><strong>콜레스테롤</strong></td>
						<td id="cholesterol">${chole }</td>
					</tr>
					<tr>
						<td><strong>포화지방산</strong></td>
						<td id="saturfat">${fattyacid }</td>
					</tr>
					<tr>
						<td><strong>트랜스지방</strong></td>
						<td id="transfat">${transfat }</td>
					</tr>
				</table>
			</div>
		</div>
		
		<br>
		<br>

		<div class="row">
			<div class="col-md-2"></div>		
			<div class="col-md-8">
				<div class="panel panel-danger">
					<div class="panel-heading heading">
						<h3 class="text-center">섭취 내역</h3>
					</div>
					<div class="panel-body table-responsive">
						<table class="table table-condensed">
							<tr>
								<td class="text-center"><strong>번호</strong></td>
								<td class="text-center"><strong>제품명</strong></td>
								<td class="text-center"><strong>수량</strong></td>
							</tr>
							<c:forEach items="${foodsCal }" var="food" varStatus="status">
							<tr>
								<td id="name" class="text-center">${status.index+1 }</td>
								<td id="maker" class="text-center">${food.name }</td>
								<td id="allergy" class="text-center">${quantities[status.index]}</td>	
							</tr>
							</c:forEach>
						</table>
						<br>
						<br>
<%-- 						<table class="table table-condensed">
							<tr>
								<td class="text-center"><strong>재료정보</strong></td>
							</tr>
							<tr>
								<td id="material">${food.material }</td>
							</tr>
						</table> --%>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>

<script>
	let nutritions = ["#daily", "#calorie", "#carbo", "#protein", "#fat", "#sugar", "#natrium", "#cholesterol", "#saturfat", "#transfat"];
	let maxnutritions = [0, 2000, 320, 60, 50, 50, 2000, 300, 15, 2]
	for(let a=0; a<nutritions.length; a++) {
		if(a >= 1 && Number($(nutritions[a]).text()) >= Number(maxnutritions[a])/2) {
			$(nutritions[a]).css("color", "red");
		}
	}
	
	$("#addbtn").on("click", function() {
		$.ajax({
			url: "food.do",
			type: "post",
			data: "action=quantity&code="+$("#foodcode").val()+"&number="+$("#number").val(),
			success: function(redData) {
				$("#quantityresult").text("수량이 변경되었습니다.");
			},
			error: function() {
				alert("Error Occur");
			}
		});
	});
</script>

<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawSeriesChart);
	
	function drawSeriesChart() {
		var data = google.visualization.arrayToDataTable([
			['ID', 		'X', 			  'Y', 		 'sort',     				'value'],
		    ['DAI',    1.23,              1.67,      'daily',  			Number($("#daily").text())],
		    ['CAL',    2.46,              2.47,      'calorie',     	Number($("#calorie").text())],
		    ['CAR',    3.68,              3.52,      'carbo',       	Number($("#carbo").text())],
		    ['PRO',    4.24,              1.33,      'protein',     	Number($("#protein").text())],
		    ['FAT',    2.12,              2.62,      'fat',         	Number($("#fat").text())],
		    ['SUG',    5.32,              3.33,      'sugar',       	Number($("#sugar").text())],
		    ['NAT',    1.64,              4.01,      'natrium',     	Number($("#natrium").text())],
		    ['CHO',    3.25,              3.82,      'cholesterol', 	Number($("#cholesterol").text())],
		    ['SAF',    4.44,              2.99,      'saturfat',    	Number($("#saturfat").text())],
		    ['TRF',    5.10,              1.23,      'transfat',   		Number($("#transfat").text())]
		]);
		var options = {
			title: '영양 정보',	
			bubble: {textStyle: {fontSize: 11}}
		};
		
		var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
		chart.draw(data, options);
	}
</script>
</html>
