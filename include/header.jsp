<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" 	   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/trendproject/css/header.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Source+Code+Pro:ital,wght@0,200..900;1,200..900&display=swap" rel="stylesheet">
<link rel="favicon" href="../images/favicon.ico">
<script src="https://kit.fontawesome.com/0be5d50f06.js" crossorigin="anonymous"></script>
<script src="/trendproject/js/header.js" defer></script>
<script src="/trendproject/js/jquery-3.6.0.js"></script>
<script src="/trendproject/js/jquery-ui.js"></script> 
</head>
<style>
.navbar img{
	height:30px;
	position:relative;
	top:-10px;
}
</style>

<script>

$(function(){
	
	$("#btn_logout").click(function(){	
		$.ajax({ 
			data:"",
			url:"logout.do",
			type:"post",
			datatype:"text",
			success:function(data) {
				data = $.trim(data);
				if(data == "ok") {
					alert("로그아웃 했습니다.");
					location = "index.do";
				} else {
					alert("로그아웃에 실패했습니다.")
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
	<nav class="navbar">
		<div class="navbar_logo">		
			<a href="index.do"><img src="/trendproject/images/logo1.png" width="30"></a>
			<a href="index.do"><img src="/trendproject/images/logo2.png" width="130"></a>
		</div>
			
		<ul class="navbar_icons">
			<li><a href="index.do"><i class="fas fa-house"></a></i></li>
			<li><a href="#"><i class="fas fa-heart"></i></a></li>
			<li><a href="/trendproject/search.do"><i class="fas fa-light fa-magnifying-glass"></a></i></li>			
			<li><a href="/trendproject/cart.do"><i class="fas fa-light fa-cart-shopping"></a></i></li>
			<li><a href="/trendproject/user.do"><i class="fas fa-user"></a></i></li>
			<li><a href="/trendproject/faqList.do"><i class="fas fa-light fa-headphones"></a></i></li>
		<c:if test="${sessionScope.LoginID == null}">
			<li><a class="btn btn-sm btn-outline-secondary" href="login.do">Login</a></li>
		</c:if>
		<c:if test="${sessionScope.LoginID != null}">
			<li><a class="btn btn-sm btn-outline-secondary" href="logout.do"
				id="btn_logout">Logout</a></li>
		</c:if>
		</ul>
	</nav>
</body>
</html>