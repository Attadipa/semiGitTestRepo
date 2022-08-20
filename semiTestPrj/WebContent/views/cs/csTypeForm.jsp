<%@page import="com.kh.cs.vo.FaqVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<FaqVo> voList = (List<FaqVo>)request.getAttribute("voList");
%>
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
    
    #hide-no{
    	display:none;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>

	<div id="cs-page">

	    <%@ include file="/views/cs/common/csHeader.jsp" %>
	    <%@ include file="/views/cs/common/csFooter.jsp" %>
	    
	    <hr>
	
	    <table id="table-main" class="table">
	    	<c:forEach var="vo" items="${voList}">
		    	<tr>
		    			<td id="hide-no">${vo.no}</td>
		    			<td>${vo.faqType}</td>
		    			<td>${vo.title}</td>
		    	</tr>
	    	</c:forEach>
	    </table>


	</div>

	<script>
		$(function(){
			$('#table-main>tbody>tr').click(function(){
				//행 클릭 되었을 때, 동작할 내용
				
				//글 번호 가져오기
				const num = $(this).children().eq(0).text();
				//해당 번호 이용해서 요청 보내기
				location.href = '/semiTestPrj/cs/detail?num='+ num;
			});
		})
	</script>
	
	<%@ include file="/views/cs/common/oneByOne.jsp"%>

</body>
</html>