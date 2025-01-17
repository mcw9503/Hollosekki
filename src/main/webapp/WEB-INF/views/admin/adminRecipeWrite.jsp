<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
	#titleTop{width: 1200px; margin: auto; border-bottom: 1px solid black;}
	#mainBox{width: 1200px; margin: auto; background-color: lightgray; border-radius: 10px; box-shadow: 5px 5px 7px 0px black;}
	#contentBox{width: 1100px; padding: 50px 100px; position: relative;}
	
/* 	썸네일 이미지 넣기 */
	#insertRecipePic:hover{color:#19A7CE;}
	#thumImg{width:300px; height:300px; background-color:white; margin:auto; border-radius:2em; border:1px solid #B0DAFF; position: relative;}
	#insertBtn{display:none;}
	#insertRecipePic{padding-top:95px; font-weight:bold; text-align:center; font-size:15px; height:300px; width:300px; display:inline-block;}
	
/* 	레시피 제목, 카테고리 등등 */
	#place{display: inline-block; width: 100px; height: 300px;}
	.insertInfo{position: absolute;}
	.beforeInput{width: 130px; height: 50px; font-weight: bold; font-size: 20px;}
	#title{border-radius: 4px; width: 320px;}
	#category{width: 320px;}
	.categoryItem{width: 100px;}
	#time{width: 150px;}
	.term{height: 35px;}
	
/* 	레시피 설명 */
	.recipeInformationBox{width: 1000px; padding: 0 5px;}
	.recipeInformation{width: 1000px; height: 100px; resize: none; border-radius: 5px;}
	.recipeBox{width: 1000px; height: 200px; border-radius: 5px; border: 1px solid black; margin-bottom: 5px; position: relative;}
	.recipeNo{width: 100px; height: 20px; text-align: center; position: absolute; padding-top: 90px;}
	.recipeContent{width: 700px; height: 200px; border-radius: 10px;}
	.content{width: 680px; height: 180px; border: none; position: absolute; left: 110px; top: 10px; border-radius: 10px; resize:none; white-space: pre-wrap;}
	.recipeImage{width: 200px; height: 200px; position: absolute; left: 800px;}
	.insertOrderPic{padding-top:15px; padding-right: 15px; font-weight:bold; text-align:center; font-size:15px; height:130px; width:200px; display:inline-block; position: relative; z-index: 1;}
	.orderImgPreview{position: relative; top: -180px; height:130px; width: 180px; border-radius: 10px;}


/* 	레시피 사진 추가 */
	.recipeImg{width:180px; height:180px; border:none; position: absolute; top: 10px;}
	.imgInsert{margin-top: 60px; border:1px solid #B0DAFF;}
	
/* 	사진 추가 버튼 */
	#plusBtn{width: 200px; margin-left: 300px; margin-top: 30px; font-size: 18px; font-weight: bold; border: none; background-color: lightgray;}
	#minusBtn{width: 200px; margin-top: 30px; font-size: 18px; font-weight: bold; border: none; background-color: lightgray;}
	
/* 	완성된 요리 추가 */
	#completePic{height: 330px;}
	.insertCompletePic{font-weight:bold; text-align:center; font-size:15px; height:200px; width:200px; display:inline-block; position: relative; z-index: 1; padding-top: 50px;}
	.completeImg{width: 200px; background-color: #B0DAFF;}
	.comPicBox{width: 1000px; height: 280px; margin-bottom: 5px;}
	.completeImgPreview{position: relative; top: -248px; height:200px; width: 205px; border-radius: 10px;}
	.comImgBox{width: 210px; height: 250px; border-radius: 10px; border: 1px solid black; position: absolute;}
	
	#plusComBtn{width: 200px; margin-left: 300px; margin-top: 30px; font-size: 18px; font-weight: bold; border: none; background-color: lightgray;}
	#minusComBtn{width: 200px; margin-top: 30px; font-size: 18px; font-weight: bold; border: none; background-color: lightgray;}
	
	#comAddPlace1{width: 300px; height: 280px; position: absolute; left: 400px;}
	#comAddPlace2{width: 300px; height: 280px; position: absolute; left: 700px;}
	
/* 	완료 */
	#buttonBox{width: 300px; margin: auto; padding: 30px 0; }
	#can{width: 130px; height: 50px; border-radius: 10px; border: 1px solid lightgray; background-color: lightgray; box-shadow: 0px 5px 0px 0px black; margin-right: 5px;}
	#sub{width: 130px; height: 50px; border-radius: 10px; border: 1px solid #B0DAFF; background-color: #B0DAFF; box-shadow: 0px 5px 0px 0px black; margin-left: 5px;}

	textarea{white-space: pre-wrap;}
</style>

</head>
<body>
<%@ include file="../common/top.jsp" %>
<br><br>

	<div id="titleTop">
		<h1>레시피 등록</h1>
	</div>
	<br><br> 
<form action="writeRecipe.rc" method="post" enctype="multipart/form-data">
	<div id="mainBox">
		<div id="contentBox">
			<div id="thumImg" class="d-inline-block">
				<span id="insertRecipePic">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-plus" viewBox="0 0 16 16">
								<path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"/>
						<path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
					</svg><br><br>
					레시피 대표 이미지 첨부<br>[필수 사항]
				</span>
				<img id="preview">		
				<input type="file" accept="image/*" class="form-control form-control-lg" name="thum" id="insertBtn" onchange="setThumbnail(event);">
			</div>
			
			<div id="place"></div>
			
			
<!-- 			레시피 명, 카테고리 등등 -->
			<div class="d-inline-block insertInfo">
				<div class="d-inline-block beforeInput">레시피 명</div><input type="text" id="title" placeholder=" 제목을 입력해주세요." name="recipeName" maxlength="30">
				<div class="term"></div>
				<div class="d-inline-block beforeInput">카테고리</div>
				<div class="d-inline-block" id="category">
					<select class="categoryItem" name="categoryIngredient">
						<option selected disabled value="">재료 별</option>
						<option value="고기">고기</option>
						<option value="해물">해물</option>
						<option value="과일">과일</option>
						<option value="채소">채소</option>
					</select>
					<select class="categoryItem" name="categorySituation">
						<option selected disabled value="">상황 별</option>
						<option value="다이어트">다이어트</option>
						<option value="술안주">술안주</option>
						<option value="도시락">도시락</option>
						<option value="아침식사">아침식사</option>
						<option value="비건">비건</option>
					</select>
					<select class="categoryItem" name="categoryType">
						<option selected disabled value="">종류 별</option>
						<option value="메인반찬">메인반찬</option>
						<option value="반찬">반찬</option>
						<option value="간식">간식</option>
						<option value="면">면</option>
						<option value="국">국</option>
					</select>
				</div>
				<div class="term"></div>
				<div class="d-inline-block beforeInput">난이도</div><input type="range" min="1" max="5" id="grade" name="recipeDifficulty"><span>(난이도는 1~5, 기본 3)</span>
				<div class="term"></div>
				<div class="d-inline-block beforeInput">조리시간</div><input type="number" min="5" max="120" step="5" id="time" value="30" name="recipeTime">
			</div>
			
			<br><br>
			
<!-- 			레시피 설명 -->
			<div class="recipeInformationBox">
				<div class="beforeInput">레시피 설명</div>
				<textarea class="recipeInformation" placeholder=" 간단한 요리 설명을 적어주세요." name="recipeContent" maxlength=100;></textarea>
			</div>
			
			<br><br>
			
<!-- 			재료 -->
			<div class="recipeInformationBox">
				<div class="beforeInput">재료</div>
				<textarea class="recipeInformation" placeholder=" 재료를 적어주세요." name="recipeIngredient" maxlength=300;></textarea>
			</div>
			
			<br><br>
			
<!-- 			레시피 순서 -->
			<div class="recipeInformationBox" id="recipeOrderBox">
				<div class="d-inline-block beforeInput">조리 순서 |</div><div class="d-inline-block">조리 순서를 추가하려면 +버튼을 눌러주세요.(조리순서는 최대 10개)</div>
				
				<div id="copy" class="copyC">
					<div class="recipeBox">
						<div class="d-inline-block recipeNo">1</div>
						<div class="d-inline-block recipeContent">
							<textarea class="content" name="recipeOrder" maxlength=100;></textarea>
							<input type="hidden" value="abc123abc" name="recipeOrder">
						</div>
						<div class="d-inline-block recipeImage">
							<div class="d-inline-block recipeImg">
								<span class="insertOrderPic">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-plus" viewBox="0 0 16 16">
									<path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"/>
									<path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
									</svg><br><br>
									레시피 이미지 첨부<br>[필수 사항]
								</span>
								<input type="file" accept="image/*" class="form-control form-control-lg" name="orderFile" onchange="orderImage(this)">
								<img class="orderImgPreview" style="display: none;">
							</div>
						</div>
					</div>
				</div>
				<div id="addplace"></div>
				
			</div>
			
			<button type="button" id="plusBtn" onclick="orderPlus()">+ 조리 순서 추가하기</button>
			<span> / </span>
			<button type="button" id="minusBtn" onclick="orderRemove()">- 조리 순서 삭제하기</button>
			
			<br><br><br>
			
			
			<div class="recipeInformationBox" id="completePic">
				<div class="d-inline-block beforeInput">완성된 요리 |</div><div class="d-inline-block">완성된 요리 이미지를 올려주세요. 이미지를 추가하려면 +버튼을 눌러주세요.(완성된 요리 이미지는 최대 3개)</div>
				<div class="comPicBox" id="cPicBox">
					<div id="comCopy" class="comCopyC">
						<div class="comImgBox">
							<span class="insertCompletePic">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-plus" viewBox="0 0 16 16">
									<path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"/>
									<path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
								</svg><br><br>
								레시피 완성 이미지 첨부<br>[필수 사항]
							</span>
							<input type="file" accept="image/*" class="form-control form-control-lg completeImg" name="comPic" onchange="comImageIns(this)">
							<img class="completeImgPreview">
						</div>
					</div>
					<div id="comAddPlace1"></div>
					<div id="comAddPlace2"></div>
				</div>
			</div>
			
			<button type="button" id="plusComBtn" onclick="comPlus()">+ 이미지 추가하기</button>
			<span> / </span>
			<button type="button" id="minusComBtn" onclick="comRemove()">- 이미지 삭제하기</button>
		</div>
	</div>
	<div id="buttonBox">
		<button type="submit" id="sub">작성하기</button>
		<button onclick="history.back()" type="button" id="can">취소하기</button>
	</div>
</form>

<br>
<%@ include file="../common/footer.jsp" %>

<script>
// 레시피 썸네일
const imgDiv = document.getElementById('thumImg');
imgDiv.addEventListener('click', ()=>{
	document.getElementById('insertBtn').click();
})

function setThumbnail(event){
	for(const image of event.target.files){
		const reader = new FileReader();
		reader.onload = function(event){
			document.getElementById('insertRecipePic').style.display='none';
			document.getElementById('thumImg').style.border='none';
			const img = document.getElementById("preview");
			img.src = event.target.result;
			img.setAttribute("style", "width:300px; height:300px; border-radius: 2em; border:3px solid #B0DAFF; position: absolute;");				
			
		}
		reader.readAsDataURL(image);
	}
	console.log(document.getElementById('insertBtn').value);
}

// 레시피 순서
function orderImage(obj){
	var imgid = obj.nextElementSibling;
	imgid.src = URL.createObjectURL(event.target.files[0]);
	imgid.onload = function(){
		URL.revokeObjectURL(imgid.src)
		obj.nextElementSibling.style.display="inline";
		obj.previousElementSibling.style.zIndex = 0;
	}
}

// 순서추가 버튼 클릭 시
const addplace = document.querySelector('#addplace');
const copy = document.querySelector('#copy');
var count = 1;
function orderPlus(){
	if(count < 10){
		addplace.appendChild(copy.cloneNode(true));
		document.querySelectorAll('.copyC')[document.querySelectorAll('.copyC').length -1].childNodes[1].childNodes[3].childNodes[1].value = "";
		document.querySelectorAll('.copyC')[document.querySelectorAll('.copyC').length -1].childNodes[1].childNodes[5].childNodes[1].childNodes[5].style.display = "none";
		document.querySelectorAll('.copyC')[document.querySelectorAll('.copyC').length -1].childNodes[1].childNodes[5].childNodes[1].childNodes[3].value=""
// 		console.log(document.querySelectorAll('.copyC')[document.querySelectorAll('.copyC').length -1].childNodes[1].childNodes[5].childNodes[1].childNodes[3]);
		count++;
		document.querySelectorAll('.copyC')[document.querySelectorAll('.copyC').length -1].childNodes[1].childNodes[1].innerText=count;
// 		console.log(document.querySelectorAll('.copyC').length);
	}
}

// 순서 삭제 버튼 클릭 시
const copys = document.querySelectorAll('.copyC');
function orderRemove(){
	if(count > 1){
		document.querySelectorAll('.copyC')[document.querySelectorAll('.copyC').length -1].remove();
		count--;
	}
}

// 완성된 이미지
function comImageIns(obj){
	var imgid = obj.nextElementSibling;
	imgid.src = URL.createObjectURL(event.target.files[0]);
	imgid.onload = function(){
		URL.revokeObjectURL(imgid.src)
		obj.nextElementSibling.style.display="inline";
		obj.previousElementSibling.style.zIndex = 0;
	}
}

// 완성 사진 추가
const comCopy = document.querySelector("#comCopy");
const comAddPlace1 = document.querySelector("#comAddPlace1");
const comAddPlace2 = document.querySelector("#comAddPlace2");
const cPicBox = document.querySelector('#cPicBox');
var comCount = 1;
function comPlus(){
	if(comCount < 3){
		if(comCount == 1){
			comAddPlace1.appendChild(comCopy.cloneNode(true));
			document.querySelectorAll('.comCopyC')[document.querySelectorAll('.comCopyC').length -1].childNodes[1].childNodes[5].style.display="none";
			document.querySelectorAll('.comCopyC')[document.querySelectorAll('.comCopyC').length -1].childNodes[1].childNodes[3].value="";
			comCount++;
		} else if(comCount == 2){
			comAddPlace2.appendChild(comCopy.cloneNode(true));
			document.querySelectorAll('.comCopyC')[document.querySelectorAll('.comCopyC').length -1].childNodes[1].childNodes[5].style.display="none";
			document.querySelectorAll('.comCopyC')[document.querySelectorAll('.comCopyC').length -1].childNodes[1].childNodes[3].value="";
			comCount++;
		}
	}
	console.log(comCount);
}

// 완성 사진 삭제
const comCopyC = document.querySelectorAll(".comCopyC");
function comRemove(){
	if(comCount > 1){
		document.querySelectorAll('.comCopyC')[document.querySelectorAll('.comCopyC').length -1].remove();
		comCount--;
	}
}


</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>