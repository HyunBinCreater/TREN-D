<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="..//js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>팀 중고 프로젝트</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/blog/">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<script src="https://kit.fontawesome.com/0be5d50f06.js" crossorigin="anonymous"></script>
<link href="/trendproject/css/bootstrap.min.css" rel="stylesheet">
<link href="/trendproject/css/slide.css" rel="stylesheet">
<link href="/trendproject/css/carousel.css" rel="stylesheet">
    
    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/trendproject/css/blog.css" rel="stylesheet">
  </head>
  
  <style>
  .fas fa-person{
  	font-size:40px;
  }
  
  
  
  </style>
  <body>
   

<div class="container">

<%@ include file = "../include/header.jsp"%>
<%@ include file = "../include/nav.jsp"%>

</div>

<main class="container">
  
<div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img id="outer-slide" src="../images/main1.jpg" class="d-block w-100" alt="First slide">
      <div id="inner-slide" class="carousel-caption col-8">
      	<img src="../images/main1.jpg" alt="First slide" class="d-none d-md-block shadow-xl w-100">
      	<div class="carousel-caption">
      		<h3>Slide 1. Lorem ipsum.</h3>
      		<p>...</p>
      	</div>
      </div>
    </div>
    <div class="carousel-item">
      <img id="outer-slide" src="../images/main2.jpg" class="d-block w-100" alt="Second slide">
      <div id="inner-slide" class="carousel-caption col-8">
      	<img src="../images/main2.jpg" alt="Second slide" class="d-none d-md-block shadow-xl w-100">
      	<div class="carousel-caption">
      		<h3>Slide 2. Lorem ipsum.</h3>
      		<p>...</p>
      	</div>
    </div>
    <div class="carousel-item">
      <img id="outer-slide" src="../images/main3.jpg" class="d-block w-100" alt="Third Slide">
      <div id="inner-slide" class="carousel-caption col-8">
      	<img src="../images/main3.jpg" alt="Thired slide" class="d-none d-md-block shadow-xl w-100">
      	<div class="carousel-caption">
      		<h3>Slide 3. Lorem ipsum.</h3>
      		<p>...</p>
      	</div>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

</main>

  
  <%@ include file = "../include/footer.jsp"%>
  

<script src="../js/bootstrap.bundle.min.js"></script>

    </body>
</html>
