<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다 고객센터</title>
<style>

    #cs-page {
        margin-left: 100px;
    }

    #cs-freq {
        margin-left: 40px;
        margin-top: 70px;
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
        background-color: rgb(198, 255, 255);
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
	                        <td>
	                            <div id="top-box">
	                                <div id="freq-num">01</div>
	                                <div id="freq-content">계정 도용 당했어요.</div>
	                            </div>
	                        </td>
	                        <td>
	                            <div id="top-box">
	                                <div id="freq-num">02</div>
	                                <div id="freq-content">사기 당했어요.</div>
	                            </div>
	                        </td>
	                        <td>
	                            <div id="top-box">
	                                <div id="freq-num">03</div>
	                                <div id="freq-content">FAQ_03</div>
	                            </div>
	                        </td>
	                        <td>
	                            <div id="top-box">
	                                <div id="freq-num">04</div>
	                                <div id="freq-content">FAQ_04</div>
	                            </div>
	                        </td>
	                        <td>
	                            <div id="top-box">
	                                <div id="freq-num">05</div>
	                                <div id="freq-content">FAQ_05</div>
	                            </div>
	                        </td>
	                    </div>
	                </tr>
	                <tr>
	                    <td>
	                        <div id="box">
	                            <div id="freq-num">06</div>
	                            <div id="freq-content">FAQ_06</div>
	                        </div>
	                    </td>
	                    <td>
	                        <div id="box">
	                            <div id="freq-num">07</div>
	                            <div id="freq-content">FAQ_07</div>
	                        </div>
	                    </td>
	                    <td>
	                        <div id="box">
	                            <div id="freq-num">08</div>
	                            <div id="freq-content">FAQ_08</div>
	                        </div>
	                    </td>
	                    <td>
	                        <div id="box">
	                            <div id="freq-num">09</div>
	                            <div id="freq-content">FAQ_09</div>
	                        </div>
	                    </td>
	                    <td>
	                        <div id="box">
	                            <div id="freq-num">10</div>
	                            <div id="freq-content">FAQ_10</div>
	                        </div>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	    </div>
	    
		<%@ include file="/views/cs/common/csFooter.jsp"%>
		
	</div>
	
	<%@ include file="/views/cs/common/oneByOne.jsp"%>

</body>
</html>