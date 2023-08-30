<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- param의 역할로 3개의 페이지를 보여줌(?)
		포워드된 페이지와 param페이지 p254
	 -->
	<h2>인클루드된 페이지에서 매개변수 확안</h2>
	<%= request.getParameter("loc1") %>에
	<%= request.getParameter("loc2") %>이 있습니다.
</body>
</html>