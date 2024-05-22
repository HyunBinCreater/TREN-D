<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240416233241">
<link type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet">
<link type="text/css" href="http://demofran.com/plugin/jquery-ui/style.css?ver=20240416233241">
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
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 상품관리 <i class="ionicons ion-ios-arrow-right"></i> 전체 상품관리		</div>
	
<div class="s_wrap">
	<h1>전체 상품관리</h1>
	
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>

<h2>기본검색</h2>
<form name="fsearch" id="fsearch" method="get">
<input type="hidden" name="code" value="list">
<div class="tbl_frm01">
	<table class="tablef">
	<colgroup>
		<col class="w100">
		<col>
		<col class="w100">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">검색어</th>
		<td colspan="3">
			<select name="sfl">
				<option value="gname">상품명</option>
				<option value="gcode">상품코드</option>
				<option value="mb_id">업체코드</option>
				<option value="maker">제조사</option>
				<option value="origin">원산지</option>
				<option value="model">모델명</option>
				<option value="explan">짧은설명</option>
			</select>
			<input type="text" name="stx" value="" class="frm_input" size="30">
		</td>
	</tr>
	
	
	
	
	</tbody>
	</table>
</div>
<div class="btn_confirm">
	<input type="submit" value="검색" class="btn_medium">
	<input type="button" value="초기화" id="frmRest" class="btn_medium grey">
</div>
</form>

<form name="fgoodslist" id="fgoodslist" method="post" action="./goods/goods_list_update.php" onsubmit="return fgoodslist_submit(this);">
<input type="hidden" name="q1" value="code=list">
<input type="hidden" name="page" value="1">

<div class="local_ov mart30">
	전체 : <b class="fc_red">13</b> 건 조회
	<span class="ov_a">
		<select id="page_rows" onchange="location='/admin/goods.php?code=list&page=1&page_rows='+this.value;">
			<option value="30" selected="selected">30줄 정렬</option>
			<option value="50">50줄 정렬</option>
			<option value="100">100줄 정렬</option>
			<option value="150">150줄 정렬</option>
		</select>
	</span>
</div>
<div class="local_frm01">
	<a href="adminProductreg.do" class="fr btn_lsmall red"><i class="ionicons ion-android-add"></i> 상품등록</a>
</div>

<div class="tbl_head02">
	<table id="sodr_list" class="tablef">
	<colgroup>
		<col class="w50">
		<col class="w50">
		<col class="w60">
		<col class="w120">
		<col>
		<col>
		<col class="w80">
		<col class="w80">
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w60">
		<col class="w60">
	</colgroup>
	<thead>
	<tr>
		<th scope="col" rowspan="2"><input type="checkbox" name="chkall" value="1" ></th>
		<th scope="col" rowspan="2">번호</th>
		<th scope="col" rowspan="2">이미지</th>
		<th scope="col" rowspan="2"><a href="/admin/goods.php?code=list&page=&filed=gcode&orderby=asc">상품코드</a></th>
		<th scope="col" colspan="2"><a href="/admin/goods.php?code=list&page=&filed=gname&orderby=asc">상품명</a></th>
		<th scope="col"><a href="/admin/goods.php?code=list&page=&filed=reg_time&orderby=asc">최초등록일</a></th>
		<th scope="col"><a href="/admin/goods.php?code=list&page=&filed=isopen&orderby=asc">신규</a></th>
		<th scope="col" colspan="4" rowspan="2" class="th_bg">가격정보</th>
		<th scope="col" rowspan="2"><a href="/admin/goods.php?code=list&page=&filed=rank&orderby=asc">순위</a></th>
		<th scope="col" rowspan="2">관리</th>
	</tr>
	<tr class="rows">
		
		<th scope="col">공급사명</th>
		<th scope="col">카테고리</th>
		<th scope="col"><a href="/admin/goods.php?code=list&page=&filed=update_time&orderby=asc">최근수정일</a></th>
		<th scope="col"><a href="/admin/goods.php?code=list&page=&filed=stock_qty&orderby=asc">중고</a></th>
		
		
	</tr>
	</thead>
	<tbody>
		<tr class="list0">
		<td rowspan="2">
			<input type="hidden" name="gs_id[0]" value="21">
			<input type="checkbox" name="chk[]" value="0">
		</td>
		<td rowspan="2">13</td>
		<td rowspan="2"><a href="http://demofran.com/shop/view.php?index_no=21" target="_blank"><img src="http://demofran.com/data/goods/1516934487/thumb-79666_Dqpxzw59F3Pzg9PrtDe9tSmaUCF7tu_40x40.jpg" width="40" height="40"></a></td>
		<td>1516934487</td>
		<td colspan="2" class="tal">[루이까또즈] 우븐 숄 머플러 인디라 와인 SA-2HW362WI</td>
		<td>17-11-10</td>
		<td>진열</td>
		<td colspan="4" rowspan="2" class="tar">39,600</td>
		
		<td rowspan="2"><input type="text" name="rank[0]" value="2" class="frm_input"></td>
		<td rowspan="2"><a href="./goods.php?code=form&w=u&gs_id=21&page=1&bak=list" class="btn_small">수정</a></td>
	</tr>
	
	
		
	
		</tbody>
	</table>
</div>
<div class="local_frm02">
	<a href="adminProductreg.do" class="fr btn_lsmall red"><i class="ionicons ion-android-add"></i> 상품등록</a>
</div>
</form>


</div>

</div>
</div>
<%@ include file = "../include/admin_footer.jsp" %>


<div id="ajax-loading"><img src="http://demofran.com/img/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>

</body>
</html>
