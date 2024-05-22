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
    <title>찜한 브랜드</title>
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

.brandList {
	display: flex;
	margin-top:70px;
	margin-bottom:40px;
	width:100%;
	flex-wrap: wrap;
  	justify-content: flex-start;
}

.brand {
  width: 200px;
  height: 80px;
  font-size:17px;
  color:#676767;
  border: 2px solid #dedede;
  margin: 5px;
  text-align: center; /* div 내부의 텍스트를 가운데 정렬합니다. */
   display: flex; /* Flexbox를 사용하여 내부 요소를 정렬합니다. */
   flex-direction: column; /* 요소를 세로로 배치합니다. */
   justify-content: center; /* 수직 중앙 정렬합니다. */
   align-items: center;
}

#delete_button {
	border:0px;
	background-color:#ffffff;
	width:15%;
	padding:0px;
}

</style>

<script>


function deleteBrand(userid, probrand) {

    $.ajax({
        url: "wishBrandDelete.do",
        method: "POST",
        data: { userid: userid, probrand: probrand },
        success: function(response) {
            if (response === "ok") {
                location.reload();
            } else {
                alert("위시브랜드 삭제에 실패하였습니다.");
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

<form name="brand_frm" method="post">

<input type ="hidden" name="userid" value="${vo.userid}">

<div class="brandList">
    <c:forEach var="brand" items="${brandList}">
    <div class="brand">
        <b>${brand.probrand}</b>
        <span>
			<button type="button" id="delete_button" onclick="deleteBrand('${brand.userid}', '${brand.probrand}')">
    			<img src="/trendproject/images/icon/fullheart.png" width="100%">
			</button>
        </span>
    </div>
</c:forEach>
</div>
</form>		
	
</main>

<div style="clear:both;">

  <%@ include file = "../include/footer.jsp"%>
  
</div>

    </body>
</html>
