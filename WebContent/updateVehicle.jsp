<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="./resources/css/jquery.bxslider.css" media="screen">
<title>차량 정보 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
    <jsp:include page="editVehiclebar.jsp" />
	<div class="login_banner">
		<div class="container">
			<h1 class="login_banner_text">차량 정보 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String vehicleId = request.getParameter("id");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from vehicle where v_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, vehicleId);
	rs = pstmt.executeQuery();
	if (rs.next()) {
	%>
	<div class="form-registeration">
		<img src="./resources/images/<%=rs.getString("v_filename")%>"
			alt="image" style="width: 100%" />
		<form name="newVehicle" action="./processUpdateVehicle.jsp"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">차량아이디</label>
				<div class="col-sm-3">
					<input type="text" id="vehicleId" name="vehicleId" class="form-control"
						value="<%=rs.getString("v_id")%>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">차량명</label>
				<div class="col-sm-3">
					<input type="text" id="vname" name="vname" class="form-control"
						value="<%=rs.getString("v_name")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice"
						class="form-control" value="<%=rs.getInt("v_unitPrice")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 설명</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form-control"><%=rs.getString("v_description")%></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control"
						value="<%=rs.getString("v_category")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock"
						class="form-control" value="<%=rs.getLong("v_unitsInStock")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">출시일</label>
				<div class="col-sm-3">
					<input type="text" id="releaseDate" name="releaseDate" class="form-control" value="<%=rs.getString("v_releaseDate")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" checked="checked" value="New ">신규
					차량 <input type="radio" name="condition" value="Old"> 중고차량
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="vehicleImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
		</form>

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
</body>
</html>
