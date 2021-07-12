<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="shortcut icon" href="../resources/images/porsche_favicon.ico" type="image/x-icon">
<!--<sql:setDataSource var="dataSource"	url="jdbc:mysql://localhost:3306/PorscheDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />-->
	
<sql:setDataSource var="dataSource"	url="jdbc:mysql://3.128.196.84:3306/PorscheDB"
	driver="com.mysql.jdbc.Driver" user="ha" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM member
</sql:query>

<title>회원 목록</title>
</head>
<body>
<body onload="init()">
	<jsp:include page="/menu.jsp" />
	<jsp:include page="../topbar.jsp" />		
	<div class="login_banner">
		<div class="container">
			<h1 class="login_banner_text">회원 목록</h1>
		</div>
	</div>
	<div class="form-registeration">
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>메일 (E-Mail)</th>
					<th>전화번호</th>
					<th>가입일 (가입 시간)</th>
					<th>비고</th>
				</tr>
				<c:forEach var="row" items="${resultSet.rows}">
				<tr>
					<td><c:out value='${row.id}'/></td>
					<td><c:out value='${row.name}'/></td>
					<td><c:out value='${row.mail}'/></td>
					<td><c:out value='${row.phone}'/></td>
					<td><c:out value='${row.regist_day}'/></td>
					<td><a href="./detailMember.jsp?id=${row.id}" class="badge badge-danger">상세 정보</a></td>
				</tr>
				</c:forEach>
				
			</table>
		</div>
		<hr>
	</div>
	
	<jsp:include page="/footer.jsp" />
</body>
</html>
