<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#chat-modal {
        position: fixed;
        display: block;
        height: 80px;
        width: 80px;
        border-radius: 50%;
        background-image: url("resources/image/cs-messanger.png");
        background-repeat: no-repeat;
        background-position: center;
        bottom: 5%;
        right: 5%;
    }

    #chat-modal:hover {
        background-image: url("resources/image/cs-messanger2.png");
        cursor: pointer;
    }
</style>
</head>
<body>

	<div id="chat-modal"></div>

</body>
</html>