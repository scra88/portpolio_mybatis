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
			<th>가격</th>
			<th>이미지</th>
		</tr>
		

		<c:forEach items="${buy_item_list}" var="m" varStatus="status">
		
			<tr>
				<td>${m.itemid}</td>
				<td>${m.price}$</td>
				<td><img src="BuyItemListimg/${m.img}" width=100 height=100></td>
			</tr>
		</c:forEach>
	</table>

	<input type="button" value="돌아가기" onclick="location.href='index.do'">
</body>
</html>