<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240416233351">
<link type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet">
<link type="text/css" href="http://demofran.com/plugin/jquery-ui/style.css?ver=20240416233351">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<script>


</script>
<script type="text/javascript" src="/trendproject/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/trendroject/js/jquery-ui.js"></script>
</head>
<body>

<%@ include file = "../include/admin_head.jsp" %>

<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config">
		<h2><i class="ionicons ion-clipboard"></i>주문관리</h2>
	</div>
		<dl>
			<dt class="o10 menu_toggle">주문관리</dt>		
				<dd class="o10 active"><a href="adminOrder.do">주문리스트(전체)<em class="snb_air">34</em></a></dd>		
				<dd class="o10"><a href="">입금대기<em>0</em></a></dd>		
				<dd class="o10"><a href="">입금완료<em>0</em></a></dd>		
				<dd class="o10"><a href="">배송준비<em>0</em></a></dd>		
				<dd class="o10"><a href="">배송중<em>0</em></a></dd>		
				<dd class="o10"><a href="">배송완료<em class="snb_air">1</em></a></dd>		
				<dd class="o10"><a href="">엑셀 배송일괄처리</a></dd>		
			<dt class="o20 menu_toggle">취소/교환/반품/환불 관리</dt>		
				<dd class="o20"><a href="">입금전 취소<em class="snb_air">33</em></a></dd>		
				<dd class="o20"><a href="">배송전 환불<em>0</em></a></dd>		
				<dd class="o20"><a href="">배송후 반품<em>0</em></a></dd>		
				<dd class="o20"><a href="">배송후 교환<em>0</em></a></dd>		
		</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 주문관리 <i class="ionicons ion-ios-arrow-right"></i> 주문리스트(전체)		</div>
	
<div class="s_wrap">
	<h1>주문리스트(전체)</h1>
	
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>

</script>
<h2>기본검색</h2>
<form name="fsearch" id="fsearch" method="get">
<input type="hidden" name="code" value="list">
<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w100">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">검색어</th>
		<td>
			<select name="sfl">
				<option value="od_id">주문번호</option>
				<option value="od_no">일련번호</option>
				<option value="mb_id">회원아이디</option>
				<option value="name">주문자명</option>
				<option value="deposit_name">입금자명</option>
				<option value="bank">입금계좌</option>
				<option value="b_name">수령자명</option>
				<option value="b_telephone">수령자집전화</option>
				<option value="b_cellphone">수령자핸드폰</option>
				<option value="delivery_no">운송장번호</option>
				<option value="seller_id">판매자ID</option>
				<option value="pt_id">가맹점ID</option>
			</select>
			<input type="text" name="stx" value="" class="frm_input" size="30">
		</td>
	</tr>
	<tr>
		<th scope="row">기간검색</th>
		<td>
			<select name="sel_field">
				<option value="od_time">주문일</option>
				<option value="receipt_time">입금완료일</option>
				<option value="delivery_date">배송일</option>
				<option value="invoice_date">배송완료일</option>
				<option value="user_date">구매확정일</option>
				<option value="cancel_date">주문취소일</option>
				<option value="refund_date">환불완료일</option>
				<option value="return_date">반품완료일</option>
				<option value="change_date">교환완료일</option>
			</select>
			<label for="fr_date" class="sound_only">시작일</label>
<input type="text" name="fr_date" value="" id="fr_date" class="frm_input w80" maxlength="10">
 ~ 
<label for="to_date" class="sound_only">종료일</label>
<input type="text" name="to_date" value="" id="to_date" class="frm_input w80" maxlength="10">
<span class="btn_group"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="오늘"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="어제"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="일주일"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="지난달"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="1개월"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="3개월"><input type="button" onclick="search_date('fr_date','to_date',this.value);" class="btn_small white" value="전체"></span>		</td>
	</tr>
	
	<tr>
		<th scope="row">주문상태</th>
		<td>
			<label><input type="radio" name="od_status" value="" checked="checked"> 전체</label>
			<label><input type="radio" name="od_status" value="1"> 입금대기</label>
			<label><input type="radio" name="od_status" value="2"> 입금완료</label>
			<label><input type="radio" name="od_status" value="3"> 배송준비</label>
			<label><input type="radio" name="od_status" value="4"> 배송중</label>
			<label><input type="radio" name="od_status" value="5"> 배송완료</label>
			<label><input type="radio" name="od_status" value="6"> 취소</label>
			<label><input type="radio" name="od_status" value="9"> 환불</label>
			<label><input type="radio" name="od_status" value="7"> 반품</label>
			<label><input type="radio" name="od_status" value="8"> 교환</label>
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

<div class="local_ov mart30">
	전체 : <b class="fc_red">34</b> 건 조회
	<select id="page_rows" onchange="location='/admin/order.php?code=list&page=1&page_rows='+this.value;" class="marl5">
		<option value="30" selected="selected">30줄 정렬</option>
		<option value="50">50줄 정렬</option>
		<option value="100">100줄 정렬</option>
		<option value="150">150줄 정렬</option>
	</select>
	<strong class="ov_a">총주문액 : 2,437,700원</strong>
</div>

<form name="forderlist" id="forderlist" method="post">
<input type="hidden" name="q1" value="code=list">
<input type="hidden" name="page" value="1">

<div class="local_frm01">
	<a href="#" id="frmOrderPrint" class="btn_lsmall white"><i class="fa fa-print"></i> 주문서출력</a>
<a href="#" id="frmOrderExcel" class="btn_lsmall white"><i class="fa fa-file-excel-o"></i> 선택 엑셀저장</a>
<a href="./order/order_excel.php?code=list" class="btn_lsmall white"><i class="fa fa-file-excel-o"></i> 검색결과 엑셀저장</a></div>
<div class="tbl_head01">
	<table id="sodr_list">
	<colgroup>
		<col class="w50">
		<col class="w100">
		<col class="w150">
		<col class="w40">
		<col class="w40">
		<col>
		<col class="w60">
		<col class="w80">
		<col class="w80">
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w90">
		<col class="w90">  
		<col class="w90">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">번호</th>
		<th scope="col">주문일시</th>
		<th scope="col">주문번호</th>
		<th scope="col"><input type="checkbox" name="chkall" value="1" onclick="check_all(this.form);"></th>
		<th scope="col" colspan="2">주문상품</th>
		<th scope="col">수량</th>
		<th scope="col">상품금액</th>
		<th scope="col">배송비</th>
		<th scope="col">주문상태</th>
		<th scope="col">판매자</th>
		<th scope="col">주문자</th>
		<th scope="col">수령자</th>
		<th scope="col">총주문액</th>
		<th scope="col">결제방법</th>
		<th scope="col">가맹점</th>
	</tr>
	</thead>
	<tbody>
		<tr class="list0">
				<td rowspan="3">34</td>
		<td rowspan="3">
			24-04-05 11:53			<span class="list_test">테스트</span>		</td>
		<td rowspan="3">
			<a href="http://demofran.com/admin/pop_orderform.php?od_id=24040511530204" onclick="win_open(this,'pop_orderform','1200','800','yes');return false;" class="fc_197">24040511530204</a>
					</td>
		<td rowspan="3">
			<input type="hidden" name="od_id[0]" value="24040511530204">
			<label for="chk_0" class="sound_only">주문번호 24040511530204</label>
			<input type="checkbox" name="chk[]" value="0" id="chk_0">
		</td>
				<td class="td_img"><a href="http://demofran.com/shop/view.php?index_no=14" target="_blank"><img src="http://demofran.com/data/order/2404/24040511530204/thumb-95S2lNwQks3caPhpLyDPjPWygyeCsC_30x30.jpg" width="30" height="30"></a></td>
		<td class="td_itname"><a href="http://demofran.com/admin/goods.php?code=form&w=u&gs_id=14" target="_blank">Mathey-Tissot 심플 서류가방+백팩 블랙세트</a></td>
		<td>1</td>
		<td class="tar">70,000</td>
		<td class="tar">0</td>
		<td>취소</td>
		<td>본사</td>
				<td rowspan="3">
			관리자			<span class="list_mb_id">(admin)</span>		</td>
		<td rowspan="3">관리자</td>
		<td rowspan="3" class="td_price">136,240</td>
		<td rowspan="3">무통장</td>
		<td rowspan="3">본사</td>
				<tr class="list0">
				<td class="td_img"><a href="http://demofran.com/shop/view.php?index_no=20" target="_blank"><img src="http://demofran.com/data/order/2404/24040511530204/thumb-30323_NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_30x30.jpg" width="30" height="30"></a></td>
		<td class="td_itname"><a href="http://demofran.com/admin/goods.php?code=form&w=u&gs_id=20" target="_blank">Guy Laroche 토리노 지퍼 동전 카드케이스 GL-9300-TR-NY</a></td>
		<td>1</td>
		<td class="tar">29,520</td>
		<td class="tar">0</td>
		<td>취소</td>
		<td><span class="sv_wrap">
<a href="javascript:void(0);" class="sv_member">AP-100001</a>
<span class="sv">
<a href="http://demofran.com/admin/pop_memberform.php?mb_id=tubeweb2" onclick="win_open(this,'win_member','1200','600','yes');return false;">회원정보수정</a>
<a href="http://demofran.com/admin/pop_sellerform.php?mb_id=tubeweb2" onclick="win_open(this,'win_seller','1200','600','yes');return false;">공급사정보수정</a>
<a href="http://demofran.com/admin/formmail.php?mb_id=tubeweb2&name=AP-100001&email=2qyUnKnIk5ilmtHHn9JelaLO" onclick="win_open(this,'win_email','650','580','no'); return false;">메일보내기</a>
<a href="http://demofran.com/admin/sms/sms_user.php?ph=01022222222" onclick="win_open(this,'win_sms','300','360','no'); return false;">SMS보내기</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2" target="_blank">쇼핑몰로그인</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2&lg_type=S" target="_blank">공급사로그인</a>
</span>

<noscript class="sv_nojs"><span class="sv">
<a href="http://demofran.com/admin/pop_memberform.php?mb_id=tubeweb2" onclick="win_open(this,'win_member','1200','600','yes');return false;">회원정보수정</a>
<a href="http://demofran.com/admin/pop_sellerform.php?mb_id=tubeweb2" onclick="win_open(this,'win_seller','1200','600','yes');return false;">공급사정보수정</a>
<a href="http://demofran.com/admin/formmail.php?mb_id=tubeweb2&name=AP-100001&email=2qyUnKnIk5ilmtHHn9JelaLO" onclick="win_open(this,'win_email','650','580','no'); return false;">메일보내기</a>
<a href="http://demofran.com/admin/sms/sms_user.php?ph=01022222222" onclick="win_open(this,'win_sms','300','360','no'); return false;">SMS보내기</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2" target="_blank">쇼핑몰로그인</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2&lg_type=S" target="_blank">공급사로그인</a>
</span>
</noscript></span></td>
				<tr class="list0">
				<td class="td_img"><a href="http://demofran.com/shop/view.php?index_no=16" target="_blank"><img src="http://demofran.com/data/order/2404/24040511530204/thumb-l7xUjCx1dy5Tp6GlLAy2zMlRLHhxGx_30x30.jpg" width="30" height="30"></a></td>
		<td class="td_itname"><a href="http://demofran.com/admin/goods.php?code=form&w=u&gs_id=16" target="_blank">Guy Laroche 사피아노 핸들 카드케이스 GL-9307-OR</a></td>
		<td>1</td>
		<td class="tar">36,720</td>
		<td class="tar">0</td>
		<td>취소</td>
		<td>본사</td>
				<tr class="list1">
				<td rowspan="2">33</td>
		<td rowspan="2">
			24-04-04 16:42			<span class="list_test">테스트</span>		</td>
		<td rowspan="2">
			<a href="http://demofran.com/admin/pop_orderform.php?od_id=24040416420267" onclick="win_open(this,'pop_orderform','1200','800','yes');return false;" class="fc_197">24040416420267</a>
					</td>
		<td rowspan="2">
			<input type="hidden" name="od_id[1]" value="24040416420267">
			<label for="chk_1" class="sound_only">주문번호 24040416420267</label>
			<input type="checkbox" name="chk[]" value="1" id="chk_1">
		</td>
				<td class="td_img"><a href="http://demofran.com/shop/view.php?index_no=19" target="_blank"><img src="http://demofran.com/data/order/2404/24040416420267/thumb-10228_95S2lNwQks3caPhpLyDPjPWygyeCsC_30x30.jpg" width="30" height="30"></a></td>
		<td class="td_itname"><a href="http://demofran.com/admin/goods.php?code=form&w=u&gs_id=19" target="_blank">[루이까또즈] 넥타이 네이비 LW705ST03-N-75</a></td>
		<td>1</td>
		<td class="tar">38,730</td>
		<td class="tar">0</td>
		<td>취소</td>
		<td><span class="sv_wrap">
<a href="javascript:void(0);" class="sv_member">AP-100001</a>
<span class="sv">
<a href="http://demofran.com/admin/pop_memberform.php?mb_id=tubeweb2" onclick="win_open(this,'win_member','1200','600','yes');return false;">회원정보수정</a>
<a href="http://demofran.com/admin/pop_sellerform.php?mb_id=tubeweb2" onclick="win_open(this,'win_seller','1200','600','yes');return false;">공급사정보수정</a>
<a href="http://demofran.com/admin/formmail.php?mb_id=tubeweb2&name=AP-100001&email=2qyUnKnIk5ilmtHHn9JelaLO" onclick="win_open(this,'win_email','650','580','no'); return false;">메일보내기</a>
<a href="http://demofran.com/admin/sms/sms_user.php?ph=01022222222" onclick="win_open(this,'win_sms','300','360','no'); return false;">SMS보내기</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2" target="_blank">쇼핑몰로그인</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2&lg_type=S" target="_blank">공급사로그인</a>
</span>

<noscript class="sv_nojs"><span class="sv">
<a href="http://demofran.com/admin/pop_memberform.php?mb_id=tubeweb2" onclick="win_open(this,'win_member','1200','600','yes');return false;">회원정보수정</a>
<a href="http://demofran.com/admin/pop_sellerform.php?mb_id=tubeweb2" onclick="win_open(this,'win_seller','1200','600','yes');return false;">공급사정보수정</a>
<a href="http://demofran.com/admin/formmail.php?mb_id=tubeweb2&name=AP-100001&email=2qyUnKnIk5ilmtHHn9JelaLO" onclick="win_open(this,'win_email','650','580','no'); return false;">메일보내기</a>
<a href="http://demofran.com/admin/sms/sms_user.php?ph=01022222222" onclick="win_open(this,'win_sms','300','360','no'); return false;">SMS보내기</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2" target="_blank">쇼핑몰로그인</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb2&lg_type=S" target="_blank">공급사로그인</a>
</span>
</noscript></span></td>
				<td rowspan="2">
			11111111			<span class="list_mb_id">(비회원)</span>		</td>
		<td rowspan="2">11111111</td>
		<td rowspan="2" class="td_price">58,890</td>
		<td rowspan="2">무통장</td>
		<td rowspan="2">본사</td>
				<tr class="list1">
				<td class="td_img"><a href="http://demofran.com/shop/view.php?index_no=10" target="_blank"><img src="http://demofran.com/data/order/2404/24040416420267/thumb-Dqpxzw59F3Pzg9PrtDe9tSmaUCF7tu_30x30.jpg" width="30" height="30"></a></td>
		<td class="td_itname"><a href="http://demofran.com/admin/goods.php?code=form&w=u&gs_id=10" target="_blank">선인장 자수패치 반팔T</a></td>
		<td>2</td>
		<td class="tar">20,160</td>
		<td class="tar">0</td>
		<td>취소</td>
		<td>본사</td>
				<tr class="list0">
				<td rowspan="1">32</td>
		<td rowspan="1">
			24-03-22 11:45			<span class="list_test">테스트</span>		</td>
		<td rowspan="1">
			<a href="http://demofran.com/admin/pop_orderform.php?od_id=24032211451267" onclick="win_open(this,'pop_orderform','1200','800','yes');return false;" class="fc_197">24032211451267</a>
					</td>
		<td rowspan="1">
			<input type="hidden" name="od_id[2]" value="24032211451267">
			<label for="chk_2" class="sound_only">주문번호 24032211451267</label>
			<input type="checkbox" name="chk[]" value="2" id="chk_2">
		</td>
				<td class="td_img"><a href="http://demofran.com/shop/view.php?index_no=12" target="_blank"><img src="http://demofran.com/data/order/2403/24032211451267/thumb-NcEq6PgZABZ4yTEDMfbc7CMZjFb4w8_30x30.jpg" width="30" height="30"></a></td>
		<td class="td_itname"><a href="http://demofran.com/admin/goods.php?code=form&w=u&gs_id=12" target="_blank">[벨카리노] 안틱캐주얼 투타임 블랙 남녀공용 손목시계 [BC97042B]</a></td>
		<td>1</td>
		<td class="tar">60,060</td>
		<td class="tar">0</td>
		<td>취소</td>
		<td>본사</td>
				<td rowspan="1">
			<span class="sv_wrap">
<a href="javascript:void(0);" class="sv_member">한글만</a>
<span class="sv">
<a href="http://demofran.com/admin/pop_memberform.php?mb_id=tubeweb1" onclick="win_open(this,'win_member','1200','600','yes');return false;">회원정보수정</a>
<a href="http://demofran.com/admin/formmail.php?mb_id=tubeweb1&name=%ED%95%9C%EA%B8%80%EB%A7%8C&email=2qyUnKnIk5elmtHHn9JelaLO" onclick="win_open(this,'win_email','650','580','no'); return false;">메일보내기</a>
<a href="http://demofran.com/admin/sms/sms_user.php?ph=01011111111" onclick="win_open(this,'win_sms','300','360','no'); return false;">SMS보내기</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb1" target="_blank">쇼핑몰로그인</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb1&lg_type=P" target="_blank">가맹점로그인</a>
</span>

<noscript class="sv_nojs"><span class="sv">
<a href="http://demofran.com/admin/pop_memberform.php?mb_id=tubeweb1" onclick="win_open(this,'win_member','1200','600','yes');return false;">회원정보수정</a>
<a href="http://demofran.com/admin/formmail.php?mb_id=tubeweb1&name=%ED%95%9C%EA%B8%80%EB%A7%8C&email=2qyUnKnIk5elmtHHn9JelaLO" onclick="win_open(this,'win_email','650','580','no'); return false;">메일보내기</a>
<a href="http://demofran.com/admin/sms/sms_user.php?ph=01011111111" onclick="win_open(this,'win_sms','300','360','no'); return false;">SMS보내기</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb1" target="_blank">쇼핑몰로그인</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb1&lg_type=P" target="_blank">가맹점로그인</a>
</span>
</noscript></span>			<span class="list_mb_id">(tubeweb1)</span>		</td>
		<td rowspan="1">한글만</td>
		<td rowspan="1" class="td_price">60,060</td>
		<td rowspan="1">무통장</td>
		<td rowspan="1"><span class="sv_wrap">
<a href="javascript:void(0);" class="sv_member">한글만</a>
<span class="sv">
<a href="http://demofran.com/admin/pop_memberform.php?mb_id=tubeweb1" onclick="win_open(this,'win_member','1200','600','yes');return false;">회원정보수정</a>
<a href="http://demofran.com/admin/formmail.php?mb_id=tubeweb1&name=%ED%95%9C%EA%B8%80%EB%A7%8C&email=2qyUnKnIk5elmtHHn9JelaLO" onclick="win_open(this,'win_email','650','580','no'); return false;">메일보내기</a>
<a href="http://demofran.com/admin/sms/sms_user.php?ph=01011111111" onclick="win_open(this,'win_sms','300','360','no'); return false;">SMS보내기</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb1" target="_blank">쇼핑몰로그인</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb1&lg_type=P" target="_blank">가맹점로그인</a>
</span>

<noscript class="sv_nojs"><span class="sv">
<a href="http://demofran.com/admin/pop_memberform.php?mb_id=tubeweb1" onclick="win_open(this,'win_member','1200','600','yes');return false;">회원정보수정</a>
<a href="http://demofran.com/admin/formmail.php?mb_id=tubeweb1&name=%ED%95%9C%EA%B8%80%EB%A7%8C&email=2qyUnKnIk5elmtHHn9JelaLO" onclick="win_open(this,'win_email','650','580','no'); return false;">메일보내기</a>
<a href="http://demofran.com/admin/sms/sms_user.php?ph=01011111111" onclick="win_open(this,'win_sms','300','360','no'); return false;">SMS보내기</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb1" target="_blank">쇼핑몰로그인</a>
<a href="http://demofran.com/admin/admin_ss_login.php?mb_id=tubeweb1&lg_type=P" target="_blank">가맹점로그인</a>
</span>
</noscript></span><span class="list_mb_id">(tubeweb1)</span></td>
				
				 
				
				
				</tbody>
	</table>
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
