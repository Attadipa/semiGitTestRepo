<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String keyword = request.getParameter("keyword"); 
	String keywordOption = request.getParameter("keyword-option");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		.search-error-h1{text-align: center; height: 500px; font-hieght:100px;}
		#search-result-msg{text-align: center; height: 100px; }
    </style>
</head>
<body>
	
	<%@ include file="/views/common/header.jsp" %>
	
	<br> <br> <br> <br> <br> <br> <br>
	
	<!-- searchList용 css -->
	<link href="${contextPath}/views/search/factor/searchList.css" rel="stylesheet" type="text/css">	
	
	<%-- 키워드 입력 제대로 했는지 확인 --%>
		<c:if test="${not empty searchErrorMsg}">
			<h1 class="search-error-h1">${searchErrorMsg}</h1>
		</c:if>
	
	<%-- 검색 결과 list 창 --%>
	<div id="outer">
		<c:if test="${'' ne param.keyword}">
			<h2 id="search-result-msg">"${param.keyword}"에 대한 검색 결과입니다.</h2>		
		</c:if>
	
		<div id="today-content-area">
			<%-- <c:forEach items="${searchList}" var="sl"> --%>
			<c:set value="${searchList}" var="sl"/>
			<c:forEach var="i" begin="0" step="1" end="${fn:length(sl)-1}">
	    	    <ul>
	    	    	<c:if test="${not empty avo.get(i)}">
	        	    	<li id="trade-img-area" style="background-image: url('${avo.get(i).getFilePath()}');"></li>
	    	    	</c:if>
	    	    	<c:if test="${empty avo.get(i)}">
	        	    	<li id="trade-img-area">사진 없음</li>
	    	    	</c:if>
	            	<li class="today-content-text-area title-area">${sl.get(i).getTitle()}</li>
	            	<li class="today-content-text-area writer-area">${sl.get(i).getWriter()}</li>
	            	<li class="today-content-text-area date-area">${sl.get(i).getEnrollDate()}</li>
	            	<li class="today-content-text-area no-area">${sl.get(i).getTradeNo()}</li>
	        	</ul>
	        </c:forEach>
	    </div>
    	<c:if test="${'' ne param.keyword}">
		    <div id="page-area">
				<c:set value="${pageVo.getCurrentPage()}" var="currentPage"/>
				<c:set value="${pageVo.getStartPage()}" var="startPage"/>
				<c:set value="${pageVo.getEndPage()}" var="endPage"/>
				<c:set value="${pageVo.getMaxPage()}" var="maxPage"/>
				<c:if test="${currentPage != 1}">
					<a class="btn btn-outline-success page-btn" href="${contextPath}/search?p=1&keyword-option=<%= keywordOption %>&keyword=<%=keyword%>"><<</a>
					<a class="btn btn-outline-success page-btn" href="${contextPath}/search?p=${currentPage-1}&keyword-option=<%= keywordOption %>&keyword=<%=keyword%>"><</a>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" varStatus="st">
					<c:if test="${st.current == currentPage}">
						<a class="btn btn-outline-success page-btn" style="color:darkgrey; font-weight: 900;">${st.current}</a>
					</c:if>
					<c:if test="${st.current != currentPage}">
						<a class="btn btn-outline-success page-btn" href="${contextPath}/search?p=${st.current}&keyword-option=<%= keywordOption %>&keyword=<%=keyword%>">${st.current}</a>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage != maxPage}">
					<a class="btn btn-outline-success page-btn" href="${contextPath}/search?p=${currentPage+1}&keyword-option=<%= keywordOption %>&keyword=<%=keyword%>">></a>
					<a class="btn btn-outline-success page-btn" href="${contextPath}/search?p=${maxPage}&keyword-option=<%= keywordOption %>&keyword=<%=keyword%>">>></a>
				</c:if>
			</div>
		</c:if>
	</div>
		
	<script>
		$(function(){
			$('#today-content-area>ul').click(function(){
				//행 클릭 되었을 때, 동작 할 내용
				
				//글 번호 가져오기
				const num = $(this).children().eq(4).text();
				//해당 번호 이용해서 요청 보내기
				location.href= "${contextPath}/trade/detail?num=" + num;
			});
		})
 	</script>
	
	
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>