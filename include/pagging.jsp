<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function fn_commPagging(n) {
	document.searchForm.pageIndex.value = n;
	document.searchForm.submit();
}
</script>
<body>
		<a href="javascript:fn_commPagging('1')">[처음으로]</a>

		<c:if test="${vo.pageStartNo > 1}">
			<a href="javascript:fn_commPagging('${vo.pageStartNo-1 }')">[이전]</a>
		</c:if>

		<c:forEach var="p" begin="${vo.pageStartNo }" end="${vo.pageLastNo }">
			<c:if test="${vo.pageIndex == p }">
				<b><font color="red">${p }</font></b>
			</c:if>
			<c:if test="${vo.pageIndex != p }">
				<a href="javascript:fn_commPagging('${p }')">${p }</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${vo.pageLastNo < vo.totalPageCnt}">
			<a href="javascript:fn_commPagging('${vo.pageLastNo+1 }')">[다음]</a>
		</c:if>
		<a href="javascript:fn_commPagging('${vo.totalPageCnt }')">[마지막페이지]</a>	
</body>
</html>