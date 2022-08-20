<%@page import="com.kh.cs.vo.FaqVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% FaqVo vo = (FaqVo)request.getAttribute("vo"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>FAQ 상세확인</title>
    <style>
        .cs-detail-outer{
            color: black;
            width: 90%;
            height: auto;
            margin: auto;
            padding-top: 50px;
        }
        
        #table-cs-detail{
        	font-size: 20px;
            border: 2px solid green;
        }
    </style>
</head>
<body>
    
    <%@ include file="/views/common/header.jsp" %>

    <div class="cs-detail-outer" align="center">
    <%@ include file="/views/cs/common/csHeader.jsp"%>

        
        <br><br><br>

        <table id="table-cs-detail" class="table-bordered">
            <tr>
                <th width="100px">제목</th>
                <td colspan="3" width="1200px">${vo.title}</td>
            </tr>
            <tr>
                <th>분류</th>
                <td>${vo.faqType}</td>
                <th>작성일</th>
                <td>${vo.enrollDate}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <textarea rows="15" style="width: 100%; border: 0px; resize: none; background-color: white;" readonly disabled>${vo.content}</textarea>
                </td>
            </tr>

        </table>

        <br><br>

        <div>
            <a href="javascript:history.back()" class="btn btn-sm btn-success">뒤로가기</a>

            <!-- 현재 로그인한 사용자가 관리자일 경우 -->
            <a href="${contextPath}/cs/edit?num=${vo.no}" class="btn btn-sm btn-success">수정하기</a>
            <a href="${contextPath}/cs/delete?num=${vo.no}" class="btn btn-sm btn-success">삭제하기</a>
        </div>
       	<br><br>

        
    </div>
    
    <%@ include file="/views/cs/common/oneByOne.jsp"%>


</body>
</html>