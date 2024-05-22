<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240416233648">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/trendproject/js/postcode.js"></script>

<script type="text/javascript" src="/trendproject/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/trendproject/js/jquery-ui.js"></script>

</head>
<script>

$(function(){
	
	
	$( "#birth" ).datepicker({
	      changeMonth: true,
	      changeYear: true
	    });
	
	
	$("#btn_submit").click(function(){
	
		
		let myform = $("#frm").serialize();
		
		$.ajax({
			data:myform,
			url:"adminMemberModifySave.do",
			type:"post",
			datatype:"json",
			success:function(data){
				if(data.result == "0"){
					alert("저장완료");
					location:"adminMember.do";
				}else if (data.result == "1"){
					alert("저장실패");
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
	<h1>회원정보 수정하기</h1>
	






<h2>수정사항 입력</h2>

<div class="tbl_frm01">
	
 <form id="frm"> 
 
 <input type="hidden" name="unq" value="${vo.unq }">
	<table>
		<colgroup>
			<col class="w180">
			<col>
		</colgroup>
	
		<tr>
			<th scope="row"><label for="reg_mb_id">아이디</label></th>
			<td>
				<input type="text" name="userid" id="userid"  class="frm_input required" size="20" maxlength="20" value="${vo.userid} ">
				<span class="frm_info fc_125">제약조건 설명하기?</span>		
			</td>
		</tr>
		<tr>
			<th scope="row">이름(실명)</th>
			<td><input type="text" name="name" id="name"  class="frm_input required" size="20" value="${vo.name }"></td>
		</tr>
		<tr>
			<th scope="row">닉네임(별명)</th>
			<td><input type="text" name="nickname" id="nickname"  class="frm_input required" size="20" value="${vo.nickname }"></td>
		</tr>
		<tr>
			<th scope="row">생년월일</th>
			<td><input type="text" name="birth" id="birth"  class="frm_input required" size="20" value="${vo.birth }"></td>
		</tr>
		
		<tr>
			<th scope="row"><label for="reg_mb_hp">휴대폰번호</label></th>
			<td>
				<input type="text" name="mobile" id="mobile" class="frm_input" size="20" maxlength="20" value="${vo.mobile }">
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
				<input type="text" name="postcode" id="postcode" class="frm_input" size="8" maxlength="5" value="${vo.postcode }">
				<button type="button" class="btn_small" onclick="fn_postcode()">주소검색</button>
				
				<br>
				
				<input type="text" name="loadaddr" id="loadaddr" class="frm_input frm_address" size="60" value="${vo.loadaddr }"> <br>
				<input type="text" name="etcaddr" id="etcaddr" class="frm_input frm_address" size="60" value="${vo.etcaddr }">

			</td>
		</tr>		
	</table>
</div>
<div class="btn_confirm">
	<button type="button" class="btn_large" id="btn_submit" >저장</button>
</div>
</form>
	
		</div>
	</div>
</div>



<%@ include file = "../include/admin_footer.jsp" %>


<div id="ajax-loading"><img src="http://demofran.com/img/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>
</body>
</html>
