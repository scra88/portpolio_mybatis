<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

안녕하세요 <% 
if(session.getAttribute("login_id") != null)
{%>  
	<%= session.getAttribute("login_id") +"님"  %>
	<br> 등급 : ${login_info.role}
	<br> 보유중인 돈 : ${login_info.money}원
<%  }else{%>

<%="손님"%>
<% 
}
%><br><br>
<a href="RegisterForm.do">회원가입</a>
<%if(session.getAttribute("login_id") != null)
{
%>
	<a href="LogOut.do">로그아웃</a>
<% 
}else{%>
	<a href="LoginForm.do">로그인</a>
<%
}
%>
<% if(session.getAttribute("login_id") != null){ %>
<a href="PostForm.do">상품등록</a>
<% } %>
<a href="getBoardList.do">상품목록</a>
<a href="BuyItemList.do">구매한상품</a>
</body>
</html>