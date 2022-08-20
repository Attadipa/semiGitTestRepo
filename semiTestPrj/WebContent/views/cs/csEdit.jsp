<%@page import="com.kh.cs.vo.FaqVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    FaqVo vo = (FaqVo)request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
<style>

    #faq-outer{
        color: black;
        width: 60%;
        height: 70vh;
        margin: auto;
    }

    #faq-outer h1{
        padding-top: 50px;
    }

    #section{
        width: 90%;
        height: 60%;
        margin: auto;
    }

    #section *{
        width: 100%;
    }

    #div-btn-area{
        width: 50%;
        text-align: center;
        margin: auto;
        margin-top: 30px;
    }

</style>
</head>
<body>
	
    <%@ include file="/views/common/header.jsp"%>

    <div id="faq-outer">
        <br><br>
        <form action="${contextPath}/cs/edit" method="post">
            <input type="hidden" name="num" value="${vo.no}">
            <input type="hidden" name="enrollDate" value="${vo.enrollDate}">
            <div id="section">
                카테고리<select id="type" name="faqType">
                    <option value="trade">거래 관련</option>
                    <option value="id">계정 관련</option>
                    <option value="event">행사 관련</option>
                    <option value="ads">광고 관련</option>
                    <option value="rule">운영 정책</option>
                    <option value="etc">기타</option>
                </select>
                제목 <input type="text" size="120" name="title" value="${vo.title}" required>
                <br>
                내용 
                <br>
                <textarea rows="10" cols="130" style="resize:none;" name="content" required>${vo.content}</textarea>
            </div>

            <div id="div-btn-area">
                <input type="submit" value="수정하기" class="btn btn-sm btn-success">
                <input type="reset" value="초기화" class="btn btn-sm btn-success">
                <input type="button" value="뒤로가기" class="btn btn-sm btn-success" onclick="history.go(-1)">
            </div>

        </form>

    </div>
    
    <script>
    	const sels = document.getElementById("type");

        const type = "${vo.faqType}";

        for(let i=0; i<sels.length; i++){
            if(sels.options[i].text == type){
                sels.options[i].selected = true;
            }
        }
    </script>

</body>
</html>