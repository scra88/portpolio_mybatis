<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<table border=1>
<tr><th>제목 : ${board.title}</th></tr>
<tr><th>내용 : ${board.contents}</th></tr>
<tr><th>가격 : $${board.price}원</th></tr>
<tr><td><img src=img/${board.img} width=100	 height=100></td></tr>

</table>
<form method="post" action ="BuyItemOk.do">
<input type="hidden" value="${board.id}" name = "id">
<input type="submit" value="구매하기"><br>
</form>
<input type="button" value="돌아가기" onclick="location.href='getBoardList.do'">
</body>
</html>