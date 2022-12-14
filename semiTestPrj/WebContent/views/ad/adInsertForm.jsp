<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #container{
        width: 600px;
        margin: 0 auto;
    }
    #title-container img{
        width: 100px;
        height: 100px;
    }
    #price{
        font-size: 25px;
        font-weight: bold;
        vertical-align: bottom;
        padding-left: 10px;
        height: 50px;
    }
    #post-title{
        vertical-align: super;
        padding-left: 10px;
        height: 50px;
    }
    #keyword-container{
        width: 100%;
        display: flex;
        justify-content: space-between;
    }
    .keyword{
        height: 30px;
        width: 30%;
        font-size: 17px;
        border-radius: 5px;
        border: 2px solid grey;
    }
    #period-container td{
        width: 33%;
        margin: 0 auto;
    }
    #period-container input[type=radio]{
        display: none;
    }
    input[type=radio] + label{
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 10px;
        height: 100%;
        width: 100%;
        color: grey;
        font-weight: bold;
    }
    input[type=radio]:checked + label{
        background-color: white;
        color: black;
    }
    #period-container, #pay-amount-container{
        height: 50px;
        width: 100%;
        background-color: rgb(225, 225, 225);
        border-radius: 10px;
        box-sizing: border-box;
    }
    #pay-amount-container{
        display: flex;
        align-items: center;
        justify-content: end;
        background-color: gold;
        padding-right: 20px;
        font-size: 17px;
        font-weight: bold;
        color: rgb(73, 73, 73); 
    } 
    input[type=submit]{
        margin-top: 20px;
        width: 100%;
        height: 50px;
        background-color: rgb(230, 0, 0);
        color: white;
        border: none;
        border-radius: 10px;
        font-size: 20px;
        cursor: pointer;
    }
    input[type=submit]:active{
        background-color: rgb(200, 0, 0);
    }

</style>
</head>
<body>
    <div id="container">
        <form action="/semiTestPrj/pay/insert" method="post">
            <input type="hidden" name="tradeNo" value="${tradeVo.tradeNo}">
            <input type="hidden" name="isAd" value="true">
            <input type="hidden" id="pay-amount" name="payAmout">

            <h1>????????????</h1>
            <hr>
            <br>
            <table id="title-container">
                <tr>
                    <td rowspan="4"><img src="resources/gundam1.jpg" alt="????????? ????????????"></td>
                    <td id="price">${tradeVo.price}???</td>
                </tr>
                <tr>
                    <td id="post-title">${tradeVo.title}</td>
                </tr>
            </table>
            <h2>?????????</h2>
            <div id="keyword-container">
                <input type="text" name="keyword1" class="keyword" placeholder="?????????1">
                <input type="text" name="keyword2" class="keyword" placeholder="?????????2">
                <input type="text" name="keyword3" class="keyword" placeholder="?????????3">
            </div>
            <h2>??????</h2>
            <table id="period-container">
                <tr>
                    <td>
                        <input type="radio" id="7days"  name="period" value="7" onclick="addPayAmount(7)">
                        <label for="7days">7???</label>                  
                    </td>
                    <td>
                        <input type="radio" id="15days" name="period" value="15"onclick="addPayAmount(15)">
                        <label for="15days">15???</label>
                    </td>
                    <td>
                        <input type="radio" id="30days" name="period" value="30"onclick="addPayAmount(30)">
                        <label for="30days">30???</label>
                    </td>
                </tr>
            </table>
            <h2>????????????</h2>
            <div id="pay-amount-container"></div>
            <input type="submit" value="????????????">
        </form>
    </div>
    <script>
        function addPayAmount(days){
            const payAmountContainer = document.querySelector("#pay-amount-container");
            const payAmountValue = document.querySelector("#pay-amount");
            if(days==7){
                payAmountContainer.innerHTML = "30,000???";
                payAmountValue.value = "30000";
            } 
            if(days==15){
                payAmountContainer.innerHTML = "60,000???";
                payAmountValue.value = "60000";
            } 
            if(days==30){
                payAmountContainer.innerHTML = "100,000???";
                payAmountValue.value = "100000";
            } 
        }
    </script>

    

</body>
</html>