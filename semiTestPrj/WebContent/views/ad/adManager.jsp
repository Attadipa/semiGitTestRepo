<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 제이쿼리 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- 부트스트랩 --%>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    #container{
        margin: 0 auto;
        width: 1000px;
    }
    thead > tr{
        font-weight: bold;
    }
    #page-area{
		width: 80%;
		text-align: center;
		margin: auto;
		padding-top: 30px;
	}
    tbody > tr{
        cursor: pointer;
    }


</style>
</head>
<body>
    <div id="container">
        <br>
        <h1>광고관리</h1>
        <table class="table table-hover table-sm">
            <thead class="table-success">
                <tr>
                    <td>광고번호</td>
                    <td>글번호</td>
                    <td>제목</td>
                    <td>가격</td>
                    <td>기간</td>
                    <td>신청일시</td>
                    <td>키워드1</td>
                    <td>키워드2</td>
                    <td>키워드3</td>
                    <td>광고상태</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${adList }" var="vo">
	                <tr onclick="location.href='/semiTestPrj/trade/detail?num=${vo.tradeNo }'">
	                    <td>${vo.adNo }</td>
	                    <td>${vo.tradeNo }</td>
	                    <td>${vo.title }</td>
	                    <td>${vo.price }원</td>
	                    <td>${vo.period }일</td>
	                    <td>${vo.enrollDate }</td>
	                    <td>${vo.keyword1 }</td>
	                    <td>${vo.keyword2 }</td>
	                    <td>${vo.keyword3 }</td>
	                    <td>${vo.adStatus }</td>
	                </tr>
                </c:forEach>
            </tbody>
          </table>

          <div id="page-area">
			
			<c:if test="${pv.currentPage!=1}">
				<a class="btn btn-sm btn-success" href="/semiTestPrj/ad/manager?p=${pv.currentPage-1 }"> &lt; </a>
			</c:if> 

			<c:forEach begin="${pv.startPage }" end="${pv.endPage }" step="1" varStatus="vs">
				<c:if test="${vs.index == pv.currentPage }">
					<a class="btn btn-sm btn-success">${vs.index }</a>
				</c:if>
				<c:if test="${vs.index != pv.currentPage }">
					<a class="btn btn-sm btn-success" href="/semiTestPrj/ad/manager?p=${vs.index }">${vs.index }</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${pv.currentPage!=pv.maxPage}">
				<a class="btn btn-sm btn-success" href="/semiTestPrj/ad/manager?p=${pv.currentPage+1 }"> &gt; </a>
			</c:if> 

			
		</div>
    </div>
    
</body>
</html>