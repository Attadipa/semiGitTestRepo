<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.vo.MemberVo"%>
<%
	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember"); 
	String alertMsg = (String)session.getAttribute("alertMsg");
	session.removeAttribute("alertMsg");
	String contextPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%-- 제이쿼리 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js""></script>
<%-- 부트스트랩 --%>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<c:set value="<%= contextPath %>" var="contextPath"></c:set>

<style>
    body{
        padding-top: 150px;
    }
    .header{
        box-sizing: border-box;
        padding: 0;
        margin: 0;
        background-color: white;
        z-index: 20;
    }
    .header-hr{
        box-sizing: border-box;
        padding: 0;
        margin: 0;
    }
    header{
        width: 100%;
        height: 150px;
        position: fixed;
        top: 0;
        left: auto;
    }
    #header-inner1{
        width: 100%;
        height: 32%;
        display: flex;
        align-items: center;
        flex-direction: row-reverse;
        padding-right: 100px;
    }
    #header-inner2{
        width: 100%;
        height: 68%;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    #header-inner1 a{
        text-decoration: none;
        color: black;
        font-size: 20%;
        height: 50%;
        margin: 0 3px 0 10px;
        margin-top: 6px;
        font-size: 15px;
    }
    #header-inner2-category a{
        text-decoration: none;
        color: black;
        font-size: 25px;
        font-weight: 700;
        height: 50%;
        margin: 0 3px 0 10px;        
    }
    #header-inner2-category{
        padding-right: 100px;
    }
    #search{
        height: 40px;
        width: 700px;
    }
    #search>form {
        height: 40px !important;
        min-height: 0!important;
        width: 700px!important;
        display: flex !important;
    }
    #logo-anbd{
        padding-left: 100px!important;
    }
    #logo-anbd img{
        height: 60px!important;
    }
    .btn-search{display: block !important;}

    #form-select{width: 120px !important; height: 100% !important;}
    .form-control{width: 500px !important; height:40px !important;}
    .btn-search{widhth:40px important; margin: 0 !important;}
</style>
</head>
<body>

    <header id="header" class="header">
            <hr class="header-hr">
            <div id="header-inner1" class="header">
                <a href="${contextPath}/cs/search">고객센터</a>
                <c:if test="${empty loginMember}">
   		            <a href="${contextPath}/member/login">로그인</a>
                </c:if>
                <c:if test="${loginMember.getMemberGrade() eq 'A'}">
   		            <a href="${contextPath}/admin/search">관리자페이지</a>
                </c:if>
                <c:if test="${not empty loginMember}">
	                <a href="${contextPath}/member/wishlist?p=1">관심상품</a>
	                <a href="${contextPath}/member/mypage">마이페이지</a>
	                <a href="${contextPath}/trade/myList?p=1">나의판매</a>
                	<a href="${contextPath}/member/logout">로그아웃</a>
                </c:if>
            </div>
            <hr class="header-hr">
            <div id="header-inner2" class="header">
                <a id="logo-anbd" href="/semiTestPrj">
                    <img src="/semiTestPrj/views/common/resources/anbdpng.png" alt="아나바다로고">
                </a>
                <div id="search">
	                <form action="<%= contextPath %>/search" method="get">
	                	<input type="hidden" name="p" value="1">
                        <select id="form-select" class="form-select" name="keyword-option">
                            <option value="TITLE">글제목</option>
                            <option value="WRITER">작성자</option>
                            <option value="EXPLAIN">내용</option>
                        </select>
                        <input type="text" class="form-control" name="keyword" placeholder="포켓몬빵은 어때요?">
                        <button class="btn btn-success btn-search" type="submit">검색</button>
	                </form>
                </div>
                <div id="header-inner2-category">
                    <a href="${contextPath}/trade/insert">SALE</a>
                    <a href="">SHOP</a>
                    <a href="">ABOUT</a>
                </div>
            </div>
            <hr class="header-hr">
            <!-- 사이드바 --> <%@ include file="/views/common/sideBar.jsp" %>
    </header>
    
    	<c:if test="${empty loginMember}">
		    <!-- 광고영역 -->
	    	<%@ include file="/views/common/factor/adModal.jsp" %>
    	</c:if>


    <script>
    	<%if(alertMsg != null){%>
    		alert('<%= alertMsg %>')
    	<%}%>
    </script>

</body>
</html>
