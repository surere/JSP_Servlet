<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.time.LocalDateTime" %>
    <%@page import="java.time.LocalDate" %>
    <!-- 
    	HTML 주석 : 보통의 경우 인클루드되는 JSP파일은 HTML태그 없이
    	순수한 JSP코드만 작성하는 것이 좋다. 포함되었을 때 
    	html태그가 중복될 수 있기 때문이다.
     -->
     <%-- JSP주석 : 포함되는 페이지를 만들때에도 반드시 page지시어는 있어야한다.
     		page 지시어가 없는 JSP파일은 오류가 발생한다.
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
LocalDate today = LocalDate.now();
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);
%>
</body>
</html>