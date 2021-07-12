<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/vehicle_validation.js"></script>
<title>차량 등록</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">
		<jsp:include page="menu.jsp" />
		<jsp:include page="editVehiclebar.jsp" />	
		<title><fmt:message key="title" /></title>
		<div class="login_banner">
			<h1 class="login_banner_text">
				<fmt:message key="title_v" />
			</h1>
		</div>
		<div class="form-registeration">
			<div class="text-right">
				<div class="language">
					<a href="?language=ko" class="btn btn-sm btn-success pull-right">Korean</a>
					<a href="?language=en" class="btn btn-sm btn-success pull-right">English</a>
				</div>
			</div>
			<form name="newVehicle" action="./processAddVehicle.jsp"
				class="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="vehicleId" /></label>
					<div class="col-sm-3">
						<input type="text" id="vehicleId" name="vehicleId"
							class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="vname" /></label>
					<div class="col-sm-3">
						<input type="text" id="vname" name="vname" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
					<div class="col-sm-3">
						<input type="text" id="unitPrice" name="unitPrice"
							class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="description" /></label>
					<div class="col-sm-5">
						<textarea name="description" cols="100" rows="4"
							class="form-control">Top speed:    km/h 
Acceleration from 0 - 100 km/h:   s</textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="category" /></label>
					<div class="col-sm-5">
						<input type="radio" name="category" checked="checked" value="Panamera">
						<fmt:message key="category_Panamera" />
						<input type="radio" name="category" value="718">
						<fmt:message key="category_718" />
						<input type="radio" name="category" value="911">
						<fmt:message key="category_911" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
					<div class="col-sm-3">
						<input type="text" id="unitsInStock" name="unitsInStock"
							class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="releaseDate" /></label>
					<div class="col-sm-3">
						<input type="text" id="releaseDate" name="releaseDate" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="condition" /></label>
					<div class="col-sm-5">
						<input type="radio" name="condition" checked="checked" value="New ">
						<fmt:message key="condition_New" />
						<input type="radio" name="condition" value="Old">
						<fmt:message key="condition_Old" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="vehicleImage" /></label>
					<div class="col-sm-5">
						<input type="file" name="vehicleImage" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="button" class="btn btn-primary"
							value="<fmt:message key="button" />" onclick="CheckAddVehicle()">
					</div>
				</div>
			</form>
		</div>
	</fmt:bundle>
</body>
</html>
