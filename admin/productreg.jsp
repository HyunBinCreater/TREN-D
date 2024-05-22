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
<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240416234154">
<link type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet">
<link type="text/css" href="http://demofran.com/plugin/jquery-ui/style.css?ver=20240416234154">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<script type="text/javascript" src="/trendproject/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/trendroject/js/jquery-ui.js"></script>
</head>
<body>

<%@ include file = "../include/admin_head.jsp" %>
<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config">
		<h2><i class="ionicons ion-bag"></i>상품관리</h2>
	</div>
		<dl>
			<dt class="g10 menu_toggle">상품관리</dt>		
				<dd class="g10 active"><a href="adminProduct.do">전체 상품관리</a></dd>		
				<dd class="g10"><a href="http://demofran.com/admin/goods.php?code=supply">신규 상품관리</a></dd>	
				<dd class="g10"><a href="http://demofran.com/admin/goods.php?code=supply">중고 상품관리</a></dd>	
						
						
				<dd class="g10"><a href="http://demofran.com/admin/goods.php?code=brand_list">브랜드 관리</a></dd>		
					
					
			<dt class="g40 menu_toggle">문의 / 후기</dt>		
				<dd class="g40"><a href="http://demofran.com/admin/goods.php?code=qa">상품 문의관리</a></dd>		
				<dd class="g40"><a href="http://demofran.com/admin/goods.php?code=review">상품 후기관리</a></dd>	
		</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 상품관리 <i class="ionicons ion-ios-arrow-right"></i> 신규 상품등록		</div>
	
<div class="s_wrap">
	<h1>신규 상품등록</h1>
	
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>


<script src="http://demofran.com/js/categoryform.js?ver=20240416234154"></script>

<form name="fregform" method="post" onsubmit="return fregform_submit(this)" enctype="MULTIPART/FORM-DATA">

<section id="anc_sitfrm_cate">
<h2>카테고리</h2>

</div>
<div class="tbl_frm02">
	<table>
	<colgroup>
		<col class="w180">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">카테고리 선택</th>
		<td>
			<div class="sub_frm01">
				<table>
				<tr>
					<td class="w20p bg1">
						<select id="sel_ca1" name="sel_ca1" size="10" class="multiple-select">
							<option value="">=카테고리선택=</option>
								<c:forEach var="catelist1" items="${CategoryList1}">
							<option value="">${catelist1.catelcode }</option>
								</c:forEach>
		
						</select>
					</td>
					<td class="w20p bg1">
						<select id="sel_ca2" name="sel_ca2" size="10" class="multiple-select">
							<option value="">=카테고리선택=</option>
								<c:forEach var="catelist2" items="${CategoryList2}">
							<option value="">${catelist2.catemcode }</option>
								</c:forEach>
						</select>
					</td>
					<td class="w20p bg1">
						<select id="sel_ca3" name="sel_ca3" size="10" class="multiple-select">
							<option value="">=카테고리선택=</option>
								<c:forEach var="catelist3" items="${CategoryList3}">
							<option value="">${catelist3.catescode }</option>
								</c:forEach>
						</select>
					</td>
					
					
				</tr>
				</table>
			</div>
			<div class="btn_confirm02">
				<button type="button" class="btn_lsmall blue" onclick="category_add();">카테고리 추가</button>
			</div>
			<script>
			$(function() {
				$("#sel_ca1").multi_select_box("#sel_ca",5,tb_admin_url+"/ajax.category_select_json.php","=카테고리선택=");
				$("#sel_ca2").multi_select_box("#sel_ca",5,tb_admin_url+"/ajax.category_select_json.php","=카테고리선택=");
				$("#sel_ca3").multi_select_box("#sel_ca",5,tb_admin_url+"/ajax.category_select_json.php","=카테고리선택=");
				$("#sel_ca4").multi_select_box("#sel_ca",5,tb_admin_url+"/ajax.category_select_json.php","=카테고리선택=");
				$("#sel_ca5").multi_select_box("#sel_ca",5,"","=카테고리선택=");
			});
			</script>
		</td>
	</tr>
	<tr>
		<th scope="row">선택된 카테고리<br><span class="fc_red">(최대 3개까지만 등록)</span></th>
		<td>
			<select name="sel_ca_id" id="sel_ca_id" size="5" class="multiple-select">
						</select>
			<div class="btn_confirm02">
				<button type="button" class="btn_lsmall bx-white" onclick="category_move('sel_ca_id', 'prev');">▲ 위로</button>
				<button type="button" class="btn_lsmall bx-white" onclick="category_move('sel_ca_id', 'next');">▼ 아래로</button>
				<button type="button" class="btn_lsmall frm_option_del red">카테고리 삭제</button>
			</div>
		</td>
	</tr>
	</tbody>
	</table>
</div>
</section>

<div class="btn_confirm">
    <input type="submit" value="저장" class="btn_large" accesskey="s"></div>
<section id="anc_sitfrm_ini">
<h2>기본정보</h2>
<div class="tbl_frm02">
	<table>
	<colgroup>
		<col class="w180">
		<col>
	</colgroup>
	<tbody>
	
	<tr>
		<th scope="row">상품여부</th>
		<td class="td_label">
			<label><input type="radio" name="notax" value="1" checked="checked"> 신규</label>
			<label><input type="radio" name="notax" value="2"> 중고</label>
		</td>
	</tr>
	
	<tr>
		<th scope="row">상품코드</th>
		<td>
			<input type="text" name="gcode" value="상품코드는 자동생성" class="required frm_input" readonly>
			<input type="hidden" name="gcode" id="unq" value="" class="required frm_input">
		</td>
	</tr>
	<tr>
		<th scope="row">브랜드</th>
		<td>
			<input type="text" name="probrand" id="probrand" value="" class="frm_input">
		</td>
	</tr>
	<tr>
		<th scope="row">상품명</th>
		<td><input type="text" name="proname" id="proname" value=""  class="frm_input" ></td>
	</tr>
	<tr>
		<th scope="row">짧은설명</th>
		<td><input type="text" name="proinfo" id="proinfo" value="" class="frm_input"></td>
	</tr>
	<tr>
		<th scope="row">가격</th>
		<td>
			<input type="text" name="proprice" id="proprice" value="" class="frm_input">
		</td>
	</tr>
	
	<tr>
		<th scope="row">카테고리(대분류)</th>
		<td>
			<select>
				<option value="">=카테고리선택=</option>
					<c:forEach var="catelist1" items="${CategoryList1}">
				<option value="">${catelist1.catelcode }</option>
					</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th scope="row">카테고리(중분류)</th>
		<td>
			<select>
				<option value="">=카테고리선택=</option>
					<c:forEach var="catelist2" items="${CategoryList2}">
				<option value="">${catelist2.catemcode }</option>
					</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<th scope="row">카테고리(소분류)</th>
		<td>
			<select>
				<option value="">=카테고리선택=</option>
					<c:forEach var="catelist3" items="${CategoryList3}">
				<option value="">${catelist3.catescode }</option>
					</c:forEach>
			</select>
		</td>
	</tr>
	
	
	
	<tr>
		<th>사진등록</th>
		<td>
			<input type="text" name="" id="" class="frn_input">
		</td>
	</tr>
	
	
	</tbody>
	</table>
</div>
</section>

<div class="btn_confirm">
    <input type="submit" value="저장" class="btn_large" accesskey="s"></div>



</div>

</div>
</div>
<%@ include file = "../include/admin_footer.jsp" %>

<div id="ajax-loading"><img src="http://demofran.com/img/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>


</body>
</html>
