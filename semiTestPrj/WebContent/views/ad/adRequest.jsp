<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    #container{
        margin: 0 auto;
        width: 1000px;
    }

    table{
        width: 100%;
        text-align: center;
    }
    .trade-title{
        cursor: pointer;
    }
    .page-item.active .page-link {
        color: #fff !important;
        background: #f00 !important;
    }
    #page-btns-container{
        display: flex;
        justify-content: center;
    }
    #page-btns-container .btn{
        margin: 0 2px 0 2px;
    }


</style>
</head>
<body>
    <%@ include file="/views/common/header.jsp" %>
    <div id="container">
        <br>
        <h1>광고신청</h1>
        <hr>
        <br>
        	<table class="table table-hover table-sm">
	            <thead class="table-success">
	                <tr>
	                    <th>글번호</th>
	                    <th>제목</th>
	                    <th>게시날짜</th>
                        <th></th>
	                </tr>
	            </thead>
	
	            <!-- 예시 -->
	            <tbody>
					<c:forEach items="${voList}" var="vo">
	                	<tr>
	                    	<td>${vo.tradeNo}</td>
		                    <td onclick="location.href='/semiTestPrj/trade/detail?num=${vo.tradeNo }'" class="trade-title">${vo.getTitle()}</td>
		                    <td>${vo.enrollDate}</td>
                            <td><button class="btn btn-danger" onclick="location.href='/semiTestPrj/ad/insert?num=${vo.tradeNo}'">광고신청</button></td>
	                	</tr>
					</c:forEach>
	        	</table>
	
	        <br>

            <div id="page-btns-container">
                <c:if test="${pv.currentPage!=1}">
                    <a class="btn btn-outline-success" href="/semiTestPrj/ad/request?p=1">&lt;&lt;</a>
                    <a class="btn btn-outline-success" href="/semiTestPrj/ad/request?p=${pv.currentPage-1}">&lt;</a>
                </c:if>
    
                <c:forEach begin="${pv.startPage }" end="${pv.endPage }" step="1" varStatus="vs">
                    <c:if test="${vs.index == pv.currentPage }">
                        <a class="btn btn-success">${vs.index}</a>
                    </c:if>
                    <c:if test="${vs.index != pv.currentPage }">
                        <a class="btn btn-outline-success" href="/semiTestPrj/ad/request?p=${vs.index}">${vs.index}</a>
                    </c:if>
                </c:forEach>
    
                <c:if test="${pv.currentPage!=pv.maxPage}">
                    <a class="btn btn-outline-success" href="/semiTestPrj/ad/request?p=${pv.currentPage+1}">&gt;</a>
                    <a class="btn btn-outline-success" href="/semiTestPrj/ad/request?p=${pv.maxPage}">&gt;&gt;</a>
                </c:if>
            </div>

        
    </div>
</body>
</html>