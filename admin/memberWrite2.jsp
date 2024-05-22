<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240416233648">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">

<script src="../js/jquery-3.6.0.js"></script>
<script src="../js/jquery-ui.js"></script>
</head>
<script>

function fn_action(){
	alert("제발나와라이요")
}

$(function(){
	$("#btn_submit").click(function(){
		alert("제발 제발 제발")
	});
	
	$("#btn_submit2").click(function(){
		
		
		
		let myform = $("#frm").serialize();
		
		$.ajax({
			data:myform,
			url:"adminMemberWriteSave.do",
			type="post",
			datatype:"json"
			success:function(data){
				if(data.result == "0"){
					alert("저장완료");
					location-"adminMember.do";
				}
			},
			error:function(){
				alter("전송실패");
			}
		});
		
	});
});

</script>



<body>

<%@ include file = "../include/admin_head.jsp"  %>

<div id="wrapper">	
	<div id="snb">
		<div class="snb_header ico_config">
			<h2><i class="ionicons ion-ios-people fs40"></i>회원관리</h2>
	</div>
		<dl>
			<dt class="m10 menu_toggle">회원관리</dt>		
				<dd class="m10 active"><a href="adminMember.do">회원 정보관리</a></dd>			
				<dd class="m10"><a href="adminMemberWrite.do">회원 등록하기</a></dd>		
				<dd class="m10"><a href="http://demofran.com/admin/member.php?code=point">회원 마일리지 관리</a></dd>			
		</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 회원관리 <i class="ionicons ion-ios-arrow-right"></i> 회원 등록하기		
			</div>
	
<div class="s_wrap">
	<h1>회원 등록하기</h1>
	






<h2>사이트 이용정보 입력</h2>

<div class="tbl_frm01">
	
	<table>
	
		<colgroup>
			<col class="w180">
			<col>
		</colgroup>
	
		<tr>
			<th scope="row"><label for="reg_mb_id">아이디</label></th>
			<td>
				<input type="text" name="userid" id="userid"  class="frm_input required" size="20" maxlength="20">
				<span class="frm_info fc_125">제약조건 설명하기?</span>		
			</td>
		</tr>
		<tr>
			<th scope="row"><label for="reg_mb_password">비밀번호</label></th>
			<td><input type="password" name="pass" id="pass" required class="frm_input required" size="20" maxlength="20"> 4자 이상의 영문 및 숫자</td>
		</tr>
		<tr>
			<th scope="row"><label for="reg_mb_password_re">비밀번호 확인</label></th>
			<td><input type="password" name="pass2" id="pass2" required class="frm_input required" size="20" maxlength="20"></td>
		</tr>
		<tr>
			<th scope="row">이름(실명)</th>
			<td><input type="text" name="name" id="name"  class="frm_input required" size="20"></td>
		</tr>
		<tr>
			<th scope="row">닉네임(별명)</th>
			<td><input type="text" name="nickname" id="nickname"  class="frm_input required" size="20"></td>
		</tr>
		<tr>
			<th scope="row">생년월일</th>
			<td><input type="text" name="birth" id="birth"  class="frm_input required" size="20"></td>
		</tr>
		
		<tr>
			<th scope="row"><label for="reg_mb_hp">휴대폰번호</label></th>
			<td>
				<input type="text" name="mobile" id="mobile" class="frm_input" size="20" maxlength="20">
			</td>
		</tr>
		<tr>
			<th scope="row">성별</th>
			<td>
				<input type="radio" name="gender" value="M" id="gender"> 남자
				<input type="radio" name="gender" value="F" id="gender"> 여자
			</td>
		</tr>
		<tr>
			<th scope="row">주소</th>
			<td>
				<label for="reg_mb_zip" class="sound_only">우편번호</label>
				<input type="text" name="mb_zip" id="reg_mb_zip" class="frm_input" size="8" maxlength="5">
				<button type="button" class="btn_small" onclick="win_zip('fregisterform', 'mb_zip', 'mb_addr1', 'mb_addr2', 'mb_addr3', 'mb_addr_jibeon');">주소검색</button><br>
				<input type="text" name="mb_addr1" id="reg_mb_addr1" class="frm_input frm_address" size="60">
				<label for="reg_mb_addr1">기본주소</label><br>
				<input type="text" name="mb_addr2" id="reg_mb_addr2" class="frm_input frm_address" size="60">
				<label for="reg_mb_addr2">상세주소</label><br>
				<input type="text" name="mb_addr3" id="reg_mb_addr3" class="frm_input frm_address" size="60" readonly="readonly">
				<label for="reg_mb_addr3">참고항목</label>
				<input type="hidden" name="mb_addr_jibeon" value="">
			</td>
		</tr>	
	</table>
</div>
<div class="btn_confirm">
	<button type="button" class="btn_large" id="btn_submit" onclick="fn_action()">저장</button>
</div>

		<button type="button" class="btn_large" id="btn_submit">테스트</button>
		</div>
	</div>
</div>



<%@ include file = "../include/admin_footer.jsp" %>


<div id="ajax-loading"><img src="http://demofran.com/img/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>


</body>
</html>
