<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

�ȳ��ϼ��� <% 
if(session.getAttribute("login_id") != null)
{%>  
	<%= session.getAttribute("login_id") +"��"  %>
	<br> ��� : ${login_info.role}
	<br> �������� �� : ${login_info.money}��
<%  }else{%>

<%="�մ�"%>
<% 
}
%><br><br>
<a href="RegisterForm.do">ȸ������</a>
<%if(session.getAttribute("login_id") != null)
{
%>
	<a href="LogOut.do">�α׾ƿ�</a>
<% 
}else{%>
	<a href="LoginForm.do">�α���</a>
<%
}
%>
<% if(session.getAttribute("login_id") != null){ %>
<a href="PostForm.do">��ǰ���</a>
<% } %>
<a href="getBoardList.do">��ǰ���</a>
<a href="BuyItemList.do">�����ѻ�ǰ</a>
</body>
</html>