<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
    
#div_modal2 {	
	display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 반투명한 검은색 배경 */
    z-index: 998;
}

#div_modal1 {
	display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    padding-left:35px;
    transform: translate(-50%, -50%);
    background-color: white;
    width: 920px;
    height:	700px;
    border-radius: 5px;
    overflow-y: auto; /* 세로 스크롤 추가 */
    z-index: 999;
}

#lev {
	width:100%;
	margin:30px 0 20px 0;
	position: relative; 
}

#lev b {
 	display: block;
	text-align:center;
	font-size:20px;
}

#close {
	position: absolute; /* 절대적으로 위치시키기 위해 */
    top: 0; /* 부모 요소 기준으로 위쪽으로 정렬 */
    right: 0; /* 부모 요소 기준으로 오른쪽으로 정렬 */
    margin-top: 10px; /* 원하는 여백 추가 */
    margin-right: 40px; 
}

.myinfo p {
	cursor:pointer;
}

.mylist ul li a.active {
    font-weight: bold;
}
</style>
    
<script>
function lev_modal() {
	document.getElementById("div_modal1").style.display = "block";
	document.getElementById("div_modal2").style.display = "block";
	document.body.style.overflow = "hidden";
}
function lev_close() {
	document.getElementById("div_modal1").style.display = "none";
	document.getElementById("div_modal2").style.display = "none";
	document.body.style.overflow = "auto";
}

$(document).ready(function(){
    var url = window.location.href;
    $(".mylist a").each(function(){
        if(url.indexOf($(this).attr("href")) != -1){
            $(this).addClass("active");
        }
    });
});

</script>

<div class="myinfo">

	<span><img src="/trendproject/images/shopping/user.png" width=50px;></span>
	<div class="gr">
		<b>${vo.name}님</b><br>
		<p onclick="lev_modal()">${vo2.grade} 등급혜택 ></p>				
	</div>
	
	<div class="bc">
		<ul>		
			<li>
				<a href="bmoney.jsp"><b>B머니</b><br>0원</a>			
			</li>
			<li>
				<a href="coupon.jsp"><b>쿠폰</b><br>0장</a>
			</li>
		</ul>
	</div>
	
</div>

<div class="mylist">
		<ul>
			<li><a class="nav-item nav-link" href="order.do">주문/배송내역</a></li>		
			<li><a class="nav-item nav-link" href="resalelist.do">판매내역</a></li>	
			<li><a class="nav-item nav-link" href="user.do">내 정보 관리</a></li>	
			<li><a class="nav-item nav-link" href="myreview.do">리뷰</a></li>	
			<li><a class="nav-item nav-link" href="myqna.do">문의 내역</a></li>
			<li><a class="nav-item nav-link" href="notice.do">공지사항</a></li>	
			<li><a class="nav-item nav-link" href="center.do">고객센터</a></li>	
		</ul>	
	</div>
	

	<div id="div_modal2"></div>
		
		<div id="div_modal1">
		
		<div id="lev">
			<b>등급별 B머니 안내</b>
			<button id="close" onclick="lev_close()">X</button>	
		</div>
		<img src="/trendproject/images/shopping/level.PNG">

		</div>
	