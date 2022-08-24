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
    #page-area{
		width: 80%;
		text-align: center;
		margin: auto;
		padding-top: 30px;
	}
    tbody > tr{
        cursor: pointer;
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
        <h1>광고관리</h1>
        <hr>
        <br>
        <table class="table table-hover table-sm">
            <thead class="table-success">
                <tr>
                    <th>광고번호</th>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>가격</th>
                    <th>기간</th>
                    <th>신청일시</th>
                    <th>키워드1</th>
                    <th>키워드2</th>
                    <th>키워드3</th>
                    <th>광고상태</th>
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
	                    <td><h5><span class="badge rounded-pill bg-danger">${vo.adStatus }</span></h5></td>
	                </tr>
                </c:forEach>
            </tbody>
          </table>

          <div id="page-btns-container">
            <c:if test="${pv.currentPage!=1}">
                <a class="btn btn-outline-success page-btn" href="/semiTestPrj/ad/manager?p=1">&lt;&lt;</a>
                <a class="btn btn-outline-success page-btn" href="/semiTestPrj/ad/manager?p=${pv.currentPage-1}">&lt;</a>
            </c:if>

            <c:forEach begin="${pv.startPage }" end="${pv.endPage }" step="1" varStatus="vs">
                <c:if test="${vs.index == pv.currentPage }">
                    <a class="btn btn-success">${vs.index}</a>
                </c:if>
                <c:if test="${vs.index != pv.currentPage }">
                    <a class="btn btn-outline-success" href="/semiTestPrj/ad/manager?p=${vs.index}">${vs.index}</a>
                </c:if>
            </c:forEach>

            <c:if test="${pv.currentPage!=pv.maxPage}">
                <a class="btn btn-outline-success page-btn" href="/semiTestPrj/ad/manager?p=${pv.currentPage+1}">&gt;</a>
                <a class="btn btn-outline-success page-btn" href="/semiTestPrj/ad/manager?p=${pv.maxPage}">&gt;&gt;</a>
            </c:if>
        </div>

    </div>
</body>
</html>