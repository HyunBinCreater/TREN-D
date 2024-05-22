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
  </head>
  
<style>

</style>
  
  <body>

<div class="container">

	<%@ include file = "../include/header.jsp"%>
	
	<%@ include file = "../include/nav.jsp"%>

</div>

<main class="container">

<%@ include file = "../include/myinfo.jsp"%>

 <input type ="hidden" name="userid" value="${vo.userid}">

	<div class="period">
			<ul>
				<li>3개월</li>
				<li>1년</li>
				<li>전체</li>
			</ul>	
	</div> 
	
</main>

  <%@ include file = "../include/footer.jsp"%>
  

<script src="../js/bootstrap.bundle.min.js"></script>

    </body>
</html>
