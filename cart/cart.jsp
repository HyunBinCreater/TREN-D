<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" 	   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 	   uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">
    <title>장바구니</title>
    <script src="/trendproject/assets/js/color-modes.js"></script>
    <script src="/trendproject/js/jquery-3.6.0.js"></script>
    <script src="/trendproject/js/jquery-ui.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/blog/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="/trendproject/css/bootstrap.min.css" rel="stylesheet">
    <link href="/trendproject/css/slide.css" rel="stylesheet">
    <link href="/trendproject/css/carousel.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/trendproject/css/blog.css" rel="stylesheet">

<style>
    h1 {
        margin-top: 50px;
        font-size: 30px;
        font-weight: bold;
    }

    .cart1 {
        margin-top: 50px;
        margin-bottom: -30px;
        width: 100%;
    }

    .all_price {
        font-size: 20px;
        font-weight: bold;
    }

    .cart1_table {
        width: 100%;
        text-align: center;
        border: 1px solid #dedede;
        white-space: nowrap;
    }

    .cart1_table th,
    td {
        padding: 15px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        -webkit-box-orient: vertical;
    }

    .cart1_table th {
        color: #555555;
        font-size: 15px;
        font-weight: bold;
        border-right: 1px solid #dedede;
        border-bottom: 1px solid #dedede;
        background-color: #f7f7f7;
    }

    .cart1_table td {
        padding: 15px;
        border-right: 1px solid #dedede;
        border-bottom: 1px solid #dedede;
    }

    .cart2_table {
        margin-top: 70px;
        margin-bottom: 40px;
        width: 100%;
        border: 1px solid #dedede;
        border-top: 3px solid #131313;
        padding: 15px;
    }

    .cart2_table th,
    td {
        padding: 10px;
    }

    .cart2_table th {}

    .cart2_table td {
        border-right: 1px solid #dedede;
        border-collapse: collapse;
        text-align: right;
    }

    .cart2 {
        width: 100%;
        overflow: auto;
        overflow-x: scroll;
    }

    .amount_button {
        display: flex;
        align-items: center;
        margin-top: 15px;
    }

    .minus_button {
        background-color: transparent;
        border: none;
    }

    .plus_button {
        background-color: transparent;
        border: none;
    }

</style>

<script>    

document.addEventListener('DOMContentLoaded', function() {
    // 페이지 로드 시 초기화
    updateTotalPrice();

    var allCheck = document.getElementById('all_check');
    var eachChecks = document.querySelectorAll('#each_check');

    allCheck.addEventListener('click', function() {
        eachChecks.forEach(function(check) {
            check.checked = allCheck.checked;
        });
        updateTotalPrice();
    });

    eachChecks.forEach(function(check) {
        check.addEventListener('click', function() {
            updateTotalPrice();
        });
    });

    var minusButtons = document.querySelectorAll('.minus_button');
    var plusButtons = document.querySelectorAll('.plus_button');

    minusButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            var cartAmountInput = button.nextElementSibling; // 형제 노드의 input 요소를 찾음
            var currentValue = parseInt(cartAmountInput.value);
            if (currentValue > 1) {
                cartAmountInput.value = currentValue - 1;
                updateFinalPrice(cartAmountInput); // 값을 변경한 후에 최종 가격 업데이트
                updateTotalPrice(); // 값을 변경한 후에 총 가격 업데이트
            }
        });
    });

    plusButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            var cartAmountInput = button.previousElementSibling; // 형제 노드의 input 요소를 찾음
            var currentValue = parseInt(cartAmountInput.value);
            cartAmountInput.value = currentValue + 1;
            updateFinalPrice(cartAmountInput); // 값을 변경한 후에 최종 가격 업데이트
            updateTotalPrice(); // 값을 변경한 후에 총 가격 업데이트
        });
    });
});

function updateTotalPrice() {
    var totalPrice = 0;
    var totalItems = 0;
    var checkedCheckboxes = document.querySelectorAll('#each_check:checked');

    checkedCheckboxes.forEach(function(checkbox) {
        var row = checkbox.parentNode.parentNode;

        var amountCell = row.querySelector('.cartamount');
        var amount = parseInt(amountCell.value);

        var priceCell = row.querySelector('.price');
        var price = parseFloat(priceCell.textContent.replace(/[^0-9.-]+/g, ''));

        var finalPrice = price * amount;

        totalPrice += finalPrice;
        totalItems += amount;
    });

    var totalPriceSpan = document.querySelector('.all_price span:last-child');
    var totalItemsSpan = document.querySelector('.all_price span:first-child');
    totalPriceSpan.textContent = totalPrice.toLocaleString() + "원";
    totalItemsSpan.textContent = totalItems + "개";

    // 총 상품 가격 및 상품 수 업데이트
    var totalPriceItemsSpan = document.querySelector('.total_price_items');
    var totalItemsCountSpan = document.querySelector('.total_items');
    totalPriceItemsSpan.textContent = totalPrice.toLocaleString() + "원";
    totalItemsCountSpan.textContent = totalItems + "개";

    // 최종구매가 계산 및 업데이트
    var finalPurchasePriceSpan = document.querySelector('.total_price'); // 최종구매가를 가리키는 클래스로 변경
    finalPurchasePriceSpan.textContent = totalPrice.toLocaleString() + "원";
}

function updateFinalPrice(input) {
    var row = input.parentNode.parentNode.parentNode; // 부모 노드로부터 행 가져오기
    var amount = parseInt(input.value); // 변경된 수량 가져오기
    var priceCell = row.querySelector('.price'); // 가격 셀 가져오기
    var price = parseFloat(priceCell.textContent.replace(/[^0-9.-]+/g, '')); // 셀의 텍스트에서 가격 가져오기
    var finalPriceCell = row.querySelector('.finalprice'); // 최종 가격 셀 가져오기
    finalPriceCell.textContent = (price * amount).toLocaleString() + "원"; // 최종 가격 업데이트
}
	
$(function(){
    $(".minus_button").click(function(){
        updateCartAmount($(this).closest("tr"));
    });

    $(".plus_button").click(function(){
        updateCartAmount($(this).closest("tr"));
    });
});

function updateCartAmount(row) {
    let myform = row.find("input, select, textarea").serialize();


    function updateCartAmount() {
        let myform = $("#frm").serialize();
        
        $.ajax({
            data: myform, 
            url: "cartAmountUpdate.do",
            type: "post",
            dataType: "json",
         
            success: function(data) {
                if(data.result == "0") {
                    alert("추가 정보가 저장되었습니다.");
                    location.reload();
                } else if(data.result == "1") {
                    alert("추가 정보 저장에 실패하였습니다.");
                }
            },
            error: function() {
                alert("전송실패!");

||||||| .r78
=======
    alert(myform); // 폼 데이터가 올바르게 직렬화되었는지 확인

>>>>>>> .r82
    $.ajax({
        data: myform, 
        url: "cartAmountUpdate.do",
        type: "post",
        dataType: "json",
        success: function(data) {
            if(data.result == "0") {
                alert("추가 정보가 저장되었습니다.");
                location.reload();
            } else {
                alert("추가 정보 저장에 실패하였습니다.");
            }
        });
    }
});
$(function(){
	
	$("#btn_delete").click(function(){
		
		let myform = $("#frm").serialize();

		$.ajax({  // ajax :: 비동기전송방식
			data:myform, 
			url :"cartItemDelete.do",
			type:"post",
	      	datatype:"json",    // json
			success:function(data) {
				if(data.result == "0") {
					alert("삭제완료");
					location.reload();
				} else if(data.result == "1") {
					alert("삭제실패!");
				}
			},
			error:function() { 
				alert("전송실패!");
			}
		});
	});
});

    </script>
</head>

<body>

    <div class="container">

        <%@ include file = "../include/header.jsp"%>

        <%@ include file = "../include/nav.jsp"%>

    </div>

    <main class="container">
    
    <form id="frm">
    
    <h1> 장바구니</h1>
    <div class="cart1">
        <span class="all_price">총 <span style="color:#41c09a;">0개</span> : <span>0원</span></span>
        <div class="p-4 p-md-5" style="text-align:right; margin-top:-80px; margin-right:-30px;">
            <button type="button" id="delete_button" class="btn btn-light rounded-pill px-3">선택삭제(1)</button>
        </div>
    </div>
    <div class="cart2">
        <table class="cart1_table">
            <colgroup>
                <col width="10%" />
                <col width="35%" />
                <col width="15%" />
                <col width="15%" />
                <col width="15%" />
                <col width=* />
            </colgroup>
            <tr>
                <th><input type="checkbox" class="form-check-input" id="all_check"></th>
                <th>상품정보</th>
                <th>적립금</th>
                <th>판매가</th>
                <th>최종구매가</th>
                <th>삭제</th>
            </tr>
            <c:forEach var="cartList" items="${cartList}">
                <tr>
                    <td><input type="checkbox" class="form-check-input" id="each_check" onchange="updateTotalPrice()"></td>
                    <td style="text-align:left;">
                        <img src="/trendproject/images/upload/${cartList.filename}.jpg" width=20% style="float:left; margin-right:7%; padding:0px;">
                        <b>${cartList.brand }</b><br> 
                        <c:if test="${cartList.productType == 'used'}">
                            <input type="hidden" name="usedprounq" value="${cartList.usedprounq}" />
                            [중고]
                        </c:if>
                        <c:if test="${cartList.productType != 'used'}">
                            <input type="hidden" name="prounq" value="${cartList.prounq}" />
                        </c:if>
                        ${cartList.name }<br>
                        <input type="hidden" name="cartcode" value="${cartList.cartcode }">
                        <div class="amount_button">
                            <button type="button" class="minus_button" name="minus_button" onclick="return false;">-</button>&nbsp;&nbsp;
                            <input type="text" class="form-control cartamount" name="amount" readonly value="${cartList.amount }" style="width:25%; text-align:right;">&nbsp;&nbsp;
                            <button type="button" class="plus_button" name="plus_button" onclick="return false;">+</button>
                        </div>
                    </td>
                    <td>최대 <fmt:formatNumber value="${cartList.price * 0.018}" pattern="###,###원" /></td>
                    <td class="price"><fmt:formatNumber value="${cartList.price}" pattern="###,###원" /></td>
                    <td class="finalprice"><fmt:formatNumber value="${cartList.price * cartList.amount}" pattern="###,###원" /></td>
                    <td><button type="button" id="btn_delete" class="btn btn-light rounded-pill px-3">삭제</button></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <table class="cart2_table">
        <colgroup>
            <col width="*" />
            <col width="20%;" />
            <col width="55%" />
        </colgroup>
        <tr>
            <th>주문 상품 수</th>
            <td><span class="total_items">0개</span></td>
            <td rowspan="2">최종구매가 <span class="total_price"> - 원</span></td>
        </tr>
        <tr>
            <th>총 상품 가격</th>
            <td><span class="total_price_items">0원</span></td>
        </tr>
    </table>
</form>


    </main>

    <%@ include file = "../include/footer.jsp"%>

</body>

</html>
               