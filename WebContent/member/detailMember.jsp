<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="shortcut icon" href="../resources/images/porsche_favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%
	String id = request.getParameter("id");
%>
<!--<sql:setDataSource var="dataSource"	url="jdbc:mysql://localhost:3306/PorscheDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />-->
	
<sql:setDataSource var="dataSource"	url="jdbc:mysql://3.128.196.84:3306/PorscheDB"
	driver="com.mysql.jdbc.Driver" user="ha" password="1234" />
	
<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM member WHERE ID=?
   <sql:param value="<%=id%>" />
</sql:query>
<title>회원 상세정보</title>
</head>
<body onload="init()">
	<jsp:include page="/menu.jsp" />
	<div class="login_banner">
		<div class="container">
			<h1 class="login_banner_text">회원 상세정보</h1>
		</div>
	</div>

	<c:forEach var="row" items="${resultSet.rows}">
		<c:set var="email" value="${row.mail}" />
		<c:set var="email1" value="${mail.split('@')[0]}" />
		<c:set var="email2" value="${mail.split('@')[1]}" />

		<c:set var="birth" value="${row.birth }" />
		<c:set var="year" value="${birth.split('/')[0]}" />
		<c:set var="month" value="${birth.split('/')[1]}" />
		<c:set var="day" value="${birth.split('/')[2]}" />

		<div class="form-registeration">
			<div class="form-group">
				<div class="col-sm-3">
					아이디 :
					<c:out value='${row.id }' />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					이름 :
					<c:out value='${row.name }' />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					성별 :
					<c:out value='${row.gender }' />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					생일 :
					<c:out value='${row.birth }' />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					메일 :
					<c:out value='${row.mail }' />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					전화번호 :
					<c:out value='${row.phone }' />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					주소 :
					<c:out value='${row.address }' />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					가입일 :
					<c:out value='${row.regist_day }' />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3 ">
					<a href="memberList.jsp" class="btn btn-primary">회원 목록</a> 
					<a href="deleteMember_Admin.jsp?id=${row.id}" class="btn btn-primary">회원 삭제</a>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>