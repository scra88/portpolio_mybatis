<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

	<form action="getBoardUpdateOk.do" method="post"  onsubmit="return ValidCheck();" enctype="multipart/form-data" >
	    <input type="hidden" name="id" value="${board_info.id}">
		제목 : <input type="text" placeholder="제목" name="title" value="${board_info.title}"><br>
		내용 : <input type="text" placeholder="내용" name="contents" value="${board_info.contents}"><br>
		가격 : <input type="number" placeholder="가격[1원이상]" name="price" value="${board_info.price}"><br>
		<img src="img/${board_info.img}" width=100	 height=100><br>
		<input type="file" name="file"><br>
		<input type="submit" value="글 수정">
	</form>
	<input type="button" value="돌아가기" onclick="location.href='index.do'">
</body>
<script>
	function ValidCheck() {
		var title = document.getElementsByName("title");
		var contents = document.getElementsByName("contents");
		var price = document.getElementsByName("price");


		if (title[0].value.length == 0 || contents[0].value.length == 0 || price[0].value <= 0) {
			alert("값을 입력해주세요.");
			return false;
		}
	}
</script>
</html>