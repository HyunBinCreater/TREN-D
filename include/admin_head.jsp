<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<link rel="shortcut icon" href="http://demofran.com/data/banner/JnLfWUSUyR6sXJP5n3Re4Fvdc93k93.ico" type="image/x-icon">
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var tb_url		 = "http://demofran.com";
var tb_bbs_url	 = "http://demofran.com/bbs";
var tb_shop_url  = "http://demofran.com/shop";
var tb_admin_url = "http://demofran.com/admin";
</script>
<script type="text/javascript" src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>

    
    <header id="hd">
	<div id="hd_wrap">
		<h1>행복을 주는 쇼핑몰!</h1>
		<div id="logo"><a href="adminMain.do"><img src="http://demofran.com/admin/img/logo.gif" alt="행복을 주는 쇼핑몰! 관리자"></a></div>
		<div id="tnb">
			<ul>
				<li><a href="adminMain.do">관리자홈</a></li>
				<li><a href="" target="_blank">쇼핑몰</a></li>
				<li id="tnb_logout"><a href="">로그아웃</a></li>
			</ul>
		</div>

		<nav id="gnb">
			<h2>관리자 주메뉴</h2>
			<ul id="gnb_1dul">
				<li class="gnb_1dli">
					<a href="adminMember.do" class="gnb_1da">회원관리</a>
				</li>
				<li class="gnb_1dli">
					<a href="adminCategory.do" class="gnb_1da">카테고리 관리</a>
				</li>
				<li class="gnb_1dli">
					<a href="adminProduct.do" class="gnb_1da">상품관리</a>
				</li>
				<li class="gnb_1dli">
					<a href="adminOrder.do" class="gnb_1da">주문관리</a>
				</li>
				<li class="gnb_1dli">
					<a href="" class="gnb_1da">통계분석</a>
				</li>
				<li class="gnb_1dli">
					<a href="" class="gnb_1da">고객지원</a>
				</li>
			</ul>
		</nav>
		
	</div>
</header>