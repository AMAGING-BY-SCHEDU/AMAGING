<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TAMain</title>
 <script src="resources/js/common.js"></script>
<script src=""></script>
<script>
	function getPage3(userCode) {
  		const f = document.getElementsByName("TApage")[0];
   	 	const hidden = makeInputElement("hidden","userCode",userCode,"");
    	f.appendChild(hidden);
    	document.getElementsByName("userCode")[0];
    	f.submit();
 	}
	
	function makeInputElement(type, name, value, placeholder){
		const input = document.createElement("input");
		input.setAttribute("type", type);
		input.setAttribute("name", name);
		if(value != ""){input.setAttribute("value", value);}
		if(placeholder != ""){input.setAttribute("placeholder", placeholder);}
		
		return input;
	}
	function ajax() {
		
	}
	function makeInputElement(type, name, value, placeholder){
		const input = document.createElement("input");
		input.setAttribute("type", type);
		input.setAttribute("name", name);
		if(value != ""){input.setAttribute("value", value);}
		if(placeholder != ""){input.setAttribute("placeholder", placeholder);}
		
		return input;
	}
	/*페이지 이동*/
	function getPage3(userCode) {
	      const f = document.getElementsByName("TApage")[0];
	      const hidden = makeInputElement("hidden","userCode",userCode,"");
	      f.appendChild(hidden);
	      document.getElementsByName("userCode")[0];
	      f.submit();
	   }
</script>
<style>
#basic {
	position: fixed;
	width: 99%;
	height: 100%;
	
}

#body {
	width: 100%;
	height: 99%;
	
	background-color: #F6F6F6;
}

#logo {
	width: 20%;
	height: 15%;
	
	position: absolute;
	top: 6%;
	left: 41%;
	background-image:url(resources/images/최종로고.png);  background-size:100%  100%;  background-repeat : no-repeat; background-position:right center;
}

#arm {
	width: 85%;
	height: 50%;
	
	position: absolute;
	top: 25%;
	left: 8%;
 float:left; background-image:url(resources/images/선생님메인.png);  background-size:100%  100%;  background-repeat : no-repeat; background-position:right center; border-radius: 15px ; 
}

#loginMom {
	width: 30%;
	height: 30%;
	position: absolute;
	top: 20%;
	left: 70%;
	
	
	
}

#loginMom div {
	display: inline-block; 
}

 #sLoginB {
	width: 40%;
	height:20%;
	border-radius: 10px ;
	position:absolute; top:60%; left:36.5%;
 background-color: transparent;
	cursor: pointer;
	border: 4px dotted white;

	font-size: 20px;


}  


#pointer {
  width: 50%;
  height: 20%;
  position: relative; left:35%; top:30%;
  background: #00A6EF;
   cursor: pointer;
   text-align:center;
  
}
#pointer:before {
  content: "";
  position: absolute;
  left: -10%;
  bottom: 0;
  width: 0;
  height: 0;
  border-right: 29px solid #00A6EF;
  border-top: 29px solid transparent;
  border-bottom: 29px solid transparent;
}
#pointer:after {
  content: "";
  position: absolute;
  right: 0px;
  bottom: 0;
  width: 0;
  height: 0;
  border-right: 29px solid #F6F6F6;
  border-top: 29px solid transparent;
  border-bottom: 29px solid transparent;
}
#pointer2 {
   width: 50%;
  height: 20%;
  position: relative; left:35%; top:30%;
  background: #EF90FF  ;
   cursor: pointer;
   text-align:center;
   font-size:100%;
   text-align:center;
	}
 
 #pointer2:before {
  content: "";
  position: absolute;
  left: -10%;
  bottom: 0;
  width: 0;
  height: 0;
  border-right: 29px solid #EF90FF  ;
  border-top: 29px solid transparent;
  border-bottom: 29px solid transparent;
} 
  

#pointer2:after {
  content: "";
  position: absolute;
  right: 0px;
  bottom: 0;
  width: 0;
  height: 0;
  border-right: 29px solid #F6F6F6 ;
  border-top: 29px solid transparent;
  border-bottom: 29px solid transparent;
}
  



.box {
   text-align: center;
   line-height: 100px;
   font-size: 100px;
   color: #fff;
   font-weight: bold;

}

.slider {
   width: 30%;
   height: 12%;
   margin-top: 1%;
   

}
#banner{ position:absolute; left:50.5%; top:46%;
   width:100%; height:100%;}
#slider2{margin-top:16%;}
#slider1{position:fixed; top:76.2%; width:30%;right:49.6%; }



#subphoto { width:40%; height:40%;}
#bottom{ position:absolute;  top:87.3%; width:110%; height:10%;   }
h1{color:#A6A6A6; font-size:30%; position:absolute; left:34%; top:36%; }
#smphoto{  background-image:url(resources/images/작은로고.png);  background-size:100%  100%;  background-repeat : no-repeat; background-position:center center;  width:5%; height:17%; position:absolute; top:40%; left:28.5%;}
#st{color:#F6F6F6; font-size:30px; font-weight:1000; line-height: 50px;   }
#pa{color:#F6F6F6; font-size:30px; font-weight:1000; line-height: 50px;   }
</style>

</head>
<body onLoad="">
	<form name="TApage" action="/LoginPage" method="get">
		<div id="basic">
			<div id="body">
				<div id="logo"></div>
			
				<div id="arm">
				<div id="subphoto"></div>
			    </div>
				<div id="loginMom">
					<div id="pointer"   onClick="getPage3('3')" ><span id="st">선생님로그인</span></div> 
					<div id="pointer2"  onClick="getPage3('4')" ><span id="pa">관리자로그인</span></div>
				</div>

			<div id="banner">
				<section id="slider1" class="slider">
					<div class="box" style="background-color: #000;">
						<img src="resources/images/이벤트배너.jpg" width="100%" height="100%"  />
					</div>
					<div class="box" style="background-color: #000;">
						<img src="resources/images/배송배너.jpg" width="100%" height="100%"  />
					</div>
					<div class="box" style="background-color: #000;">
						<img src="resources/images/커피배너.jpg" width="100%" height="100%" />
					</div>
					<div class="box" style="background-color: #000;">
						<img src="resources/images/바우처.jpg" width="100%" height="100%"  />
					</div>
					<div class="box" style="background-color: #000;">
						<img src="resources/images/시험배너.jpg" width="100%" height="100%"  />
					</div>
				</section>

				<section id="slider2" class="slider">
					<div class="box" style="background-color: #ff0000;">
						<img src="resources/images/수상배너1.jpg" width="100%" height="100%" />
					</div>
					<div class="box" style="background-color: #ff0000;">
						<img src="resources/images/수상배너2.jpg" width="100%" height="100%" />
					</div>
					<div class="box" style="background-color: #ff0000;">
						<img src="resources/images/수상배너3.jpg" width="100%" height="100%" />
					</div>
					<div class="box" style="background-color: #ff0000;">
						<img src="resources/images/수상배너4.jpg" width="100%" height="100%" />
					</div>
					<div class="box" style="background-color: #ff0000;">
						<img src="resources/images/수상배너5.jpg" width="100%" height="100%" />
					</div>
				</section>
			</div>
			<div id="bottom"><h1>(주)어메이징 대표 : 김현우 사업자등록번호 : 213-15-419513 통신판매업신고번호 : 제2013-인천미추홀구-1245<br>
				사업자등록확인 주소 : 인천 미추홀구 매소홀로488번길 6-32 태승빌딩 5층  TEL : 0507-1491-3360 FAX : 0507-1491-3360<br>
							COPYRIGHT (C) 2016 AMAGING.COM ALL RIGHTS RESERVED.</h1>
				<div style=" font-size:80%; color:#5D5D5D;  padding:10px; width: 4%; height: 6%; position:absolute; top:68%; left:33.5%;cursor: pointer; text-decoration: underline; " onclick="location.href='https://map.naver.com/v5/entry/place/36395746?c=14101418.5597610,4500465.0064930,13,0,0,0,dh&placePath=%2Fhome%3Fentry=plt';">
						찾아오시는길</div>
			
				<div id="smphoto"> </div>
				
			</div>
		</div>
	</form>
</body>
<script>
function Slider(target, type) {
	  // 상태
	  let index = 1;
	  let isMoved = true;
	  const speed = 1000; // ms

	  // 방향
	  const transform = "transform " + speed / 1000 + "s";
	  let translate = (i) => "translateX(-" + 100 * i + "%)";
	  if (type === "V") {
	    translate = (i) => "translateY(-" + 100 * i + "%)";
	  }

	  // 슬라이더
	  const slider = document.querySelector(target);
	  const sliderRects = slider.getClientRects()[0];
	  slider.style["overflow"] = "hidden";

	  // 슬라이더 화면 컨테이너
	  const container = document.createElement("div");
	  container.style["display"] = "flex";
	  container.style["flex-direction"] = type === "V" ? "column" : "row";
	  container.style["width"] = sliderRects.width + "px";
	  container.style["height"] = sliderRects.height + "px";
	  container.style["transform"] = translate(index);

	  // 슬라이더 화면 목록
	  let boxes = [].slice.call(slider.children);
	  boxes = [].concat(boxes[boxes.length - 1], boxes, boxes[0]);

	  // 슬라이더 화면 스타일
	  const size = boxes.length;
	  for (let i = 0; i < size; i++) {
	    const box = boxes[i];
	    box.style["flex"] = "none";
	    box.style["flex-wrap"] = "wrap";
	    box.style["height"] = "100%";
	    box.style["width"] = "100%";
	    container.appendChild(box.cloneNode(true));
	  }

	  // 처음/마지막 화면 눈속임 이벤트
	  container.addEventListener("transitionstart", function () {
	    isMoved = false;
	    setTimeout(() => {
	      isMoved = true;
	    }, speed);
	  });
	  container.addEventListener("transitionend", function () {
	    // 처음으로 순간이동
	    if (index === size - 1) {
	      index = 1;
	      container.style["transition"] = "none";
	      container.style["transform"] = translate(index);
	    }
	    // 끝으로 순간이동
	    if (index === 0) {
	      index = size - 2;
	      container.style["transition"] = "none";
	      container.style["transform"] = translate(index);
	    }
	  });

	  // 슬라이더 붙이기
	  slider.innerHTML = "";
	  slider.appendChild(container);

	  return {
	    move: function (i) {
	      if (isMoved === true) {
	        index = i;
	        container.style["transition"] = transform;
	        container.style["transform"] = translate(index);
	      }
	    },
	    next: function () {
	      if (isMoved === true) {
	        index = (index + 1) % size;
	        container.style["transition"] = transform;
	        container.style["transform"] = translate(index);
	      }
	    },
	    prev: function () {
	      if (isMoved === true) {
	        index = index === 0 ? index + size : index;
	        index = (index - 1) % size;
	        container.style["transition"] = transform;
	        container.style["transform"] = translate(index);
	      }
	    }
	  };
	}

	const s1 = new Slider("#slider1", "H");
	const s2 = new Slider("#slider2", "V");

	setInterval(() => {
	  s1.next();
	  s2.next();
	}, 1000)
</script>
</html>