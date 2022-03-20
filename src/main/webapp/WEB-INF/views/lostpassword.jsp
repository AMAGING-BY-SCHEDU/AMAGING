<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 분실</title>
 <script src="resources/js/common.js"></script>
<style>
#basic {
	position: fixed;
	width: 99%;
	height: 98%;
	border: 1px solid #000000;
}

#logo {
	width: 30%;
	height: 12%;
	
	margin-left: 34%;
	margin-top: 10%;
	background-image: url(resources/images/콜라보로고.png);
	background-size: 100% 100%;
	background-repeat: no-repeat;
	background-position:center;
}

#body {
	width: 20%;
	height: 15%;
	
	margin-left: 39.3%;
	margin-top: 1%;
}

#lineOne {
	height: 50%;
	
	margin-bottom: 3%;
	margin-top:8%;
	
}

#lineTwo {
	height:40%;

	
	
}

.box {
	width: 98.5%;
	font-size: 150%;
	border:2px solid #EF90FF;
	height: 73%;
	margin-top: 3%;
}
#btn {width:35%; height:85%; padding:0% 5%; border-radius: 15px; margin-left:32%;
	font-size:100%; 
	cursor: pointer;
	border-bottom: 5px solid #D1B2FF;
	border-top: 5px solid #D1B2FF;
	border-left: 5px solid #D1B2FF;
	border-right: 5px solid #D1B2FF; 
	background-color: #D1B2FF;
	text-align: center;
	}
 #btn:active {
 width:35%;
 border-top: 5px solid #AD8EDB;
	border-left: 5px solid #AD8EDB;
	border-right: 5px solid #AD8EDB;
	border-bottom: 5px solid #AD8EDB;
	background-color: #ffffff;
 }
 
</style>
</head>
<body>
	<form name="" action="/" method="get">
		<div id="basic">
			<div id="logo"></div>
			<div id="body">
				<div id="lineOne">
					<input class="box" type="text" id="email" placeholder="이메일입력">
				</div>
				<div id="lineTwo">
					<input type="button" id="btn" value="보내기" onclick="">
				</div>
			</div>
		</div>
	</form>

</body>
</html>