<%@page import="com.kh.cs.vo.FaqVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

    <div id="faq-outer">
        <br><br>
        <form action="${contextPath}/cs/insert" method="post">
            <div id="section">
                카테고리<select id="type" name="faqType">
                    <option value="trade" selected="selected">거래 관련</option>
                    <option value="id">계정 관련</option>
                    <option value="event">행사 관련</option>
                    <option value="ads">광고 관련</option>
                    <option value="rule">운영 정책</option>
                    <option value="etc">기타</option>
                </select>
                제목 <input type="text" size="120" name="title" required>
                <br>
                내용 
                <br>
                <textarea rows="15" cols="130" style="resize:none;" name="content" required></textarea>
            </div>

            <div id="div-btn-area">
                <input type="submit" value="등록하기" class="btn btn-sm btn-success">
                <input type="reset" value="초기화" class="btn btn-sm btn-success">
            </div>

        </form>

    </div>
    

</body>
</html>