<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

   #outer{
        width: 65%;
        margin: 0px auto;
        margin-bottom: 50%;
        margin-top: 5%;
    }

    #wrap {
        position: relative;
        height: 320px;
    }

    #wrap > div {
        width: 48.5%;
        height: 300px;
        border:1px solid #333;
        float:left;
        margin: 7px;
        box-sizing:border-box; /* border 또한 위치값을 갖기에 div크기가 더 커짐을 방지하기 위한 */
    }

    #wrap > div:first-child {
        width: 300px;
        height: 300px;
    }

    #wrap > div:nth-child(2) {
        width: 655px;
        height: 300px;
    }

   

    #wrap > div:first-child{
        background-image: url('https://image.croket.co.kr/storeItem/62ccdf5d75cac45e7e80a0c0/itemImg/1657593693985/0/item_emwT3.jpeg');
        background-size: 300px 300px;
    }

    #wrap > div:nth-child(2) {
        padding: 2%;
    }   

    #wrap > div:nth-child(3) {
        clear:both; /* float:left 의 줄바꿈을 위한 */
        width: 98.5%;
        height: 500px;
    }

    .btns a{
        width: 140px;
        height: 60px;
        float: left;
        text-align: center;
        font-weight: 1000;
        font-size: 20px;
        padding-top: 10px;
        margin-left: 5px;
        margin-bottom: 30px;
        text-decoration: none;
        color: whitesmoke;
    }

    .btns a:first-child{
       margin-left: 25%;
    }

    .btns a:hover{
        color: white;
    }
    
    .btn-success {
        margin-left: 60%;
    }




</style>
</head>
<body>

    <%@ include file="/views/common/header.jsp"%>

    <div id="outer">
        <hr>

            
                <div id="wrap">
                    <div class="product-images">
             
                    </div>

                    <div class="product-info">
                        <div>
                            범고래 나이키 판매 20(제목)
                            <br><br>
                        </div>

                        <div>
                            200,000(가격)
                            <button class="btn btn-success" onclick="clip(); return false;">URL 복사 | 공유</button>
                            <hr>
                        </div>

                        <div> 
                            조회 : 100
                            작성일 : 2022-08-05
                            <br><br>
                        </div>

                        <div>
                            *상품상태 : (중고/새상품)
                            <br>
                            *교환여부 : (교환가능/교환불가능)
                            <br>
                            *배송비 : (배송비 미포함/배송비 포함)
                            <button style="margin-left: 87%; border: none;" onclick="location.href=''">신고하기</button>
                            <br>
                        </div>
                        
                    </div>


                    <div class="others-info">
                        판매자정보 : <br>
                        아나바다 <br><br><br>

                        <hr>

                        상품정보 : <br>
                        파손폰 안쓰는폰 오래된폰 고장폰 정상폰 최고가 매입 합니다^^<br>
                        모든문의는 언제든지 번톡으로 가능합니다!<br>
                        <br>
                        기종 / 용량 / 파손여부 / 기능이상 상태 알려주시면 빠른상담이 가능합니다 궁금하신점은 언제든지 문의주세요!!!<br>
                        <br>

                        인천 지하철 1호선 작전역 1번출구 근처매장입니다!<br>
                      
                    </div>

                    <span class="btns">
                        <a href="" class="btn btn-secondary">찜</a>
                        <a href="" class="btn btn-warning"> 채팅</a>
                        <a href="" class="btn btn-danger">구매하기</a>
                    </span>
                   
                </div>


    </div>

    

    <script>
        function clip(){
        var url = '';   
        var textarea = document.createElement("textarea");  
    
        document.body.appendChild(textarea);
        url = window.document.location.href;  
        textarea.value = url;
        textarea.select(); 
        document.execCommand("copy");  
        document.body.removeChild(textarea);

        alert("URL이 복사되었습니다.");
    }
    </script>

    <%@include file="/views/common/footer.jsp" %>

  

</body>
</html>