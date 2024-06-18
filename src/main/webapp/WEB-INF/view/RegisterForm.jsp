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

	<form action="RegisterOk.do" method="post"
		onsubmit="return ValidCheck();">

		<input type="text" placeholder="아이디" name="name"><br> <input
			type="password" placeholder="비밀번호" name="password"><br>
		<input type="submit" value="회원가입">
	</form>
	<input type="button" value="돌아가기" onclick="location.href='index.do'">
</body>
<script>
	function ValidCheck() {
		var name = document.getElementsByName("name");
		var password = document.getElementsByName("password");
		const regexp = /^[a-zA-Z0-9]+$/;
		//alert(regexp.test("asdf12"));
	    //return false;
		
		if (name[0].value.length == 0 || password[0].value.length == 0) {
			alert("값을 입력해주세요.");
			return false;
		}else if(!regexp.test(name[0].value) || !regexp.test(password[0].value))
		{
			alert("숫자와 영문만 입력가능합니다.");
			return false;
		}
	}
</script>
</html>