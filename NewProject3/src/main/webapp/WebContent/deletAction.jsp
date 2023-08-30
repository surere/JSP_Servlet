<%@page import="reply.ReplyDAO"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>	


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 3.7.0 적용 -->

<title></title>
<jsp:useBean id="reply" class="reply.Reply" scope="page"/>
<jsp:setProperty name="reply" property="replyContent"/> 
<jsp:setProperty name="reply" property="replyID"/> 
<jsp:setProperty name="reply" property="userID"/> 
</head>
<%
		int bbsID=1;
		String replyUserId=request.getParameter("UserID");
		System.out.println("delAct 강제 replyuserid :"+reply.getUserID());
		int replyid = reply.getRepllyID();
		System.out.println("리플아이디"+replyid);
		if(request.getParameter("bbsID")!=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		}
	
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
			System.out.println("delAct :"+userID);
			System.out.println("delAct replyuserid :"+reply.getUserID());
			
		}
		if(userID==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("history.back()");
			script.println("</script>");	
		}
		
		else{
			ReplyDAO replyDAO=new ReplyDAO();
			int result = replyDAO.delete(reply.getRepllyID()); 
			
			if(result==-1){
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('댓글삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if(result==1){
				System.out.println("댓삭성공함");
				String url="view.jsp?bbsID="+bbsID;
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("location.href='"+url+"'");
				script.println("</script>");
			}
		}
	%>
	
</html>