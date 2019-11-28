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
		<h2 class="text-center">식사 달력</h2>
		<div class="col-md-4">
			<div class="calendar">
				<div id="calendarContainer"></div>
			</div>
		</div>
		
		<div class="col-md-8">
			<div class="intakeData">
					<div class="row">
						<div class="col-md-8">
							 <div id="series_chart_div" style="width: 500px; height: 300px;"></div>
						</div>
			
						<div class="col-md-4 table-responsive">
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
						<div class="col-md-offset-2 col-md-8">
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


// ------------------------------------- organizer OnClickListener
// Days Block Click Listener
organizer.setOnClickListener('days-blocks',
    // Called when a day block is clicked
    function () {
        console.log("Day block clicked4");
        
    }
);

// Days Block Long Click Listener
organizer.setOnLongClickListener('days-blocks',
    // Called when a day block is long clicked
    function () {
        console.log("Day block long clicked2");
    }
);

// Month Slider (Left and Right Arrow) Click Listeners
organizer.setOnClickListener('month-slider',
    // Called when the month left arrow is clicked
    function () {
        console.log("Month back slider clicked3");
    },
    // Called when the month right arrow is clicked
    function () {
        console.log("Month next slider clicked3");
    }
);

// Year Slider (Left and Right Arrow) Click Listeners
organizer.setOnClickListener('year-slider',
    // Called when the year left arrow is clicked
    function () {
        console.log("Year back slider clicked");
    },
    // Called when the year right arrow is clicked
    function () {
        console.log("Year next slider clicked");
    }
);


organizer.onMonthChange = function (callback) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // TODO : Change the Organizer's Data to the new Data
            // TODO : that you just grabbed from the Ajax Request

            organizer.data = this.responseText;

            // TODO : Call the Callback to display the Data
            callback();
        }
    };
    xhttp.open("GET", "someurl.json", true);
    xhttp.send();
};

// https://github.com/nizarmah/calendar-javascript-lib#calendar-onclicklisteners
</script>
</html>