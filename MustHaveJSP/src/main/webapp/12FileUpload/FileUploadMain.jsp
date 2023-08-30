<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>FileUpload</title></head>
<script>
    function validateForm(form) { 
        if (form.name.value == "") {
            alert("작성자를 입력하세요.");
            form.name.focus();
            return false;
        }
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.attachedFile.value == "") {
            alert("첨부파일은 필수 입력입니다.");
            return false;
        }
    }
</script>
<body>
    <h3>파일 업로드</h3>
    <!-- 파일업로드시 실패하는 경우 에러메세지를 표현한다.
    영역에 저장될 것이다. -->
    <span style="color: red;">${errorMessage }</span>
    <!-- 
    	파일 업로드를 위한 form태그 작성시 필수사항
    		1. method 즉 전송방식은 반드시 post로 지정해야 한다.
    		2. encytype을 mutipart/form-date로 지정해야한다.(필수사항?)
    	일반적인 폼값 전송을 위해 enctype을 명시하지 않는 경우
    		request내장객체의 getParameter()로 폼값을 받을 수 있다.
    	파일업로드를 위해 enctype을 위와같이 명시하는 경우
    		request내장객체로는 폼값을 받을 수 없다. cos.jar확장 라이브러리에서
    		제공하는 MutipartRequest객체를 통해 받아야 한다.
     -->
     
     <!-- 파일명을 날짜와 시간을 통해 변경하는 방식으로 실무에서 주로
     사용하는 방식이다. -->
     <form name="fileForm" method="post" enctype="multipart/form-data"
          action="UploadProcess.jsp" onsubmit="return validateForm(this);">
         
        <!-- 파일명을 그대로 사용하고, 중복되는 경우 자동으로 인덱스를 부여하여
         처리하는 방식 -->
<!--      <form name="fileForm" method="post" enctype="multipart/form-data" -->
<!--           action="SimpleProcess.jsp" onsubmit="return validateForm(this);"> -->
<!-- 위의 this는 method post를 불러온다? 스크립트에 작성된 작성자 제목 첨부파일이
	this에 해당된다고 볼 수 있다? -->
        작성자 : <input type="text" name="name" value="머스트해브" /><br />
        제목 : <input type="text" name="title" /><br /> 
        카테고리(선택사항) : 
            <input type="checkbox" name="cate" value="사진" checked />사진 
            <input type="checkbox" name="cate" value="과제" />과제 
            <input type="checkbox" name="cate" value="워드" />워드 
            <input type="checkbox" name="cate" value="음원" />음원 <br /> 
        첨부파일 : <input type="file" name="attachedFile" /> <br />
        <input type="submit" value="전송하기" />
    </form>
</body>
</html>