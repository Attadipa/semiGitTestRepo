<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래는 아나바다</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<style>


    html{
        overflow-y: scroll;
    }

    #outer{
        width: 65%;
        margin: 0px auto;
        margin-bottom: 5%;
        margin-top: 5%;
    }

    table{
        border: 1px black;
        width: 100%;
        text-align: center;
        border-spacing: 10px;
        border-collapse: collapse;
        border-top: 1px solid darkgray !important;
        border-bottom: 1px solid darkgray !important;
    }

    #next-page{
        margin-left: 30%;
        margin-top: 5%;
        padding-top: 10px;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 400;
    }

    h1 {
        padding-top: 3%;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 400;
    }
    
    th, td {
        border-bottom: 0.5px dashed darkgray !important;
        padding: 5px;
        font-size: medium;
        font-family: 'IBM Plex Sans KR', sans-serif;
    }
    
    th{
        background-color: whitesmoke;
    }

    .title:hover, .writer:hover {
        text-decoration: underline 0.5px;
        
    }
    #page-outer{
        background-color: whitesmoke;
        width: 100%;
        height: 180px;
    }

    hr{
        height: 0.5px !important;
    }

    span{
        padding: 0px 10px;
        
    }
    
    .category{
        position: relative;
        width: 150px;
        height: 30px;
        border: 2px solid darkgray;
    }

    .search {
        position: relative;
        width: 120px;
        height: 30px;
        border: 2px solid darkgray;
    }

    .category .category-select, .search .search-select  {
        width: inherit;
        height: inherit;
        background: transparent;
        border: 0 none;
        outline: 0 none;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 400;
    }
    
     a {
        text-decoration: none !important;
        color: black !important;
    }
    tbody tr:hover{background-color: darkgrey; cursor: pointer;}
    
    .btn-wish-delete{margin: 10px 0 0 95%;}

</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>

	
	<div id="outer">
        
    
        
        <h1>관심상품 목록</h1>
        

        <br><br>

        <form action="${contextPath}/wish/delete" method="post">
        	<table>
	            <thead>
	                <tr>
	                    <th>글번호</th>
	                    <th>선택</th>
	                    <th>글제목</th>
	                    <th>추가날짜</th>
	                </tr>
	            </thead>
	
	            <!-- 예시 -->
	            
	            <tbody>
					<c:forEach items="${voList}" var="l">
	                	<tr>
	                		<td><input type="checkbox" name="postNo" value="${l.getPostNo()}"></td>
	                		<td class="info-area">${l.getPostNo()}</td>
		                    <td class="info-area">${l.getTitle()}</td>
		                    <td class="info-area">${l.getEnrollDate()}</td>
	                	</tr>
					</c:forEach>
	            	<br clear="both">
        	</table>
        	<input type="hidden" value="${loginMember.getMemberNo()}" name="memberNo">
        	<button class="btn btn-sm btn-danger btn-wish-delete" type="submit">삭제</button>
	
	        <br>
	
        </form>

        <div id="page-outer">
            <div id="next-page">
                <div id="page-area">
					<c:set value="${pageVo.getCurrentPage()}" var="currentPage"/>
					<c:set value="${pageVo.getStartPage()}" var="startPage"/>
					<c:set value="${pageVo.getEndPage()}" var="endPage"/>
					<c:set value="${pageVo.getMaxPage()}" var="maxPage"/>
					<c:if test="${currentPage != 1}">
						<a class="btn btn-outline-success page-btn" href="${contextPath}/member/wishlist?p=1"><<</a>
						<a class="btn btn-outline-success page-btn" href="${contextPath}/member/wishlist?p=${currentPage-1}"><</a>
					</c:if>
					<c:forEach begin="${startPage}" end="${endPage}" varStatus="st">
						<c:if test="${st.current == currentPage}">
							<a class="btn btn-outline-success page-btn" style="color:darkgrey; font-weight: 900;">${st.current}</a>
						</c:if>
						<c:if test="${st.current != currentPage}">
							<a class="btn btn-outline-success page-btn" href="${contextPath}/member/wishlist?p=${st.current}">${st.current}</a>
						</c:if>
					</c:forEach>
					<c:if test="${currentPage != maxPage}">
						<a class="btn btn-outline-success page-btn" href="${contextPath}/member/wishlist?p=${currentPage+1}">></a>
						<a class="btn btn-outline-success page-btn" href="${contextPath}/member/wishlist?p=${maxPage}">>></a>
					</c:if>
				</div>
            </div>
        </div>
        
    </div>
	
	<%@ include file="/views/common/footer.jsp" %>
	
	<script>
		$(function(){
			$('tbody tr').children('.info-area').click(function(){
				//행 클릭 되었을 때, 동작 할 내용
				
				//글 번호 가져오기
				const num = $(this).parent().children().eq(1).text();
				//해당 번호 이용해서 요청 보내기
				location.href= "${contextPath}/trade/detail?num=" + num;
			});
		})
 	</script>

</body>
</html>