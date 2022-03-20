<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
 <script src="resources/js/common.js"></script>
 <script >
	
	function regMember(userCode){
		
		 /*1. HTML 개체와의 연결*/
		 const form = document.getElementsByName("join")[0];
		
		/*2. 사용자 데이터의 수집*/
		const hidden = makeInputElement("hidden", "userCode", userCode, "");
	
		form.appendChild(hidden);
		
		const userData = [document.getElementsByName("userName")[0], document.getElementsByName("email")[0], document.getElementsByName("password")[0], document.getElementsByName("check")[0]];
		const message = ["이름을 입력하세요", "이메일을 입력하세요", "비밀번호를 입력", "확인 비밀번호를 입력하세요"];
		/*3. 유효성 검사*/	
		for(let index=0; index<userData.length; index++){
			if(!isEmpty(userData[index])){
				alert(message[index]);
				return;
			}
			
			if(document.getElementsByName("password")[0].value!=document.getElementsByName("check")[0].value){
				alert("비밀번호기 일치하지 않습니다. 다시입력하세요");
				document.getElementById("password").value='';
				document.getElementById("check").value='';
				return;
			}
			
			
		}
		
		
		/*4. 서버 전송*/
		form.submit();
		
	
		
	}
 
 </script>
<style>
#basic {
	position: fixed;
	width: 99%;
	height: 98%;
	
}

#logo {
	width: 30%;
	height: 12%;
	
	margin-left: 34%;
	margin-top: 3%;
	background-image: url(resources/images/콜라보로고.png);
	background-size: 100% 100%;
	background-repeat: no-repeat;
	background-position:center;
}

#body {
	width: 20%;
	height: 70%;
	
	margin-left: 39.3%;
	margin-top: 1%;
}

.moji {
	text-align: center;

	font-size: 150%;
	margin: 1% 0%;
	width:94.5%;
	height:5%;
}

.box {
	width: 99%;
	font-size: 150%;
	
	height: 100%;
}

#btn {
	width: 35%;
	margin-top: 2.5%;
	padding: 4% 5%;
	border-radius: 15px;
	margin-left: 32%;
	cursor: pointer;
	border-bottom: 5px solid #D1B2FF;
	border-top: 5px solid #D1B2FF;
	border-left: 5px solid #D1B2FF;
	border-right: 5px solid #D1B2FF; 
	background-color: #D1B2FF;
	text-align: center;
	font-size: 100%;
}
#btn:active {
	width:35%;	
	border-top: 5px solid #AD8EDB;
	border-left: 5px solid #AD8EDB;
	border-right: 5px solid #AD8EDB;
	border-bottom: 5px solid #AD8EDB;
	background-color: #ffffff;
}		


#lineOneS {
	
	width:96.5%;
	height: 38%;
	border-top: 5px solid #FFBB00;
	border-left: 5px solid #FFBB00;
	border-right: 5px solid #FFBB00;
	margin-bottom: 5%;
	
}
#lineOne{width:96.5%; height:25%;  left:3%;}
#lineTwo{width:96.5%; height:25%;  left:3%;}
#lineThree{width:96.5%; height:25%;  left:3%;}
#lineFour{width:96.5%; height:25%;  left:3%;}
#big1{ height:20%; width:100%;}
#big2{ height:20%; width:100%;}
#big3{ height:20%; width:100%;}
#big4{ height:20%; width:100%;}

#lineTwoS {
	width:96.5%;
	height: 38%;
	border-top: 5px solid #99E000 ;
	border-left: 5px solid #99E000 ;
	border-right: 5px solid #99E000 ;
	margin-bottom: 5%;
}

#lineThreeS {
width:96.5%;
	height: 38%;
	border-top: 5px solid #00A6EF ;
	border-left: 5px solid #00A6EF ;
	border-right: 5px solid #00A6EF ;
	margin-bottom: 5%;
}

#lineFourS {
width:96.5%;
	height: 38%;
	border-top: 5px solid #EF90FF ;
	border-left: 5px solid #EF90FF ;
	border-right: 5px solid #EF90FF ;
	margin-bottom: 5%;
}

#lineFive {
	height: 12.5%;
	
	margin-bottom: 5%;
}

</style>
</head>
<body>
	<form name="join" action="/Join" method="post">
		<div id="basic">
			<div id="logo"></div>
			<div id="body">
				<div id="big1">
				<div class="moji" id="lineOne">이름</div>
				<div id="lineOneS">
					<input class="box" type="text" id="userName" name="userName" placeholder="이름입력">
				</div>
				</div>
				<div id="big2">
				<div class="moji" id="lineTwo">이메일</div>
				<div id="lineTwoS">
					<input class="box" type="text" id="email" name="email" placeholder="이메일입력">
				</div>
				</div>
				<div id="big3">
				<div class="moji" id="lineThree">비밀번호</div>
				<div id="lineThreeS">
					<input class="box" type="password" id="password" name="password"  placeholder="비밀번호 입력">
				</div>
				</div>
				<div id="big4">
				<div class="moji" id="lineFour">비밀번호 확인</div>
				<div id="lineFourS">
					<input class="box" type="password" id="check" name="check" placeholder="비밀번호 확인">
				</div>
				</div>
				<div id="lineFive">
					<input type="button" id="btn" value="가입완료" onclick="regMember('${sessionInfo.userCode}')">
				</div>

			</div>


		</div>
	</form>

</body>
</html>