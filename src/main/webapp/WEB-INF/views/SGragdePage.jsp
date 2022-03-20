<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 페이지</title>
 <script src="resources/js/common.js"></script>
<style>
#frame {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 5%;
}

#logo {
	width: 30%;
   height: 10%;
   position: absolute;
   left: 5%;
   top:2.5%;
   float: left;
   background-image: url(resources/images/학생로고.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: left center;
}

#logOut {
   width: 15%;
   height: 10%;
   position: absolute;
   top: 1%;
   right: 1%;
   
}

#colorline {
	border: 0;
	outline: 0;
	height: 1.5%;
	width: 90%;
	float: left;
	margin: 2% 4.5%;
	border-radius: 20px;
	background-color: #FFBB00;
}

#body {
	border: 0;
	outline: 0;
	width: 99.8%;
	height: 85%;
	margin-top: 1%;
	float: left;
	background-color: #ffffff;
	position: absolute;
	top: 15%;
}

#basic {
	position: fixed;
	width: 99%;
	height: 100%;
}

.servicebutton {
    width: 15%;
   height: 100%;
   float: left;
   margin-left: 4.2%;
   margin-top:-2%;

}
#mainpage {
	width: 73%;
	height: 80%;
	float: right;
	margin-right: 5.5%;
	
	background-size: 45% 65%;
	background-repeat: no-repeat;
	background-position: center center;
}

.bothB {
	width: 85%;
	height: 13%;
	border-radius: 20px;
	margin: 2% 4%;
	background-color: transparent;
	border-top: 5px solid #FFBB00;
	border-left: 5px solid #FFBB00;
	border-right: 5px solid #FFBB00;
	border-bottom: 5px solid #FFBB00;
}

.bothB:active {
	width: 85%;
	height: 13%;
	border-radius: 20px;
	margin: 2% 4%;
	background-color: #FFBB00;
}

#oneB {
	  margin-top:5%;
   margin-bottom:3%;
   float: left;
   background-image: url(resources/images/학사일정4.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: center center;
   cursor: pointer;
   height:9%;
   
   
}

#twoB {
height:9%;
	margin-bottom: 3%;
	float: left;
	background-image: url(resources/images/성적.png);
	background-size: 100% 80%;
	background-repeat: no-repeat;
	background-position: right center;
	cursor: pointer;
	background-color: #FFBB00;
}

#threeB {
height:9%;
	margin-bottom: 3%;
	float: left;
	background-image: url(resources/images/출석.png);
	background-size: 100% 80%;
	background-repeat: no-repeat;
	background-position: right center;
	cursor: pointer;
}

#fourB {
height:9%;
	margin-bottom: 3%;
	float: left;
	background-image: url(resources/images/시간표.png);
	background-size: 100% 80%;
	background-repeat: no-repeat;
	background-position: right center;
	cursor: pointer;
}

#fiveB {
margin-bottom: 3%;
height:9%;
	float: left;
	background-image: url(resources/images/상담.png);
	background-size: 100% 80%;
	background-repeat: no-repeat;
	background-position: right center;
	cursor: pointer;
}
#sixB{height:9%;
	float: left;
	background-image: url(resources/images/정보수정.png);
	background-size: 100% 80%;
	background-repeat: no-repeat;
	background-position: right center;
	cursor: pointer;}

#btn {
	width: 50%;
   height: 50%;
	border-radius: 10px;
	margin-left: 15%;
	margin-top: 10%;
	border-bottom: 5px solid #EA7B03;
	border-top: 5px solid #EA7B03;
	border-left: 5px solid #EA7B03;
	border-right: 5px solid #EA7B03;
	background-color: #EA7B03;
	text-align: center;
	font-size: 130%;
	cursor: pointer;
}

#btn:active {
	border-top: 5px solid #FFBB00;
	border-left: 5px solid #FFBB00;
	border-right: 5px solid #FFBB00;
	border-bottom: 5px solid #FFBB00;
	background-color: #ffffff;
	width: 50%;
   height: 50%;
	text-align: center;
}

#photo {
	position: absolute;
	top: 22%;
	width: 4%;
	left: 13%;
	box-shadow: none;
}
#session{ width:100%;  height:50%; 

position:absolute; top:44%; left:60%;
text-align:center;
 font-size:130%;
 
	
	}

#sessionBox{ width:30%; height:10%; 
position:absolute; left:45%; top:1%;
}
</style>

</head>
<body onload="">
	<form name="" action="" method="get">
		<div id="basic">
			<div id="frame">
				<div id="logo"></div>
				 <div id="sessionBox"><span id="session">김현우님 환영합니다.</span></div>
				<div id="logOut">
					<input type="button" id="btn" value="로그아웃" onclick="accessOut()"
						onmouseover="mouseOver(this)" onmouseout="mouseLeave(this)">
				</div>
			</div>

			<div id="body">
				<div id="colorline"></div>
				<div class="servicebutton">
					<input type="button" class="bothB" id="oneB" onclick=""> <input
						type="button" class="bothB" id="twoB" onclick=""> <input
						type="button" class="bothB" id="threeB" onclick=""> <input
						type="button" class="bothB" id="fourB" onclick=""> <input
						type="button" class="bothB" id="fiveB" onclick="">
						<input
						type="button" class="bothB" id="sixB" onclick="">
				</div>
				<div id="mainpage"></div>
			</div>
		</div>
	</form>

	<script>
   function mouseOver(obj) {
      let fColor = (obj.id == "btn") ? "#000000" : "#FFFFFF";
      obj.style.color = fColor;
      obj.style.background = "#FFBB00";

   }

   function mouseLeave(obj) {

      let fColor = (obj.id == "btn") ? "#ffffff" : "#FF0000";
      obj.style.color = fColor;
      obj.style.background = "#EA7B03";
      obj.style.border = ""

   }
</script>
</body>
</html>