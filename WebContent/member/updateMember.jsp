<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="shortcut icon" href="../resources/images/porsche_favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<!--<sql:setDataSource var="dataSource"	url="jdbc:mysql://localhost:3306/PorscheDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />-->
	
	
<sql:setDataSource var="dataSource"	url="jdbc:mysql://3.128.196.84:3306/PorscheDB"
	driver="com.mysql.jdbc.Driver" user="ha" password="1234" />
	
<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM member WHERE id=?
      <sql:param value="<%=sessionId%>" />
</sql:query>

	<title>회원정보 수정</title>
</head>
<body onload="init()">
	<jsp:include page="/menu.jsp" />
	<div class="login_banner">
		<div class="container">
			<h1 class="login_banner_text">회원정보 수정</h1>
		</div>
	</div>

	<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="mail" value="${row.mail}" />
	<c:set var="mail1" value="${mail.split('@')[0]}" />
	<c:set var="mail2" value="${mail.split('@')[1]}" />

	<c:set var="phone" value="${row.phone}" />
    <c:set var="phone1" value="${phone.split('-')[0]}" />    
    <c:set var="phone2" value="${phone.split('-')[1]}" />
	<c:set var="phone3" value="${phone.split('-')[2]}" />
	
	<c:set var="birth" value="${row.birth }" />
	<c:set var="year" value="${birth.split('/')[0]}" />
	<c:set var="month" value="${birth.split('/')[1]}" />
	<c:set var="day" value="${birth.split('/')[2]}" />
	
	<div class="form-registeration">
		<form name="newMember" class="form-horizontal"
			action="processUpdateMember.jsp" method="post"
			onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id" value="<c:out value='${row.id }'/>" readonly>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control"
						placeholder="password" value="<c:out value='${row.password }'/>" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="password" class="form-control"
						placeholder="password_confirm" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"
						placeholder="name" value="<c:out value='${row.name }'/>" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<c:set var="gender" value="${row.gender }" />
					<input name="gender" type="radio" value="남"	<c:if test="${gender.equals('남')}"> <c:out value="checked" /> </c:if> >남 
						<input name="gender" type="radio" value="여"	<c:if test="${gender.equals('여')}"> <c:out value="checked" /> </c:if> >여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-4  ">
					<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" class="form-controler" size="6" value="${year}"> 
						<select name="birthmm"	id="birthmm">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input type="text" name="birthdd" maxlength="2" placeholder="일" class="form-controler" size="4" value="${day}">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="email1" maxlength="20" class="form-controler" placeholder="이메일을 입력하세요" value="${mail1}"> @ 
					<input type="text" name="email2" id="email2" onfocus="inInput(this)" class="form-controler" placeholder="email" onblur="outInput(this)"value="${mail2}"/>
						<select onfocus="inInput(this)" onblur="outInput(this)" onChange="setEmail(this.value)">
							<option onselect="focus">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="daum.net">daum.net</option>
							<option value="hanmail.com">hanmail.com</option>
							<option value="kyonggi.ac.kr">kyonggi.ac.kr</option>
						</select>
				</div>				
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-5">
					<select name="phone1">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select> ㅡ
					<input type="text" name="phone2" class="form-controler" maxlength="4" size="4" value="${phone2}"/> ㅡ 
					<input type="text" name="phone3" class="form-controler" maxlength="4" size="4" value="${phone3}" />	
				</div>
			</div>

			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" placeholder="address" value="<c:out value='${row.address}'/>">
				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="회원수정 "> 
					<a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
				</div>
			</div>
		</form>	
	</div>
	</c:forEach>
</body>
</html>
<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
		setComboBirthValue("${month}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true; 
				break;
			}
		}
	}
	function setComboBirthValue(val) {
		var selectBirth = document.getElementById('birthmm'); 
		for (i = 0, j = selectBirth.length; i < j; i++){
			if (selectBirth.options[i].value == val){
				selectBirth.options[i].selected = true; 
				break;
			}
		}
	}
	function checkForm() {
		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
	
	function setEmail(email){
		if(email != "직접입력"){
			document.getElementById("email2").value = email;
			document.getElementById("email2").readOnly = true;
			document.getElementById("email2").focus();
		}else{
			document.getElementById("email2").readOnly = false;
			document.getElementById("email2").value = "";
	                document.getElementById("email2").focus();
		}
	}
</script>