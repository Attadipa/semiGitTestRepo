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
<title>아나바다 고객센터</title>
<style>

    #cs-freq {
        margin : 0 auto;
        width: 1500px;
        height: 600px;

    }

    #cs-freq > table > thead > tr td {
        font-size: 30px;
        font-weight: bold;
    }

    #box {
        border: 2px #c7c7c7 solid;
        background-color: white;
        width: 260px;
        height: 200px;
        margin: 10px;
    }

    #top-box {
        border: 2px #c7c7c7 solid;
        background-color: white;
        width: 260px;
        height: 200px;
        margin: 10px;
        margin-top: 60px;
    }

    #box:hover, #top-box:hover{
        background-color: rgb(198, 255, 203);
        cursor: pointer;
    }


    #freq-num {
        color: #7e7e7e;
        font-size: 25px;
        font-weight: bold;
        margin: 10px;
    }

    #freq-content {
        font-size: 20px;
        margin: 10px;
        font-weight: bold;
    }
</style>

</head>
<body>

	<%@ include file="/views/common/header.jsp"%>
	
	<div id="cs-page">
	    <%@ include file="/views/cs/common/csHeader.jsp"%>
	
	    <div id="cs-freq">
	        <table>
	            <thead>
	                <tr>
	                    <td>자주 찾는 도움말</td>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <div style="top: 30px;">
	                    	<c:forEach items="${voList}" var="vl" end="4">
	                    		<td>
	                    			<div id="top-box" onclick="location.href='${contextPath}/cs/detail?num=${vl.no}'">
	                    				<div id="freq-num">${vl.no}</div>
	                    				<div id="freq-content">${vl.title}</div>
	                    			</div>
	                    		</td>
	                    	</c:forEach>
	                    </div>
	                </tr>
	                <tr>
	                	<c:forEach items="${voList}" var="vl" begin="5">
	                		<td>
	                			<div id="box" onclick="location.href='${contextPath}/cs/detail?num=${vl.no}'">
	                				<div id="freq-num">${vl.no}</div>
	                				<div id="freq-content">${vl.title}</div>
	                			</div>
	                		</td>
	                	</c:forEach>
	                </tr>
	            </tbody>
	        </table>
	    </div>

		<hr>
	    
		<%@ include file="/views/cs/common/csFooter.jsp"%>
		
	</div>
	
	<%@ include file="/views/cs/common/oneByOne.jsp"%>
	

</body>
</html>