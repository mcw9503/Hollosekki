<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminProductDetail</title>
<style>
	span{height:30px;}
</style>
</head>
<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	
	<div class="d-inline-block align-top mt-5 p-4 ps-5 rounded" style="width: 900px; height:1000px; border: 2px solid rgba(0,0,0,0.1);">
		<h4 class="py-4 mb-0">상품관리</h4>
		<div class="row">
			<div class="col-6 row">
<!-- 				<h5 class="my-3">- 개인정보 -</h5> -->
<!-- 				<span class="col-4">회원번호</span> -->
<!-- 				<input type="text" class="col-8 pb-1 mb-2 rounded border" value="1" readonly> -->
<!-- 				<span class="col-4">아이디</span> -->
<!-- 				<input type="text" class="col-8 pb-1 mb-2 rounded border" value="ganggangsu1" readonly> -->
<!-- 				<span class="col-4">이름</span> -->
<!-- 				<input type="text" class="col-8 pb-1 mb-2 rounded border" value="강건강" readonly> -->
<!-- 				<span class="col-4">이메일</span> -->
<!-- 				<input type="text" class="col-8 pb-1 mb-2 rounded border" value="rkd1@naver.com" readonly> -->
<!-- 				<span class="col-4">전화번호</span> -->
<!-- 				<input type="text" class="col-8 pb-1 mb-2 rounded border" value="010-9111-2222" readonly> -->
<!-- 				<span class="col-4">가입일자</span> -->
<!-- 				<input type="date" class="col-8 pb-1 mb-2 rounded border" value="2023-05-05" readonly> -->
<!-- 				<span class="col-4">출석체크</span> -->
<!-- 				<input type="text" class="col-8 pb-1 mb-2 rounded border" value="15" readonly> -->
<!-- 				<span class="col-4">탈퇴일자</span> -->
<!-- 				<input type="text" class="col-8 pb-1 mb-2 rounded border" value="" readonly> -->
<!-- 				<span class="col-4">활동여부</span> -->
<!-- 				<input type="text" class="col-8 pb-1 mb-2 rounded border" value="O" readonly> -->
<!-- 				<span class="col-4">관리자여부</span> -->
<!-- 				<input type="text" class="col-8 pb-1 mb-2 rounded border" value="O" readonly> -->
<!-- 				<span class="col-12"></span> -->

				
<!-- 				<h5 class="mb-3">- 기타정보 -</h5> -->
<!-- 				<span class="col-4">포인트</span> -->
<!-- 				<span class="col-8 pb-1 mb-2 rounded border text-end"> -->
<%-- 					<fmt:formatNumber pattern="###,###,###" value="1000"/> --%>
<!-- 				</span> -->
<!-- 				<span class="col-4">팔로잉</span> -->
<!-- 				<span class="col-8 pb-1 mb-2 rounded border text-end"> -->
<%-- 					<fmt:formatNumber pattern="###,###,###" value="9703"/> --%>
<!-- 				</span> -->
<!-- 				<span class="col-4">팔로워</span> -->
<!-- 				<span class="col-8 pb-1 mb-2 rounded border text-end"> -->
<%-- 					<fmt:formatNumber pattern="###,###,###" value="10547"/> --%>
<!-- 				</span> -->
<!-- 				<span class="col-4">레시피 등록 수</span> -->
<!-- 				<span class="col-8 pb-1 mb-2 rounded border text-end"> -->
<%-- 					<fmt:formatNumber pattern="###,###,###" value="94"/> --%>
<!-- 				</span> -->
<!-- 				<span class="col-4">총 스크랩 수</span> -->
<!-- 				<span class="col-8 pb-1 mb-2 rounded border text-end"> -->
<%-- 					<fmt:formatNumber pattern="###,###,###" value="1202"/> --%>
<!-- 				</span> -->
<!-- 				<span class="col-4">총 좋아요 수</span> -->
<!-- 				<span class="col-8 pb-1 mb-2 rounded border text-end"> -->
<%-- 					<fmt:formatNumber pattern="###,###,###" value="1702"/> --%>
<!-- 				</span> -->
			</div>
			
			<div class="col-6">
				<div class="ms-5" style="padding-top:56px;">
					<img class="w-100 rounded border" alt="로드 실패" src="${contextPath}/resources/images/persons.png"/>
				</div>
			</div>
			
			<input type="hidden" name="page" value="">
			<div class="d-flex justify-content-center pt-5">
				<button class="rounded me-4" onclick="location.href='${contextPath}/adminProductEdit.ad?page='" style="width: 100px; height:40px; border: 2px solid rgba(0,0,0,0.1); background:white; color: rgba(0,0,0,0.8);">수정하기</button>
				<button class="rounded" onclick="location.href='${contextPath}/adminProductManage.ad?page='" style="width: 100px; height:40px; border: 2px solid rgba(0,0,0,0.1); background:white; color: rgba(0,0,0,0.8);">뒤로가기</button>
			</div>
		</div>
	</div>
	
</body>
</html>