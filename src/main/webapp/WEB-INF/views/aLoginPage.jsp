<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
 <script src="resources/js/common.js"></script>
<script src="resources/js/login.js"></script>
</head>

<style>


#basic  {
         position:fixed;
          width:99%;
          height:100%;
          } 

#body   {width:99%; height:90%;
         position:absolute; top:50%; left:50%;
         transform: translate(-50%, -50%); 
        }
#logo   {width:35%; height:20%; 
       position:absolute; top:20%; left:50%; 
       background-image:url(resources/images/관리자로고.png); background-size:95% 70%;   background-repeat : no-repeat; background-position:left center;   transform: translate(-50%, -50%);
       }
#inBody   {width:30%; height:30%;
         position:absolute; top:50%; left:50%;
         transform: translate(-50%, -50%); 
         }
#welcome  {text-align:center; font-size:35px; color: #000000;
         position:absolute; top:-3%; left: 30%;
         }
.inputE    {height: 20%;width:60%;font-size:100%;border:1px solid #EF90FF ;
          position:absolute; top:27%; left: 8%;}
          
.inputP    {height: 20%;width:60%; font-size:100%;border:1px solid #EF90FF ;
          position:absolute; top:50%; left: 8%;}
          
#loginbtn {background-color: #EF90FF ; color:#FFFFFF; height: 48%;
         line-height: 1%;width:22%;
           font-size:150%;text-align:center;
           box-shadow : 5px 5px 5px black; transition-duration:0.3s;
           position:absolute; top:23%; left: 65%;cursor: pointer;
           border-radius:8px;}
           
#loginbtn:active {background-color: #E14FCA  ; color:#FFFFFF; height: 48%;
              line-height: 10%;width:22%;
                font-size:150%;text-align:center;
                 box-shadow : none; margin-left:1%; margin-top:1%;}
         
#findPassword {height: 8%; width:24.5%;font-size:100%;
               position:absolute; top:59.1%; left:38%; 
               text-align:center;
               background-image:url(resources/images/돋보기.png);  background-size:15% 85%;  background-repeat : no-repeat; background-position:100% 90%; cursor: pointer;
               }
               
#join{height: 8%; width:17%;font-size:100%;
               position:absolute; top:59.1%; left:7%;  
               text-align:left; background-image:url(resources/images/사람.png);  background-size:20% 85%;  background-repeat : no-repeat; background-position:85% 85%;cursor: pointer;
           }
#bottombox { width:64%;  height:10%;
         margin-top:31.6%;}         
#pabox{ width:90%; height:75%;  position:fixed;   }
</style>
<body class ="background">
<form name ="login" action="/Login" method="post">
<input	type="hidden" value='4' name="userCode" />
<div id="basic">
<div id="body">
	<div id="logo"></div>
	<div id="inBody">
		<div id="welcome">관리자 로그인</div>
		<div id="pabox">
			<div>
				<input class = "inputE" type="text" name="adCode" placeholder="ID 입력 "/>
			</div>
			<div>
				<input class = "inputP" type="password" name="password" placeholder=" PASSWORD"/>
			</div>
		</div>
		<div>
 			<div>
				<input type="button" id="loginbtn" value="LOGIN" onClick="authentication1('4')"/>
			</div>
		</div>
   
		<div id="bottombox">
			<div id="findPassword"  onClick="">비밀번호 찾기 </div>
      		<div id="join" onClick="getJoinPage(4)">회원가입</div>
		</div>
	</div>
</div>
</div>
</form>
</body>
</html>