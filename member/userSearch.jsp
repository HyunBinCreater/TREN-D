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
	<script src="https://kit.fontawesome.com/0be5d50f06.js" crossorigin="anonymous"></script>
	<link href="/trendproject/css/bootstrap.min.css" rel="stylesheet">
	<link href="/trendproject/css/sign-in.css" rel="stylesheet">
    <script src="/trendproject/js/jquery-3.6.0.js"></script>
  	<script src="/trendproject/js/jquery-ui.js"></script>   
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link href="/trendproject/css/blog.css" rel="stylesheet">
    
  </head>
<style>
.modal{ 
  position:absolute; 
  width:100%; height:100%; 
  background: rgba(0,0,0,0.8); 
  top:0; left:0; 
  display:none;
}
.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
#modal2{ 
  position:absolute; 
  width:100%; height:100%; 
  background: rgba(0,0,0,0.8); 
  top:0; left:0; 
  display:none;
}
.modal_content2{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}

</style>
 
<script>

$(function(){ 
	
	$("#btn_passSubmit").click(function(){
		
		let pass = $("#pass").val();
		let newPass = $("#newPass").val();
		let userid = $("#userid").val();
		if ( newPass == "" ) {
			alert("변경할 암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		if ( pass != newPass ) {
			alert(" 암호가 일치하지 않습니다.");
			$("#newPass").focus();
			return false;
		}
		
		let data2 = "pass="+pass+"&userid="+userid;
		let url  = "searchPwResultSave.do";
		$.ajax({ 
			data:data2,
			url:url,
			type:"post",
			datatype:"text",
			success:function(data2) {
				data2 = $.trim(data2);
				if(data2 == "0") {
					alert("암호가 변경 되었습니다.")
					self.close();
				} else if(data2 == "1") {
					alert("암호가 일치하지 않습니다.")
				}
			},
			error:function() { 
				alert("전송실패!");
			}
		});
	});
	
	$("#searchBtn").click(function(){
		
		let name = $("#name").val();
		let mobile   = $("#mobile").val();
		if( name == "" ) {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if( mobile == "" ) {
			alert("핸드폰번호를 입력해주세요");
			$("#mobile").focus();
			return false;
		}

		let data = "name="+name+"&mobile="+mobile;
		let url  = "searchIdResult.do";
		$.ajax({ 
			data:data,
			url:url,
			type:"post",
			datatype:"text",
			success:function(data) {
				data = $.trim(data);
				if(data != "1") {				
					$("#searchUserid").val(data);			
					$(".modal").fadeIn();
				} 
			},
			error:function() { 
				alert("전송실패!");
			}
		});
	});	
	$(".modal_content").click(function(){
	    $(".modal").fadeOut();
	});
	
	$("#searchBtn2").click(function(){
			
			let userid = $("#userid").val();
			let mobile2   = $("#mobile2").val();
			if( userid == "" ) {
				alert("아이디를 입력해주세요");
				$("#userid").focus();
				return false;
			}
			if( mobile2 == "" ) {
				alert("핸드폰번호를 입력해주세요");
				$("#mobile2").focus();
				return false;
			}
	
			let data1 = "userid="+userid+"&mobile="+mobile2;
			let url  = "searchPwResult.do";
			$.ajax({ 
				data:data1,
				url:url,
				type:"post",
				datatype:"text",
				success:function(data1) {
					data1 = $.trim(data1);
					$("#modal2").fadeIn();	
					if(data1 == "0") {
								
					} else if(data1 == "1") {											
						alert("아이디와 핸드폰번호가 일치하지 않습니다.");
					} 
				},
				error:function() { 
					alert("전송실패!");
				}
			});
		$(".modal_content2").click(function(){
		    $("#btn_close").click(function(){
		    	location = "userSearch.do";
		    });
		});	
		
	});
	
});

function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}

</script>
 
 
<body>


<div class="container">

<%@ include file = "../include/header.jsp"%>

</div>
	
<div class="form-floating">
<form id="frm" autocomplete="on">

	<div class="sub_title font-weight-bold text-black">
			<h3>아이디/비밀번호 찾기</h3>
			<p>등록된 핸드폰 번호로만 찾기가 가능합니다.</p>
	</div>
		<div
			class="custom-control custom-radio custom-control-inline">
			<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
			<label class="custom-control-label font-weight-bold text-black"	for="search_1">아이디 찾기</label>
		</div>
		<div class="custom-control custom-radio custom-control-inline">
			<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
			<label class="custom-control-label font-weight-bold text-black" for="search_2">비밀번호 찾기</label>
		</div>
		<div id="searchI">
			<div class="form-group">
				<label class="font-weight-bold text-black" for="name">이름</label>
				<div>
					<input type="text" class="form-control" id="name" name="name" placeholder="ex) 홍길동">
				</div>
			</div>
			<div class="form-group">
				<label class="font-weight-bold text-black" for="mobile">휴대폰번호</label>
				<div>
					<input type="text" class="form-control" id="mobile" name="mobile" placeholder="ex) 01077779999">
				</div>
			</div>
			<div class="form-group">
				<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-sm btn-outline-secondary">아이디 찾기</button>
				<button type="button" class="btn btn-sm btn-outline-secondary" onclick="self.close()">닫기</a>
			</div>
		</div>
		<div id="searchP" style="display: none;">
			<div class="form-group">
				<label class="font-weight-bold text-black" for="userid">아이디</label>
				<div>
					<input type="text" class="form-control" id="userid" name="userid" placeholder="ex) Id">
				</div>
			</div>
			<div class="form-group">
				<label class="font-weight-bold text-black" for="mobile2">휴대폰번호</label>
				<div>
					<input type="text" class="form-control" id="mobile2" name="mobile2" placeholder="ex) 01077779999">
				</div>
			</div>
			<div class="form-group">
				<button id="searchBtn2" type="button" class="btn btn-sm btn-outline-secondary">비밀번호 찾기</button>
				<button type="button" class="btn btn-sm btn-outline-secondary" onclick="self.close()">닫기</a>
			</div>		
		</div>

</form>
</div>
<!-- 모달창의 폼을 script로 넘기는 폼 -->
<form name="modalFrm">
	<!-- 컨트롤러에서 화면으로 받은 userid -->
	<input type="hidden" id="userid" value="${userid }">

	<div class="modal">
 		<div class="modal_content" title="클릭하면 창이 닫힙니다.">
			 아이디 : <input type="text" id="searchUserid" value="" readonly>	
	 	</div>  	
	</div>
    <div class="modal2" id="modal2">
  		<div class="modal_content2">
			 새로운 암호 : <input type="text" id="pass" name="pass"><br>
			 암호 확인 : <input type="text" id="newPass" name="newPass">
		 	<button type=button id="btn_passSubmit" class="btn btn-sm btn-outline-secondary" onclick="return false;">저장</button>
			<button type=button id="btn_close" class="btn btn-sm btn-outline-secondary" onclick="return false;">닫기</button>
		</div>
   </div>
</form>
	  
<script src="/trendproject/js/bootstrap.bundle.min.js"></script>
<script src="/trendproject/js/login.js"></script>
    </body>
</html>
