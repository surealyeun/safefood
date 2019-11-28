<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${user.id }
<br>
<%-- ${eatF } --%>
<br>
${eatformonth }
<hr>
<input type="date" id="date" name="date">
<input type="button" id="search" value="일별 섭취">
<p id="result"></p>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$("#search").on("click", function() {
	$.ajax({
		url: "searchByDate.do",
		type: "post",
		data: {date: $("#date").val()},
		success: function(resData) {
			$("#result").text(resData);
		},
		error: function() {
			alert("Error Occur");
		}
	});
});
</script>

</html>