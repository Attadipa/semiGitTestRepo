<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<style>

     #outer{
        width: 65%;
        margin: 0px auto;
        margin-bottom: 5%;
        margin-top: 5%
    }
    
    .images {
        border: 1px solid black;
        width: 180px;
        height: 180px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    #products{
        width: 100%;
        height: 1100px;
        margin-top: 50px;
        flex-wrap: wrap;
        display: flex;
        justify-content: space-around;
        align-items: center;
    }
    
    .contents {
        border: 1px solid black;
        width: 180px;
        height: 70px;
        /* margin: 0px 0px 80px 0px; */
    }
    
    table {
        border: 1px solid black;
        
    }
    
    
    .page-outer{
        background-color: whitesmoke;
        height: 180px;
        padding-bottom: 50px;
        padding-top: 10px;
        margin-top: 30px;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 400;
        text-align: center;
    }

    span{
        padding: 0px 10px;
    }

    .images {
        background-image: url("data:image/png;base64,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") !important;
        width: 180px;
        height: 180px;
    }

</style>
</head>
<body>
    
    <%@include file="/views/common/header.jsp" %>

    <div id="outer">


        <div id="products">

            <table>
                <tr>
                    <td><div class="images"></div></td>
                </tr>
                <tr>
                    <!-- <td><div class="contents" onclick="location.href=''"></div></td> -->
                </tr>
            </table>

            








            
            <!-- <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div>
            <div class="items"><div class="images"></div></div> -->
        </div>

        
        <div class="page-outer">
            <span>1</span>
            <span>2</span>
            <span>3</span>
            <span>4</span>
            <span>5</span>
            <span>6</span>
            <span>7</span>
            <span>8</span>
            <span>9</span>
            <span>10</span>
            <span>|</span>
            <span>다음 ></span>
        
            <!-- <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>6</button>
            <button>7</button>
            <button>8</button>
            <button>9</button>
            <button>10</button>
            <button>|</button>
            <button>다음</button> -->
            
            <br><br><hr><br>

        </div>

        
    </div>

    <%@include file="/views/common/footer.jsp" %>

</body>
</html>