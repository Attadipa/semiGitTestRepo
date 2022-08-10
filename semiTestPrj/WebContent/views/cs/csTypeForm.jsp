<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유형별 FAQ</title>
<style>
    #table-main{
		border: 2px solid darkgreen;
		width: 95%;
		margin-top: 50px;
        font-size: 20px;
	}

	#table-main>tbody tr:hover{
		background-color: rgb(198, 255, 203);
		cursor: pointer;
	}

    #faq-write{
        background-color: darkgreen;
        border-color: darkgreen;
        color: white;
        border-radius: 10%;
        float: right;
        margin-right: 100px;
        margin-bottom: 50px;
    }
</style>
</head>
<body>

<%@ include file="/views/common/header.jsp"%>

<div id="cs-page">

    <%@ include file="/views/cs/common/csHeader.jsp"%>
    <%@ include file="/views/cs/common/csFooter.jsp"%>
    
    <hr>

    <button id="faq-write">FAQ 작성</button>

    <table id="table-main" class="table">
        <tr>
            <td>거래 관련</td>
            <td>판매 금지 물품은 어떤 것이 있나요?</td>
        </tr>
        <tr>
            <td>거래 관련</td>
            <td>직접 재배하거나 채취한 농수산물도 중고거래 가능한가요?</td>
        </tr>
        <tr>
            <td>거래 관련</td>
            <td>형편없는 물건을 판매해요.</td>
        </tr>
        <tr>
            <td>거래 관련</td>
            <td>핸드메이드 제품을 중고거래할 수 있나요?</td>
        </tr>
        <tr>
            <td>거래 관련</td>
            <td>반려동물, 생명이 있는 동물과 곤충을 분양할 수 있나요?</td>
        </tr>
    </table>


</div>

<%@ include file="/views/cs/common/oneByOne.jsp"%>

</body>
</html>