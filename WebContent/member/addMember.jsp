<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<script type="text/javascript">
	function checkForm() {
		if (document.newMember.duplicateId.value !="Checked") {
			alert("아이디 중복체크를 해주세요.");
			document.newMember.duplicateId.select();
			document.newMember.duplicateId.focus();
			return false;
		}
		
		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			document.newMember.password.select();
			document.newMember.password.focus();
			return false;
		}else if (document.newMember.password.value.length > 15) {
			alert("비밀번호는 최대 15자 이내로 입력하세요");
			document.newMember.password.select();
			document.newMember.password.focus();
			return false;
		}else if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			document.newMember.password_confirm.select();
			document.newMember.password_confirm.focus();
			return false;
		}
		
		if (!document.newMember.name.value) {
			alert("이름을 입력하세요.");
			document.newMember.name.select();
			document.newMember.name.focus();
			return false;
		}
		
		if (document.newMember.name.value.length > 10) {
			alert("이름은 최대 10자 이내로 입력하세요");
			document.newMember.name.select();
			document.newMember.name.focus();
			return false;
		}

		if (!document.newMember.birthyy.value || !document.newMember.birthdd.value) {
			alert("생년월일을 선택하세요.");
			document.newMember.birthyy.select();
			document.newMember.birthyy.focus();
			return false;
		}else if (isNaN(document.newMember.birthyy.value) || isNaN(document.newMember.birthdd.value)) {
			alert("생년월일은 숫자만 입력하세요.");
			document.newMember.phone3.select();
			document.newMember.phone3.focus();
			return false;
		}
		
		if (!document.newMember.email1.value) {
			alert("이메일을 입력하세요.");
			document.newMember.email1.select();
			document.newMember.email1.focus();
			return false;
		}else if (!document.newMember.email2.value) {
			alert("이메일을 선택하세요.");
			document.newMember.email2.select();
			document.newMember.email2.focus();
			return false;
		}
		
		if (!document.newMember.phone2.value) {
			alert("전화번호를 입력하세요.");
			document.newMember.phone2.select();
			document.newMember.phone2.focus();
			return false;
		}else if (!document.newMember.phone3.value ) {
			alert("전화번호를 입력하세요.");
			document.newMember.phone3.select();
			document.newMember.phone3.focus();
			return false;
		}else if (isNaN(document.newMember.phone2.value) || isNaN(document.newMember.phone3.value)) {
			alert("전화번호는 숫자만 입력하세요.");
			document.newMember.phone3.select();
			document.newMember.phone3.focus();
			return false;
		}
		
		if (!document.newMember.address.value) {
			alert("주소를 입력하세요.");
			document.newMember.address.select();
			document.newMember.address.focus();
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
	function idCheck(){
		window.open("checkId.jsp","idWin","width=500 height=400")
	}
	
</script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="shortcut icon" href="../resources/images/porsche_favicon.ico" type="image/x-icon">
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="login_banner">
		<div class="container">
			<h1 class="login_banner_text">회원 가입</h1>
		</div>
	</div>

	<div class="form-registeration">
		<form name="newMember" class="form-horizontal"  action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-5">
					<input name="id" type="text" class="form-controler" placeholder="아이디">
					<input name="duplicateId" type="button" class="btn btn-primary " value="아이디 중복 체크"  onclick="idCheck()" > 
				</div>
				<div class="col-sm-2">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-5">
					<input name="password" type="text" class="form-control" placeholder="비밀번호는 최대 15자 이내로 입력하세요" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-5">
					<input name="password_confirm" type="password" class="form-control" placeholder="비밀번호 확인" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-5">
					<input name="name" type="text" class="form-control" placeholder="이름은 최대 10자 이내로 입력하세요" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="남" checked="checked"/> 남 
					<input name="gender" type="radio" value="여" /> 여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-4  ">
					<input type="text" name="birthyy" class="form-controler" maxlength="4" placeholder="년(4자)" size="6"> 
					<select name="birthmm">
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
					</select> <input type="text" name="birthdd" class="form-controler" maxlength="2" placeholder="일" size="4">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="email1" maxlength="20" class="form-controler" placeholder="이메일을 입력하세요" > @ 
					<input type="text" name="email2" id="email2" onfocus="inInput(this)" class="form-controler" placeholder="email" onblur="outInput(this)"/>
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
					<input type="text" name="phone2" class="form-controler" maxlength="4" size="4" /> ㅡ 
					<input type="text" name="phone3" class="form-controler" maxlength="4" size="4" />	
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" placeholder="address">

				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>