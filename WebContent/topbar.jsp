<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sessionId = (String) session.getAttribute("sessionId");	
	if (sessionId == null){
		sessionId = "n";
	}
%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<div id="wrap">
	<div class="topbar">
		<a href="/Porsche/home.jsp" style="text-decoration: none"> <img class="Logo" src="/Porsche/resources/images/Logo.png">
		</a>
			<div class="text-right login_logout_text">
			<%
				if (request.isUserInRole("admin") || sessionId.equals("admin")){ 
			%>
    		    <a class="admin">[관리자님] 로그인되었습니다.</a>
    		    <a class="login_btn btn-sm btn-success pull-right" href='<c:url value="/member/memberList.jsp"/>'>회원 목록</a>
    		   	<a class="login_btn btn-sm btn-success pull-right" href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a>
    		    <a class="login_btn btn-sm btn-success pull-right" href="/Porsche/logout.jsp">로그아웃</a>
    		</div>    
		    <%
				}else {
			%>
		<div class="text-right">
			<div class="login_logout_text">
				<c:choose>
					<c:when test="${empty sessionId}">
						<a class="login_btn btn-sm btn-success pull-right" href="<c:url value="/member/loginMember.jsp"/>">로그인</a>
		    		   	<a class="login_btn btn-sm btn-success pull-right" href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a>				
						<a class="login_btn btn-sm btn-success pull-right" href='<c:url value="/member/addMember.jsp"/>'>회원 가입</a>
					</c:when>
					<c:otherwise>
							<a class="admin">[<%=sessionId%>님]</a>
							<a class="login_btn btn-sm btn-success pull-right" href='<c:url value="/member/updateMember.jsp"/>'>정보 수정</a>
						   	<a class="login_btn btn-sm btn-success pull-right" href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a>
							<a class="login_btn btn-sm btn-success pull-right" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<%
			}
		%>
	</div>
</div>
<!--top bar-->
<div class="topbar_container"></div>
