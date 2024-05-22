<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	   uri="http://java.sun.com/jsp/jstl/core" %>
    
<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="/trendproject/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>TREN:D</title>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<link rel="icon" href="../favicon.ico" type="image/x-icon">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/blog/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
	<link href="/trendproject/css/bootstrap.min.css" rel="stylesheet">
	<link href="/trendproject/css/sign-in.css" rel="stylesheet">
    <script src="/trendproject/js/jquery-3.6.0.js"></script>
 	<script src="/trendproject/js/jquery-ui.js"></script>
 	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/trendproject/js/postcode.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/trendproject/css/blog.css" rel="stylesheet">
  </head>
 
 <style>

.form-floating {
	width: 700px; margin: 50px auto 30px; padding: 20px 40px 50px;
    border-radius: 30px; background-color: #FAFAFA;
}
table{
	width:600px;
	
}
.memberWrite th,td {
	border:1px solid #cccccc;
	padding:5px;  /*셀 내부 간격 */
	font-size:13px;
}
.button{
	text-align:center;
	margin-bottom:30px;
}
input[type=text], input[type=password] {
  background: white;
  border: 1px solid #222;
  border-radius: .3em;
  box-shadow: 0 1px 0 rgba(255,255,255,0.1);
  color: black;
  font-size: 13px;
  margin-bottom: 5px;
  padding: 8px 5px;
  height:30px;
}
</style>
 <script>
function fn_ajax(data,url) {
	let result = "";
	$.ajax({ 
		data:data,
		url:url,
		type:"post",
		datatype:"text",
		async:false,      // 비동기 -> 동기
		success:function(data) {
			data = $.trim(data);
			result = data;
		},
		error:function() { 
			alert("전송실패!");
		}
	});
	return result;
}

$(function(){

	$("#userid").keyup(function(){
		let userid = $("#userid").val();
		userid = userid.replaceAll(" ","");
		$("#userid").val(userid);
		
		let msg = "";         // java에서 값을 받는 변수
		let result_msg = "";  // 결과 출력 메세지 변수
		// 6~12 자리수의 여부
		if(userid.length < 6 || userid.length > 12) {
			result_msg = "<font color='red'>6자~12자 사이로 작성해주세요.</font>";
		} else {
			// 특수문자의 여부
			// 중복여부 
			msg = fn_ajax("userid="+userid,"useridCheck.do");
		
			if(msg == "0") {
				result_msg = "<font color='green'>사용 가능한 아이디입니다.</font>";
			} else if(msg == "1") {
				result_msg = "<font color='red'>형식에 맞지 않습니다.</font>";
			} else if(msg == "2") {
				result_msg = "<font color='red'>이미 사용중인 아이디입니다.</font>";
			}
		}
		$("#userid_check_span").html(result_msg);
	});
	
	$( "#birth" ).datepicker({
	      changeMonth: true,
	      changeYear: true
	    });

	$("#btn_submit").click(function(){
		// userid 길이체크 (6~12자리) - (영문+숫자+(_-))
		// 핸드폰(8자리) - (숫자)
		// 년-월-일
		if($("#userid").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		if($("#pass").val().length < 4 || $("#pass").val().length > 20) {
			alert("암호는 4 ~ 20자 사이로 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		if($("#pass").val() != $("#pass2").val()) {
			alert("암호가 일치하지 않습니다.");
			$("#pass").focus();
			return false;
		}
		if($("#name").val() == "") {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if($("input[name='gender']").is(":checked") == false  ) {
			alert("성별을 체크해주세요.");
			return false;
		}
		
		if($("#mobile2").val().length != 8) {
			alert("핸드폰번호를 다시 확인해주세요.");
			$("#mobile2").focus();
			return false;
		}
		
		$("#mobile").val($("#mobile1").val()+$("#mobile2").val());
		
		let formdata = $("#frm").serialize();
		$.ajax({
			type:"post", 
			data:formdata, 
			url:"memberWriteSave.do",
			datatype:"json",          // 리턴 데이터 세팅 - 리턴값 타입
			success:function(data) {  // 리턴 데이터 세팅 - 리턴값 세팅
	
				if( data.result == "0" ) {
					alert("회원가입 완료!");
					location="login.do";
				} else if( data.result == "1" ){
					alert("회원가입 실패!");	
				} else if( data.result == "2" ) {
					alert("이미 가입된 아이디 입니다.")
				} else if( data.result == "3" ) {
					alert("아이디에 적합하지 않습니다." )
				} else if( data.result == "4" ) {
					alert("비밀번호에 적합하지 않습니다") 		
				} else if( data.result == "5" ) {
					alert("번호를 다시 확인해 주세요.")			
				} else if( data.result == "6" ) {
					alert("가입된 번호가 있습니다.")
				}
			},
			error:function() {     // 전송실패(o), 저장실패와는 무관함
				alert("전송실패!");
			}
		});
	});
});


</script>
 
 
  <body>
   
<div class="container">

<%@ include file = "../include/header.jsp"%>
<%@ include file = "../include/nav.jsp"%>

</div>

   

<div class="form-floating">
<form id="frm" autocomplete="on">

<input type="hidden" name="mobile" id="mobile">

<main>
<table>
	<tr>
		<th>아이디</th>
		<td>
		<input type="text" name="userid" id="userid"
						   placeholder="아이디를 입력해주세요."
						   style="width:35%;"
						   autofocus>
		<span id="userid_check_span"></span>
		<br>
		(영문+숫자 조합의 6~12자 사이로 입력해주세요.)
		</td>
	</tr>	
	<tr>
		<th>패스워드</th> 
		<td><input type="password" name="pass" id="pass"
								   style="width:35%;"
								   placeholder="암호를 입력해주세요.">
		<br>
		(암호는 4~20자 사이로 입력해주세요.)
		</td>
	</tr>
	<tr>
		<th>패스확인</th>
		<td><input type="password" name="pass2" id="pass2"
								   style="width:35%;"
								   placeholder="암호를 입력해주세요."></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name"
							   value="" 
							   style="width:25%;"></td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>
		<input type="text" name="nickname" id="nickname"
						   placeholder="닉네임을 입력해주세요."
						   style="width:35%;"
						   autofocus>
	</tr>
	<tr>
		<th>생일</th>
		<td>
			<input type="text" name="birth" id="birth">
		</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
		<input type="radio" name="gender" value="M"> 남
		<input type="radio" name="gender" value="F"> 여
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
		<input type="text" name="postcode" id="postcode"  style="width:100px; margin-bottom:2px;">
		
		<button type="button" onclick="fn_postcode()" 
		style="font-size:11px;"
		class="btn btn-sm btn-outline-secondary" >주소찾기</button>

		<br>
		<input type="text" name="loadaddr" id="loadaddr" style="width:90%; margin-bottom:2px;"><br>
		<input type="text" name="etcaddr" id="etcaddr" style="width:90%;">
		</td>
	</tr>
	<tr>
		<th>휴대폰</th>
		<td>
		<select name="mobile1" id="mobile1">
			<option value="010">010</option>
			<option value="011">011</option>
		</select>
		<input type="text" name="mobile2" id="mobile2">
		</td>
	</tr>
</table>

</div>
 <div class="button">
	<button type="submit" id="btn_submit"  onclick="return false;" 
				class="btn btn-sm btn-outline-secondary">회원가입</button>
	<button type="reset" class="btn btn-sm btn-outline-secondary">취소</button>
</div>
</form>
</main>
  <%@ include file = "../../include/footer.jsp"%>
  

<script src="/trendproject/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
