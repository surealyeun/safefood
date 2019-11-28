<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>Board Project</title>
<link rel="stylesheet" type="text/css" href="css/basic.css" />

</head>
<body>
	
	<article id="content">

		<article id="mainContent">
			<div class="main" id="viewBoard" align="center">
				<form id="frm">
					<input type="hidden" name="no" id="no" value='${board.no}' />

					<input type="hidden" name="query" id="query" />
					<table border="1" width='400'>
						<tr>
							<th colspan="4">게시글 보기</th>
						</tr>
						<tbody>
							<tr>
								<td width='100'>
									<label for="title">제목</label>
								</td>
								<td colspan="3">${board.title}</td>
							</tr>
							<tr>
								<td>글쓴이</td>
								<td>${board.id}</td>
								<td>게시일</td>
								<td>${board.regdate }</td>
							</tr>
							<tr>
								<td colspan="4" valign="top" height="200">
									<pre>${board.contents}</pre>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4" align="center">
									<a href="#" onclick="listBoard()">목록</a>
									<c:if test="${id==board.id}">
										<a href="#" onclick="updateBoardForm()">수정</a>
										<a href="#" onclick="deleteBoard()">삭제</a>
									</c:if>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>
		</article>
	</article>

</body>
<!-- TODO: 13-2 updateForm(), deleteBoard(), listBoard() 함수를 구현하시오. -->
<script>
	// @@ updateBoardForm() 호출 시 form의 action을 updateBoardForm.do로 변경 후 submit 한다. 	
	function updateBoardForm() {
		let $form = $("#frm");
		$form.attr("action", "updateBoardForm.do");
		$form.submit();
		
	}
	// @@ deleteBoard() 호출 시 form의 action을 deleteBoard.do로 변경 후 submit 한다.
	function deleteBoard() {
		let $form = $("#frm");
		$form.attr("action", "deleteBoard.do");
		$form.submit();
		
	}
	// @@ listBoard() 호출 시 request의 queryString을 이용해서 listBoard.do를 호출한다.
	function listBoard() {
		let target = "listBoard.do?<%=request.getQueryString()%>";
		location.href=target;
		
	}
</script>
<!-- END: -->
</html>


