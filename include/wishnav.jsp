<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<style>
.wish1 {
	margin:30px 0px 30px 0px;
	width:100%;
	text-align:left;
}

.wish1 li {
   	display:inline-block;
   	padding-right:20px;
   	border-right:1px solid #dedede;
   	font-size:22px;
   	font-weight:bold;	
}

.wish1 li:last-child {
	border-right:none;
	padding-left:10px;
}
</style>

    <c:if test="${type == 'wishProduct'}">
    	<c:set var="wpfont" value="bold"/>
    	<c:set var="wbfont" value="normal"/>
    </c:if>
    
    <c:if test="${type == 'wishBrand'}">
    	<c:set var="wpfont" value="normal"/>
    	<c:set var="wbfont" value="bold"/>
    </c:if>
    
    <div class="wish1">
		<ul>
			<li>
                <a href="wishList.do" style="font-weight:${wpfont};">찜한 상품</a>
            </li>
            <li>
                <a href="wishBrand.do" style="font-weight:${wbfont};">찜한 브랜드</a>
            </li>
		</ul>
	</div>