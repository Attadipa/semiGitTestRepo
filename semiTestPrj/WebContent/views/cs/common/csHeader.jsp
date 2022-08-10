<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#cs-header {
        background-image: linear-gradient(to right, green, white);
        color: white;
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
        margin-left: 300px;
        
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
        margin-left: 100px;
		width: 1500px;
    }
</style>
</head>
<body>
	<div id="cs-header">
        <p>아나바다 고객센터</p>
        
        <div id="cs-search">
            <div>도움말 검색</div>
            <form action="" id="search-form">
                <input type="text" class="form-control" style="font-size: 15px;">
                <input type="submit" value="검색" class="btn btn-success"  style="font-size: 13px;">

            </form>
        </div>
    </div>
</body>
</html>