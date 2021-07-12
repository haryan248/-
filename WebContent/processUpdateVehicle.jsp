	<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	//String realFolder = "C:\\Users/harya\\eclipse-workspace\\Porsche\\WebContent\\resources\\images\\"; //웹 어플리케이션상의 절대 경로
	String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	File isDir = new File(realFolder); //해당 파일의 경로가 없을 경우 생성
    if(!isDir.isDirectory()){
    	isDir.mkdir();
    }
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	String vehicleId = multi.getParameter("vehicleId");
	String vname = multi.getParameter("vname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	String releaseDate = multi.getParameter("releaseDate");

	Integer price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
		String sql = "select * from vehicle where v_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vehicleId);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE vehicle SET v_name=?, v_unitPrice=?, v_description=?, v_category=?, v_unitsInStock=?, v_releaseDate=?, v_condition=?, v_fileName=? WHERE v_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vname);
				pstmt.setInt(2, price);
				pstmt.setString(3, description);
				pstmt.setString(4, category);
				pstmt.setLong(5, stock);
				pstmt.setString(6, releaseDate);
				pstmt.setString(7, condition);
				pstmt.setString(8, fileName);
				pstmt.setString(9, vehicleId);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE vehicle SET v_name=?, v_unitPrice=?, v_description=?, v_category=?, v_unitsInStock=?, v_releaseDate=?, v_condition=? WHERE v_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vname);
				pstmt.setInt(2, price);
				pstmt.setString(3, description);
				pstmt.setString(4, category);
				pstmt.setLong(5, stock);
				pstmt.setString(6, releaseDate);
				pstmt.setString(7, condition);
				pstmt.setString(8, vehicleId);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("editVehicle.jsp?edit=update");
%>


