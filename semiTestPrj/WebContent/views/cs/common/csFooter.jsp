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
        width: 1500px;
        height: 250px;
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
        background-color: rgb(198, 255, 203);
        cursor: pointer;
    }

    #footer-content {
        font-size: 20px;
        margin: 10px;
        font-weight: bold;
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
                        <div id="cs-footer-box" onclick="location.href='/semiTestPrj/cs/type?t=trade'">
                            <div id="footer-content">거래 관련</div>
                        </div>
                    </td>
                    <td>
                        <div id="cs-footer-box" onclick="location.href='/semiTestPrj/cs/type?t=id'">
                            <div id="footer-content">계정 관련</div>
                        </div>
                    </td>
                    <td>
                        <div id="cs-footer-box" onclick="location.href='/semiTestPrj/cs/type?t=event'">
                            <div id="footer-content">행사 관련</div>
                        </div>
                    </td>
                    <td>
                        <div id="cs-footer-box" onclick="location.href='/semiTestPrj/cs/type?t=ads'">
                            <div id="footer-content">광고 관련</div>
                        </div>
                    </td>
                    <td>
                        <div id="cs-footer-box" onclick="location.href='/semiTestPrj/cs/type?t=suggest'">
                            <div id="footer-content">건의 및 제안</div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="cs-footer-box" onclick="location.href='/semiTestPrj/cs/type?t=etc'">
                            <div id="footer-content">기타</div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>