<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" 	   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 	   uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!doctype html>
<html lang="en" data-bs-theme="auto">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>주문/배송내역</title>
    <script src="/trendproject/assets/js/color-modes.js"></script>
    <script src="/trendproject/js/jquery-3.6.0.js"></script>
    <script src="/trendproject/js/jquery-ui.js"></script>
  	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/blog/">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
	<link href="/trendproject/css/bootstrap.min.css" rel="stylesheet">
	<link href="/trendproject/css/slide.css" rel="stylesheet">
	<link href="/trendproject/css/carousel.css" rel="stylesheet">  
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> 
    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/trendproject/css/blog.css" rel="stylesheet">
    <link href="/trendproject/css/mypage.css" rel="stylesheet">
  
<style>

.info1 h1 {
	padding:20px 0 20px 0;
	font-size:20px;
}

.infotable1 {
	width:100%;	
}

.infotable1 th,td{
	padding:10px;
	
}

#div_pass2,#div_size2,#div_addInfo2 {	
	display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 반투명한 검은색 배경 */
    z-index: 998;
}

#div_pass1,#div_size1,#div_addInfo1 {
	display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    padding:30px;
    transform: translate(-50%, -50%);
    background-color: white;
    width: 500px;
    height:	700px;
    border-radius: 5px;
    z-index: 999;
}

#div_pass1 h3 {
	font-size:25px;
	padding-top:20px;
	padding-bottom:25px;
}

#div_size1 h3 {
	font-size:25px;
	padding-top:20px;
	padding-bottom:25px;
}

#div_addInfo1 h3 {
	font-size:25px;
	padding-top:20px;
	padding-bottom:25px;
}

#nickname_msg,#name_msg,#mobile_msg {
	font-size:12px;
	color:red;
	font-weight:bold;
	text-align:left;
}

#pass_msg,#newpw1_msg,#newpw2_msg,#birth_msg {
	font-size:12px;
	color:red;
	font-weight:bold;
}
</style>

</head>

<script>

$(function(){
	
	$("#nickname,#name,#mobile").keyup(function(){
		
		var nicknameCheck = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
		
		if (!nicknameCheck.test($("#nickname").val())) {
			$("#nickname_msg").html("닉네임은  2~16자, 영어 또는 숫자 또는 한글로 구성해주세요. (한글 초성 및 모음은 허용되지 않습니다.)");
		} else {
				$("#nickname_msg").html("");
		}
		
		var nameCheck = /^[가-힣]+$/;
		
		if (!nameCheck.test($("#name").val()))  {
			$("#name_msg").html("이름은 한글만 입력해주세요.");
		} else {
				$("#name_msg").html("");
		}
		
		var mobileCheck = /^[0-9]+$/;
		
		if (!mobileCheck.test($("#mobile").val()))  {
			$("#mobile_msg").html("연락처는 숫자만 입력해주세요.");
		} else {
				$("#mobile_msg").html("");
		}	
	});
	
	$("#btn_submit").click(function(){
	
		if( $("#nickname").val() == "" ) {
			alert("닉네임을 입력해주세요.");
			$("#nickname").focus();
			return false;
		}
		
		if( $("#name").val() == "" ) {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		
		if( $("#mobile").val() == "" ) {
			alert("연락처를 입력해주세요.");
			$("#mobile").focus();
			return false;
		}	
		
		if ($("#mobile").val().length != 11	) {
			alert("연락처를 올바르게 입력해주세요.");
			$("#mobile").focus();
			return false;
		}
		
		var nicknameCheck = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
		
		if (!nicknameCheck.test($("#nickname").val())) {
		 	$("#nickname").focus();
		 	$("#nickname_msg").text("닉네임을 올바르게 입력해주세요.");
			return false;
		}	
		
		var nameCheck = /^[가-힣]+$/;
		
		if (!nameCheck.test($("#name").val()))  {
			$("#name").focus();
			$("#name_msg").text("이름을 올바르게 입력해주세요.");
			return false;
		}
		
		var mobileCheck = /^[0-9]+$/;
		
		if (!mobileCheck.test($("#mobile").val()))  {
			$("#mobile").focus();
			$("#mobile_msg").text("연락처를 올바르게 입력해주세요.");
			return false;
		}
		
		let myform = $("#frm").serialize();
		
		$.ajax({  // ajax :: 비동기전송방식
			data:myform, 
			url :"userModifySave.do",
			type:"post",
			
	      	datatype:"json",    // json
			success:function(data) {	// let data = {"result":"0"};
				if(data.result == "0") {
					alert("회원정보 변경이 완료되었습니다.");
					location="user.do";
				} else if(data.result == "1") {
					alert("회원정보 변경에 실패했습니다.");
				}
			},
			error:function() { 
				alert("전송실패!");
			}
		});
	});
});

$(function(){
	
	$("#pass,#newpw1,#newpw2").keyup(function(){
		
		var pass = $("#pass").val();
		var newpw1 = $("#newpw1").val();
		var newpw2 = $("#newpw2").val();
		var passCheck = RegExp(/^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[#$%*!~@%]).{8,20}$/);
		
		if ($("#pass").val() == "") {
			$("#pass_msg").html("현재 비밀번호를 입력해주세요.");
		} else {
				$("#pass_msg").html("");
		}		
		
		if (!passCheck.test($("#newpw1").val())) {
			$("#newpw1_msg").html("비밀번호는 영문, 숫자, 특수문자를 조합하여 8~20자리여야 합니다.");
		} else {
				$("#newpw1_msg").html("");
		}
		
		if ($("#newpw1").val() != $("#newpw2").val()) {		
               $("#newpw2_msg").html("비밀번호가 일치하지 않습니다.");
    	} else {
            	$('#newpw2_msg').html("");
		}
	});	
	
	$("#pass_submit").click(function(){
			// let myform = new FormData(document.getElementById('frm_pass'));
			
			let pass = $("#pass").val();
			let newPw1 = $("#newpw1").val();
			let newPw2 = $("#newpw2").val();
			let myform = "newPw1="+newPw1+"&newPw2="+newPw2+"&pass="+pass;
			
			if ($("#pass").val() == "")
				{
				alert("현재 비밀번호를 입력해주세요.");
				return false;				
				}
			if ($("#newpw1").val() == "")
				{
				alert("새 비밀번호를 입력해주세요.");
				return false;				
				} 
			if ($("#newpw2").val() == "")
				{
				alert("새 비밀번호를 다시 입력해주세요.");
				return false;				
				} 
			
			$.ajax({  // ajax :: 비동기전송방식
				data:myform, 
				url :"userPassModifySave.do",
				type:"post",
				
		      	datatype:"json",    // json
				success:function(data) {	// let data = {"result":"0"};
					if(data.result == "ok") {
						alert("비밀번호 변경이 완료되었습니다.");
						location.reload();
					} else if(data.result == "pass1") {						
						$("#pass_msg").html("현재 비밀번호가 틀립니다.");
						$("#pass").focus();
					} else if(data.result == "pass2") {
						$("#newpw1_msg").html("비밀번호는 영문, 숫자, 특수문자를 조합하여 8~20자리여야 합니다.");
						$("#newpw1").focus();
					} else {
						$("#newpw2").focus();
					}
				},
				error:function() { 
					alert("전송실패!");
				}
			});
		});
});

$(function(){

	$("#size_submit").click(function(){
	
		if( $("#height").val() == "" || 
			$("#weight").val() == "" ||
			$("#topsize").val() == "" ||
			$("#btmsize").val() == "" ||
			$("#footsize").val() == "") {
			alert("내 평소 사이즈를 입력주세요.");
			return false;
		}
		
		let myform = $("#frm_size").serialize();
		
		$.ajax({  // ajax :: 비동기전송방식
			data:myform, 
			url :"userSizeModifySave.do",
			type:"post",
			
	      	datatype:"json",    // json
			success:function(data) {	// let data = {"result":"0"};
				if(data.result == "0") {
					alert("사이즈 정보가 저장되었습니다.");
					location.reload();
				} else if(data.result == "1") {
					alert("사이즈 정보 저장에 실패하였습니다.");
				}
			},
			error:function() { 
				alert("전송실패!");
			}
		});
	});
});

$(function (){	
	
	$("#birth").datepicker({
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dateFormat: "yy/mm/dd",
		yearRange: "-100:+0",
		maxDate: 0,
		yearSuffix : "년",
		showMonthAfterYear : true,
		changeMonth: true,
		changeYear: true
		});
	
	$("#birth").keyup(function(){
	    var birthValue = $(this).val();
	    
	    // 숫자로만 이루어진 문자열인지 확인하는 정규식
	    var numberPattern = /^\d+$/;
	    
	    // 입력값이 빈 문자열인 경우
	    if (birthValue == "") {
	        $("#birth_msg").html("생년월일 8자리를 입력해주세요.");
	        return;
	    }
	    
	    // 숫자로만 이루어진 경우
	    if (numberPattern.test(birthValue)) {
	        // 입력값이 8자리인지 확인
	        if (birthValue.length === 8) {
	            // 날짜 형식으로 변환
	            var formattedDate = birthValue.replace(/(\d{4})(\d{2})(\d{2})/, "$1/$2/$3");
	            
	            // 유효한 날짜 형식인지 확인
	            var validDatePattern = /^\d{4}\/\d{2}\/\d{2}$/;
	            if (validDatePattern.test(formattedDate)) {
	                // 변환된 값이 유효한 날짜 형식인 경우
	                $(this).val(formattedDate);
	                $("#birth_msg").html("");
	            } else {
	                $("#birth_msg").html("올바른 날짜 형식이 아닙니다. (YYYY/MM/DD)");
	            }
	        } else {
	            $("#birth_msg").html("8자리로 입력해주세요.");
	        }
	    } else {
	        // 숫자가 아닌 경우
	        $("#birth_msg").html("숫자만 입력해주세요.");
	    }
	});

	$("#addInfo_submit").click(function(){
		var birthValue = $("#birth").val();
		
		if ($("input[name='gender']").is(":checked") == false) {
			alert("성별을 체크해주세요.");
			return false;
		}
		
		if ($("#birth").val() == ""){
			alert("생년월일을 입력주세요.");
			$("#birth").focus();
			return false;
		}
	    
	    // 입력값이 10자리인지 확인
	    if (birthValue.length !== 10) {
	    	alert("생년월일을 올바르게 입력해주세요.");
	    	$("#birth").focus();
	        return false;
	    }
		
		let myform = $("#frm_addInfo").serialize();
		
		$.ajax({
			data: myform, 
			url: "addInfoModifySave.do",
			type: "post",
			dataType: "json",
			success: function(data) {
				if(data.result == "0") {
					alert("추가 정보가 저장되었습니다.");
					location.reload();
				} else if(data.result == "1") {
					alert("추가 정보 저장에 실패하였습니다.");
				}
			},
			error: function() {
				alert("전송실패!");
			}
		});
	});
});

function pass_modal() {
	document.getElementById("div_pass1").style.display = "block";
	document.getElementById("div_pass2").style.display = "block";
	document.body.style.overflow = "hidden";
}
function pass_close() {
	document.getElementById("div_pass1").style.display = "none";
	document.getElementById("div_pass2").style.display = "none";
	document.getElementById("frm_pass").reset();
	
	$("#pass_msg").html("");
    $("#newpw1_msg").html("");
    $("#newpw2_msg").html("");
    
	document.body.style.overflow = "auto";
}

function size_modal() {
	document.getElementById("div_size1").style.display = "block";
	document.getElementById("div_size2").style.display = "block";
	document.body.style.overflow = "hidden";
	 let selectedTopSize = "${vo2.topsize}";
	  $("#topsize").val(selectedTopSize).prop("selected", true);
}
function size_close() {
	document.getElementById("div_size1").style.display = "none";
	document.getElementById("div_size2").style.display = "none";
	document.getElementById("frm_size").reset();   
	document.body.style.overflow = "auto";
}

function addInfo_modal() {
	document.getElementById("div_addInfo1").style.display = "block";
	document.getElementById("div_addInfo2").style.display = "block";
	document.body.style.overflow = "hidden";
	$("input[name='gender'][value='${vo.gender}']").prop("checked",true);
}
function addInfo_close() {
	document.getElementById("div_addInfo1").style.display = "none";
	document.getElementById("div_addInfo2").style.display = "none";
	document.getElementById("frm_addInfo").reset();   
	document.body.style.overflow = "auto";
}

</script>

  <body>

<div class="container">

	<%@ include file = "../include/header.jsp"%>
	
	<%@ include file = "../include/nav.jsp"%>

</div>

<main class="container">

<%@ include file = "../include/myinfo.jsp"%>

 <form id="frm"> 
 
 <input type ="hidden" name="userid" value="${vo.userid}">

	<div class="info1">	
	<h1>기본정보</h1>
	
	<table class="infotable1">
	  <colgroup>
		<col width="25%"/>
		<col width="*"/>
	  </colgroup>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userid" id="userid" value="${vo.userid }" class="form-control" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><button type="button" class="btn btn-primary" onclick="pass_modal()" style="width:100%;">변경하기</button></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickname" id="nickname" value="${vo.nickname }" class="form-control">
				<span id="nickname_msg"></span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name" value="${vo.name }" class="form-control">
				<span id="name_msg"></span>
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="mobile" id="mobile" value="${vo.mobile }" class="form-control">
				<span id="mobile_msg"></span>
				</td>
			</tr>
			<tr>
				<th>내 사이즈</th>
				<td>
					<button type="button" class="btn btn-primary" onclick="size_modal()" style="width:100%;">변경하기</button>
				</td>
			</tr>
			<tr>
				<th>추가정보</th>
				<td>
					<button type="button" class="btn btn-primary" onclick="addInfo_modal()" style="width:100%;">변경하기</button>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<br><br><button type="submit" id="btn_submit" onclick="return false;" class="btn btn-primary">변경사항 저장하기</button>
				</th>
			</tr>
			
	</table>
	</div> 
	
</form>

<div id="div_pass2"></div>
<div id="div_pass1">

<form name="frm_pass" id="frm_pass">
	<h3>비밀번호 변경</h3>

	<p>현재 비밀번호</p>
		<input type="password" id="pass" class="form-control" placeholder="현재 비밀번호"></input>
		<span id="pass_msg"></span><br><br>
	<p>새 비밀번호</p>
		<input type="password" id="newpw1" class="form-control" placeholder="신규 비밀번호" style="margin-bottom:5px;"></input>
		<span id="newpw1_msg"></span>
		<input type="password" id="newpw2" class="form-control" placeholder="비밀번호 확인" style="margin-bottom:5px;"></input>
		<span id="newpw2_msg"></span>
	<div style="text-align:center; margin-top:60px;">
		<button type=button class="btn btn-primary" style="width:45%;" onclick="pass_close()">취소</button>&nbsp;&nbsp;&nbsp;
		<button type=submit id=pass_submit class="btn btn-primary" style="width:45%;" onclick="return false;">확인</button>
	</div>
</form>

</div>

<div id="div_size2"></div>
<div id="div_size1">

<form name="frm_size" id="frm_size">
	<h3>내 사이즈</h3>

	<p>내 체형</p>
		<select class="form-select" name="height" id="height" style="width:45%;">
		     <c:choose>
		        <c:when test="${empty vo2.height or vo2.height == ''}">
		            <option value="" selected>키 (cm)</option>	
		        </c:when>
		        <c:otherwise>
		            <option value="" disabled>키 (cm)</option>	
		        </c:otherwise>
		    </c:choose>
    		<c:forEach var="i" begin="100" end="299">
       				<option value="${i }"
			        	<c:if test="${not empty vo2.height and vo2.height != '' and i == vo2.height}">
			            selected
			        	</c:if>>${i }</option>
    		</c:forEach>	
		</select>
		
		<select class="form-select" name="weight" id="weight" style="width:45%;">				
			<c:choose>
		        <c:when test="${empty vo2.weight or vo2.weight == ''}">
		            <option value="" selected>몸무게 (kg)</option>	
		        </c:when>
		        <c:otherwise>
		            <option value="" disabled>몸무게 (kg)</option>	
		        </c:otherwise>
		    </c:choose>
    		<c:forEach var="i" begin="5" end="199">
       				<option value="${i }"
			        	<c:if test="${not empty vo2.weight and vo2.weight != '' and i == vo2.weight}">
			            selected
			        	</c:if>>${i }</option>
    		</c:forEach>
		</select><br><br>				
			
	<p>평소 상의/하의/발 사이즈</p>
		<select class="form-select" name="topsize" id="topsize" style="width:45%;">
				<option value="">상의 사이즈</option>
				<option value="1">XXS 이하</option>
				<option value="2">XS</option>
				<option value="3">S</option>
				<option value="4">M</option>
				<option value="5">L</option>
				<option value="6">XL</option>
				<option value="7">XXL</option>
				<option value="8">XXXL</option>
				<option value="9">XXXXL 이상</option>
		</select>
		
		<select class="form-select" name="btmsize" id="btmsize" style="width:45%;">
			<c:choose>
		        <c:when test="${empty vo2.btmsize or vo2.btmsize == ''}">
		            <option value="" selected>하의 사이즈</option>	
		        </c:when>
		        <c:otherwise>
		            <option value="" disabled>하의 사이즈</option>	
		        </c:otherwise>
		    </c:choose>
		     <option value="23" <c:if test="${not empty vo2.btmsize and vo2.btmsize != '' and vo2.btmsize <= 23}">selected</c:if>>23이하</option>
    		<c:forEach var="i" begin="24" end="44">
       				<option value="${i }"
			        	<c:if test="${not empty vo2.btmsize and vo2.btmsize != '' and i == vo2.btmsize}">
			            selected
			        	</c:if>>${i }</option>
    		</c:forEach>
    		 <option value="45" <c:if test="${not empty vo2.btmsize and vo2.btmsize != '' and vo2.btmsize >= 45}">selected</c:if>>45이상</option>
		</select>
		
		<select class="form-select" name="footsize" id="footsize" style="width:45%;">
			<c:choose>
		        <c:when test="${empty vo2.footsize or vo2.footsize == ''}">
		            <option value="" selected>신발 (cm)</option>	
		        </c:when>
		        <c:otherwise>
		            <option value="" disabled>신발 (cm)</option>	
		        </c:otherwise>
		    </c:choose>
		     <option value="220" <c:if test="${not empty vo2.footsize and vo2.footsize != '' and vo2.footsize <= 220}">selected</c:if>>220 이하</option>
    		<c:forEach var="i" begin="225" end="295" step="5">
       				<option value="${i }"
			        	<c:if test="${not empty vo2.footsize and vo2.footsize != '' and i == vo2.footsize}">
			            selected
			        	</c:if>>${i }</option>
    		</c:forEach>
    		 <option value="300" <c:if test="${not empty vo2.footsize and vo2.footsize != '' and vo2.footsize >= 300}">selected</c:if>>300 이상</option>
		</select>
		<br><br>
		
	<div style="text-align:center; margin-top:60px;">
		<button type=button class="btn btn-primary" style="width:45%;" onclick="size_close()">취소</button>&nbsp;&nbsp;&nbsp;
		<button type=submit id=size_submit class="btn btn-primary" style="width:45%;" onclick="return false;">확인</button>
	</div>
</form>

</div>

<div id="div_addInfo2"></div>
<div id="div_addInfo1">

<form name="frm_addInfo" id="frm_addInfo">
	<h3>추가 정보</h3>

	<p>성별</p>
		<input type="radio" name="gender" id="gender" value="M">남성
		<input type="radio" name="gender" id="gender" value="F">여성<br><br>
	<p>생년월일</p>
		<input type="text" name="birth" id="birth" class="form-control" placeholder="생년월일 8자리를 입력해주세요." style="margin-bottom:5px;" value="${vo.birth }"></input>
		<span id="birth_msg"></span>
	<div style="text-align:center; margin-top:100px;">
		<button type=button class="btn btn-primary" style="width:45%;" onclick="addInfo_close()">닫기</button>&nbsp;&nbsp;&nbsp;
		<button type=submit id=addInfo_submit class="btn btn-primary" style="width:45%;" onclick="return false;">저장</button>
	</div>
</form>

</div>
	
</main>

  <%@ include file = "../include/footer.jsp"%>


<script src="../js/bootstrap.bundle.min.js"></script>

    </body>
</html>
