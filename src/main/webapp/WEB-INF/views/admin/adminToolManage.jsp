<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,500,0,0" />
<script src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	.btns{color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 35px; height: 25px; font-size: 12px;}
</style>
</head>

<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="mainBox d-inline-block align-top mt-5" style="width: 900px;">
		<h4 class="py-4 mb-0">상품관리</h4>
		<div style="width: 100%; border:1px solid black; margin-bottom:1px;"></div>
		<div style="width: 100%; border:1px solid black; margin-bottom:30px;"></div>
		<div style="width: 100%; margin-bottom:3px; height:35px;" class="d-flex justify-content-between">
			<div class="d-flex">
				<form id="pageCountForm" action="adminToolManage.ad">
					<input type="hidden" name="page" value="${ab.page}">
					<input type="hidden" name="searchType" value="${ab.searchType}">
					<input type="hidden" name="searchText" value="${ab.searchText}">
					<select name="pageCount" style="font-size: 14px; height:25px">
						<option value="10" <c:if test="${pageCount eq 10}">selected</c:if>>10개씩 보기</option>
						<option value="20" <c:if test="${pageCount eq 20}">selected</c:if>>20개씩 보기</option>
						<option value="40" <c:if test="${pageCount eq 40}">selected</c:if>>40개씩 보기</option>
					</select>
					<button style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 45px; height: 25px; font-size: 12px; font-weight: bold;">변경</button>
				</form>
			</div>
			<span class="material-symbols-outlined me-2 deleteBtn" style="font-size: 36px; color: black; text-shadow: 1px 1px 2px gray; cursor:pointer;">delete</span>
		</div>
			
		<form id="deleteForm" action="${contextPath}/adminToolDeletes.ad" method="post">
			<table class="w-100 text-center mb-3">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
					<th style="width: 6%">번호</th>
					<th style="width: 19%">이름</th>
					<th style="width: 9%">분류</th>
					<th style="width: 9%">가격</th>
					<th style="width: 8%">할인률</th>
					<th style="width: 8%">재고</th>
					<th style="width: 8%">구매자</th>
					<th style="width: 8%">조회수</th>
					<th style="width: 8%">좋아요</th>
					<th style="width: 10%">상태</th>
					<th style="width: 7%">
						<button type="button" class="allSelect" style="background-color: #19A7CE; color: white; border-radius: 5px; box-shadow: 2px 2px 3px 0px gray; width: 45px; height: 25px; font-size: 12px; font-weight: bold;">전체</button>
					</th>
				</tr>
				
				<c:forEach items="${tList}" var="t" varStatus="vs">
					<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
						<td>${t.productNo}
							<input type="hidden" name="productNo" value="${t.productNo}">
						</td>
						<td>
							<a href="${contextPath}/adminToolDetail.ad?page=${pi.currentPage}&pageCount=${ab.pageCount}&searchType=${ab.searchType}&searchText=${ab.searchText}&productNo=${t.productNo}">
								${t.toolName}
							</a>
						</td>
						<td>
							<c:if test="${t.toolType eq 1}">조리도구</c:if>
							<c:if test="${t.toolType eq 2}">보관용품</c:if>
							<c:if test="${t.toolType ne 1 && t.toolType ne 2}">기타</c:if>
						</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${t.productPrice}"/>원
						</td>
						<td>${t.productSale}%</td>
						<td>${t.productStock}</td>
						<td>${t.orderCount}</td>
						<td>${t.viewCount}</td>
						<td>${t.likeCount}</td>
						<td>
							<c:if test="${t.productStatus eq 'Y'}">
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: gray;">N</button>
							</c:if>
							<c:if test="${t.productStatus eq 'N'}">
								<button type="button" class="btns statusBtn" style="background-color: gray;">Y</button>
								<button type="button" class="btns statusBtn" style="background-color: #19A7CE;">N</button>
							</c:if>
						</td>
						<td><input type="checkbox" name="selectDelete" style="width: 16px; height: 16px;" value="${t.productNo}"></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div class="d-flex justify-content-end mb-5">
			<div class="d-flex">
				<button onclick="location.href='${contextPath}/adminToolWrite.ad'" style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 100px; height: 40px; font-size: 14px; font-weight: bold;">상품등록</button>
			</div>
		</div>
		<form id="searchForm">
			<input type="hidden" name="page" value="${ab.page}">
			<input type="hidden" name="pageCount" value="${ab.pageCount}">
			<div class="text-center">
				<input type="hidden" name="page" value="${pi.currentPage}"> 
				<select name="searchType" class="border" style="padding: 6px 7px;">
					<option value="name">이름</option>
				</select>

				<div style="width:200px" class="d-inline-block mb-4">
					<input type="search" class="form-control" name="searchText" value="${ab.searchText}">
				</div>
				<button style="background-color: #19A7CE; color: white; border-radius: 10px; box-shadow: 2px 2px 3px 0px gray; width: 70px; height: 38px; font-size: 14px; font-weight: bold;">검색</button>
			</div>
		</form>
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>

	<script>
		window.onload = () =>{
// 			삭제 체크박스 전체선택 이벤트
			const allSelect = document.getElementsByClassName('allSelect')[0];
			allSelect.addEventListener('click', ()=>{
				selectDeletes = document.getElementsByName('selectDelete');
				let count = 0;
				for(const sDel of selectDeletes){
					if(sDel.checked == true){
						count += 1;
					}
				}
				if(count == selectDeletes.length){
					for(const sDel of selectDeletes){
						sDel.checked = false;
					}
				}else{
					for(const sDel of selectDeletes){
						sDel.checked = true;
					}
				}
			})
			
// 			삭제버튼 클릭 이벤트 (confirm 띄우기)
			const deleteBtn = document.getElementsByClassName('deleteBtn')[0];
			deleteBtn.addEventListener('click', ()=>{
				const result = confirm("정말 삭제하시겠습니까?");
				if(result){
					document.getElementById('deleteForm').submit();
				}
			})
			
// 			상태 버튼 이벤트
			const statusBtns = document.getElementsByClassName('statusBtn');
			const pNos = document.getElementsByName('productNo');
			
			for(const i in statusBtns){
				if(i<statusBtns.length){
					let j = Math.floor(i/2);
					if(pNos[j].value != 0){
						statusBtns[i].addEventListener('click', function(){
							$.ajax({
								url: '${contextPath}/adminUpdateStatus.ad',
								data: {dataNo:pNos[j].value,
									   dataStatus:statusBtns[i].innerText,
									   dataType:4},
								success: data =>{
									if(data == "success"){
										if(i%2 == 0){
											statusBtns[i].style.background = "#19A7CE";
											statusBtns[i].nextElementSibling.style.backgroundColor = "gray";
										}else if(i%2 == 1){
											statusBtns[i].style.background = "#19A7CE";
											statusBtns[i].previousElementSibling.style.backgroundColor = "gray";
										}
									}else{
										alert("상태 변경에 실패하였습니다.");
									}
								},
								error: data => {
									console.log(data);
								}
							})
						})
					}
				}
			}
		}
	</script>
	
	
	
	
	
</body>
</html>