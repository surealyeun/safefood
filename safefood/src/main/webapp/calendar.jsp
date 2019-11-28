<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="css/main.css" media="all">
<link rel="stylesheet" href="resources/calendarorganizer.css">

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
		<h2 class="text-center">식사 달력</h2><br>
		<div class="col-md-4">
			<div class="calendar">
				<div id="calendarContainer"></div>
			</div>
		</div>
		
		<div class="col-md-8">
			<div class="intakeData">
					<div class="row">
						<div class="col-md-8 chart_class" style="margin-left : 60px; margin-right:-80px;">
							 <div id="series_chart_div" style="width: 400px; height: 300px;"></div>
						</div>
			
						<div class="col-md-4 table-responsive">
							<table class="table table-condensed">
								<tr>
									<td>총 제공량</td>
									<td id="daily">${supportpereat }</td>
								</tr>
								<tr>
									<td>칼로리</td>
									<td id="calorie">${calory }</td>
								</tr>
								<tr>
									<td>탄수화물</td>
									<td id="carbo">${carbo }</td>
								</tr>
								<tr>
									<td>단백질</td>
									<td id="protein">${protein }</td>
								</tr>
								<tr>
									<td>지방</td>
									<td id="fat">${fat }</td>
								</tr>
								<tr>
									<td>당류</td>
									<td id="sugar">${sugar }</td>
								</tr>
								<tr>
									<td>나트륨</td>
									<td id="natrium">${natrium }</td>
								</tr>
								<tr>
									<td>콜레스테롤</td>
									<td id="cholesterol">${chole }</td>
								</tr>
								<tr>
									<td>포화지방산</td>
									<td id="saturfat">${fattyacid }</td>
								</tr>
								<tr>
									<td>트랜스지방</td>
									<td id="transfat">${transfat }</td>
								</tr>
							</table>
						</div>
					</div>
					
			
					<div class="row">
					아아
					<div>${userinfo }</div>					
						<div class="col-md-offset-1 col-md-10">
							<div class="panel panel-danger">
								<div class="panel-heading heading">
									<h3 class="text-center">식사 내역</h3>
								</div>
								<div class="panel-body table-responsive">
									<table class="table table-condensed">
										<tr>
											<td class="text-center">제품명</td>
											<td class="text-center">수량</td>
											<td class="text-center">날짜</td>
											<td class="text-center">식사 시간</td>
										</tr>
										
										<c:forEach items="${sessionScope.userinfo }" var="user">
										<tr>
											<td id="name" class="text-center">${user.name }</td>
											<td id="quantity" class="text-center">${user.quantity }</td>
											<td id="eatdate" class="text-center">${user.date}</td>	
											<td id="eatdate" class="text-center">${user.mealtime}</td>
										</tr>
										</c:forEach>
									</table>
									<br>
									<br>
								</div>
							</div>
						</div>
					</div>
			
			</div>
		</div>
		
		
			<!-- Stick script at the end of the body -->
		<script	src="resources/calendarorganizer.js"></script>
		<script>
			/* Fill with whatever your dreams desire */
		</script>
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
		console.log("carbo = "+$("#carbo"));
		
		var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
		chart.draw(data, options);
	}
</script>
<script>
//Basic config
var calendar = new Calendar("calendarContainer",         // HTML container ID,                                                                     Required
                            "small",                     // Size: (small, medium, large)                                                           Required
                            ["Sunday", 3],               // [ Starting day, day abbreviation length ]                                              Required
                            [ "#4db954",                 // Primary Color                                                                          Required
                              "#92e097",                 // Primary Dark Color                                                                     Required
                              "#ffffff",                 // Text Color                                                                             Required
                              "#007a07" ],               // Text Dark Color                                                                        Required
                            { // Following is optional
                                days: [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday",  "Saturday" ],
                                months: [ "January", "Feburary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ],
                                indicator: true,         // Day Event Indicator                                                                    Optional
                                indicator_type: 1,       // Day Event Indicator Type (0 not to display num of events, 1 to display num of events)  Optional
                                indicator_pos: "bottom", // Day Event Indicator Position (top, bottom)                                             Optional
                                placeholder: ""
                            });
/*
var data = {
            2017: {
                12: {
                    25: [
                        {
                            startTime: "00:00",
                            endTime: "24:00",
                            text: "Christmas Day"
                        }
                    ]
                }
            }
        };

var organizer = new Organizer("organizerContainer", calendar, data);
*/
//Days Block click listener
calendar.setOnClickListener('days-blocks',
    // Called when a day block is clicked
    function () {
        console.log("Day block clicked2");
    }
);

// Month Slider (Left and Right Arrow) Click Listeners
calendar.setOnClickListener('month-slider',
    // Called when the month left arrow is clicked
    function () {
        console.log("Month back slider clicked");
    },
    // Called when the month right arrow is clicked
    function () {
        console.log("Month next slider clicked");
    }
);

// Year Slider (Left and Right Arrow) Click Listeners
calendar.setOnClickListener('year-slider',
    // Called when the year left arrow is clicked
    function () {
        console.log("Year back slider clicked");
    },
    // Called when the year right arrow is clicked
    function () {
        console.log("Year next slider clicked");
    }
);

// ------------------------------------- calendar OnClickListener
// Days Block click listener
calendar.setOnClickListener('days-blocks',
    // Called when a day block is clicked
    function () {
        console.log("Day block clicked3");
        console.log(calendar.date);
		$.ajax({
			url : "searchByDate.do",
			type : "post",
			data : {
				date : calendar.date
			},
			success : function(res) {
				console.log(res);
			},
			error : function() {
				alert("일일 섭취 정보 검색 실패");
			}
		});
    }
);

// Month Slider (Left and Right Arrow) Click Listeners
calendar.setOnClickListener('month-slider',
    // Called when the month left arrow is clicked
    function () {
        console.log("Month back slider clicked");
    },
    // Called when the month right arrow is clicked
    function () {
        console.log("Month next slider clicked");
    }
);

// Year Slider (Left and Right Arrow) Click Listeners
calendar.setOnClickListener('year-slider',
    // Called when the year left arrow is clicked
    function () {
        console.log("Year back slider clicked");
    },
    // Called when the year right arrow is clicked
    function () {
        console.log("Year next slider clicked");
    }
);


// https://github.com/nizarmah/calendar-javascript-lib#calendar-onclicklisteners
</script>
</html>