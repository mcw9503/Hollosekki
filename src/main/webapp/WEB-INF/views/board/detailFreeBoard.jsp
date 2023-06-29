<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Insert title here</title>
<style>

#floatingText{
	background-color: white;
	height: 500px;
	vertical-align: baseline;
}
#floatingInput{
	background-color: white;
}
/* table { */
/* 	text-align: center; */
/* 	margin: 0 auto; */
/* 	width: 900px; */
/* 	border-top: 2px solid #444444; */
/* 	border-bottom: 2px solid #444444; */
/* 	border-collapse: collapse; */
/* } */

/* th, td { */
/* 	border-top: 1px solid #444444; */
/* 	border-left: 1px solid #444444; */
/* 	padding: 10px; */
/* } */

/* th:first-child, td:first-child { */
/* 	border-left: none; */
/* } */

/* 3D Button */
.btn-3d {
	text-decoration: none;
	width: 100px;
	height: 35px;
	position: relative;
	display: inline-block;
	font-weight: bold;
	font-size: 15px;
	padding: 5px;
	/*   padding: 20px 60px; */
	color: white;
	margin: 20px 10px 10px;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
}

.btn-3d.blue:hover {
	color: white;
	background-color: #699DD1;
}

.btn-3d:active {
	top: 9px;
}

.btn-3d.blue {
	background-color: #6DA2D9;
	box-shadow: 0 0 0 1px #6698cb inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 8px 0 0 rgba(110, 164, 219, .7), 0 8px 0 1px
		rgba(0, 0, 0, .4), 0 8px 8px 1px rgba(0, 0, 0, 0.5);
}

.btn-3d.blue:active {
	box-shadow: 0 0 0 1px #6191C2 inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 0 0 1px rgba(0, 0, 0, 0.4);
}

#parentDiv{
	padding:75px; 
	border:5px solid #B0DAFF;
	width:1200px; 
	margin:0 auto;
/* 	margin-left:330px; */
	justify-content: center;
	border-radius:2em;
}

.note-modal-content{height:350px}

.comment{
	border:5px solid #B0DAFF;
	padding:75px; 
	width:1200px; 
	margin:0 auto;
/* 	margin-left:330px; */
	justify-content: center;
	border-radius:2em;
}

#replySubmit{
	display: inline-block;
 	margin-top: -50px; 
	vertical-align: top;
	 
}

#reBtn{
	width: 47px; height: 28px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	font-size: 14px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 2px; 
}
#xBtn{
	width: 47px; height: 28px;
	border: 2px solid black;
	border-radius: 20px;
	box-shadow: 0px 5px black;
	font-size: 14px;
	font-weight: 500;
	background-color: #B0DAFF;
	padding: 2px; 
}

</style>

</head>
<body>
	
	<%@include file="../common/top.jsp"%>
	<br><br><br><br><br><br><br><br><br><br><br>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- 서머노트를 위해 추가해야할 부분 -->
	<script src="resources/summernotes/summernote-lite.js"></script>
	<script src="resources/summernotes/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="resources/summernotes/summernote-lite.css">
	
	<div id="parentDiv">
		<div class="intro form-floating mb-3">
		   <input readonly type="text" class="form-control" id="floatingInput" value="${ blist.boardTitle }">
		   <label>제목</label>
		</div>
		<div class="row text-center">
			<c:forEach items="${ aList }" var="a">
				<c:if test="${ a.usersNo eq blist.usersNo }">
					<p style="cursor: pointer;" class="d-inline text-start col-5" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${ a.usersId }' + '&uNo=' + '${ a.usersNo }' + '&page='">작성자 : ${blist.nickName }</p>
				</c:if>
			</c:forEach>
			<p class="d-inline col-3">조회수 : ${blist.boardCount } </p>
			<p class="d-inline col-4">작성날짜 : <fmt:formatDate value="${blist.boardDate }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></p>
		</div>
		<input type="hidden" id="hdnBoardNo" value="${blist.boardNo}">
		<br>
		<div class="intro form-floating text-start text-wrap">
		   <textarea name="content" style="resize: none;" readonly class="form-control" id="floatingText">${blist.boardContent}</textarea>
		   <label>내용</label>
		</div>
	</div><br>
		<div class="comment text-start">
			<div class="intro">
				<label>댓글 내용</label>
				<table class="table text-center">
					<thead>
						<tr>
							<th class="col-6">댓글내용</th>
							<th class="col-2">작성자</th>
							<th class="col-2">작성일</th>
							<th class="col-1">수정</th>
							<th class="col-1">삭제</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list }" var="r" varStatus="var"> 
						<tr>
							<td>${r.reviewContent}</td>
							<c:forEach items="${ aList }" var="a">
								<c:if test="${ r.reviewWriter eq a.nickName }">
									<td style="cursor: pointer;" onclick="location.href='${contextPath}/otherUsersProfile.en?uId=' + '${ a.usersId }' + '&uNo=' + '${ a.usersNo }' + '&page=' ">${r.reviewWriter }</td>
								</c:if>
							</c:forEach>
							
							<td><fmt:formatDate value="${r.reviewDate }" pattern="yyyy-MM-dd HH:mm"/></td>
							<td>
								<button type="button" class="reBtn" id="reBtn">수정</button>
							</td>
							<td>
								<button type="button" class="xBtn" id="xBtn">삭제</button>
								<input type="hidden" id="hdnReplyNo" value="${r.reviewNo}">
							</td>
						</tr>
					</c:forEach>	
					</tbody>
				</table>
			</div><br>
			<div class="intro form-floating">
				<input type="text" name="commentWrite" id="commentWrite" class="form-control">
				<label for="commentWrite">댓글 작성</label>
			</div>
			<div class="position-relative">
				<a id="replySubmit" class="btn-3d blue position-absolute end-0">작성하기</a>
			</div>
		</div>
	<!-- 작성 버튼 -->
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<div class="modal" id="deleteModal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">댓글 삭제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>댓글을 삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">예</button>
	        <button type="button" class="btn btn-primary deleteYes">아니요</button>
	      </div>
	    </div>
	  </div>
	</div>

	<%@include file="../common/footer.jsp"%>

</body>
<script>

window.onload=()=>{
	const deleteModal = document.getElementById('deleteModal');
	const xBtn = document.querySelectorAll('.xBtn');
	const replySubmit = document.getElementById('replySubmit');
	const deleteYes = document.getElementsByClassName("deleteYes");
	
		
	$('.xBtn').each(function(index, item){
		$(this).click(function(e){
			e.preventDefault();
			console.log(index);
			$('#deleteModal').modal("show");
			
		 	for(const yes of deleteYes){
		 		yes.addEventListener('click', ()=>{
		 			const hdnBoardNo = document.querySelector('#hdnBoardNo');
		 			const hdnReplyNo = document.getElementById('hdnReplyNo');
	 				$.ajax({
	 					url: 'replyDelete.bo',
	 					data:{
	 						reviewNo: hdnReplyNo.value,
	 						reviewWriter: '${login}',
	 						productNo: hdnBoardNo.value
	 					},
	 					success: data=>{
	 						console.log(data);
	 						if(data == 'success'){
	 							const trs = document.querySelectorAll('tr');
	 							trs[index].innerHTML = '';
	 						}else{
	 							alert("오류로 인해 삭제가 되지 않았습니다.");
	 							location.reload();
	 						}
	 					}
	 				});
	 			
		 		})
		 	};
			
		})
	});
	
	replySubmit.addEventListener('click', ()=>{
		const hdnBoardNo = document.querySelector('#hdnBoardNo');
		const reviewCon = document.getElementById('commentWrite');
		$.ajax({
			url: 'insertReply.bo',
			dataType: 'json',
			data: {
					productNo: hdnBoardNo.value,
					reviewContent: reviewCon.value,
					reviewWriter: '${login}'
			},
			success: data =>{
				console.log(data);
				const tbody = document.querySelector('tbody');
				tbody.innerHTML = '';
				
				for(const r of data){
					
					const tr = document.createElement('tr');
					
					const contentTd = document.createElement('td');
					contentTd.innerText = r.reviewContent;
					
					const writerTd = document.createElement('td');
					writerTd.innerText = r.reviewWriter;
					
					const dateTd = document.createElement('td');
					dateTd.innerText = r.reviewDate;
					
					const modifyBtn = document.createElement('td');
					modifyBtn.innerHTML = '<button type="button" id="reBtn">수정</button>';
					
					const deleteBtn = document.createElement('td');
					deleteBtn.innerHTML = '<button type="button" id="xBtn">삭제</button>';
					
					
					tr.append(contentTd);
					tr.append(writerTd);
					tr.append(dateTd);
					tr.append(modifyBtn);
					tr.append(deleteBtn);
					
					tbody.append(tr);
					
					
				}
				document.getElementById('commentWrite').value = '';
					
			},
			error: data =>{
				console.log(data);
			}
		});
	})		
	
	
	
	
	
	
	
	
	
	
}

</script>
</html>