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
    /* .header{
        border: 1px dashed red;
    } */
    /* 참고용 (추 후 삭제 예정) */
    
    
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
        height: 30px;
        width: 700px;
    }
    #logo-anbd{
        padding-left: 100px;
    }
    #logo-anbd img{
        height: 60px;
    }

    #form-select{width: 120px !important;}
    .form-control{width: 500px !important;}
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
                <form id="search" action="<%= contextPath %>/search" method="get">
                	<input type="hidden" name="p" value="1">
                    <div class="input-group mb-3" id="search-div">
                        <select id="form-select" class="form-select" name="keyword-option">
                            <option value="TITLE">글제목</option>
                            <option value="WRITER">작성자</option>
                            <option value="EXPLAIN">내용</option>
                        </select>
                        <input type="text" class="form-control" name="keyword" placeholder="포켓몬빵은 어때요?">
                        <button class="btn btn-success" type="submit">검색</button>
                    </div>
                </form>
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
    	<%-- <c:if test="${not empty loginMember}">
    		<c:if test="${loginMember.getMemberGrade() eq "NORMAL"}">
			    <!-- 광고영역 -->
		    	<%@ include file="/views/common/factor/adModal.jsp" %>
    		</c:if>
    	</c:if> --%> <!-- 로그인 멤버의 등급이 NORMAL 일 때 광고창 출력 (일단 주석처리->memberdao에서 memberGrade 받아오면 그때 처리) -->


    <script>
    	<%if(alertMsg != null){%>
    		alert('<%= alertMsg %>')
    	<%}%>
    </script>

</body>
</html>
