<%@page import="java.awt.Button"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
		}
	%>
	<%
		if(userID == null){
	%>		<button type="button" onclick="'location.href=login.jsp'">로그인페이지</button>
	<%
		}else{
	%>
			<%= userID %>님 환영합니다.
			<button type="button" onclick="'location.href=logoutAction.jsp'">로그아웃페이지</button>
	<%		
		}
	%>	
<!-- 	%> -->
	<script>
		location.href='main.jsp';//main.jsp 파일로 이동
	</script>
</body>
</html>