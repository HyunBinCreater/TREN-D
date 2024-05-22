<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
    
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
    
    <script src="https://developers.kakao.com/sdk/js/kakao.js" 
    		integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" 
    		crossorigin="anonymous">></script>
	<script type="text/javascript" 
			src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" 
			charset="utf-8"></script>
  </head>
 

 <script>
$(function(){ 
	$("#btn_submit").click(function(){
		
		let userid = $("#userid").val();
		let pass   = $("#pass").val();
		if( userid == "" ) {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		if( pass == "" ) {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		let data = "userid="+userid+"&pass="+pass;
		let url  = "loginSession.do";
		$.ajax({ 
			data:data,
			url:url,
			type:"post",
			datatype:"text",
			success:function(data) {
				data = $.trim(data);
				if(data == "0") {
					alert("로그인에 성공했습니다.");
					location = "index.do";
				} else if(data == "1") {
					alert("로그인 정보가 올바르지 않습니다.");
				}
			},
			error:function() { 
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

<main>

<div class="login">
	<h1>로그인</h1>
	<div class="first_input">
	
		<input type="text" id="userid" placeholder="Id">
	</div>
	<div class="second_input">
		<input type="password" id="pass" placeholder="Password">
	</div>
	
	 <div class="memberInfo">
		<ul>
			<li><a href="userSearch.do" 
			onclick="window.open(this.href,'_blank','width=600, height=500'); return false;">아이디,비밀번호 찾기</a></li>		
			<li>&nbsp/&nbsp</li>
			<li><a href="memberAgree.do">회원가입</a></li>
		</ul>
	</div>
	
	<button type="submit" id="btn_submit" onclick="return false;" class="btn btn-sm btn-outline-secondary">
   		로그인
    </button>
   
   	<div class="separator">
    	<p>-------------- OR ---------------</p>
  	</div>
	<div class="loginApi">
		<ul>
		<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=412472ad90b4e8705e67714db7eb1a60
		&redirect_uri=http://localhost:8080/trendproject/kakaologin.do&response_type=code">
 		 <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    		alt="카카오 로그인 버튼" />
		</a>
		<!-- <a href="http://developers.kakao.com/logout">Logout</a>  --> 
		 <p id="token-result"></p>
		</ul>	
		<%
	    String clientId = "0wgf9ZFYm2cG_o09Vycr";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = URLEncoder.encode("http://localhost:8080/trendproject/naverlogin.do", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
	         + "&client_id=" + clientId
	         + "&redirect_uri=" + redirectURI
	         + "&state=" + state;
	    session.setAttribute("state", state);
		 %>
		
		<ul>
			<li>
	      	<!-- 아래와같이 아이디를 꼭 써준다. -->
	      	<a href="<%=apiURL%>"><img width="222" height="50" src="/trendproject/images/login/naver_login.png"/></a>
			</li>
		<!--	<li onclick="naverLogout(); return false;">
	     	 <a href="javascript:void(0)">
	          <span>네이버 로그아웃</span>
	      	</a>
			</li>-->
		</ul>
    </div>

</div>


</form>

</div>

</main>

  
  <%@ include file = "../include/footer.jsp"%>
  
<script src="/trendproject/js/bootstrap.bundle.min.js"></script>
<script src="/trendproject/js/login.js"></script>
    </body>
</html>
