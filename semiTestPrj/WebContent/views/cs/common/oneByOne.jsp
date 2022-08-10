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
        background-color: rgba(0, 0, 0, 0);
        border: 0px;
        bottom: 5%;
        right: 5%;
    }

    #chat-modal:hover {
        background-image: url("resources/image/cs-messanger2.png");
        cursor: pointer;
    }

    .modal-down {
        vertical-align: text-bottom;
        float: right;
    }
</style>
</head>
<body>

	<div id="chat-modal" data-bs-toggle="modal" data-bs-target="#oneByOne"></div>

    <div class="modal modal-down fade" id="oneByOne" tabindex="-1" aria-labelledby="oneByOneLabel" aria-hidden="true">
        <div class="modal-dialog modal-down modal-dialog-scrollable">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="oneByOneLabel">1대1 문의</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <textarea style="width: 100%; resize: none;"></textarea>
                <button class="btn btn-info">전송</button>
            </div>
          </div>
        </div>
      </div>

</body>
</html>