<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학부모 성적 페이지</title>
 <script src="resources/js/common.js"></script>
 <script src="resources/js/gradePage.js"></script>
<style>
#frame {width:100%; height:100%;
   position:absolute; top:5%;}
#logo {
  width: 30%;
   height: 10%;
   position: absolute;
   left: 5%;
   top:2.5%;
   float: left;
   background-image: url(resources/images/부모님로고1.png);
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
   background-color: #99E000;
}

#body {
   border: 0;
   outline: 0;
   width: 99.8%;
   height: 85%;
   margin-top: 1%;
   float: left;
   background-color: #ffffff;
   position:absolute; top:15%;
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
   background-image: url(resources/images/.png);
   background-size: 25% 50%;
   background-repeat: no-repeat;
   background-position: center center;
}

.bothB {
   width: 85%;
   height: 13%;
   border-radius: 20px;
   margin: 2% 4%;
   background-color: transparent;
   border-top: 5px solid #99E000 ;
   border-left: 5px solid #99E000 ;
   border-right: 5px solid #99E000 ;
   border-bottom: 5px solid #99E000 ;
}

.bothB:active {
   width: 85%;
   height: 13%;
   border-radius: 20px;
   margin: 2% 4%;
   background-color: #99E000 ;
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
margin-bottom:3%;
   float: left;
   background-image: url(resources/images/성적.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height:9%;
   background-color:#99E000;
}

#threeB {
margin-bottom:3%;
   float: left;
   background-image: url(resources/images/출석.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height:9%;
}

#fourB {
margin-bottom:3%;
   float: left;
   background-image: url(resources/images/시간표.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height:9%;
}

#fiveB {
	margin-bottom:3%;
   float: left;
   background-image: url(resources/images/납부내역.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height:9%;
}

#sixB{
margin-bottom:3%;
 float: left;
   background-image: url(resources/images/상담.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height:9%;
}
#sevenB{
 float: left;
   background-image: url(resources/images/정보수정.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height:9%;
}


#btn {
   width: 50%;
   height: 50%;
   border-radius: 10px;
   margin-left: 15%;
   margin-top: 10%;
   border-bottom: 5px solid #63AA00 ;
   border-top: 5px solid #63AA00 ;
   border-left: 5px solid #63AA00;
   border-right: 5px solid #63AA00;
   background-color: #63AA00;
   text-align: center;
   font-size: 130%;
   cursor: pointer;
}

#btn:active {
   border-top: 5px solid #99E000 ;
   border-left: 5px solid #99E000 ;
   border-right: 5px solid #99E000 ;
   border-bottom: 5px solid #99E000 ;
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

position:absolute; top:44%; left:58%;
text-align:center;
 font-size:130%;
 
	
	}

#sessionBox{ width:30%; height:10%; 
position:absolute; left:45%; top:1%;
}

</style>

</head>
<body onload="MyChildList()">
   <form name="pmainservice" action="" method="post">
      <div id="basic">
         <div id="frame">
            <div id="logo"></div>
             <div id="sessionBox"><span id="session"><span id='childName'></span>${sessionInfo.userName}님 환영합니다.
             	<input	type="hidden" value='${sessionInfo.userId}' name="userId" />
				<input	type="hidden" value='${sessionInfo.userCode}' name="userCode" />
				<input	type="hidden" value="" name="sEmail" id ="sEmail" />
				<input	type="hidden" value="" name="sCode" id ="sCode" />
			</span></div>
            <div id="logOut">
               <input type="button" id="btn" value="로그아웃" onclick="accessOut()" onmouseover="mouseOver(this)" onmouseout="mouseLeave(this)">
            </div>
         </div>
         
         <div id="body">
            <div id="colorline"></div>
               <div class="servicebutton">
                  <input type="button" class="bothB" id="oneB" onclick=""> 
                  <input type="button" class="bothB" id="twoB" onclick="getPage('pmainservice','GradePage')"> 
                  <input type="button" class="bothB" id="threeB" onclick=""> 
                  <input type="button" class="bothB" id="fourB" onclick="">
                   <input type="button" class="bothB" id="fiveB" onclick=""> 
                   <input type="button" class="bothB" id="sixB" onclick="">
                    <input type="button" class="bothB" id="sevenB" onclick="">  
               </div>
            <div id="mainpage"></div>
         </div>
      </div>
   </form>

<script>
   function mouseOver(obj) {
      let fColor = (obj.id == "btn") ? "#000000" : "#FFFFFF";
      obj.style.color = fColor;
      obj.style.background = "#99E000 ";

   }

   function mouseLeave(obj) {

      let fColor = (obj.id == "btn") ? "#ffffff" : "#FF0000";
      obj.style.color = fColor;
      obj.style.background = "#63AA00 ";
      obj.style.border = ""

   }
</script>
</body>
</html>