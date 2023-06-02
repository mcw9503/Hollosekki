<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminFAQManage</title>
<style>
	tr{height: 40px;}
	td{font-size: 14px;}
</style>
</head>

<body>
	<jsp:include page="../common/adminSidebar.jsp"/>
	<div class="d-inline-block align-top mt-5" style="width: 900px;">
		<h4 class="py-4 mb-0">자주묻는질문관리</h4>
		
		<table class="w-100 text-center mb-3">
			<tr style="border-bottom: 1px solid rgba(0,0,0,0.2); background: rgba(176, 218, 255, 0.5);">
				<th style="width: 10%">글번호</th>
				<th style="width: 10%">카테고리</th>
				<th style="width: 60%">제목</th>
				<th style="width: 10%">작성날짜</th>
				<th style="width: 10%">상태</th>
			</tr>
			
			<c:forEach begin="1" end="10" varStatus="vs">
				<tr style="border-bottom: 1px solid rgba(0,0,0,0.2);">
					<td>${31-vs.index}</td>
					<td>이용방법</td>
					<td>비밀번호 찾는 방법${vs.index}</td>
					<td>2023-06-${(21-vs.index)}</td>
					<td>Y</td>
				</tr>
			</c:forEach>
		</table>
		
		<jsp:include page="../common/adminPaging.jsp"/>
		
	</div>


	
	
	
	
</body>
</html>