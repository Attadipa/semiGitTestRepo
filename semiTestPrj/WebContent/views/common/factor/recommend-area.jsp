<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
    #recommend-content-area{
        width: 100%;    
        height: 100%;
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        flex-wrap: wrap;
    }
    #recommend-content-area button{
        border: 1px solid blue; /*추후 삭제*/
        width: 200px;
        height: 150px;
        margin-left: 30px;
        margin-right: 30px;
        font-size: 30px;
        border: 3px solid green;
    }
   
</style>

</head>
<body>
    
    <div id="recommend-content-area">
        <button type="button" class="btn btn-outline-success">HOT</button>
        <button type="button" class="btn btn-outline-success">남성추천</button>
        <button type="button" class="btn btn-outline-success">여성추천</button>
        <button type="button" class="btn btn-outline-success">LUXURY</button>
        <button type="button" class="btn btn-outline-success">신발</button>
        <button type="button" class="btn btn-outline-success">악세사리</button>
        <button type="button" class="btn btn-outline-success">캠핑</button>
        <button type="button" class="btn btn-outline-success">추천</button>
    </div>
    
</body>
</html>