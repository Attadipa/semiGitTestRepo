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
	#outer{
		width: 60%;
		margin: auto;
		padding-top: 50px;
		height: 550px;
		background-color: black;
		color: white;
	}
	#outer table{
		width: 95%;
		margin: auto;
		margin-top: 50px;
	}
	#page-area{
		width: 80%;
		text-align: center;
		margin: auto;
		padding-top: 30px;
	}
	#page-area a{
		text-decoration: none;
		color : white;
	}
</style>
</head>
<body>
	
	<%@ include file="/views/common/header.jsp" %>
	
	<br> <br> <br> <br> <br> <br> <br>
	
	<%-- 키워드 입력 제대로 했는지 확인 --%>
		<c:if test="${not empty searchErrorMsg}">
			<h1 class="search-error-h1">${searchErrorMsg}</h1>
		</c:if>
	
	<%-- 검색 결과 list 창 --%>
	<div id="outer">
		<h1 align="center">검색 결과</h1>
		
		<table border="1">
			<!--글번호,글제목,작성자,조회수,작성일시-->
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
			</tr>
			<c:forEach items="${searchList}" var="sl">
				<tr>
					<td>${sl.getNo()}</td>
					<td>${sl.getTitle()}</td>
					<td>${sl.getWriter()}</td>
					<td>${sl.getEnrollDate()}</td>
				</tr>
			</c:forEach>
				
		</table>

		<div id="page-area">
			<c:set value="${pageVo.getCurrentPage()}" var="currentPage"/>
			<c:set value="${pageVo.getStartPage()}" var="startPage"/>
			<c:set value="${pageVo.getEndPage()}" var="endPage"/>
			<c:set value="${pageVo.getMaxPage()}" var="maxPage"/>
			<c:if test="${currentPage != 1}">
				<a class="btn btn-sm btn-primary page-btn" href="${contextPath}/search?p=1&keyword-option=<%= keywordOption %>&keyword=<%=keyword%>"><<</a>
				<a class="btn btn-sm btn-primary page-btn" href="${contextPath}/search?p=${currentPage-1}&keyword-option=<%= keywordOption %>&keyword=<%=keyword%>"><</a>
			</c:if>
			<c:forEach begin="${startPage}" end="${endPage}" varStatus="st">
				<c:if test="${st.current == currentPage}">
					<a class="btn btn-sm btn-primary page-btn" style="color:black; font-weight: 900;">${st.current}</a>
				</c:if>
				<c:if test="${st.current != currentPage}">
					<a class="btn btn-sm btn-primary page-btn" href="${contextPath}/search?p=${st.current}&keyword-option=<%= keywordOption %>&keyword=<%=keyword%>">${st.current}</a>
				</c:if>
			</c:forEach>
			<c:if test="${currentPage != maxPage}">
				<a class="btn btn-sm btn-primary page-btn" href="${contextPath}/search?p=${currentPage+1}&keyword-option=<%= keywordOption %>&keyword=<%=keyword%>">></a>
				<a class="btn btn-sm btn-primary page-btn" href="${contextPath}/search?p=${maxPage}&keyword-option=<%= keywordOption %>&keyword=<%=keyword%>">>></a>
			</c:if>
		</div>
		
	</div>
		
	<script type="text/javascript">
	
		$(function(){
			
		})
	</script>
	
	
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>