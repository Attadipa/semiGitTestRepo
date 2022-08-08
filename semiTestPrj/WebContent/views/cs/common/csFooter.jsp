<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#cs-footer {
        padding-left: 40px;
        padding-top: 40px;
        width: 1500px;
        height: 250px;
        background-color: #a6ecf1;
    }

    #cs-footer > table > thead > tr td {
        font-size: 30px;
        font-weight: bold;
        color: white;
    }

    #cs-footer-box {
        border: 2px #c7c7c7 solid;
        background-color: white;
        width: 260px;
        height: 50px;
        margin: 10px;
    }

    #cs-footer-box:hover{
        background-color: rgb(198, 255, 255);
        cursor: pointer;
    }
</style>
</head>
<body>
	<div id="cs-footer">

        <table>
            <thead>
                <tr>
                    <td>유형별 FAQ</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div id="cs-footer-box">
                            <div id="freq-content">사기 관련</div>
                        </div>
                    </td>
                    <td>
                        <div id="cs-footer-box">
                            <div id="freq-content">결제 관련</div>
                        </div>
                    </td>
                    <td>
                        <div id="cs-footer-box">
                            <div id="freq-content">건의 제안</div>
                        </div>
                    </td>
                    <td>
                        <div id="cs-footer-box">
                            <div id="freq-content">FAQ_Type1</div>
                        </div>
                    </td>
                    <td>
                        <div id="cs-footer-box">
                            <div id="freq-content">FAQ_Type2</div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="cs-footer-box">
                            <div id="freq-content">FAQ_Type3</div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>