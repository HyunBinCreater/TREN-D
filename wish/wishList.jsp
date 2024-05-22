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
    <title>위시리스트</title>
    <script src="/trendproject/assets/js/color-modes.js"></script>
    <script src="/trendproject/js/jquery-3.6.0.js"></script>
    <script src="/trendproject/js/jquery-ui.js"></script>
  	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/blog/">
  	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/list-groups/">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
	<link href="/trendproject/assets/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="/trendproject/css/bootstrap.min.css" rel="stylesheet">
	<link href="/trendproject/css/slide.css" rel="stylesheet">
	<link href="/trendproject/css/carousel.css" rel="stylesheet">   
    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/trendproject/css/blog.css" rel="stylesheet">
    <link href="/trendproject/css/mypage.css" rel="stylesheet">
  
<style>

.wishList {
	margin-top:70px;
	width:100%;
}

.wishList p{
	font-size:13px;
	margin-top:0px;
	padding:0px;
	line-height:15px;
}

.wishList span{
	font-size:12px;
	text-align:center;
	color:#757575;
	display:block;
	background-color:#dedede;
	width:30%;
	margin-top:10px;
	padding:0px;
}

.product {
	width:200px;	
	float:left;
	margin-right:20px;
	margin-bottom:70px;		
}

.product img {
    max-width: 200px; /* 이미지의 최대 너비를 200px로 설정합니다. */
    max-height: 200px; /* 이미지의 최대 높이를 200px로 설정합니다. */
    width: auto; /* 이미지의 너비를 자동으로 조정합니다. */
    height: auto; /* 이미지의 높이를 자동으로 조정합니다. */
    display: block;
    margin: 0 auto;
}

.product p {
    width: 180px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

#delete_button {
	width:30px;
	height:30px;
	background-color:transparent;
	border:none;
}
</style>

<script>

function deleteProduct(userid, prounq) {

    $.ajax({
        url: "wishListDelete.do",
        method: "POST",
        data: { userid: userid, prounq: prounq },
        success: function(response) {
            if (response === "ok") {
                location.reload();
            } else {
                alert("위시리스트 삭제에 실패하였습니다.");
            }
        },
        error: function(xhr, status, error) {
            alert("삭제 중 오류가 발생했습니다. 에러: " + error);
            console.error(error);
        }
    });
}

</script>

</head>
   
  <body>

<div class="container">

	<%@ include file = "../include/header.jsp"%>
	
	<%@ include file = "../include/nav.jsp"%>

</div>

<main class="container">

	<%@ include file = "../include/wishnav.jsp"%>
	
<input type ="hidden" name="userid" value="${vo.userid}">

<c:forEach var="wish" items="${wishList}">
    <div class="wishList">
        <div class="product">
            <a href="#" class="product-link">
            
                <img src="/trendproject/images/upload/${wish.profilename}.jpg" style="margin-bottom:10px;">
                
                <button type="button" id="delete_button" onclick="deleteProduct('${wish.userid}', '${wish.prounq}')">
                    <img src="/trendproject/images/icon/xicon.png" style="width: 100%; height: 100%;">
                </button>
                
                <b>${wish.probrand}</b>
                <p>${wish.proname}</p>
                <b>${wish.proprice} 원</b>
                <span>무료배송</span>
            </a>
        </div>
    </div>
</c:forEach>
	
</main>

<div style="clear:both;">

  <%@ include file = "../include/footer.jsp"%>
  
</div>

    </body>
</html>
