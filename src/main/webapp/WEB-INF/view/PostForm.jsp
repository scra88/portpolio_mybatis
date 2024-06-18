<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

	<form action="PostFormOk.do" method="post" onsubmit="return ValidCheck();" enctype="multipart/form-data">
		<input type="text" placeholder="제목" name="title"><br>
		<input type="text" placeholder="내용" name="contents"><br>
		<input type="number" placeholder="가격[1원이상]" name="price"><br>
		<input type="file" name="file"><br>
		<input type="submit" value="글 작성">
	</form>
	<input type="button" value="돌아가기" onclick="location.href='index.do'">
</body>
<script>
	function ValidCheck() {
		var title = document.getElementsByName("title");
		var contents = document.getElementsByName("contents");
		var price = document.getElementsByName("price");
		var file = document.getElementsByName("file");
		if (title[0].value.length == 0 || contents[0].value.length == 0 || price[0].value <= 0 || file[0].value.length == 0) {
			alert("값을 입력해주세요. 파일을 지정해주세요.");
			return false;
		}
	}
</script>
</html>