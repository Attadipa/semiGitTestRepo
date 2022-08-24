<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String c = (String)request.getParameter("c");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		.search-error-h1{text-align: center; height: 500px; font-hieght:100px;}
		#search-result-msg{text-align: center; height: 100px; }
		#trade-img-area>img{width: 250px !important; height: 250px !important; padding-top: 15px !important;} 
    </style>
</head>
<body>
	
	<%@ include file="/views/common/header.jsp" %>
	
	<br> <br> <br> <br> <br> <br> <br>
	
	<!-- searchList용 css -->
	<link href="${contextPath}/views/search/factor/searchList.css" rel="stylesheet" type="text/css">	
	
	<c:if test="${not empty searchList}">
		<%-- 검색 결과 list 창 --%>
		<div id="outer">
			<div id="today-content-area">
				<%-- <c:forEach items="${searchList}" var="sl"> --%>
				<c:set value="${searchList}" var="sl"/>
				<c:forEach var="i" begin="0" step="1" end="${fn:length(sl)-1}">
		    	    <ul>
		    	    	<c:if test="${not empty avo.get(i)}">
	        	    	<li id="trade-img-area">
	        	    		<img src="${avo.get(i).getFilePath()}">
	        	    	</li>
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
			    <div id="page-area">
					<c:set value="${pageVo.getCurrentPage()}" var="currentPage"/>
					<c:set value="${pageVo.getStartPage()}" var="startPage"/>
					<c:set value="${pageVo.getEndPage()}" var="endPage"/>
					<c:set value="${pageVo.getMaxPage()}" var="maxPage"/>
					<c:if test="${currentPage != 1}">
						<a class="btn btn-outline-success page-btn" href="${contextPath}/search/category?c=<%=c%>&p=1"><<</a>
						<a class="btn btn-outline-success page-btn" href="${contextPath}/search/category?c=<%=c%>&p=${currentPage-1}"><</a>
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" varStatus="st">
						<c:if test="${st.current == currentPage}">
							<a class="btn btn-outline-success page-btn" style="color:darkgrey; font-weight: 900;">${st.current}</a>
						</c:if>
						<c:if test="${st.current != currentPage}">
							<a class="btn btn-outline-success page-btn" href="${contextPath}/search/category?c=<%=c%>&p=${st.current}">${st.current}</a>
						</c:if>
					</c:forEach>
					<c:if test="${currentPage != maxPage}">
						<a class="btn btn-outline-success page-btn" href="${contextPath}/search/category?c=<%=c%>&p=${currentPage+1}">></a>
						<a class="btn btn-outline-success page-btn" href="${contextPath}/search/category?c=<%=c%>&p=${maxPage}">>></a>
					</c:if>
				</div>
		</div>
	</c:if>
		
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