<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>관리자 페이지</title> 
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<script type="text/javascript" src="/trendproject/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/trendroject/js/jquery-ui.js"></script>
<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240416232849">
<script>


</script>


</head>
<body>

<%@ include file = "../include/admin_head.jsp" %>


<div id="wrapper">
	
<div id="main_wrap">
	<section>
		<div class="order_vbx">
			<dl class="od_bx1">
				<dt>전체 주문현황</dt>
				<dd>
					<p class="ddtit">총 주문건수</p>
					<p>34</p>
				</dd>
				<dd class="total">
					<p class="ddtit">총 주문액</p>
					<p>2,437,700</p>
				</dd>
			</dl>

			<dl class="od_bx2">
				<dt>주문상태 현황</dt>
				<dd>
					<p class="ddtit">입금대기</p>
					<p>0</p>
				</dd>
				<dd>
					<p class="ddtit">입금완료</p>
					<p>0</p>
				</dd>
				<dd>
					<p class="ddtit">배송준비</p>
					<p>0</p>
				</dd>
				<dd>
					<p class="ddtit">배송중</p>
					<p>0</p>
				</dd>
				<dd>
					<p class="ddtit">배송완료</p>
					<p>1</p>
				</dd>
			</dl>
			<dl class="od_bx2">
				<dt>구매확정/클래임 현황</dt>
				<dd>
					<p class="ddtit">구매미확정</p>
					<p>0</p>
				</dd>
				<dd>
					<p class="ddtit">취소</p>
					<p>33</p>
				</dd>
				<dd>
					<p class="ddtit">환불</p>
					<p>0</p>
				</dd>
				<dd>
					<p class="ddtit">반품</p>
					<p>0</p>
				</dd>
				<dd>
					<p class="ddtit">교환</p>
					<p>0</p>
				</dd>
			</dl>
		</div>
	</section>

	<section class="sidx_head01">
		<!-- 5개정보만 나오게 끔 해야함. -->
		<h2>최근 주문내역<a href="adminOrder.do" class="btn_small">주문내역 바로가기</a></h2>
		<table>
		<thead>
		<tr>
			<th scope="col">주문번호</th>
			<th scope="col">주문자명</th>
			<th scope="col">수령자명</th>
			<th scope="col">전화번호</th>
			<th scope="col">총주문액</th>
			<th scope="col">주문일시</th>
		</tr>
		</thead>
		<tbody>
				<tr class="tr_alignc">
			<td>24040511530204</td>
			<td>관리자</td>
			<td>관리자</td>
			<td>010-0000-0000</td>
			<td>136,240</td>
			<td>2024-04-05 11:53 (금)</td>
		</tr>
			
				</tbody>
		</table>
	</section>
	
	
	<section class="sidx_head01">
		<h2>최근 회원가입<a href="adminMember.do" class="btn_small">회원관리 바로가기</a></h2>
		
		
		<table>
		<thead>
		
		<tr>
			<th scope="col">이름</th>
			<th scope="col">아이디</th>
			<th scope="col">레벨</th>
			<th scope="col">성별</th>
			<th scope="col">생일</th>
			<th scope="col">연락처</th>
			<th scope="col">가입일시</th>
		</tr>
		
		</thead>
		<tbody>
		<c:forEach var="memlist" items="${memberselectlist}">
		<tr class="tr_alignc">
			<td>${memlist.name }</td>
			<td>${memlist.userid }</td>
			<td>${memlist.grade }</td>
			<td>${memlist.gender }</td>
			<td>${memlist.birth }</td>
			<td>${memlist.mobile }</td> 
			<td>${memlist.rdate }</td>
		</tr>
		</c:forEach>
			
				</tbody>
		</table>
	</section>
</div>

</div>



<div id="ajax-loading"><img src="http://demofran.com/img/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>




</body>
</html>
