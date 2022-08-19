<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
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
    input[type=radio]{
        background-color: blue;

    }
    #pay-method-container{
        width: 100%;
        height: 200px;
        margin: 0 auto;
    }
    #pay-method-container td{
        width: 30px;
        height: 50px;
    }
    input{
        cursor: pointer;
    }
    input[type=checkbox]{
        width: 30px;
        height:20px;
    }
    input[type=radio]{
        display: none;
    }
    input[type=radio]+label{
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        width: 100%;
        height: 100%;
        border-radius: 10px;
        line-height: 50px;
        border: 3px solid rgb(194, 194, 194);
        box-sizing: border-box;
        color: grey;
        font-size: 20px;
    }
    input[type=radio]:checked+label{
        border: 3px solid rgb(222, 0, 0);
        box-sizing: border-box;
    }
    input[type=submit]{
        width: 100%;
        height: 50px;
        border-radius: 10px;
        border: none;
        background-color: rgb(222, 0, 0);
        color: white;
        font-size: 20px;
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
    #payAmount-container{
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

</style>
</head>
<body>
    <div id="container">
        <h1>결제</h1>
        <hr>
        <form action="/semiTestPrj/pay/insert" method="post">
            <input type="hidden" name="memberNo" value="0">
            <input type="hidden" name="postNo" value="0">
            <input type="hidden" name="payAmount" value="0">
            <h2>직거래,안전결제로 구매합니다</h2>
                <table id="title-container">
                    <tr>
                        <td rowspan="4"><img src="../ad/resources/gundam1.jpg" alt="게시글 대표사진"></td>
                        <td id="price">690,000원(가격)</td>
                    </tr>
                    <tr>
                        <td id="post-title">대형건담 180cm(게시글제목)</td>
                    </tr>
                </table>
            <h2>배송지</h2>
                <div id="delivery-container">
                    <input type="text" name="delivery-address"  id="delivery-address" placeholder="배송주소를 입력해주세요">
                    <input type="text" name="delivery-address-detail"  id="delivery-address-detail" placeholder="상세주소를 입력해주세요">
                    <select name="request-content" id="request-content">
                        <option value="0">배송시 요청사항</option>
                        <option value="1">문앞</option>
                        <option value="2">직접 받고 부재 시 문앞</option>
                        <option value="3">경비실</option>
                        <option value="4">우편함</option>
                        <option value="direct">직접입력</option>
                    </select>
                    <input type="text" name="request-content-direct" id="request-content-direct">
                </div>
            <h2>결제금액</h2>
                <div id="payAmount-container">690,000원</div>
            <h2>결제수단</h2>
                <table id="pay-method-container">
                    <tr>
                        <td>
                            <input type="radio" id="method1" name="payMethod" value="card">
                            <label for="method1">카드</label>
                        </td>
                        <td>
                            <input type="radio" id="method2" name="payMethod" value="trans">
                            <label for="method2">계좌이체<label>
                        </td>
                        <td>
                            <input type="radio" id="method3" name="payMethod" value="vbank">
                            <label for="method3">무통장입금</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" id="method4" name="payMethod" value="kakaopay">
                            <label for="method4">카카오페이</label>
                        </td>
                        <td>
                            <input type="radio" id="method5" name="payMethod" value="tosspay">
                            <label for="method5">토스</label>
                        </td>
                        <td>
                            <input type="radio" id="method6" name="payMethod" value="payco">
                            <label for="method6">페이코</label>
                        </td>
                    </tr>
                </table>
            <div id="agree-box">
                <input type="checkbox" id="agree-check" required>
                <label for="agree-check">
                    개인정보 제 3자 제공동의와 결제대행 서비스 이용약관에 동의합니다.
                </label>
            </div>
            <input type="submit" value="결제하기" onclick="startPay()">
            
        </form>
        
    </div>
    <br><br>
    
	<script>
		const submitBtn = $('input[type=submit]');

	</script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        window.onload = function(){
            document.getElementById("delivery-address").addEventListener("click", function(){ //주소입력칸을 클릭하면
                //카카오 지도 발생
                new daum.Postcode({
                    oncomplete: function(data) { //선택시 입력값 세팅
                        document.getElementById("delivery-address").value = data.address; // 주소 넣기
                        document.querySelector("input[name=delivery-address-detail]").focus(); //상세입력 포커싱
                    }
                }).open();
            });
        }
     </script>
     <script>
            var IMP = window.IMP; // 생략가능
            IMP.init('imp16407085'); // <-- 본인 가맹점 식별코드 삽입
            


           	function startPay(){
                const str = $("input:radio[name=method]:checked").val();
                console.log(str);
            	
            	IMP.request_pay({
                    pg : 'kcp',
                    pay_method : 'card',
                    merchant_uid: "order_no_0001", //상점에서 생성한 고유 주문번호
                    name : '주문명:결제테스트',
                    amount : 14000,
                    buyer_email : 'iamport@siot.do',
                    buyer_name : '구매자이름',
                    buyer_tel : '010-1234-5678',
                    buyer_addr : '서울특별시 강남구 삼성동',
                    buyer_postcode : '123-456',
                    m_redirect_url : '{모바일에서 결제 완료 후 리디렉션 될 URL}' // 예: https://www.my-service.com/payments/complete/mobile
                }, function(rsp) { // callback 로직
                	if(rsp.success){
                		alert("결제성공");
                		location
                		console.log(rsp);
                	}else{
                		alert("결제취소됨");
                		
                		console.log(rsp);
                	}
                });
            }   
	</script>


</body>
</html>