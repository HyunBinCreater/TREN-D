<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" 	   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 	   uri="http://java.sun.com/jsp/jstl/functions" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 메인 화면</title>
</head>
<body>

<c:if test="${fn:indexOf(topmenu,'index') > -1 }">
	<c:set var="menuActive" value="index" />
</c:if>
<c:if test="${fn:indexOf(topmenu,'goodsDetail') > -1 }">
	<c:set var="menuActive" value="goodsDetail" />
</c:if>

 <div class="nav-scroller py-1 mb-3 border-bottom">
    <nav class="nav nav-underline justify-content-between">
      <a class="nav-item nav-link link-body-emphasis <c:if test='${menuActive =="index" }'>active</c:if>" href="index.do">Home</a>
      <a class="nav-item nav-link link-body-emphasis <c:if test='${menuActive =="goodsDetail" }'>active</c:if>" href="goodsDetail.do">상품</a>
      <a class="nav-item nav-link link-body-emphasis" href="../goods/goods2.do">goods2</a>
      <a class="nav-item nav-link link-body-emphasis" href="answerModify.do">문의/수정하기</a>
      <a class="nav-item nav-link link-body-emphasis" href="reviewWrite.do">상품리뷰</a>
      <a class="nav-item nav-link link-body-emphasis" href="#">카테고리5</a>
      <a class="nav-item nav-link link-body-emphasis" href="#">카테고리6</a>
      <a class="nav-item nav-link link-body-emphasis" href="#">카테고리7</a>
    </nav>
  </div>
</body>
</html>