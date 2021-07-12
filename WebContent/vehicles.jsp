<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Vehicle"%>
<%@ page import="dao.VehicleRepository"%>

<div class="cover-masonry">
	<div class="inner" align ="center">
		<div class="Models_title">Models</div>
		<div class="add_V">
			<a href="addVehicle.jsp">차량 등록</a>
		</div>
		<div class="add_V">
			<a href="./editVehicle.jsp?edit=update">차량 수정</a>
		</div>
		<div class="add_V">
			<a href="./editVehicle.jsp?edit=delete">차량 삭제</a>
		</div>
		<%
			VehicleRepository dao = VehicleRepository.getInstance();
		ArrayList<Vehicle> listOfVehicles = dao.getAllVehicles();
		ArrayList<Vehicle> listOfPanameras = dao.getAllPanameras();
		ArrayList<Vehicle> listOf718s = dao.getAll718s();
		ArrayList<Vehicle> listOf911s = dao.getAll911s();
		%>
		<h3 class="video-con_title"><%=listOfPanameras.get(0).getCategory()%></h3>
		<%@ include file="dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from vehicle";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while (rs.next()) {
			if (i == listOfPanameras.size()) {
		%>
		<h3 class="video-con_title"><%=listOf718s.get(0).getCategory()%></h3>
		<%
			} else if (i == (listOfPanameras.size() + listOf718s.size())) {
		%>
		<h3 class="video-con_title"><%=listOf911s.get(0).getCategory()%></h3>
		<%
			}
		%>
		<ul class="video-con" id="Vehicle">
			<li>
				<div class="textbox" id="<%=rs.getString("v_category")%>">

					<div class="thumb">
						<a href="./vehicle.jsp?id=<%=rs.getString("v_id")%>"> <img
							src="./resources/images/<%=rs.getString("v_fileName")%>" />
						</a>
					</div>
					<h3 class="title">
						<a href="./vehicle.jsp?id=<%=rs.getString("v_id")%>">- <%=rs.getString("v_name")%>
							-
						</a>
					</h3>
					<br>
					<p class="desc">
						가격:
						<%=rs.getString("v_unitPrice")%>000 KRW <br>
						<%=rs.getString("v_description")%>
					</p>
				</div>
			</li>
		</ul>
		
		<%
		i++;
			}
		%>

	</div>
</div>