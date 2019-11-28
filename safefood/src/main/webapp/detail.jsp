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
<link rel="stylesheet" href="css/main.css" media="all">

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
	
	<div class="container m-t-70">
		<h2 class="text-center">내가 검색한 음식은...</h2>
		
		<div class="row m-t-20">
			<div class="col-md-6 detail_img">
				<div class="panel col-md-12">
					<div class="panel-body col-md-8">
						<img src="${food.img }" alt="${food.name }" class="img-thumbnail" id="detail_image" width="400px">
						<input type="hidden" value="${food.code }" id="foodcode" value="foodcode">
					</div>
					<div class="panel-body col-md-4">
						<br><br>
						<h5>얼마나 먹었니?</h5>
						<input type="number" name="number" id="number" min="0" value="${sessionScope.quantity }" style="width:100px; border:solid 1px #ccc; border-radius: 5px;">
						<br><br>
						<form method="post" action="??.do">
								<!-- <input type="hidden" name="action" value="search"> -->
							<div id="" class="">
								<label for="join_year" class="sr-only">&nbsp년</label>
									<select id="join_year" class="select_year" style="float:left">
										<option value="2019">2019</option>
										<option value="2018">2018</option>
										<option value="2017">2017</option>
										<option value="2016">2016</option>
										<option value="2015">2015</option>
										<option value="2014">2014</option></select>
									<h5 style="float:left;">&nbsp년</h5><br><br>

									<label for="join_month" class="sr-only">월</label>
									<select id="join_month" class="select_month" style="float:left">
									<option value="12">12</option>
										<option value="11">11</option>
										<option value="10">10</option>
										<option value="9">9</option>
										<option value="8">8</option>
										<option value="7">7</option>
										<option value="6">6</option>
										<option value="5">5</option>
										<option value="4">4</option>
										<option value="3">3</option>
										<option value="2">2</option>
										<option value="1">1</option></select>
										<h5 style="float:left;">&nbsp월&nbsp&nbsp</h5>
										
									<label for="join_day"  class="sr-only">일</label>
									<select id="join_day" class="select_day" style="float:left;overflow:auto;">
										<option value="11">31</option>
										<option value="30">30</option>
										<option value="29">29</option>
										<option value="28">28</option>
										<option value="27">27</option>
										<option value="26">26</option>
										<option value="25">25</option>
										<option value="24">24</option>
										<option value="23">23</option>
										<option value="22">22</option>
										<option value="21">21</option>
										<option value="20">20</option>
										<option value="19">19</option>
										<option value="18">18</option>
										<option value="17">17</option>
										<option value="16">16</option>
										<option value="15">15</option>
										<option value="14">14</option>
										<option value="13">13</option>
										<option value="12">12</option>
										<option value="11">11</option>
										<option value="10">10</option>
										<option value="9">9</option>
										<option value="8">8</option>
										<option value="7">7</option>
										<option value="6">6</option>
										<option value="5">5</option>
										<option value="4">4</option>
										<option value="3">3</option>
										<option value="2">2</option>
										<option value="1">1</option>
									</select>
									<h5 style="float:left">&nbsp일</h5><br><br>
									
									<label for="join_time" style="float:left">시간&nbsp&nbsp</label>
									<select id="join_time" class="select_time" style="float:left">
										<option value="아침">아침</option>
										<option value="점심">점심</option>
										<option value="간식">간식</option>
										<option value="저녁">저녁</option></select>

							</div>
							</form>
							<br><br>
						<c:remove var="quantity" scope="session"/>						
						<p id="quantityresult"></p>
						<input type="button" id="addbtn" value="먹기!">
					</div>
				</div>
			</div>
			
			<div class="col-md-6 m-l-m10">
				<div class="panel panel-danger">
					<div class="panel-heading heading">
						<h3 class="text-center">제품 정보</h3>
					</div>
					<div class="panel-body table-responsive">
						<table class="table table-condensed">
							<tr>
								<td class="text-center">제품명</td>
								<td class="text-center">제조사</td>
								<td class="text-center">알레르기 성분</td>
							</tr>
							<tr>
								<td id="name" class="text-center">${food.name }</td>
								<td id="maker" class="text-center">${food.maker }</td>
								<td id="allergy" class="text-center">${food.allergy }</td>	
							</tr>
						</table>
						<br>
						<br>
						<table class="table table-condensed">
							<tr>
								<td class="text-center">재료정보</td>
							</tr>
							<tr>
								<td id="material">${food.material }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			
		</div>
	</div>		
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				 <div id="series_chart_div" style="height: 410px;"></div>
			</div>
			<div class="col-md-6 m-l-m10">
			<div class="panel panel-danger">
				<div class="panel-heading heading">
							<h3 class="text-center">영양 정보</h3>
				</div>
				<div class="panel-body table-responsive">
					<table class="table table-condensed detail_ingred">
						<tr>
							<td>일일 제공량</td>
							<td id="daily">${food.supportpereat }</td>
						</tr>
						<tr>
							<td>칼로리</td>
							<td id="calorie">${food.calory }</td>
						</tr>
						<tr>
							<td>탄수화물</td>
							<td id="carbo">${food.carbo }</td>
						</tr>
						<tr>
							<td>단백질</td>
							<td id="protein">${food.protein }</td>
						</tr>
						<tr>
							<td>지방</td>
							<td id="fat">${food.fat }</td>
						</tr>
						<tr>
							<td>당류</td>
							<td id="sugar">${food.sugar }</td>
						</tr>
						<tr>
							<td>나트륨</td>
							<td id="natrium">${food.natrium }</td>
						</tr>
						<tr>
							<td>콜레스테롤</td>
							<td id="cholesterol">${food.chole }</td>
						</tr>
						<tr>
							<td>포화지방산</td>
							<td id="saturfat">${food.fattyacid }</td>
						</tr>
						<tr>
							<td>트랜스지방</td>
							<td id="transfat">${food.transfat }</td>
						</tr>
					</table>
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