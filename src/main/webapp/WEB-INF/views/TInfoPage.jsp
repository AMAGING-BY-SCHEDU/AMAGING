<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 정보수정 페이지</title>
<script src="resources/js/common.js"></script>
<script src="resources/js/info.js"></script>
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
   background-image: url(resources/images/선생님로고1.png);
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
   background-color: #00A6EF ;
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
   
   background-size: 30% 55%;
   background-repeat: no-repeat;
   background-position: center center;
}

.bothB {
     width: 85%;
   height: 13%;
   border-radius: 20px;
   margin: 2% 4%;
   background-color: transparent;
   border-top: 5px solid #00A6EF  ;
   border-left: 5px solid #00A6EF  ;
   border-right: 5px solid #00A6EF  ;
   border-bottom: 5px solid #00A6EF  ;
}

.bothB:active {
    width: 85%;
   height: 13%;
   border-radius: 20px;
   margin: 2% 4%;
   background-color: #00A6EF  ;
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
   background-image: url(resources/images/상담.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height:9%;
     
}
#sixB{ float: left;
   background-image: url(resources/images/정보수정.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height:9%;
    background-color: #00A6EF ;}



#btn {
   width: 50%;
   height: 50%;
   border-radius: 10px;
   margin-left: 15%;
   margin-top: 10%;
   border-bottom: 5px solid #0042ED  ;
   border-top: 5px solid #0042ED  ;
   border-left: 5px solid #0042ED ;
   border-right: 5px solid #0042ED ;
   background-color: #0042ED ;
   text-align: center;
   font-size: 130%;
   cursor: pointer;
}

#btn:active {
   border-top: 5px solid #00A6EF  ;
   border-left: 5px solid #00A6EF  ;
   border-right: 5px solid #00A6EF  ;
   border-bottom: 5px solid #00A6EF  ;
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
.div1{ font-size:120%; width:100%; height:30%;

}

.div2 {
       position: relative; top:-1%;
        width: 72%;
        height: 13%;
        display: flex;
        align-items: center;
       margin-left:13%;
       cursor: pointer;
       font-weight:600;
       font-size: 100%;
      
      
}
 .clicked {
        color: #00A6EF;
       font-weight:800;
       font-size:130%;
}

.container {
	background-color: gray;
	background: rgba(0, 0, 0, 0.4);
	position: absolute;
	width: 100%;
	min-height: 100%;
	left: 0;
	top: 0;
	text-align: center;
}

.mdialog {
	border: 2px solid white;
	border-radius: 25px;
	background-color: #ffffff;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 50%;
	height: 450px;
	transform: translate(-50%, -50%);
}
.mbody {
	border: 2px solid #92acbb;
	margin-left:10%;
	width:80%;
	pont-size: 100pt;
}
.acCode{	
	border: 2px solid #92acbb;
	float: left;
	width:20%;
	height:100%;
}
.acName{
	border: 2px solid #92acbb;
	float: left;
	width:20%;
	height:100%;
}
.acAddress{	
	border: 2px solid #92acbb;
	width:100%;
	height:100%;
}
.mfooter{
	top:85%;
	left:30%;
  	position: fixed;
	clear:both;
	margin-bottom:10%;
	width:40%;
	height:50px;
}
.acbox{
	margin-left:25%;
	margin-top:10%;
	width: 50%;	
	height: 20%;
}
.box {	
	border: 8px solid #00A6EF;
	width: 100%;
	font-size: 200%;
	text-align:center;	
	height: 100%;
	border-radius: 10px;
}
.regButton {
	border-top: 5px solid #00A6EF;
	border-left: 5px solid #00A6EF;
	border-right: 5px solid #00A6EF;
	border-bottom: 5px solid #00A6EF;
	background-color: #00A6EF;
	margin-left:27%;
	margin-top:5%;
	width: 50%;
	height: 50%;
	text-align: center;
	font-size:150%;
	cursor: pointer;
	border-radius: 10px;	
}     
.mbtn{
 border-radius: 10px;background-color: #00A6EF; width:50%; height:100%; border: 1px solid #00A6EF;
}
.searchBtn{
 border-radius: 10px; background-color: #00A6EF; width:15%; height:40px; border: 1px solid #00A6EF;
} 
</style>

</head>
<body onload="dotClick('${category}')">
   <form name="" action="" method="get">
      <div id="basic">
         <div id="frame">
            <div id="logo"></div>
             <div id="sessionBox"><span id="session">${sessionInfo.userName}님 환영합니다.
             	<input	type="hidden" value='${sessionInfo.userId}' name="userId" />
				<input	type="hidden" value='${sessionInfo.userCode}' name="userCode" />
            </span></div>
            <div id="logOut">
               <input type="button" id="btn" value="로그아웃" onclick="accessOut()" onmouseover="mouseOver(this)" onmouseout="mouseLeave(this)">
            </div>
         </div>
         
         <div id="body">
            <div id="colorline"></div>
               <div class="servicebutton">
                  <input type="button" class="bothB" id="oneB" onclick=""> 
                  <input type="button" class="bothB" id="twoB" onclick="">
                  <input type="button" class="bothB" id="threeB" onclick=""> 
                  <input type="button" class="bothB" id="fourB" onclick="">
                   <input type="button" class="bothB" id="fiveB" onclick="">
                   <input type="button" class="bothB" id="sixB" onclick="">  
                   <div class="div1">
                    <div class="div2" id="regAcademy" onclick="regAcForm()" >
                   ●&nbsp;&nbsp;학원등록
                     </div>
                    <div class="div2" onclick="">
                 ●&nbsp;&nbsp;비밀번호 변경
                      </div>
                 <div class="div2" onclick="">
                 ●&nbsp;&nbsp;회원탈퇴
                      </div>
                  
               </div>
                    
               </div>
            <div id="mainpage"></div>
         </div>
      </div>
   </form>

<script>
   function mouseOver(obj) {
      let fColor = (obj.id == "btn") ? "#000000" : "#FFFFFF";
      obj.style.color = fColor;
      obj.style.background = "#00A6EF ";

   }

   function mouseLeave(obj) {

      let fColor = (obj.id == "btn") ? "#ffffff" : "#FF0000";
      obj.style.color = fColor;
      obj.style.background = "#0042ED  ";
      obj.style.border = ""

   }
   var div2 = document.getElementsByClassName("div2");

   function handleClick(event) {
     console.log(event.target);
     // console.log(this);
     // 콘솔창을 보면 둘다 동일한 값이 나온다

     console.log(event.target.classList);

     if (event.target.classList[1] === "clicked") {
       event.target.classList.remove("clicked");
     } else {
       for (var i = 0; i < div2.length; i++) {
         div2[i].classList.remove("clicked");
       }

       event.target.classList.add("clicked");
     }
   }

   function init() {
     for (var i = 0; i < div2.length; i++) {
       div2[i].addEventListener("click", handleClick);
     }
   }

   init();
</script>
</body></html>