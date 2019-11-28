<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Board Project</title>
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<link rel="stylesheet" type="text/css"
	href="https://pagination.js.org/dist/2.1.4/pagination.css">
</head>
<body>

	<article id="content">

		<article id="mainContent">
			<div class="main" align="center">
				<form id="frm">
					<input type="hidden" id="no" name="no" />
					<table border="1">
						<tr>
							<th colspan="4">게시글 목록</th>
						</tr>
						<tr align="center">
							<td colspan="4" align="right"><select name="key" id="key">
									<option value="all">---선택하세요---</option>
									<option value="id">아이디</option>
									<option value="title">제목</option>
									<option value="contents">내용</option>
							</select> <input type="text" id="word" name="word" /> <input
								type="hidden" id="pageNumber" name="pageNumber" /> <input
								type="button" value="검색" id="search"> <c:if
									test="${not empty id }">
									<a href="insertBoardForm.do">글쓰기</a>
								</c:if></td>
						</tr>
						<tr align="center">
							<td width="50">번 호</td>
							<td width="150">제 목</td>
							<td width="50">아이디</td>
							<td width="100">게시일</td>
						</tr>
						<tbody id="data-container"> <!-- 데이터가 보일 곳 -->

						</tbody>
					</table>
				</form>
			</div>
			<div id="pagination-container"></div> <!-- 페이징 처리할 녀석 -->
		</article>
	</article>

</body>
<!--  title jsp 와 중복 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> -->
<script src="https://pagination.js.org/dist/2.1.4/pagination.min.js"></script>
<!-- TODO: 12 http://pagination.js.org/index.html를 참조해서 pagination을 구성하시오. -->
<script>
	// @@ 전달받은 파라미터(key, word, pageNumber)로 검색 조건을 초기화 한다.
	// 초기에는 값이 없고 검색 후, 페이지네이션 후 값들이 생성
	<c:if test="${!empty param.key}">
		$("#key").val("${param.key}"); // select 는 고정된 값 만!! 써야한다. : 공백 금지
	</c:if>
		
	$("#word").val("${param.word}");
	$("#pageNumber").val("${param.pageNumber}");
	// @@ pagination 부분을 find() 로 작성하시오. 이때 pageNumber가 있다면 해당 page로 이동한다.
	
	
	// @@ ajax처럼 동적으로 데이터를 가져오는 경우 pagination.js는 한번 datasource를 구성해야 페이지 이동이 가능하다.
	// @@ 실제 게시물을 조회하기 위해 listBoardData.do 페이지를 이용한다.
	// @@ 게시물의 상세 내용을 확인하기 위해 searchBoard.do를 호출한다.
	
	// @@ 상세 내용 조회 시 다시 list로 돌아올 때를 대비해서 글번호와 함께 현재 검색 조건을 함께 전달한다.
	function find() {
		// pageNumber는 자동으로 붙어진다.
		let queryStr = "key=" + $("#key").val() + "&word=" + $("#word").val();
		$("#pagination-container").pagination({
			dataSource: "listBoardData.do?" + queryStr, // ajax 호출 경로 --> JSON을 리턴
			locator: "list",							// JSON 에서 데이터의 키 값
			totalNumberLocator:function(res) {
				return res.totalNumber;
			},
			pageSize: 5,
			callback: function(data, pagination) {	// 한 화면에 보여줄 데이터 개수
				//console.log(data, pagination);		// 화면에 보여줄 데이터가 전달됨
				$("#data-container").empty();	// 초기화
				
				
				$.each(data, function(idx, item){
					let href = "href =searchBoard.do?no=" + item.no + "&pageNumber="+pagination.pageNumber + "&" + queryStr;
					let $tr = $("<tr>");
					$tr.append("<td><a " + href + ">" + item.no +"</a></td>");
					$tr.append("<td>" + item.title +"</td>");
					$tr.append("<td>" + item.id +"</td>");
					$tr.append("<td>" + item.regdate +"</td>");
					$("#data-container").append($tr);
				});
				
				if($("#pageNumber").val()) {
					$("#pagination-container").pagination($("#pageNumber").val());
					$("#pageNumber").val("");
				}
			 } // callback
		});
		
	}
	
	// @@ search 버튼 클릭 시 find 함수를 호출한다.
	$("#search").on("click", function(){
		find();
	});
	// @@ 처음 1회는 바로 실행
	find();
</script>
<!-- END: -->
</html>













