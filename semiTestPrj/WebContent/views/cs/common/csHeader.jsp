<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#cs-header {
        color: black;
        width: 1500px;
        height: 250px;
    }
    
    #cs-header p{
        text-align: center;
        padding-top: 60px;
        font-size: 40px;
        font-weight: bolder;
    }

    #cs-search div{
        font-size: 22px;
        font-weight: bold;
        width: 150px;
        margin-left: 350px;
        
    }

    #search-form{
        display: flex;
        width: 800px;
    }

    #cs-search {
        display: flex;
        margin-top: 60px;
        align-items: center;
        width: 1400px;
    }

    #cs-page {
        margin: 0 auto;
		width: 1500px;
    }
</style>
</head>
<body>
	<div id="cs-header">
        <p>아나바다 고객센터</p>
        
        <div id="cs-search">
            <div>도움말 검색</div>
            <form action="${contextPath}/cs/search" id="search-form" method="post">
                <input type="text" class="form-control" name="searchFaq" style="font-size: 15px;">
                <input type="submit" value="검색" class="btn btn-success"  style="font-size: 13px;">

            </form>
        </div>
    </div>
    <hr>
</body>
</html>