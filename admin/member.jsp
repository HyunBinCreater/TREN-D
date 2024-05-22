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
<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240416233111">
<link type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css" rel="stylesheet">
<link type="text/css" href="http://demofran.com/plugin/jquery-ui/style.css?ver=20240416233111">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<script type="text/javascript" src="/trendproject/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/trendroject/js/jquery-ui.js"></script>
</head>
<script>

function fn_action(n) {
	//document.hiddenForm.unq.value = n;
	//document.hiddenForm.action = "uploadDetail.do";
	//document.hiddenForm.submit();
	$("#unq").val(n);
	$("#hiddenForm").attr("action","adminMemberModify.do");
	$("#hiddenForm").submit(); 
}

function fn_commPagging(n) {
	document.searchForm.pageIndex.value = n;
	document.searchForm.submit();
}


</script>

<body>

<%@ include file = "../include/admin_head.jsp" %>

<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config">
		<h2><i class="ionicons ion-ios-people fs40"></i>회원관리</h2>
	</div>
		<dl>
			<dt class="m10 menu_toggle">회원관리</dt>		
			<dd class="m10 active"><a href="adminMember.do">회원 정보관리</a></dd>			
			<dd class="m10"><a href="adminMemberWrite.do">회원 등록하기</a></dd>		
			<dd class="m10"><a href="http://demofran.com/admin/member.php?code=point">회원 마일리지 관리</a></dd>			
		</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"> </i> 회원관리 <i class="ionicons ion-ios-arrow-right"></i> 회원 정보관리		</div>
	
<div class="s_wrap">
	<h1>회원 정보관리</h1>
	
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/jquery-ui.min.js"></script>

<h2>기본검색</h2>
<form name="fsearch" id="fsearch">

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
				<option value="id">아이디</option>
				<option value="name">회원명</option>
				
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

<div class="local_ov mart30">
	총 회원수 : <b class="fc_red">${memberSelectcnt }</b>명
</div>
<div class="local_frm01">
<a href="adminMemberWrite.do" class="fr btn_lsmall red"><i class="ionicons ion-android-add"></i> 회원추가</a></div>
<div class="tbl_head01">
	<table>
	<colgroup>
		<col class="w50">
		<col class="w130">
		<col class="w150">
		<col>
		<col class="w130">
		<col class="w100">
		<col class="w130">
		<col class="w60">
		<col class="w90">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">번호</th>
		<th scope="col">아이디</th>
		<th scope="col">회원명</th>
		<th scope="col">회원등급</th>
		<th scope="col">성별</th>
		<th scope="col">핸드폰</th>
		<th scope="col">생년월일</th>
		<th scope="col">총 구매금액</th>
		<th scope="col">마일리지</th>
	</tr>
	</thead>
	<tbody class="list">
	
	
	<c:forEach var="list" items="${memberselectlist}">
	
	<tr class="list0">
		<td>3</td>
		<td class="tal"><span class="sv_wrap">
			<a href="#" onclick="fn_action('${list.unq}')" class="sv_member">${list.userid }</a>
		</td>
		<td class="tal" align="center">${list.name }</td>
		<td>${list.grade }</td>
		<td class="tal">${list.gender }</td>
		<td>${list.mobile }</td>
		<td>${list.birth }</td>
		<td>${list.totalpay }</td>
		<td class="tar">${list.mileage }</td>
	</tr>
	
</c:forEach>
	
	</table>
	<div style="text-align:center;">
	<a href="javascript:fn_commPagging('1')">[처음으로]</a>

		<c:if test="${vo.firstPno > 1}">
			<a href="javascript:fn_commPagging('${vo.firstPno-1 }')">[이전]</a>
		</c:if>

		<c:forEach var="p" begin="${vo.firstPno }" end="${vo.lastPno }">
			<c:if test="${vo.pageIndex == p }">
				<b><font color="red">${p }</font></b>
			</c:if>
			<c:if test="${vo.pageIndex != p }">
				<a href="javascript:fn_commPagging('${p }')">${p }</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${vo.lastPno < vo.totalPageCnt}">
			<a href="javascript:fn_commPagging('${vo.lastPno+1 }')">[다음]</a>
		</c:if>
		<a href="javascript:fn_commPagging('${vo.totalPageCnt }')">[마지막페이지]</a>
	</div>
</div>
</div>

</div>
</div>

	
<%@ include file = "../include/admin_footer.jsp" %>


<div id="ajax-loading"><img src="http://demofran.com/img/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>



<script src="http://demofran.com/js/wrest.js"></script>


<form name="hiddenForm" id="hiddenForm" >
	<input type="hidden" name="unq" id="unq" value="">
</form>


</body>
</html>
