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
    #page-btns-container{
        display: flex;
        justify-content: center;
    }
    #page-btns-container .btn{
        margin: 0 2px 0 2px;
    }
    tbody > tr{
        cursor: pointer;
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
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${adList }" var="vo">
	                <tr class='tr'>
	                    <td onclick="getDetail('${vo.tradeNo }')">${vo.adNo }</td>
	                    <td onclick="getDetail('${vo.tradeNo }')">${vo.tradeNo }</td>
	                    <td onclick="getDetail('${vo.tradeNo }')">${vo.title }</td>
	                    <td onclick="getDetail('${vo.tradeNo }')">${vo.price }원</td>
	                    <td onclick="getDetail('${vo.tradeNo }')">${vo.period }일</td>
	                    <td onclick="getDetail('${vo.tradeNo }')">${vo.enrollDate }</td>
	                    <td onclick="getDetail('${vo.tradeNo }')">${vo.keyword1 }</td>
	                    <td onclick="getDetail('${vo.tradeNo }')">${vo.keyword2 }</td>
	                    <td onclick="getDetail('${vo.tradeNo }')">${vo.keyword3 }</td>
	                    <td><h5><span class="badge rounded-pill bg-danger">${vo.adStatus }</span></h5></td>
                        <td id="refund-btn"><button class="btn btn-outline-success btn-sm" onclick="refund('${vo.tradeNo }')">환불받기</button></td>
	                </tr>
                </c:forEach>
            </tbody>
          </table>

          <div id="page-btns-container">
            <c:if test="${pv.currentPage!=1}">
                <a class="btn btn-outline-success" href="/semiTestPrj/ad/manager?p=1">&lt;&lt;</a>
                <a class="btn btn-outline-success" href="/semiTestPrj/ad/manager?p=${pv.currentPage-1}">&lt;</a>
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
                <a class="btn btn-outline-success" href="/semiTestPrj/ad/manager?p=${pv.currentPage+1}">&gt;</a>
                <a class="btn btn-outline-success" href="/semiTestPrj/ad/manager?p=${pv.maxPage}">&gt;&gt;</a>
            </c:if>
        </div>

        <script>
            function refund(no){
                let refund = confirm('정말로 환불받으시겠습니까?');
                if(refund==true){
                    window.location="/semiTestPrj/ad/delete?no="+no;
                }
            }
            function getDetail(tradeNo){
                    location.href='/semiTestPrj/trade/detail?num='+tradeNo;
            }
        </script>

        

    </div>
</body>
</html>