<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>차량 정보 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 차량을 삭제합니다.") == true)
			location.href = "./deleteVehicle.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="editVehiclebar.jsp" />
	<div class="login_banner">
		<div class="container">
			<h1 class="login_banner_text">차량 정보 편집</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
				PreparedStatement pstmt = null;	
				ResultSet rs = null;
			
				String sql = "select * from vehicle";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-7">
				<img src="./resources/images/<%=rs.getString("v_fileName")%>" style="width: 100%">
				<br><br>				
				<h3><%=rs.getString("v_name")%></h3>
				<p><%=rs.getString("v_description")%>
				<p><%=rs.getString("v_UnitPrice")%>000 KRW
				<p>
					<%
						if (edit.equals("update")) {
					%>
					<a href="./updateVehicle.jsp?id=<%=rs.getString("v_id")%>"	class="btn btn-success" role="button"> 수정 >></a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("v_id")%>')" class="btn btn-success" role="button">삭제 >></a>
					<%
						}
					%>				
			</div>
			<%
				}
				if (rs != null)
					rs.close();
	 			if (pstmt != null)
	 				pstmt.close();
	 			if (conn != null)
					conn.close();
	 			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>