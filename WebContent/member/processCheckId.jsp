<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%
	String id = request.getParameter("id");
%>
<!--<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/PorscheDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />-->

<sql:setDataSource var="dataSource"	url="jdbc:mysql://3.128.196.84:3306/PorscheDB"
	driver="com.mysql.jdbc.Driver" user="ha" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT id FROM member WHERE id=?
   <sql:param value="<%=id%>" />
</sql:query>
<script type="text/javascript">
	function apply(id){
		opener.document.newMember.id.value = id;
		opener.document.newMember.duplicateId.value = "Checked";
		window.close();
	}
</script>
</head>
<jsp:include page="/menu.jsp" />
<br>
<body>
	<div class="form-idCheck" align="center">
		<c:choose>
			<c:when test="${resultSet.rowCount eq 1}">
				<%
					out.println("<p style='color:red'>중복된 아이디입니다. </p>");
				%>
			</c:when>
			<c:when test="${resultSet.rowCount eq 0}">
				<%
					out.println("<p> ["+ id +"]는(은) 사용 가능한 아이디입니다! </p>");
					out.println("<a class='btn btn-primary' href='javascript:apply(\"" + id + "\")'>적용</a>");
				%>
				<!--<input type="button" value="적용" class="btn btn-primary" onclick="apply()">-->
			</c:when>
		</c:choose>
		<a href="javascript:history.back()" class="btn btn-primary ">다시 검색</a>
		<a href="javascript:window.close()" class="btn btn-primary ">창 닫기</a>
	</div>
</body>
</html>