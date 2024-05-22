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
<link rel="stylesheet" href="http://demofran.com/admin/css/admin.css?ver=20240502140624">
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<script>

</script>
<script type="text/javascript" src="/trendproject/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/trendproject/js/jquery-ui.js"></script>  
</head>

<script>

$(function(){
	$("#btn_submit").click(function(){
		let myform = $("#categoryform").serialize();
		
		$.ajax({
			data:myform,
			url:"categorySave.do",
			type:"post",
			datatype:"json",
			success:function(data){
				if(data.result == "0"){
					alert("저장완료");
					location:"adminCategory.do";
				}else if (data.result == "1"){
					alert("저장실패")
				}
			},
			error:function(){
				alter("전송실패");
			}
		});
		
		
	});
});

</script>




<body>

<%@ include file = "../include/admin_head.jsp" %>

<div id="wrapper">
	
<div id="snb">
	<div class="snb_header ico_config">
		<h2><i class="fa fa-sitemap"></i>카테고리 관리</h2>
	</div>
		<dl>
			<dt class="c10 menu_toggle">카테고리 관리</dt>		
			<dd class="c10 active"><a href="adminCategory.do">카테고리 관리</a></dd>		
		</dl>
	</div>
	<div id="content">
		<div class="breadcrumb">
			<span>HOME</span> <i class="ionicons ion-ios-arrow-right"></i> 카테고리 관리 <i class="ionicons ion-ios-arrow-right"></i> 카테고리 관리		</div>
	
<div class="s_wrap">
	<h1>카테고리 관리</h1>
	
<h2>카테고리 등록</h2>
<form id="categoryform">

<div class="tbl_frm01">
	<table>
	<colgroup>
		<col class="w140">
		<col>
	</colgroup>
	<tbody>
	<tr>
		<th scope="row">카테고리 소속</th>
		<td>
			
			<select id="sel_ca1" name="sel_ca1" multiple style="width:170px; height:200px;">
			
				<option value="">=대분류목록=</option>
				<c:forEach var="catelist1" items="${CategoryList1}">
				<option value="">${catelist1.catelcode }</option>
				</c:forEach>
			</select>
			
			<select id="sel_ca2" name="sel_ca2" multiple style="width:170px; height:200px;">
				<option value="">=중분류목록=</option>
				<c:forEach var="catelist2" items="${CategoryList2}">
				<option value="">${catelist2.catemcode }</option>
				</c:forEach>
				
			</select>
			
			<select id="sel_ca3" name="sel_ca3" multiple style="width:170px; height:200px;">
				<option value="">=소분류목록=</option>
				<c:forEach var="catelist3" items="${CategoryList3}">
				<option value="">${catelist3.catescode }</option>
				</c:forEach>
			</select>	
						
		</td>
	</tr>
	<tr>
		<th scope="row">카테고리 등록</th>
		<td>
			<select id="sel_ca3" name="sel_ca3" >
				<option value="catelcode">대분류</option>
				<option value="catemcode">중분류</option>
				<option value="catescode">소분류</option>
			</select>
			
			<input type="text" name="catename"  id="catecode" class="frm_input required" size="50">
		</td>
	</tr>
	
	
	</tbody>
	</table>
</div>
<div class="btn_confirm">
	
	<button type="button" class="btn_large" id="btn_submit" >저장</button>
</div>
</form>


</div>

</div>
</div>
<%@ include file = "../include/admin_footer.jsp" %>


<div id="ajax-loading"><img src="http://demofran.com/img/ajax-loader.gif"></div>
<div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>



<script src="http://demofran.com/js/wrest.js"></script>
</body>
</html>
