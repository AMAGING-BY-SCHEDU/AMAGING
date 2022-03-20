<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자녀등록 메일</title>
 <script src="resources/js/common.js"></script>
  <script src="resources/js/info.js"></script>
<style>
#body {
	
	width: 20%;
	height: 60%;
	margin-left: 39.3%;
	margin-top: 17%;
}
#basic {
	position: fixed;
	width: 99%;
	height: 100%;
	
}

#logo {
	width: 30%;
	height: 12%;
	float: left;
	margin-left: 34%;
	margin-top: 10%;
	
	background-image: url(resources/images/부모님로고.png);
	background-size: 100% 100%;
	background-repeat: no-repeat;
	background-position:center;
}

#son {
	border: 1px solid #99E000 ;
	font-size: 110%;
	margin-top:10%;
	width:98%;
	height:10%;
	margin-bottom:1%;
	
}

#mom {
	border: 1px solid #99E000 ;
	font-size: 110%;
	margin-top:8%; 
	width:98%;
	height:10%;
	margin-bottom:5%;
}
#btnbox{
	width:100%;
		height:8%;
}
#btn{ width:35%;
		height:100%;
		margin-left:33%; border-radius: 15px;
		cursor: pointer;
		border-bottom: 5px solid #99E000;
	border-top: 5px solid #99E000;
	border-left: 5px solid #99E000;
	border-right: 5px solid #99E000; 
	background-color: #99E000;
	text-align: center;
	font-size: 100%;
}
#btn:active {
	width:35%;
	height:100%;
	
	border-top: 5px solid #63AA00;
	border-left: 5px solid #63AA00;
	border-right: 5px solid #63AA00;
	border-bottom: 5px solid #63AA00;
	background-color: #ffffff;
}		
</style>
</head>
<body>
<form name="regParent" action="/" method="get">
	<div id="basic">
		<div id="logo"></div>
		<div id="body">
		<span>자녀 이메일</span>
		<input class="box" type="text" id="son" placeholder='${code.SEmail}' readOnly/>
		<span>부모님 이메일</span>
		<input class="box" type="text" id="mom" placeholder='${code.PEmail}' readOnly/>
		<div id="btnbox">
		<input type="button" id="btn" value="수락" onClick="parentReg('UpdParent','${code.userId}','${code.prCode}')" />
		<input type="button" id="btn" value="거절" onClick="parentReg('RejectParent','${code.userId}','${code.prCode}')" />
		</div>
		</div>
	</div>
</form>

</body>
</html>