<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다 고객센터</title>
<style>

    #cs-header {
        background-color: #cbffe9;
        color: white;
        width: 1850px;
        height: 250px;
    }
    
    #cs-header p{
        text-align: center;
        padding-top: 40px;
        font-size: 3em;
        font-weight: bolder;
    }

    #cs-search div{
        font-size: 1.5em;
        font-weight: bold;
        width: 180px;
        margin-left: 400px;
        
    }

    #search-form{
        display: flex;
        width: 1200px;
    }

    #cs-search {
        display: flex;
        margin-top: 60px;
        align-items: center;
        width: 1400px;
    }

    #cs-freq {
        margin-left: 40px;
        margin-top: 70px;

    }

    #cs-freq > table > thead > tr td {
        font-size: 30px;
        font-weight: bold;
    }

    #box {
        border: 2px #c7c7c7 solid;
        background-color: white;
        width: 300px;
        height: 240px;
        margin: 10px;
    }



</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

</head>
<body>

	
    <div id="cs-header">
        <p>아나바다 고객센터</p>
        
        <div id="cs-search">
            <div>도움말 검색</div>
            <form action="" id="search-form">
                <input type="text" class="form-control">
                <input type="submit" value="검색" class="btn btn-info">

            </form>
        </div>
    </div>

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
                            <div id="box">
                                <div>01</div>
                                <div>계정 도용 당했어요.</div>
                            </div>
                        </td>
                        <td>
                            <div id="box">
                                <div>02</div>
                                <div>사기 당했어요.</div>
                            </div>
                        </td>
                        <td>
                            <div id="box">
                                <div>03</div>
                                <div>FAQ_03</div>
                            </div>
                        </td>
                        <td>
                            <div id="box">
                                <div>04</div>
                                <div>FAQ_04</div>
                            </div>
                        </td>
                        <td>
                            <div id="box">
                                <div>05</div>
                                <div>FAQ_05</div>
                            </div>
                        </td>
                    </div>
                </tr>
                <tr>
                    <td>
                        <div id="box">
                            <div>06</div>
                            <div>FAQ_06</div>
                        </div>
                    </td>
                    <td>
                        <div id="box">
                            <div>07</div>
                            <div>FAQ_07</div>
                        </div>
                    </td>
                    <td>
                        <div id="box">
                            <div>08</div>
                            <div>FAQ_08</div>
                        </div>
                    </td>
                    <td>
                        <div id="box">
                            <div>09</div>
                            <div>FAQ_09</div>
                        </div>
                    </td>
                    <td>
                        <div id="box">
                            <div>10</div>
                            <div>FAQ_10</div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

    </div>

</body>
</html>