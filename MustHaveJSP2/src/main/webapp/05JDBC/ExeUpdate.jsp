<%@page import="common.JDBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IJDBC</title>
</head>
<body>
	<h2>회원 추가 테스트(executeUpdate()사용)</h2>
	<%
	// JDBC를 통한 DB연결 
	JDBConnect jdbc = new JDBConnect();
	
	// 입력할 회원데이터 준비(하드코딩) 
	String id = "test1";
	String pass = "1111";
	String name = "테스트1회원";
	
	// 인파라미터가 있는 동적쿼리문을 준비한다.
	String sql = "INSERT INTO member VALUES (?,?,?,sysdate)"; // 자리를 동일하게 만들어야 SQL테이블이 생성됨(?)
	// 동적쿼리문 실행을 위한 prepared객체 생성  
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	// 인파라미터 설정시 인덱스는 1부터 시작한다. 
	psmt.setString(1, id);
	psmt.setString(2, pass);
	psmt.setString(3, name);
	
	// 행에 변화를 주는 update, delete, insert (정보변경, 삭제, 새로운 정보입력(새로운 행 입력))
	// 쿼리문은 executeUpdate()메서드를 통해 실행한다
	int inResult = psmt.executeUpdate(); // 변수값이 ExUpdate.jsp뿐 아니라 연결돼있는
	// 동일한 변수가 들어있는 곳에도 오타가 없는지 확인해봐야 한다.
	out.println(inResult + "행이 입력되었습니다.");
	
	// 자원해제(객체소멸)
	jdbc.close();
	%>
	<!-- 폼값인 아이디로 들어가지는 것(?) -->
</body>
</html>