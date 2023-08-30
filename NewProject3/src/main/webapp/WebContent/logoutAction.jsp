<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>


	<script>
		location.href="main.jsp";//세션 해제 후 main 페이지로 이동
	</script>

​

		}
</body>
</html>
<%session.removeAttribute("userID");%> : 현재 사이트에서 생성된 모든 세션을 해제 한다. 
세션에 담아두었던 사용자의 아이디 값 또한 삭제 된다.
joinAction페이지와 loginAction페이지에 로그인이 된 회원은 다시 로그인 할 수 없도록 
설정해 준다.

String userID = null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		if(userID!=null){//로그인이 된 사람은 또 다시 로그인 할 수 없도록 막아준다.
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");