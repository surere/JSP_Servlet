<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		forTokens 태그 : 문자열에서 특정 구분자를 통해 배열의 
			크기만큼 반복해야할 때 사용한다.
			속성]
				items : 구분자를 포함한 문자열을 지정한다. 단 컬렉션이나
					배열은 사용할 수 없다. 
				delims(delimiter) : 구분자를 지정한다. (여러가지 특수기호를
					사용할 수 있다.)
				var : 구분자를 통해 잘라낸 토큰을 저장한다. 
				* 토큰이란? 문법적으로 의미있는 최소단위를 말한다. 하이픈으로
					구분되어 있는 전화번호를 분리했을 때, 각각의 번호가 토큰이 된다.
	 -->
	<%
	String rgba = "Red, Green, Blue, Black";
	%>
	<!-- 배열이 아닌 구분자가 들어간 문자열이라고 보면 된다. -->
	<h4>JSTL의 forTokens 태그 사용</h4>
	<c:forTokens items="<%= rgba %>" delims="," var="color">
		<span style="color:${color};">${color }</span><br/>
	</c:forTokens>
	<h4>StringTokenizer 클래스 사용</h4>
	<%
	//컬러적용을 해주지 않았기 때문에 위의 결과값에서 색상만 빠진 것
	StringTokenizer tokens = new StringTokenizer(rgba, ",");
	out.println("토큰수:" +tokens.countTokens() +"<br>");
	while(tokens.hasMoreTokens()){
		String token = tokens.nextToken();
		out.println(token + "<br>");
	}
	%>
	
	<h4>String 클래스의 split() 메서드 사용</h4>
	<%
	String[] colorArr = rgba.split(",");
	for(String s : colorArr){
		out.println(s +"<br>");
	}
	%>
</body>
</html>