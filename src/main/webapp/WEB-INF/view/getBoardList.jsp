<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<table border=1>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이미지</th>
		
			<c:if test="${login_info.role == 'admin'}"><th>수정</th>
			<th>삭제</th>
			</c:if>
		    <!--<c:if test="${login_info.role != 'admin'}"><th>구매</th></c:if>-->
		</tr>
		<c:forEach items="${board_list}" var="m" varStatus="status">
			<tr>
				<td>${m.id}</td>
				<td><a href="getBoard.do?id=${m.id}">${m.title}</a></td>
				<td><img src="img/${m.img}" width=100	 height=100></td>
			
				<c:if test="${login_info.role == 'admin'}">
				<td><input type="button" value="수정" onclick="location.href='getBoardUpdateForm.do?id=${m.id}'"></td>
				
				<form method="post" action="deleteBoardOk.do">
						<td>
						<input type="hidden" value="${m.id}" name="id"> 
						<input type="submit" value="삭제">
						</td>				
						<!--<c:if test="${login_info.role != 'admin'}"><td><input type="button" value="구매"></td></c:if>	-->	
				</form>
				</c:if>
				
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="돌아가기" onclick="location.href='index.do'">
</body>
</html>