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
			<th>��ȣ</th>
			<th>����</th>
			<th>�̹���</th>
		
			<c:if test="${login_info.role == 'admin'}"><th>����</th>
			<th>����</th>
			</c:if>
		    <!--<c:if test="${login_info.role != 'admin'}"><th>����</th></c:if>-->
		</tr>
		<c:forEach items="${board_list}" var="m" varStatus="status">
			<tr>
				<td>${m.id}</td>
				<td><a href="getBoard.do?id=${m.id}">${m.title}</a></td>
				<td><img src="img/${m.img}" width=100	 height=100></td>
			
				<c:if test="${login_info.role == 'admin'}">
				<td><input type="button" value="����" onclick="location.href='getBoardUpdateForm.do?id=${m.id}'"></td>
				
				<form method="post" action="deleteBoardOk.do">
						<td>
						<input type="hidden" value="${m.id}" name="id"> 
						<input type="submit" value="����">
						</td>				
						<!--<c:if test="${login_info.role != 'admin'}"><td><input type="button" value="����"></td></c:if>	-->	
				</form>
				</c:if>
				
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="���ư���" onclick="location.href='index.do'">
</body>
</html>