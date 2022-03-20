<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>관리자 납부내역 페이지</title>
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
   background-image: url(resources/images/관리자로고1.png);
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
   background-color: #EF90FF;
}

#body {
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
   margin-top: -2%;
 
 
}

#mainpage {
   width: 73%;
   height: 80%;
   float: right;
   margin-right: 5.5%;
   background-image: url(resources/images/.png);
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
   border-top: 5px solid #EF90FF;
   border-left: 5px solid #EF90FF;
   border-right: 5px solid #EF90FF;
   border-bottom: 5px solid #EF90FF;
}

.bothB:active {
   width: 85%;
   height: 13%;
   border-radius: 20px;
   margin: 2% 4%;
   background-color: #EF90FF;
}

#oneB {
   margin-top: 5%;
   margin-bottom: 3%;
   float: left;
   background-image: url(resources/images/학사일정4.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: center center;
   cursor: pointer;
   height: 9%;

}

#twoB {
   margin-bottom: 3%;
   float: left;
   background-image: url(resources/images/수업관리.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height: 9%;
 
}

#threeB {
 
   margin-bottom: 3%;
   float: left;
   background-image: url(resources/images/납부내역.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height: 9%;
    background-color:#EF90FF;
}

#fourB {
  margin-top:21%;
   margin-bottom: 3%;
   float: left;
   background-image: url(resources/images/인사관리.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height: 9%;
}

#fiveB {
   float: left;
   background-image: url(resources/images/상담.png);
   background-size: 100% 80%;
   background-repeat: no-repeat;
   background-position: right center;
   cursor: pointer;
   height: 9%;
}

#btn {
   width: 50%;
   height: 50%;
   border-radius: 10px;
   margin-left: 15%;
   margin-top: 10%;
   border-bottom: 5px solid #E14FCA;
   border-top: 5px solid #E14FCA;
   border-left: 5px solid #E14FCA;
   border-right: 5px solid #E14FCA;
   background-color: #E14FCA;
   text-align: center;
   font-size: 130%;
   cursor: pointer;
   
}

#btn:active {
   border-top: 5px solid #EF90FF;
   border-left: 5px solid #EF90FF;
   border-right: 5px solid #EF90FF;
   border-bottom: 5px solid #EF90FF;
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
       position: relative; top:-3%;
        width: 70%;
        height: 13%;
        display: flex;
        align-items: center;
       margin-left:13%;
       cursor: pointer;
       font-weight:600;
       font-size: 100%;
      
      
}
 .clicked {
        color: #EF90FF;
       font-weight:800;
       font-size:130%;
      }
 
</style>

</head>
<body onload="">
   <form name="" action="" method="get">
      <div id="basic">
         <div id="frame">


            <span id="logo"></span>
            <div id="sessionBox"><span id="session">김현우님 환영합니다.</span></div>
            <div id="logOut">
               <span><input type="button" id="btn" value="로그아웃" onclick="accessOut()"
                  onmouseover="mouseOver(this)" onmouseout="mouseLeave(this)"></span>
            </div>
         </div>

         <div id="body">
            <div id="colorline"></div>
            <div class="servicebutton">

               <input type="button" class="bothB" id="oneB" onclick="">                             
               <input type="button" class="bothB" id="twoB" onclick=""> 
               <input type="button" class="bothB" id="threeB" onclick="">
                 <div class="div1">
                    <div class="div2" onclick="" >
                   ●&nbsp;&nbsp;등록
                     </div>
                    <div class="div2" onclick="">
                 ●&nbsp;&nbsp;조회
                      </div>
               </div>
               <input type="button" class="bothB" id="fourB" onclick="">
               <input type="button" class="bothB" id="fiveB" onclick="">

            </div>
            <div id="mainpage"></div>
         </div>
      </div>
   </form>

   <script type="text/javascript">
   function mouseOver(obj) {
      let fColor = (obj.id == "btn") ? "#000000" : "#FFFFFF";
      obj.style.color = fColor;
      obj.style.background = "#EF90FF ";

   }

   function mouseLeave(obj) {

      let fColor = (obj.id == "btn") ? "#ffffff" : "#FF0000";
      obj.style.color = fColor;
      obj.style.background = "#E14FCA ";
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
</body>
</html>