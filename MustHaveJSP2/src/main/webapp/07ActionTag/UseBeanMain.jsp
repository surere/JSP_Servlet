<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
	<h2>useBean 액션 태그</h2>
	<h3>자바빈즈 생성하기</h3>
	<%--
		useBean액션태그를 JSP로 표현하면 다음과 같다.
			import = "common.Person";
			Person person = new Person();
			request.setAttribute("person", person);
	 --%>
	 <!-- 
	 	id="빈의이름(참조변수명)" class="패키지를 포함한 클래스명"
	 	scope="저장할 영역명" 
	  -->
	<jsp:useBean id="person" class="common.Person" scope="request" />
<!-- 	common파일에는 person은 만들지 않았기 때문에 컴파일에는 있어야함 
		useBean이 만들어주기 때문에 3줄에서 1줄로 줄어듬
		C:\DevData\JSP&Servlet\MustHaveJSP\build\classes\common에 person.class가 생성돼있음
-->
	
	<h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
	<!-- DTO객체의 setter() 메서드를 이용해서 값을 설정한다 -->
	<!-- 
		JSP로 표현하는
			person.setName("임꺽정");
			person.setAge(41);를 통해 값을 설정한다.
	 -->
	<jsp:setProperty property="name" name="person" value="임꺽정"/>
	<jsp:setProperty property="age" name="person" value="41"/>
	<!-- set은 집어 넣는다  -->
	
	<h3>setProperty 액션 태그로 자바빈즈 속성 읽기</h3>
	<!-- DTO객체의 getter()를 통해 값을 출력한다. -->
	<!-- 
		person.getName();
		person.getAge();를 통해 값이 출력된다.
	 -->
	<ul>
		<li>이름 : <jsp:getProperty property="name" name="person"/>
		<li>나이 : <jsp:getProperty property="age" name="person"/>
	</ul>
</body>
</html>