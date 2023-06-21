<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>
<%@ include file="../common/top.jsp" %>
<br><br>
	<div class="container-xxl" align="center">
		<br><br><br>
		<br>
		<br>
		<div class="customer d-flex align-items-start">
			<%@ include file="../common/customerBoardPanel.jsp" %>
		    <div class="tab-content" id="v-pills-tabContent">
			    <div class="tab-pane container text-center active" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="1">
					<br>
					<h1 style="text-align: left;">자주 묻는 질문</h1>
					<br>
					<hr style="width: 1050px;">
					<br>
					<div class="categoryBtn row justify-content-end" style="margin-right: 20px;">
						<div class="ddd col-2 dropdown-center">
							<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							    카테고리 전체
							</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">회원</a></li>
								<li><a class="dropdown-item" href="#">배송</a></li>
								<li><a class="dropdown-item" href="#">결제</a></li>
								<li><a class="dropdown-item" href="#">기타</a></li>
							</ul>
						</div>
						<input class="col-3" id="searchText" type="text" name="search">
						<button id="serachBtn" type="button" class="col-1 btn btn-outline-secondary">검색</button>
					</div>	
					<br>
					<div class="accordion acCustomer" id="accordionFlush">
						<c:forEach items="${ flist }" var="i" varStatus="st"> 
						<div class="accordion-item">
							<h2 class="accordion-header" id="flush-headingOne-${st.index +1 }">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne-${st.index +1 }" aria-expanded="false" aria-controls="flush-collapseOne-${st.index +1 }">
							        Q. ${i.faqTitle } 
							</button>
							</h2>
							<div id="flush-collapseOne-${st.index +1 }" class="accordion-collapse collapse" aria-labelledby="flush-headingOne-${st.index +1 }">
								<div class="accordion-body">
									<div>
										<h4>Q. 질문한 내용</h4>
										<span class="question">${i.faqTitle }</span>
									</div>
									<hr>
									<div> 
										<h4>A. 답변한 내용</h4>
										<span class="answer">${i.faqContent }</span>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
					<br><br><br>
					<div class="pageCustomers" > 
						<nav aria-label="Page navigation example">
							<ul class="pageCustomer pagination justify-content-center">
							    <c:if test="${ pi.currentPage > 1 }">
							    <li class="page-item">
							    	<c:url var="goBack" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
									</c:url>
									<a class="page-link" href="${ goBack }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								</c:if>
								<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
								   	<c:url var="goNum" value="${ loc }">
										<c:param name="page" value="${ p }"></c:param>
									</c:url>
								  	<li class="page-item pageCustomer"><a class="page-link" href="${ goNum }">${ p }</a></li>
								</c:forEach>
								<c:if test="${ pi.currentPage < pi.maxPage }">
								<li class="page-item">
									<c:url var="goNext" value="${ loc }">
										<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
									</c:url>
									<a class="page-link" href="${ goNext }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
								</c:if>
							</ul>
						</nav>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
<%@ include file="../common/footer.jsp" %>	

</body>
</html>