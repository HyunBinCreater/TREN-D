<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" 	   uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <link href="/trendproject/css/board.css" rel="stylesheet"><!-- css 파일 적용중.. -->
    <script src="/trendproject/js/jquery-3.6.0.js"></script>
</head>
<style>

</style>
<script>
$(function(){
	$("#search_btn").click(function(){
		$("#searchfrm").attr("method","post");
		$("#searchfrm").attr("action","usedsearch.do");
		$("#searchfrm").submit();
	
	});//search_btn
	
	
});//function
//초기 설정 1페이지


function usedpage_load(pageNumber) {
    // 현재 스크롤 위치를 저장합니다.
    var scrollTop = window.scrollY;
    
    // AJAX를 통해 해당 페이지의 내용을 가져와서 content div에 업데이트
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'usedsearch.do?pageIndex=' + pageNumber , true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var ContentDiv1 = document.getElementById('usedpro_content');
            // 기존 내용을 제거합니다.
            ContentDiv1.innerHTML = '';
            // 새로운 페이지의 내용을 추가합니다.
            ContentDiv1.innerHTML = xhr.responseText;
            
            // 페이지 내용이 업데이트된 후에 스크롤 위치를 변경합니다.
            window.scrollTo(0, scrollTop);
        }
    };
    xhr.send();
}

</script>
<body>
<div class="container">

<%@ include file = "../include/header.jsp"%>
<%@ include file = "../include/nav.jsp"%>

</div>
<div class="container">
<div class="searchwindow" >
	<form id="searchfrm">
		<p class="searchtitle">상품검색</p>
		<input  type="text" class="inputbox" id="searchKeyword" name="searchKeyword" onkeyup="selectList();" value="${searchKeyword }"  placeholder="검색어를 입력해주세요">
	 	<button type="button" class="btn_search" id="search_btn">검색</button>
	</form>     
</div>
</div>

<main class="container">
<div id="top_tab">
<ul class="top_tab_ul">
<li></li>
<li></li>
<li><a href="search.do" >새상품</a></li>
<li><a href="usedsearch.do"><font color="#000"><b>중고상품</b></font></a></li>
</ul>


</div>
<div id="usedpro_content">	
<table class="list_tbl" >
	<tr ><td class="font_style">중고</td></tr>
	 <c:if test="${usedtotal<1}">
	 	<tr><td colspan="3">검색 결과가 없습니다.</td></tr>
	 </c:if>
	 <c:if test="${usedtotal>0}">
	 <c:forEach var="list1" items="${list1 }">
		<tr class="hover_color"> 
			<td style="width:25%"> <a href="#"><img width="200"height="230" src="used_product_upload/${list1.usedfilename}"></a></td>
		    <td style="vertical-align: middle; font-size:15px;text-align:left;">
							<a href="#">${list1.usedproname  }</a>
							<p align="left">${list1.usedproinfo  }</p>
						</td>
		    <td style="width:20%;vertical-align: middle; font-size:13px;">가격 ${list1.usedproprice}원</td> 
	    </tr>
    </c:forEach>
	</c:if>
</table>

<c:if test="${usedtotal != 0 }">
<div class="pagging" id="pagging">
	    <c:set var="before" value="${svo.pageStartNo - 1}"/>
	    <c:set var="next" value="${svo.pageLastNo + 1}"/>	
	    
	    <c:if test="${svo.pageIndex != 1 }">
	    <a href="#" onclick="usedpage_load(1)">[first]</a> 
	    </c:if>
	    <c:if test="${svo.pageStartNo > 1}">
	        <a href="#" onclick="usedpage_load('${before}')">[before]</a> 
	    </c:if>
	    
	    <c:forEach var="p" begin="${svo.pageStartNo}" end="${svo.pageLastNo}">
	        <c:if test="${p != svo.pageIndex}">
	            <a href="#" onclick="usedpage_load('${p}')">${p}</a>
	        </c:if>
	        <c:if test="${p == svo.pageIndex}">
	            <span style="font-weight:bold; color:red;">${p}</span>
	        </c:if> 
	    </c:forEach> 
	    
	    <c:if test="${svo.pageLastNo < svo.totalPageCnt}">
	        <a href="#" onclick="usedpage_load('${next}')">[next]</a>
	    </c:if>
	    <c:if test="${svo.pageIndex != svo.totalPageCnt }">
	    <a href="#" onclick="usedpage_load('${svo.totalPageCnt}')">[last]</a>
	    </c:if>
	</div>
</c:if>
</div>
<hr><br><br>
</main>
<form name="searchKeywordfrm">
<input type="hidden" id="searchKeyword1" name="searchKeyword" value="${searchKeyword }">
</form>
<main class="container">
<%-- <%@include file="usedsearch.jsp" %>  --%>
</main>
<%@ include file = "../include/footer.jsp"%>