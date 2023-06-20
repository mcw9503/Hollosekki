<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>

.carrier {
	/* 		border:2px solid #dee2e6; */
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}

/* 테이블 관련 */
table {
	position: relative;
	text-align: center;
	border: 2px solid #dee2e6;
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}

tr {
	border: 2px solid #dee2e6;
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}

/* 상단 바 위 텍스트 요소 */
.barSpan {
	font-weight: bold;
	font-size: 17px;
	left: 630px;
	position: relative
}


hr {
	margin: 0 auto;
	width: 1200px;
	justify-content: center;
}


/* checkbox */
.check {
	width: 16px;
	height: 16px;
	border: 2px solid #000;
	border-radius: 4px;
	outline: none;
	cursor: pointer;
	justify-content: center;
}

.vertical-line {
	width: 1px;
	background-color: black;
	height: 100%;
	margin-left: 20%; /* 필요에 따라 간격 조정 */
}

.tableBorder1 {
	border-right: 2px solid #dee2e6;
	border-bottom: 2px solid #dee2e6
}

.imgTab {
	height: 300px;
}

.aHover {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 상위 요소의 색상 상속 */
}

.aHover:hover {
	color: #0055FF;
}

.chBox {
	width: 20px;
	height: 20px;
}

input[type="radio"] {
	transform: scale(1.5); /* 원하는 크기로 스케일 조정 */
}

input[type="text"] {
	height: 35px;
}

/* 상단 바 */
#allChec{
	height: 50px; margin: 0 auto; width: 1200px; background-color: #B0DAFF; 
	border-bottom: 2px solid #dee2e6; border-left: none; border-right: none; border-top: 2px solid #dee2e6; 
	display: flex; align-items: center
}

/* 주소 */
.address {
	width: 150px;
	height: 60px;
	border: 2px solid #dee2e6;
	background-color: #B0DAFF;
	border-right: none;
	text-align: left;
	padding: 20px;
}

/* 결제 div */
.payElement{
	padding-top: 40px; text-align: center; margin: 0 10px; border: 2px solid black; 
	width: 250px; height: 150px; border-radius: 2em
}

.payElement:hover{
	cursor:pointer;
}

.popup {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

.popup-content {
  border-radius:2em;
  background-color: white;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 950px;
  height:700px
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.shippingList{border-bottom:2px solid lightgray; height:45px;}
.shippingList2{border-bottom:2px solid lightgray; height:45px;}
</style>
</head>
<body>



	<%@include file="../common/top.jsp"%><br><br><br><br><br><br>
	

	<!-- 장바구니 상단 표 부분 -->
	<div class="carrier" style="margin-bottom: 10px;">
		<span style="font-size: 30px;"><b>주문상세내역</b></span> 
		<span class="barSpan">
			<a class="aHover" id="basketHover" style="color:lightgray; cursor:pointer" onclick="location.href='${contextPath}/basket.ma'">01 ㅈㅂㄱㄴ > </a>
			<a class="aHover" style="color: #0055FF">02 주문서작성/결제</a> 
			<a class="aHover" id="paySuccess" style="color:lightgray"> > 03 ㅈㅁㅇㄹ</a>
		</span>
	</div>
	<div id="allChec"></div><br><br>



	<!-- 장바구니 테이블 -->
	<table>
		<tr style="border: 2px solid #dee2e6; background-color: #B0DAFF;">
			<th class="tableBorder1" colspan="2" style="height: 40px"><b>상품/옵션정보</b></th>
			<th class="tableBorder1"><b>수량</b></th>
			<th class="tableBorder1"><b>상품가격</b></th>
			<th class="tableBorder1"><b>적립/할인</b></th>
			<th class="tableBorder1"><b>합계금액</b></th>
<!-- 			<th style="border-bottom: 2px solid #dee2e6">배송비</th> -->
		</tr>
		<tbody id="products">
			<c:forEach items="${ checkedCartList}" var="cl" varStatus="status" >
				<c:if test="${cl.preorderNo != checkedCartList[status.index - 1].preorderNo}">
				
<%-- 				<c:set var="prevPreorderNo" value="${cl.preorderNo}"/> --%>
<%-- 				<c:if test="${cl.preorderNo eq prevPreorderNo }"> --%>
				<tr class="productInfos" style="border-top: 2px solid #dee2e6;">
					<td class="imgTab">
						<input type="hidden" id="basketNo-${cl.productNo }" class="basketNos" value="${ cl.productNo }">
<%-- 						<input type="checkbox" onchange="changeCheckBox(this)" value="${cl.productNo }" id="chec-${cl.productNo }" name="checkProduct" style="width: 20px; height: 20px; margin-left:-15px; margin-right: 20px;"> --%>
						<img src="" style="border: 1px solid black; width: 200px; height: 200px;">
						<input type="hidden" value="${cl.preorderNo }">
					</td>
					<td style="border-right: 2px solid #dee2e6; text-align: left">
						<b>${cl.productName}</b><br><br>
						<c:forEach items="${optValues }" var="opt">
							<c:if test="${ opt.productNo eq cl.productNo }">
<%-- 								<input type="text" value="${opt.optionNo }"> --%>
								<span id="optNo-${opt.optionNo }">${opt.optionName } : ${ opt.optionValue }<br><br></span>
							</c:if>
						</c:forEach>
					</td>
					<td style="border-right: 2px solid #dee2e6; width:130px">
<%-- 						<i class="bi bi-dash-square-fill" id="minus-${cl.productNo}" style="color: #00AAFF; font-size: 15px;"></i>&nbsp; --%>
						<span class="cartCount" id="size-${cl.productNo}">${cl.cartCount }</span>개&nbsp;
<%-- 						<i class="bi bi-plus-square-fill" id="plus-${cl.productNo }" style="color: #00AAFF; font-size: 15px"></i> --%>
					</td>
					<td style="border-right: 2px solid #dee2e6; width:150px " >
						<span id="pp-${cl.productNo }" class="price">
						${cl.productPrice}
						</span>원
					</td>
					<td style="border-right: 2px solid #dee2e6; width:130px">
						<span class="point" id="point-${cl.productNo }"></span>P 적립
					</td>
					<td style="border-right: 2px solid #dee2e6; width:160px">
						<span class="sum" id="sum-${cl.productNo }">
						${cl.sum }
						</span>원
					</td>
<%-- 					<td id="shippingPrice-${cl.productNo }">${cl.shippingPrice }</td> --%>
				</tr>
				</c:if>
			</c:forEach>
<%-- 			<c:forEach items="${ cartList}" var="cl" > --%>
<!-- 				<tr class="productInfos" style="border-top: 2px solid #dee2e6;"> -->
<!-- 					<td class="imgTab"> -->
<%-- 						<input type="hidden" id="basketNo-${cl.productNo }" class="basketNos" value="${ cl.productNo }"> --%>
<%-- <%-- 						<input type="checkbox" value="${cl.productNo }" name="checkProduct" style="width: 20px; height: 20px; margin-left:-15px; margin-right: 20px;"> --%> --%>
<!-- 						<img src="" style="border: 1px solid black; width: 200px; height: 200px;"> -->
<!-- 					</td> -->
<!-- 					<td style="border-right: 2px solid #dee2e6; text-align: left"> -->
<%-- 						<b>${cl.productName}</b><br><br> --%>
<%-- 						옵션 : ${cl.selectedOpt } --%>
<!-- 					</td> -->
<!-- 					<td style="border-right: 2px solid #dee2e6; width:130px"> -->
<%-- 						<span class="cartCount" id="size-${cl.productNo}">${cl.cartCount }</span>개&nbsp; --%>
<!-- 					</td> -->
<!-- 					<td style="border-right: 2px solid #dee2e6; width:150px " > -->
<%-- 						<span id="pp-${cl.productNo }" class="price"> --%>
<%-- 						${cl.productPrice} --%>
<!-- 						</span>원 -->
<!-- 					</td> -->
<!-- 					<td style="border-right: 2px solid #dee2e6; width:130px"> -->
<%-- 						<span class="point" id="point-${cl.productNo }"></span>P 적립 --%>
<!-- 					</td> -->
<!-- 					<td style="border-right: 2px solid #dee2e6; width:160px"> -->
<%-- 						<span class="sum" id="sum-${cl.productNo }"> --%>
<%-- 						${cl.sum } --%>
<!-- 						</span>원 -->
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 				</c:forEach> --%>
		</tbody>
	</table><br><br>
	<div style="width: 1200px; margin: 0 auto; font-align: right">
		<i class="bi bi-caret-left-fill"></i><i class="bi bi-caret-left-fill"></i>
		<b>쇼핑 계속하기</b><br>
	</div><br>
	
	<!-- 금액 -->
	<table>
		<tbody>
			<tr style="height: 130px; font-size: 20px;">
				<td style="width: 800px; text-align: right">
					<b>총 <span id="orderSize">1</span>개의 상품 금액<br><br>
					<span style="color: #00AAFF" id="trTotalSum">46,500</span>원</b>
				</td>
				<td>
					&nbsp;&nbsp;&nbsp;<i class="bi bi-plus-circle-fill" style="color: #00AAFF; font-size: 30px"></i>
				</td>
				<td>
					<b>배송비<br><br><span style="color: #00AAFF" id="shipPrice">0</span>원</b>
				</td>
				<td>
					<span class="material-symbols-outlined" style="color: #00AAFF">equal</span>
				</td>
				<td>
					<b>합계<br><br><span style="color: #00AAFF" id="shipSum">46,500</span>원</b>
				</td>
			</tr>
			<tr>
				
			</tr>
		</tbody>
	</table><br><br>
	<!-- 배송 정보 -->
	<div
		style="width: 1200px; margin: 0 auto; margin-bottom: 10px; text-align: left; font-weight: bold; font-size: 30">
		배송정보</div>
	<table>
		<tr>
			<td class="address"><b>배송지 확인</b></td>
			<td style="width: 400px; text-align: left; padding-left: 13px">
				<div>
					<input type="radio" name="payment" style="margin-left: 10px; font-size: 70px; margin-right: 10px;">&nbsp;직접입력&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="radio" name="payment" style="font-size: 70px; margin-right: 10px;">&nbsp;주문자정보와 동일
					<button id="openButton">배송지 관리</button>
				</div>
			</td>
		</tr>
		<tr>
			<td class="address"><b>배송지 명</b></td>
			<td style="text-align: left; border-top: 2px solid #dee2e6; border-bottom: 2px solid #dee2e6">
				<div>
					<input type="text" id="shippingName" style="width: 400px; margin-left: 15px" name="payName">
				</div>
			</td>
		</tr>
		<tr>
			<td class="address"><b>받으실 분</b></td>
			<td
				style="text-align: left; border-top: 2px solid #dee2e6; border-bottom: 2px solid #dee2e6">
				<div>
					<input type="text" style="width: 400px; margin-left: 15px"
						name="payName">
				</div>
			</td>
		</tr>
		<tr>
			<td class="address" style="height: 167"><b>받으실 곳</b></td>
			<td style="text-align: left; height: 30px">
				<input type="text" style="width: 150px; margin-bottom: 10px; margin-left: 15px;" id="sample6_postcode" placeholder="우편번호"> 
				<input type="button" style="border-radius: 10; height: 35px;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" style="margin-bottom: 10px; width: 400px; margin-left: 15px;" placeholder="주소"><br> 
				<input type="text" id="sample6_detailAddress" style="margin-bottom: 10px; width: 400px; margin-left: 15px;" placeholder="상세주소"><br>
		</tr>
		<tr>
			<td class="address"><b>전화번호</b></td>
			<td style="width: 400px; text-align: left; height: 50px; border-top: 2px solid #dee2e6">
				<input type="text" style="width: 200px; margin-left: 15px;" name="payName">
			</td>
		</tr>
		<tr>
			<td class="address"><b>휴대폰 번호</b></td>
			<td style="width: 400px; text-align: left; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6">
				<input type="text" style="width: 200px; margin-left: 15px;" name="payName">
			</td>
		</tr>
		<tr>
			<td class="address"><b>배송 요청사항</b></td>
			<td style="text-align: left">
				<div>
					<input type="text" style="margin-left: 15px; width: 400px" name="payName" maxlength="50" placeholder="공백 포함 50글자까지 작성 가능합니다.">
				</div>
			</td>
		</tr>
	</table>

	<br>
	<br>
	<!-- 주문자 정보 -->
	<div
		style="width: 1200px; margin: 0 auto; margin-bottom: 10px; text-align: left; font-weight: bold; font-size: 30">
		주문자 정보</div>
	<table>
		<tr>
			<td class="address"><b>주문자 명</b></td>
			<td
				style="text-align: left; border-top: 2px solid #dee2e6; border-bottom: 2px solid #dee2e6">
				<div>
					<input type="text" style="width: 200px; margin-left: 15px"
						name="payName">
				</div>
			</td>
		</tr>
		<tr>
			<td class="address"><b>전화번호</b></td>
			<td
				style="width: 400px; text-align: left; height: 50px; border-top: 2px solid #dee2e6"><input
				type="text" style="width: 200px; margin-left: 15px;" name="payName"></td>
		</tr>
		<tr>
			<td class="address"><b>휴대폰 번호</b></td>
			<td
				style="width: 400px; text-align: left; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6">
				<input type="text" style="width: 200px; margin-left: 15px;"
				oninput="phoneNumber(this)" maxlength="14" name="phone">
			</td>
		</tr>
		<tr>
			<td class="address"><b>이메일</b></td>
			<td
				style="width: 400px; text-align: left; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6">
				<input type="email"
				style="width: 200px; height: 35px; margin-left: 15px;"
				name="payName">
			</td>
	</table>

	<br>
	<br>
	<!-- 결제 정보 -->
	<div
		style="width: 1200px; margin: 0 auto; text-align: left; margin-bottom: 10px; font-weight: bold; font-size: 30">
		결제 정보</div>
	<table>
		<tr>
			<td class="address"><b>상품합계</b></td>
			<td
				style="width: 420px; text-align: left; padding: 15px; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6"><span>46,500</span>원</td>
		</tr>
		<tr>
			<td class="address"><b>배송비</b></td>
			<td
				style="width: 420px; text-align: left; padding: 15px; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6"><span>0</span>원</td>
		</tr>
		<tr>
			<td class="address"><b>최종 결제금액</b></td>
			<td
				style="width: 420px; text-align: left; padding: 15px; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6"><span>46,500</span>원</td>
		</tr>
	</table>

	<br>
	<br>
	<br>
	<br>
	<div style="display: flex; justify-content: center;">
  <div class="payElement">
    <img style="border-radius:2em; width:45; height:45px"src="${contextPath }/resources/images/naverPay.jpg">
    <div>네이버페이 결제</div>
  </div>
  <div class="payElement">
    <div style="margin-left:40%; background:#B0DAFF; padding-top:8px; border-radius:2em; width:45px; height:45px; "><i class="bi bi-credit-card" style="font-size: 30px;"></i></div>
    <div>신용카드 결제</div>
  </div>
  <div class="payElement">
    <img style="border-radius:2em; width:45; height:45px"src="${contextPath }/resources/images/kakaoPay.jpg">
    <div>카카오페이 결제</div>
  </div>
</div>

	<!-- 배송지 관리 창  -->
	<div id="popup" class="popup">
	  <div class="popup-content">
	    <span class="close" id="closeButton">&times;</span>
	    <br><br>
	    <h3>나의 배송지 목록</h3><br>
	    <button id="openSecondButton" style="margin-left:600x;">+ 새 배송지 추가</button><br><br>
	    <table style=" height:35px; width:100%; border-left:none; border-right:none;">
	    	<tr class="shippingList2">
	    		<th>선택</th>
	    		<th style="width:150px">받으실 분</th>
	    		<th>배송지 명</th>
	    		<th style="width:300px">배송지</th>
	    		<th>전화번호</th>
	    		<th>휴대폰 번호</th>
<!-- 	    		<th>수정/삭제</th> -->
	    	</tr>
	    		<tbody id="tbody">
		    		<c:forEach items="${shipAddress}" var="sa" >
					    <tr class="shippingList">
					        <td><input type="radio" name="ship"></td>
					        <td>${sa.recipient}</td>
					        <td>배송지 명</td>
					        <td>${sa.address}</td>
					        <td>${sa.homePhone}</td>
					        <td>${sa.phone}</td>
<%-- 					        <td><button class='editShip'>수정</button><input type="text" value="${sa.shippingNo }"><button>삭제</button></td> --%>
					    </tr>
				    </c:forEach>
				</tbody>
				
	    </table>
	    <br><br><button id="editShipping">수정</button>&nbsp;<button>삭제</button>
	  </div>
	</div>

	<!-- 배송지 추가 시 입력 창 -->
	<div id="secondPopup" class="popup">
  <div class="popup-content">
  	<span class="close" id="closeButton2">&times;</span><br><br><br>
    <table style="width:800px; margin-top:20px">
		<tr>
			<td class="address"><b>받으실 분</b></td>
			<td style="text-align: left; border-top: 2px solid #dee2e6; border-bottom: 2px solid #dee2e6">
				<div>
					<input type="text" required id="orderName2" style="width: 400px; margin-left: 15px" name="payName">
				</div>
			</td>
		</tr>
		<tr>
			<td class="address"><b>배송지 명</b></td>
			<td style="text-align: left; border-top: 2px solid #dee2e6; border-bottom: 2px solid #dee2e6">
				<div>
					<input type="text" id="shippingName2" style="width: 400px; margin-left: 15px" name="payName">
				</div>
			</td>
		</tr>
		<tr>
			<td class="address" style="height: 167"><b>받으실 곳</b></td>
			<td style="text-align: left; height: 30px">
				<input type="text" style="width: 150px; margin-bottom: 10px; margin-left: 15px;" id="sample7_postcode" placeholder="우편번호"> 
				<input type="button" style="border-radius: 10; height: 35px;" onclick="sample7_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample7_address" style="margin-bottom: 10px; width: 400px; margin-left: 15px;" placeholder="주소"><br> 
				<input id="detailAddress2" type="text" id="sample7_detailAddress" style="margin-bottom: 10px; width: 400px; margin-left: 15px;" placeholder="상세주소"><br>
		</tr>
		<tr>
			<td class="address"><b>전화번호</b></td>
			<td style="width: 400px; text-align: left; height: 50px; border-top: 2px solid #dee2e6">
				<input id="homeNumber2" type="text" style="width: 200px; margin-left: 15px;" name="payName">
			</td>
		</tr>
		<tr>
			<td class="address"><b>휴대폰 번호</b></td>
			<td style="width: 400px; text-align: left; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6">
				<input id="phoneNumber2" type="text" style="width: 200px; margin-left: 15px;" name="payName">
			</td>
		</tr>
	</table>
    <button id="confirmButton">확인</button>
  </div>
</div>


<!-- 배송지 수정 창 -->
<div id="updatePopup" class="popup">
  <div class="popup-content">
  	<span class="close" id="closeButton3">&times;</span><br><br><br>
    <table style="width:800px; margin-top:20px">
		<tr>
			<td class="address"><b>받으실 분</b></td>
			<td style="text-align: left; border-top: 2px solid #dee2e6; border-bottom: 2px solid #dee2e6">
				<div>
					<input type="text" required id="updateOrderName" style="width: 400px; margin-left: 15px" name="payName">
				</div>
			</td>
		</tr>
		<tr>
			<td class="address"><b>배송지 명</b></td>
			<td style="text-align: left; border-top: 2px solid #dee2e6; border-bottom: 2px solid #dee2e6">
				<div>
					<input type="text" id="updateShippingName" style="width: 400px; margin-left: 15px" name="payName">
				</div>
			</td>
		</tr>
		<tr>
			<td class="address" style="height: 167"><b>받으실 곳</b></td>
			<td style="text-align: left; height: 30px">
				<input type="text" style="width: 150px; margin-bottom: 10px; margin-left: 15px;" id="update_postcode" placeholder="우편번호"> 
				<input type="button" style="border-radius: 10; height: 35px;" onclick="update_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="update_address" style="margin-bottom: 10px; width: 400px; margin-left: 15px;" placeholder="주소"><br> 
				<input id="update_detailAddress" type="text" id="update_detailAddress" style="margin-bottom: 10px; width: 400px; margin-left: 15px;" placeholder="상세주소"><br>
		</tr>
		<tr>
			<td class="address"><b>전화번호</b></td>
			<td style="width: 400px; text-align: left; height: 50px; border-top: 2px solid #dee2e6">
				<input id="updateHomeNumber" type="text" style="width: 200px; margin-left: 15px;" name="payName">
			</td>
		</tr>
		<tr>
			<td class="address"><b>휴대폰 번호</b></td>
			<td style="width: 400px; text-align: left; height: 50px; border-bottom: 2px solid #dee2e6; border-top: 2px solid #dee2e6">
				<input id="updatePhoneNumber" type="text" style="width: 200px; margin-left: 15px;" name="payName">
			</td>
		</tr>
	</table>
    <button id="updateConfirm">확인</button>
  </div>
</div>





<br><br><br><br><br><br>

<%@include file="../common/footer.jsp"%>


</body>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//주소 찾기 
    function sample6_execDaumPostcode() { //우편번호 찾기 클릭 시
        new daum.Postcode({ //다음에서 제공하는 Postcode 메서드 
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
			    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	
  //주소 찾기 
    function sample7_execDaumPostcode() { //우편번호 찾기 클릭 시
        new daum.Postcode({ //다음에서 제공하는 Postcode 메서드 
            oncomplete: function(data) {
                var addr = ''; // 주소 변수

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
                console.log(document.getElementById('sample7_postcode'));

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample7_postcode').value = data.zonecode;
                document.getElementById("sample7_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
//                 document.getElementById("sample7_detailAddress").focus();
                window.close();
            }
        }).open();
    }
  
  //수정 시 주소 찾기 
  function update_execDaumPostcode() { //우편번호 찾기 클릭 시
        new daum.Postcode({ //다음에서 제공하는 Postcode 메서드 
            oncomplete: function(data) {
                var addr = ''; // 주소 변수

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
                console.log(document.getElementById('update_postcode'));

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('update_postcode').value = data.zonecode;
                document.getElementById("update_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
//                 document.getElementById("sample7_detailAddress").focus();
                window.close();
            }
        }).open();
    }
  
  
  
</script>

<script>
	window.onload = () => {
		
		
		//총 주문 개수
		let totalCount = 0;
		const cartCount = document.getElementsByClassName('cartCount');
		for(const cc of cartCount) {
			const intCount = parseInt(cc.innerText);
			totalCount += intCount;
		}			
		document.getElementById('orderSize').innerText = totalCount;
		
		//총 합계 금액 
		let trTotalSum = 0;
		const trSum = document.getElementsByClassName('sum');
		for(const sum of trSum) {
			
			const intSum = parseInt(sum.innerText);
			trTotalSum += intSum;
		}document.getElementById('trTotalSum').innerText = trTotalSum;
		
		//포인트
		const parentPnos = document.getElementsByClassName('imgTab');
		for(let p of parentPnos) { 
			let pNos = p.children[0].value;
			let sumPrice = parseInt(document.getElementById('sum-' + pNos).innerText);
			document.getElementById('point-' + pNos).innerText = (sumPrice*0.005) 
		}
		
		
		//배송비
		if(trTotalSum <= 30000) {
			document.getElementById('shipPrice').innerText = '3,000';
		}
		//총 합계 + 배송비 
		const intTrTotalSum = parseInt(document.getElementById('shipPrice').innerText.replace(/,/g, ''));
		const shipSum = trTotalSum + intTrTotalSum;
		document.getElementById('shipSum').innerText = shipSum;
		
		
		
		
		//마우스 올렸을 때 글자 변화 
		document.getElementById('basketHover').addEventListener('mouseover', function() {
			this.innerHTML = '01 장바구니 >';
		})
		document.getElementById('basketHover').addEventListener('mouseleave', function() {
			this.innerHTML = '01 ㅈㅂㄱㄴ >';
		})
		document.getElementById('paySuccess').addEventListener('mouseover', function() {
			this.innerHTML = '> 03 주문완료 &nbsp;';
		})
		document.getElementById('paySuccess').addEventListener('mouseleave', function() {
			this.innerHTML = '> 03 ㅈㅁㅇㄹ &nbsp;';
		})
		
	
		//배송지 관리 - 추가 
		const openButton = document.getElementById("openButton");
		const closeButton = document.getElementById("closeButton");
		const closeButton2 = document.getElementById("closeButton2");
		const openSecondButton = document.getElementById("openSecondButton");
		const closeSecondButton = document.getElementById("closeSecondButton");
		const confirmButton = document.getElementById("confirmButton");
		console.log(confirmButton);
		const popup = document.getElementById("popup");
		const secondPopup = document.getElementById("secondPopup");

		// 배송지 관리 이벤트 처리
		openButton.addEventListener("click", function() {
		  popup.style.display = "block";
		  
		  //배송지 조회 
		  $.ajax({
			  url:'${contextPath}/selectShipping.ma',
			  data: {
				  usersNo:${loginUser.usersNo}
			  },
			  success: data => {
				  const tbody = document.getElementById('tbody');
				  document.getElementById('tbody').innerHTML = '';
				 
				  for(datas of data) {
					  const shippingNo = datas.shippingNo;
					  console.log(shippingNo);
					  var row = document.createElement("tr");
					  row.classList.add('shippingList');
// 					  row.children.classList.add('shippingList');
					  row.innerHTML = 
						"<td><input type='radio' name='ship' value='" + shippingNo + "'></td>" +
					    "<td>" + datas.recipient + "</td>" +
					    "<td>" + datas.shippingName + "</td>" +
					    "<td>" + datas.address + "</td>" +
					    "<td>" + datas.homePhone + "</td>" +
					    "<td>" + datas.phone + "</td>";
// 					    "<td><button class='editShip'>수정</button><input type='text' value='" + shippingNo + "'><button>삭제</button></td>";
					    
					    
					  tbody.append(row);
				  }
			  }, 
			  error: data => {
				  console.log(data);
			  }
		  })
		});

				  
				  
				  
				  
		//수정 버튼 클릭 시 
	    document.getElementById('editShipping').addEventListener('click',() => {
	    	const ship = document.getElementsByName('ship');
			let checkedShip = 0;
			for(let i=0; i<ship.length; i++) {
				if(ship[i].checked) {
					checkedShip = ship[i].value;
					break;
				  }
			}
			   
			if(checkedShip == 0) {
				swal({
					 text: "수정할 목록을 선택해주세요.",
					 icon: "error",
					 button: "확인",
					});
			} else {
				popup.style.display = 'none';
				document.getElementById('updatePopup').style.display = 'block';
				let shippingNo = checkedShip; 
				console.log(shippingNo);
				
				$.ajax({
					url:'${contextPath}/updateShipping.ma',
					data:{
						shippingNo:shippingNo
					},
					success: data => {
						console.log(data);
						const pullAddress = data.address;
						const splitPullAddress = pullAddress.split(",");
						const postNo = splitPullAddress[0].replace("[", "").trim();
						const address = splitPullAddress[1].trim();
						const detailAddress = splitPullAddress[2].replace("]", "").trim();
						
						console.log(document.getElementById('orderName2'))
						document.getElementById('updateOrderName').value = data.recipient;
						document.getElementById('updateShippingName').value = data.shippingName;
						document.getElementById('update_postcode').value = postNo;
						document.getElementById('update_address').value = address;
						document.getElementById('update_detailAddress').value = detailAddress;
						document.getElementById('updateHomeNumber').value = data.homePhone;
						document.getElementById('updatePhoneNumber').value = data.phone;
						
					},
					error: data => {
						console.log(data);
					}
				})
				
				
			}
			  
			
			  
			  
			  
			  
		  })
		
		// "x" 버튼 클릭 이벤트 처리
		closeButton.addEventListener("click", function() {
		  popup.style.display = "none";
		});

		
		// 배송지 추가 창 열기 버튼 클릭 이벤트 처리
		openSecondButton.addEventListener("click", function() {
			if(document.getElementById('tbody').children.length >= 5) {
				  alert('배송지는 최대 5개만 등록 가능합니다.');
				  return;
			  } else {
				  popup.style.display = "none";
				  secondPopup.style.display = "block";
			  }
		});
		
		//배송지 추가 창 닫기 버튼 클릭 이벤트 처리 
		closeButton2.addEventListener('click', () => {
			secondPopup.style.display = "none";
			popup.style.display = "block";
		})
		
		// 확인 버튼 클릭 이벤트 처리 - 배송지 등록 및 조회 
		confirmButton.addEventListener("click", function() { 
			const shippingName = document.getElementById('shippingName2').value;
			const orderName = document.getElementById('orderName2').value;
			const postcode = document.getElementById('sample7_postcode').value;
			const addressInfo = document.getElementById('sample7_address').value;
			const detailAddress = document.getElementById('detailAddress2').value;
			const homePhone = document.getElementById('homeNumber2').value;
			const phone = document.getElementById('phoneNumber2').value;
			
		  if (orderName.trim() === '' || postcode.trim() === '' || addressInfo.trim() === '' || detailAddress.trim() === '' || homePhone.trim() === '' || phone.trim() === '') {
			  alert('모든 입력값은 필수사항입니다.')  
			  return;
	      } else {
	    	  secondPopup.style.display = "none";
			  popup.style.display = "block";
			  
			  // 지우기
		      const tbody = document.getElementById('tbody');
		      tbody.innerHTML = '';
			  $.ajax({
				  url:'${contextPath}/insertShipping.ma',
				  data:{usersNo:${loginUser.usersNo},
					  shippingName:shippingName,
					  recipient:orderName,
					  postcode:postcode,
					  addressInfo:addressInfo,
					  detailAddress:detailAddress,
					  homePhone:homePhone,
					  phone:phone
				  },
				  success: data => {
					  const tbody = document.getElementById('tbody');
					  document.getElementById('tbody').innerHTML = '';
					  
					  for(datas of data) {
						  
						  console.log('datas : ' + datas);
						  var row = document.createElement("tr");
						  row.classList.add('shippingList');
						  row.innerHTML = "<td><input type='radio' name='ship'></td>" +
						    "<td>" + datas.recipient + "</td>" +
						    "<td>" + datas.shippingName + "</td>" +
						    "<td>" + datas.address + "</td>" +
						    "<td>" + datas.homePhone + "</td>" +
						    "<td>" + datas.phone + "</td>";
// 						    "<td><button class='editShip'>수정</button><button>삭제</button></td>";
						    
						  tbody.append(row);
					  }
					  
				  },
				  error: data => {
					  console.log(data);
				  }
			  })
	      }
		  

		});
		
		
		
	}
</script>

</html>
