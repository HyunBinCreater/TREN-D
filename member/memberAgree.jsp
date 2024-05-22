<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="/trendproject/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>TREN:D</title>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<link rel="icon" href="../favicon.ico" type="image/x-icon">
	<script src="/trendproject/js/jquery-3.6.0.js"></script>
 	<script src="/trendproject/js/jquery-ui.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/blog/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="/trendproject/css/bootstrap.min.css" rel="stylesheet">
<link href="/trendproject/css/sign-in.css" rel="stylesheet">
    
 <script src="https://t1.kakaocdn.net/kakao_js_sdk/${VERSION}/kakao.min.js"
  integrity="${INTEGRITY_VALUE}" crossorigin="anonymous"></script>   

    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/trendproject/css/blog.css" rel="stylesheet">
  </head>
 
 <style>
 	/* 회원가입 약관 */
.contract {
    width: 700px; margin: 50px auto 80px; padding: 20px 40px 50px;
    border-radius: 30px; background-color: #FAFAFA; 
}
.contract h1 {text-align: center;}
.contract .text {
    height: 230px; border: 1px solid black; background-color: white;
    white-space: pre-line; overflow-y: scroll; margin: 0 auto 20px;
}
.contract p {text-align: right;}
.contract .box {width: 100px; height: 40px;  padding: 8px; margin: 0 3px;}
 
 </style>
 
 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
 <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
 <script>

$(function(){


		$("#allcheck").click(function(){
		
			if($("#allcheck").prop("checked")) {
				$("input[name=chk]").prop("checked",true)
			} else {
				$("input[name=chk]").prop("checked",false)
			}
		})
	
		$("#btn_submit").click(function(){
					
			if(!$("input:checked[id='chk1']").is(":checked")) {
				alert("회원가입 약관 동의는 필수 입니다.")
			} else if (!$("input:checked[id='chk2']").is(":checked")) {
				alert("개인정보 처리 동의함은 필수 입니다.")
			} else{	
				location="memberWrite.do"
			}
				
		})
	
});
  </script> 
 
  <body>
    

<div class="container">

<%@ include file = "../include/header.jsp"%>
<%@ include file = "../include/nav.jsp"%>

</div>

<main>
        <form class="contract">
           <h1>회원가입 약관 동의</h1>         
                <p style="color: #e8180c; text-align: center;">회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.</p>                             
                    <h2 style="font-size: 12px; margin: 0 0 20px; text-align: center;">회원가입약관</h2>
                     <div class="text">
						<%@ include file = "../include/agreement1.jsp" %>
                  	 </div>
                    <fieldset  style="padding: 10px 0 0; text-align: right;">
                        <label for="chk1">회원가입약관의 내용에 동의합니다.(필수)</label>
                        <input type="checkbox" name="chk" id="chk1" class="checkbox">
                    </fieldset>
                </section>
                <section style="margin: 0 0 20px; padding: 20px 0;">
                    <h2 style="margin: 0 0 20px; text-align: center; font-size: 12px;">개인정보처리방침안내</h2>
                     <div class="text">
                  	  <%@ include file = "../include/agreement2.jsp" %>
              	     </div>
                    <fieldset class="fregister_agree" style="padding: 10px 0 0; text-align: right;">
                        <label for="chk2">개인정보처리방침안내의 내용에 동의합니다.(필수)</label>
                        <input type="checkbox" name="chk" id="chk2" class="checkbox">
                    </fieldset>
                </section>
                <section style="margin: 0 0 20px; text-align:right;">
                	<label for="allcheck">모두 동의합니다.</label>
                    <input type="checkbox" name="allcheck" id="allcheck" class="checkbox">
                </section>
                <div style="text-align: center;">
                   <button type="button" id="btn_submit" onclick="btn_submit(); return false;" class="btn btn-sm btn-outline-secondary">회원가입</button>
                </div>
    
         
        </div>
    </div>
	</form>
</main>
  <%@ include file = "../include/footer.jsp"%>
  

<script src="/trendproject/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
