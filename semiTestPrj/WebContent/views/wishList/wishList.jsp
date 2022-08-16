<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래는 아나바다</title>

<style>
	
	main div{
		/* border: 1px dashed red; */
	}
/* 삭제 예정 */

	main{
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	main div{
		box-sizing: border-box;
		width: 1280px;
	}
	#banner-area{
		padding-top: 30px;
		height: 800px;
	}
	#recommend-area{
		height: 400px;
		padding-top: 30px;
	}
	#today-area{
		height: 1500px;
		padding-top: 35px;
	}

	


</style>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<style>


    html{
        overflow-y: scroll;
    }

    #outer{
        width: 65%;
        margin: 0px auto;
        margin-bottom: 5%;
        margin-top: 5%;
    }

    table{
        border: 1px black;
        width: 100%;
        text-align: center;
        border-spacing: 10px;
        border-collapse: collapse;
        border-top: 1px solid darkgray !important;
        border-bottom: 1px solid darkgray !important;
    }

    #next-page{
        margin-left: 30%;
        margin-top: 5%;
        padding-top: 10px;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 400;
    }

    #writeBtn{
        float: right;
        margin-right: 15px;
    }

    h1 {
        padding-top: 3%;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 400;
    }
    
    th, td {
        border-bottom: 0.5px dashed darkgray !important;
        padding: 5px;
        font-size: medium;
        font-family: 'IBM Plex Sans KR', sans-serif;
    }
    
    th{
        background-color: whitesmoke;
    }

    .title:hover, .writer:hover {
        text-decoration: underline 0.5px;
        
    }
    #page-outer{
        background-color: whitesmoke;
        width: 100%;
        height: 180px;
    }

    hr{
        height: 0.5px !important;
    }

    span{
        padding: 0px 10px;
        
    }
    
    .category{
        position: relative;
        width: 150px;
        height: 30px;
        border: 2px solid darkgray;
    }

    .search {
        position: relative;
        width: 120px;
        height: 30px;
        border: 2px solid darkgray;
    }

    .category .category-select, .search .search-select  {
        width: inherit;
        height: inherit;
        background: transparent;
        border: 0 none;
        outline: 0 none;
        font-family: 'IBM Plex Sans KR', sans-serif;
        font-weight: 400;
    }
    
     a {
        text-decoration: none !important;
        color: black !important;
    }

</style>
</head>
<body>

	
<div id="outer">
        
    
        
        <h1>장바구니</h1>
        

        <br><br>

        <form action="">
	        	<table>
	
	            <thead>
	                <tr>
	                    <th>전체00개</th>
	                    <th>선택</th>
	                    <th>상품명</th>
	                    <th>판매자</th>
	                    <th>추가날짜</th>
	                </tr>
	            </thead>
	
	            <!-- 예시 -->
	            <tbody>
	                <tr>
	                    <td>1</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title"><a href="noticeDetail.jsp">아나바다</a></td>
	                    <td class="writer"><a href="">남재현</a></td>
	                    <td>2022/08/03</td>
	                </tr>
	                <tr>
	                    <td>2</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">중고거래 플랫폼 만들었습니다</td>
	                    <td class="writer">박한솔</td>
	                    <td>2022/07/11</td>
	                </tr>
	                <tr>
	                    <td>3</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">ANBD</td>
	                    <td class="writer">이아름</td>
	                    <td>2022/11/11</td>
	                </tr>
	                <tr>
	                    <td>4</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">HI HELLO HOW ARE YOU</td>
	                    <td class="writer">서교상</td>
	                    <td>2022/08/09</td>
	                </tr>
	                <tr>
	                    <td>5</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">KK LOL HOHOHO</td>
	                    <td class="writer">박성현</td>
	                    <td>2015/08/09</td>
	                </tr>
	                <tr>
	                    <td>6</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">ANBD</td>
	                    <td class="writer">이아름</td>
	                    <td>2022/11/11</td>
	                </tr>
	                <tr>
	                    <td>7</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">HI HELLO HOW ARE YOU</td>
	                    <td class="writer">서교상</td>
	                    <td>2022/08/09</td>
	                </tr>
	                <tr>
	                    <td>8</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">KK LOL HOHOHO</td>
	                    <td class="writer">박성현</td>
	                    <td>2015/08/09</td>
	                </tr>
	                <tr>
	                    <td>9</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">ANBD</td>
	                    <td class="writer">이아름</td>
	                    <td>2022/11/11</td>
	                </tr>
	                <tr>
	                    <td>10</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">HI HELLO HOW ARE YOU</td>
	                    <td class="writer">서교상</td>
	                    <td>2022/08/09</td>
	                </tr>
	                <tr>
	                    <td>11</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">아나바다</td>
	                    <td class="writer">남재현</td>
	                    <td>2022/08/03</td>
	                </tr>
	                <tr>
	                    <td>12</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">중고거래 플랫폼 만들었습니다</td>
	                    <td class="writer"> 박한솔</td>
	                    <td>2022/07/11</td>
	                </tr>
	                <tr>
	                    <td>13</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">ANBD</td>
	                    <td class="writer">이아름</td>
	                    <td>2022/11/11</td>
	                </tr>
	                <tr>
	                    <td>14</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">HI HELLO HOW ARE YOU</td>
	                    <td class="writer">서교상</td>
	                    <td>2022/08/09</td>
	                </tr>
	                <tr>
	                    <td>15</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">KK LOL HOHOHO</td>
	                    <td class="writer">박성현</td>
	                    <td>2015/08/09</td>
	                </tr>
	                <tr>
	                    <td>16</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">아나바다</td>
	                    <td class="writer">남재현</td>
	                    <td>2022/08/03</td>
	                </tr>
	                <tr>
	                    <td>17</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">중고거래 플랫폼 만들었습니다</td>
	                    <td class="writer">박한솔</td>
	                    <td>2022/07/11</td>
	                </tr>
	                <tr>
	                    <td>18</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">ANBD</td>
	                    <td class="writer">이아름</td>
	                    <td>2022/11/11</td>
	                </tr>
	                <tr>
	                    <td>19</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">HI HELLO HOW ARE YOU</td>
	                    <td class="writer">서교상</td>
	                    <td>2022/08/09</td>
	                </tr>
	                <tr>
	                    <td>20</td>
	                    <td><input type="checkbox"></td>
	                    <td class="title">KK LOL HOHOHO</td>
	                    <td class="writer">박성현</td>
	                    <td>2015/08/09</td>
	                </tr>
	            </tbody>
	
	            <br clear="both">
	
	
	        </table>
	
	        <br>
	
	        <button name="writeBtn" id="writeBtn" class="btn btn-danger">삭제</button>
        </form>

        <div id="page-outer">
            <div id="next-page">
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
            </div>

            
        </div>
        

        
    </div>
	
	<%@ include file="/views/common/header.jsp" %>
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>