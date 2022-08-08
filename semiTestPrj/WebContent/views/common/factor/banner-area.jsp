<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<style>
	/* 브라우저 마진과 패딩 리셋
	* {margin:0;padding:0;} */

	/* INPUT 가리기 */
	.section [id*="slide"] {display:none;}
	
	/* 슬라이드 영역 - max-width 크기를 조절해주면 됩니다*/
	.section .slidewrap {max-width:1200px;margin:0 auto;overflow:hidden;position:relative;}
	.section .slidelist {white-space:nowrap;font-size:0;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}

	/* 좌우로 넘기는 LABEL버튼에 대한 스타일 */
	.section .slide-control {position:absolute;top:0;left:0;z-index:10;width:100%;height:100%;}
	.section .slide-control label {position:absolute;z-index:1;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slide-control .left {left:30px;background:url('views/common/factor/img/left.png') center center / 100% no-repeat;}
	.section .slide-control .right {right:30px;background:url('views/common/factor/img/right.png') center center / 100% no-repeat;}
	.section .slide-control [class*="control"] {display:none;}

	/* INPUT이 체크되면 변화값이 li까지 전달되는 스타일 */
	.section [id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section [id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section [id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}
	
	/*  INPUT이 체크되면 변화값이 좌우 슬라이드 버튼을 담고 있는 div 까지 전달되는 스타일 */
	.section [id="slide01"]:checked ~ .slidewrap .control01 {display:block;}
	.section [id="slide02"]:checked ~ .slidewrap .control02 {display:block;}
	.section [id="slide03"]:checked ~ .slidewrap .control03 {display:block;}
	</style>
</head>
<body>
<div class="section">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<div class="slidewrap">
		<ul class="slidelist">
			<li>
				<a>
					<img src="views/common/factor/img/slide01.jpg">
				</a>
			</li>
			<li>
				<a>
					<img src="views/common/factor/img/slide02.jpg">
				</a>
			</li>
			<li>
				<a>
					<img src="views/common/factor/img/slide03.jpg">
				</a>
			</li>
		</ul>

		<div class="slide-control">
			<div class="control01">
				<label for="slide03" class="left"></label>
				<label for="slide02" class="right"></label>
			</div>
			<div class="control02">
				<label for="slide01" class="left"></label>
				<label for="slide03" class="right"></label>
			</div>
			<div class="control03">
				<label for="slide02" class="left"></label>
				<label for="slide01" class="right"></label>
			</div>
		</div>
	</div>
</div>
</body>
</html>