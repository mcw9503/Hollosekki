<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{background: #B0DAFF;}	
	.form-line{
		width: 600px; height: 750px;
		border: 5px solid white;
		border-radius: 45px; 
		margin-left: auto; margin-right: auto; margin-top: 100px; margin-bottom: 100px;
		}
	.form-dot{
		width: 580px; height: 730px;
		border: 5px dotted white;
		border-radius: 40px;
		margin: 5px;
		}
	.join-form{
		width: 560px; height: 705px;
		background: white;
		border-radius: 30px;
		margin: 0 auto; margin-top: 12px;
		}
	.mid{
		display: flex; justify-content: center;  
		font-size: 18px; color: #1f8acb; font-weight: bold;
		}
	.mid33{
		font-size: 15px; color: #1f8acb; font-weight: bold;
		margin-top: 30px; margin-bottom: 20px;
		text-align: center;
		}
	
	.join{
		font-size: 25px; font-weight: bold;
		margin: 10px; margin-top: 100px; 
		color: #1f8acb;
		}
	.join-line{
		width: 135px; height: 120px;
		border-bottom: 3px solid #1f8acb;}
	.line{
		width: 400px; border-bottom: 3px solid #1f8acb;
		margin: 0 auto; margin-top: 30px; margin-bottom: 30px;
		}
	.mid22{margin: 0 auto;}
	.button{
		width: 150px; height: 50px;
		border-radius: 25px; border: 2px solid black;
		font-size: 20px; font-weight: bold;
		margin-top: 50px; margin-bottom: 20px; margin-left: 10px; margin-right: 10px;
		background: #f0f0f0;
		box-shadow: 0px 5px 0px black;
		cursor: pointer; 
		}
	.button:active{box-shadow: 0px 1px 0px black; transform: translateY(5px); background: #b0daff;}
	
	.find{font-size: 13px; line-height: 35px; text-align: left; margin-left: 80px;}
	.find2{cursor: pointer; text-decoration: underline;}
	
</style>
</head>
<body>
	<div class="outline">
		<div class="form-line">
			<div class="form-dot">
				<div class="join-form">
					<div class="mid">
						<div class="join-line"></div>
						<div class="join">로그인 실패</div>
						<div class="join-line"></div>
					</div>
					<div class="mid33">
						로그인에 실패했습니다.<br>
						다시 로그인 해주세요.
					</div>
					<br>
					<div class="mid33">
						
					</div>
					<div class="mid33">
						<div class="mid">
							<div><button class="button" onclick="location.href='login.en'">로그인</button></div>
							<div><button class="button" onclick="location.href='home.do'">메인</button></div>
							
						</div>
						<div class="mid33">
							<div class="line"></div>
							<div class="find">
								<div class="find2" onclick="location.href='findId.en'">아이디를 잊어버리셨나요?</div>
								<div class="find2" onclick="location.href='findPwd.en'">비밀번호를 잊어버리셨나요?</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>