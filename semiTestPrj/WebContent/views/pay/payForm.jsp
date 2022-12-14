<%@page import="com.kh.member.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js" type="text/javascript"></script>

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
    #pay-method-container{
        width: 100%;
        height: 220px;
        margin: 0 auto;
    }
    #pay-method-container td{
        width: 30px;
        height: 50%;
    }
    input{
        cursor: pointer;
    }
    input[type=checkbox]{
        width: 30px;
        height:20px;
    }
    .method{
        display:none;
    }
    .method+label{
        display:flex;
        justify-content: center ;
        align-items: flex-end;
        cursor: pointer;
        width: 100%;
        height: 100%;
        border-radius: 10px;
        line-height: 50px;
        border: 3px solid rgb(194, 194, 194);
        box-sizing: border-box;
        color: rgb(77, 77, 77);
        font-size: 20px;
        font-weight: bold;
    }

    .method:checked+label{
        border: 3px solid rgb(222, 0, 0);
        box-sizing: border-box;
    }
    #submit-btn{
        width: 100%;
        height: 50px;
        border-radius: 10px;
        border: none;
        background-color: rgb(222, 0, 0);
        color: white;
        font-size: 20px;
        text-align: center;
    }
    #agree-box{
        height: 50px;
        display: flex;
        align-items: center;
    }

    #fake-submit{
        width: 100%;
        height: 50px;
        border-radius: 10px;
        border: none;
        background-color: rgb(222, 0, 0);
        color: white;
        font-size: 20px;
    }
    #pay-amount-container{
        width: 100%;
        height: 50px;
        background-color: rgb(255, 237, 134);
        border-radius: 10px;
        margin: auto;
        display: flex;
        align-items: center;
        justify-content: right;
        padding-right: 20px;
        box-sizing: border-box;
        font-size: 20px;
        font-weight: bold;
        color: rgb(56, 56, 56);
    }
    #delivery-container{
        width: 100%;
        margin: auto;
    }
    #delivery-container *{
        width: 100%;
        height: 40px;
        border: 1px solid grey;
        box-sizing: border-box;
        border-radius: 10px;
        margin: 5px;
        text-align: center;
        font-size: 17px;
    }
    #request-content-direct{
        display:none;
    }
    #title-container{
        width:100%;
        display: flex;
    }
    #method1 + label{background-image: url("/semiTestPrj/views/pay/resources/card.png");}
    #method2 + label{ background-image: url("/semiTestPrj/views/pay/resources/transfer.png");}
    #method3 + label{background-image: url("/semiTestPrj/views/pay/resources/virtual_account.jpg");}

    #method1 + label,#method2 + label,#method3 + label{
        background-size: 33% ;
        background-repeat: no-repeat;
        background-position: 50% 5%;
    }

    #method4 + label{background-image: url("/semiTestPrj/views/pay/resources/kakaopay.jpg");background-size:cover;}
    #method5 + label{background-image: url("/semiTestPrj/views/pay/resources/tosspay.png");background-size: cover;}
    #method6 + label{background-image: url("/semiTestPrj/views/pay/resources/payco.jpg");background-size: cover;}

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
    #period-container td{
        width: 33%;
        margin: 0 auto;
    }
    #period-container .period{
        display: none;
    }
    .period + label{
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 10px;
        height: 100%;
        width: 100%;
        color: grey;
        font-weight: bold;
    }
    .period:checked + label{
        background-color: white;
        color: black;
    }
    #period-container{
        height: 50px;
        width: 100%;
        background-color: rgb(225, 225, 225);
        border-radius: 10px;
        box-sizing: border-box;
    }

</style>
</head>
<body>


    <div id="container">
        <form action="/semiTestPrj/pay/insert" method="post">
        	<c:if test="${payCategory==1}"><h2>?????????,??????????????? ???????????????</h2></c:if>
        	<c:if test="${payCategory==2}"><h2>????????????,??????????????? ???????????????</h2></c:if>
        	<c:if test="${payCategory==3}"><h2>????????????</h2></c:if>
            <hr>
                <table id="title-container">
                    <tr>
                        <td rowspan="4"><img src="${avo.getFilePath()}" alt=""></td>
                        <td id="price">${tradeVo.price}???</td>
                    </tr>
                    <tr>
                        <td id="post-title">${tradeVo.title}</td>
                    </tr>
                </table>
                
                
            <c:if test="${payCategory==2}">
            <h2>?????????</h2>
                <div id="delivery-container">
                    <input type="text" name="delivery-address"  id="delivery-address" placeholder="??????????????? ??????????????????">
                    <input type="text" name="delivery-address-detail"  id="delivery-address-detail" placeholder="??????????????? ??????????????????">
                    <select name="request-content" id="request-content">
                        <option value="??????">????????? ????????????</option>
                        <option value="??????">??????</option>
                        <option value="?????? ?????? ?????? ??? ??????">?????? ?????? ?????? ??? ??????</option>
                        <option value="?????????">?????????</option>
                        <option value="?????????">?????????</option>
                        <option value="????????????">????????????</option>
                    </select>
                    <input type="text" name="request-content-direct" id="request-content-direct">
                </div>
            </c:if>
            
            
            <c:if test="${payCategory==3}">
            <h2>?????????</h2>
            <div id="keyword-container">
                <input type="text" name="keyword1" class="keyword" id="keyword1" placeholder="?????????1">
                <input type="text" name="keyword2" class="keyword" id="keyword2" placeholder="?????????2">
                <input type="text" name="keyword3" class="keyword" id="keyword3" placeholder="?????????3">
            </div>
            <h2>??????</h2>
            <table id="period-container">
                <tr>
                    <td>
                        <input type="radio" id="7days"  name="period" class="period" value="7" checked onclick="addPayAmount(7)">
                        <label for="7days">7???</label>                  
                    </td>
                    <td>
                        <input type="radio" id="15days" name="period" class="period" value="15"onclick="addPayAmount(15)">
                        <label for="15days">15???</label>
                    </td>
                    <td>
                        <input type="radio" id="30days" name="period" class="period" value="30"onclick="addPayAmount(30)">
                        <label for="30days">30???</label>
                    </td>
                </tr>
            </table>
            </c:if>
            
            
            <h2>????????????</h2>
				<c:if test="${payCategory==1 or payCategory==2}">
					<div id="pay-amount-container">${tradeVo.price}???</div>
				</c:if>
                <c:if test="${payCategory==3}">
					<div id="pay-amount-container">30,000???</div>
				</c:if>
                
            <h2>????????????</h2>
                <table id="pay-method-container">
                    <tr>
                        <td>
                            <input type="radio" id="method1" class="method" name="payMethod" value="card" checked>
                            <label for="method1">??????</label>
                        </td>
                        <td>
                            <input type="radio" id="method2" class="method" name="payMethod" value="trans">
                            <label for="method2">????????????<label>
                        </td>
                        <td>
                            <input type="radio" id="method3" class="method" name="payMethod" value="vbank">
                            <label for="method3">???????????????</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" id="method4" class="method" name="payMethod" value="kakaopay">
                            <label for="method4"></label>
                        </td>
                        <td>
                            <input type="radio" id="method5" class="method" name="payMethod" value="tosspay">
                            <label for="method5"></label>
                        </td>
                        <td>
                            <input type="radio" id="method6" class="method" name="payMethod" value="payco">
                            <label for="method6"></label>
                        </td>
                    </tr>
                </table>
            <div id="agree-box">
                <input type="checkbox" id="agree-check" required>
                <label for="agree-check">
                    ???????????? ??? 3??? ??????????????? ???????????? ????????? ??????????????? ???????????????.
                </label>
            </div>
            <input id="submit-btn" type="button" value="????????????" onclick="startPay()">
            
        </form>
        
    </div>
    <br>
    <script>
        //????????????(????????????, ????????????)
        let memberNoVal = '${loginMember.memberNo}';
        let tradeNoVal = '${tradeVo.tradeNo}';

        console.log("${avo.getFilePath()}");
    </script>

    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        //??????api??????

        let popWidth = 600;
        let popHeight = 500;
        window.onload = function(){
            document.getElementById("delivery-address").addEventListener("click", function(){ 
                new daum.Postcode({
                    oncomplete: function(data) { //????????? ????????? ??????
                        document.getElementById("delivery-address").value = data.address; // ?????? ??????
                        document.querySelector("input[name=delivery-address-detail]").focus(); //???????????? ?????????
                    },width:popWidth, height:popHeight
                }).open( 
                        {left: (window.screen.width / 2 )-(popWidth/2),
                        top: (window.screen.height / 2)-(popHeight/2)}
                       );
            });
        }
     </script>
     <script>
        //????????? ???????????? ???????????? ????????? ????????? ??????
       $('#request-content').click(function(){
        if($('#request-content').val()=='????????????'){
            $('#request-content-direct').css('display','block');
        }else{
            $('#request-content-direct').css('display','none');
        }
       })
     </script>

     <script>
        //???????????? ??? ??????????????????
        let payCategoryVal = '${payCategory}';
        let payAmountVal;
        let periodVal;

        if(payCategoryVal!=3){
            payAmountVal = '${tradeVo.price}';
        }else{
            payAmountVal = "30000";
            periodVal = "7"
        }
        function addPayAmount(days){
            const payAmountContainer = document.querySelector("#pay-amount-container");
            if(days==7){
                payAmountContainer.innerHTML = "30,000???";
                payAmountVal = "30000";
                periodVal="7";
            } 
            if(days==15){
                payAmountContainer.innerHTML = "60,000???";
                payAmountVal = "60000";
                periodVal="15";
            } 
            if(days==30){
                payAmountContainer.innerHTML = "100,000???";
                payAmountVal = "100000";
                periodVal="30";
            } 
        }
    </script>
     <script>
            var IMP = window.IMP; // ????????????
            IMP.init('imp16407085'); // <-- ?????? ????????? ???????????? ??????

           	function startPay(){
                //????????? ??????
                let keyword1Val = $('#keyword1').val();
                let keyword2Val = $('#keyword2').val();
                let keyword3Val = $('#keyword3').val();

                //????????? ??????
                
                let deliveryAddrVal;
                if($('#delivery-address').val()!=null){
                    deliveryAddrVal = $('#delivery-address').val()+" "+$('#delivery-address-detail').val();
                }

                //???????????? ?????? ??????
                let requestContentVal = $('#request-content').val();
                if(requestContentVal=='????????????'){
                    requestContentVal = $('#request-content-direct').val();
                    if(requestContentVal==null || requestContentVal==''){
                        requestContentVal = '??????';
                    }
                }

                //???????????? ??????
                let payMethod = $("input:radio[name=payMethod]:checked").val();
                let payMethodNoVal = "";
                let pgName = "";
                if(payMethod=='card'){pgName='kcp'; payMethodNoVal = '1';} 
                else if(payMethod=='trans'){pgName='kcp'; payMethodNoVal = '2';}
                else if(payMethod=='vbank'){pgName='kcp'; payMethodNoVal = '3';}
                else if(payMethod=='kakaopay'){pgName='kakaopay';payMethodNoVal = '4';} 
                else if(payMethod=='tosspay'){pgName='tosspay'; payMethodNoVal = '5'; payMethod='trans'}
                else if(payMethod=='payco'){pgName='payco'; payMethodNoVal = '6';}


                //????????? ???????????? ??????
                if($('#agree-check').is(":checked")==false){
                    alert("????????? ??????????????? ?????????????????????");
                } else {

                    IMP.request_pay({
                        pg : pgName,
                        pay_method : payMethod,
                        // merchant_uid: tradeNo, //???????????? ????????? ?????? ????????????
                        name : '?????????:???????????????', //?????? ????????????
                        amount : payAmountVal

                    }, function(rsp) { // callback ??????
                        if(rsp.success){
                            console.log(rsp);
                            $.ajax({
                                url : "/semiTestPrj/pay/insert",
                                method : "POST",
                                data : {
                                        payCategory : payCategoryVal,
                                        payAmount : payAmountVal,
                                        memberNo : memberNoVal,
                                        payMethodNo : payMethodNoVal,
                                        tradeNo : tradeNoVal,
                                        deliveryAddr : deliveryAddrVal,
                                        requestContent : requestContentVal,
                                        period : periodVal,
                                        keyword1 : keyword1Val,
                                        keyword2 : keyword2Val,
                                        keyword3 : keyword3Val
                                       },
                                success : function(x){
                                    console.log("????????????");
                                    if(x==1){
                                        alert('????????????');
                                        window.location='/semiTestPrj/index.jsp';
                                        
                                    }else{
                                        alert('????????????');
                                        window.location='/semiTestPrj/index.jsp';  
                                    }
                                },
                                error : function(e){
                                    console.log("????????????");
                                    alert('????????????');
                                }
                            })
                        }else{
                            alert("???????????????");
                            console.log(rsp);
                        }
                    });
                }   
            }   

	</script>


</body>
</html>