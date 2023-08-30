<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ page import="bbs.BbsDAO" %>
	<%@ page import="java.io.PrintWriter" %>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
	<jsp:setProperty name="bbs" property="bbsTitle"/>
	<jsp:setProperty name="bbs" property="bbsContent"/>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<title>JSP 게시판 웹 사이트</title>
	</head>
	<body>
		<%
			String userID=null;
			if(session.getAttribute("userID")!=null){
				userID=(String)session.getAttribute("userID");
			}
			int bbsID=1;
			if(request.getParameter("bbsID")!=null){
				bbsID=Integer.parseInt(request.getParameter("bbsID"));
			}
			System.out.println(bbsID);
			
			if(userID==null){
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('로그인이 필요합니다.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");	
			}
			else{
				if(bbs.getBbsTitle()==null || bbs.getBbsContent()==null){
					PrintWriter script= response.getWriter();
					script.println("<script>");
					script.println("alert('제목,게시글 내용이 비어있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					BbsDAO bbsDAO=new BbsDAO();
					int result = bbsDAO.update(bbsID,bbs.getBbsTitle(),bbs.getBbsContent());
					if(result==-1){
						PrintWriter script= response.getWriter();
						script.println("<script>");
						script.println("alert('글수정에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else{
						PrintWriter script= response.getWriter();
						script.println("<script>");
						script.println("alert('수정되었습니다.')");
						script.println("location.href='bbs.jsp'");
						script.println("</script>");
					}
				}
			}
		%>
	</body>
	</html>