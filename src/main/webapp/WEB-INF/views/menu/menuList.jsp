<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>

/* 	검색 창 부분 */
	#search{width: 1200px; height: 250px; border-top: 1px solid black; border-bottom: 1px solid black; background-color: #B0DAFF; margin: auto;}
	#searchBar{position: relative;}
	#inputText{border-radius: 8px; border: 1px solid black; box-shadow: 0px 5px 0px 0px black; width: 300px; height: 40px; margin-left: 450px; margin-right: 450px; margin-top: 40px;}
	#searchIcon{position: absolute; right: 455px; top: 46px;}
	#searchBtn{border-radius: 50%; width: 30px; height: 30px; border: none; background-color: #B0DAFF}
	
	#category{width: 550px; margin-left: 350px; margin-top: 30px;}
	.categoryIcon{width: 100px; height: 150px; text-align: center;}
	.circle{width: 50px; height: 50px; border-radius: 50%; background-color: white; margin-left: 25px;}
	.size{font-size: 50px; color: black;}
	.categoryBtn:hover{cursor: pointer;}
	
	.title{font-weight: bold;}
	.group-button1, .group-button2, .group-button3{padding: 10px; background-color: #B0DAFF; border: none; cursor: pointer;}
	
/* 	이번주 인기 식단 */
	#weekend{width: 1200px; height: 400px; border-radius: 10px; margin: auto; box-shadow: 5px 5px 7px 0px black; background-color: #B0DAFF;}
	#hotWeekend{width: 1200px; height: 25px; background-color: black; color: white; text-align: center; border-radius: 10px 10px 0 0;}
	#weekendBox{width: 1200px; height: 400px; margin: 37px 50px;}
	
	.foodRank{
	    font-size: 28px;
	    border: none;
	    width: 60px;
	    height: 60px;
	    margin-top: 10px;
	    padding-top: 8px;
	    border-radius: 100px;
	    background-color: lightgray;
	    text-align: center;
	}
	
	.wkalbum{position: relative;}
	.albumTitle{position: absolute; width: 300px; height: 50px; top: 250px; left: 30px; text-align: center; font-weight: bold;}
	.weekendPic{margin: 0 30px;}
	
/* 	최신 식단 */
	#middle{width: 1250px; height: 50px; font-weight: bold; font-size: 20px; border-bottom: 1px solid black; margin: auto;}
	.cardColor{background-color: #B0DAFF;}
	.likeBtn{color: black;}
</style>

</head>
<body>

<%@ include file="../common/top.jsp" %>
<br><br>

<div id="search">
	<div id="searchBar">
		<input type="text" id="inputText" name="input" placeholder=" 내용을 입력해 주세요.">
		<div id="searchIcon"><button id="searchBtn"><i class="bi bi-search"></i></button></div>
	</div>
	<br>
	<div id="category">
		<div class="categoryIcon d-inline-block">
			<div class="circle">
				<a href="#" id="diet" class="categoryBtn">	
					<span class="material-symbols-outlined size">
					fitness_center
					</span>
				</a>
			</div>
			<b>다이어트</b>
		</div>
		<div class="categoryIcon d-inline-block">
			<div class="circle">
				<a href="#" id="diet" class="categoryBtn">
					<span class="material-symbols-outlined size">
					sick
					</span>
				</a>
			</div>
			<b>몸보신</b>
		</div>
		<div class="categoryIcon d-inline-block">
			<div class="circle">
				<a href="#" id="diet" class="categoryBtn">
					<span class="material-symbols-outlined size">
					restaurant_menu
					</span>
				</a>
			</div>
			<b>든든밥상</b>
		</div>
		<div class="categoryIcon d-inline-block">
			<div class="circle">
				<a href="#" id="diet" class="categoryBtn">
					<span class="material-symbols-outlined size">
					egg_alt
					</span>
				</a>
			</div>
			<b>고단백</b>
		</div>
		<div class="categoryIcon d-inline-block">
			<div class="circle">
				<a href="#" id="diet" class="categoryBtn">
					<span class="material-symbols-outlined size">
					spa
					</span>
				</a>
			</div>
			<b>채식</b>
		</div>
	</div>
</div>

<br><br><br>

<div id="weekend">
	<div id="hotWeekend">이번주 ㅎㄹㅅㄲ의 인기 식단</div>
	
	<div id="weekendBox">
		<div class="d-inline-block wkalbum">
			<div class="position-absolute top-0 start-0" style="margin-top: -40px;" z-index: 9999;">
				<div class="foodRank" style="background: rgb(255, 217, 102);">1위</div>
			</div>
			<img src="#" width="300px" height="300px" class="weekendPic">
			<div class="albumTitle">고단백 / 영양사B</div>
		</div>
		<div class="d-inline-block wkalbum">
			<div class="position-absolute top-0 start-0" style="margin-top: -40px;" z-index: 9999;">
				<div class="foodRank" style="background: rgb(238, 238, 238);">2위</div>
			</div>
			<img src="#" width="300px" height="300px" class="weekendPic">
			<div class="albumTitle">다이어트 / 영양사C</div>
		</div>
		<div class="d-inline-block wkalbum">
			<div class="position-absolute top-0 start-0" style="margin-top: -40px;" z-index: 9999;">
				<div class="foodRank" style="background: rgb(215, 192, 174);">3위</div>
			</div>
			<img src="#" width="300px" height="300px" class="weekendPic">
			<div class="albumTitle">든든밥상 / 영양사E</div>
		</div>
	</div>
</div>

<br><br><br><br>

<div id="middle">최신 식단 목록</div>
<div class="album p-5 bg-white">
	<div class="container px-5">
	
		<div class="row row-cols-1 row-cols-sm-1 row-cols-md-5 g-2">
			
			<c:forEach begin="1" end="5">
				<div class="col">
					<div class="card shadow-sm">
					<a href="menuDetail.mn">
						<img src="resources/image/chicken1.png" style="width: 100%; height: 100%;">
					</a>
						<div class="card-body cardColor">
							<h5>고단백 / 영양사C</h5>
							<div class="d-inline-block" style="width: 130px; height: 50px;"></div>
							<a class="likeBtn" role="button"><i class="bi bi-heart d-inline-block iconMar"></i></a>&nbsp;<p class="d-inline-block likeNum">1000</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<br>
<%@ include file="../common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>