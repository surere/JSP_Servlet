<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs"	property="bbsTitle"/>
<jsp:setProperty name="bbs"	property="bbsContent"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
  <%
        String userID = null;
        if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
        }

//         추가
		int bbsID=1;
		if(request.getParameter("bbsID")!=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		}
		System.out.println("delete + "+ bbsID);
// 		여기까지
        
        if (userID == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인이 필요합니다.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        } 

        if(bbsID == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글 입니다')");
            script.println("location.href='bbs.jsp'");
            script.println("</script>");
         
        }
        else{
            BbsDAO bbsDAO = new BbsDAO();
            int result = bbsDAO.delete(bbsID);
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글 삭제에 실패했습니다')");
                script.println("history.back()");
                script.println("</script>");
                
            } else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href='bbs.jsp'");
                script.println("</script>");
            }
        }
    %>
</body>
</html>