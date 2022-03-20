<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 출석 페이지</title>
 <script src="resources/js/common.js"></script>
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
  
  background-color: #00A6EF ;
}

#fourB {
margin-top:34%;
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
   height:9%;}



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
      
	.container		{background-color:gray;
					background: rgba(0,0,0,0.4);
					position:absolute;
					width:100%;
					height:100%;
					left:0;
					top:0;
					text-align:center;
					display:flex;}
	.mdialog		{border:2px solid white;
					border-radius:25px;
					background-color:#fff;
					position:absolute;
					top:30%;
					left:38.2%;
					width:39%;
					height:450px;
					transform:translate(-50%,-50%);}

#mainpage {
   width: 73%;
   height: 80%;
   float: right;
   margin-right: 5.5%;
   
   background-size: 30% 55%;
   background-repeat: no-repeat;
   background-position: center center;
}

#mainOne			{width: 45%;
					height: 20%;
					float:left;}/*border:2px solid black;*/
#mainTwo			{width: 45%;
					height: 20%;
					float:right;}
#mainThree			{width: 90%;
					height: 80%;
					clear:both;
					overflow:auto;}

</style>

</head>
<body onload="closeModal();">
      <div id="basic">
         <div id="frame">
            <div id="logo"></div>
             <div id="sessionBox">
             	<span id="academySession" value="as"></span>
             	<span id="nameSession" >${sessionInfo.userName}님 환영합니다.</span>
             	<input type="hidden" name= "tCode" value="${sessionInfo.userId}" />
             </div>
            <div id="logOut">
               <input type="button" id="btn" value="로그아웃" onclick="accessOut()" onmouseover="mouseOver(this)" onmouseout="mouseLeave(this)">
               <input type="hidden" value='${sessionInfo.userId}' name="userId" />
			   <input type="hidden" value='${sessionInfo.userCode}' name="userCode"/>
            </div>
         </div>
         
         <div id="body">
            <div id="colorline"></div>
               <div class="servicebutton">
                  <input type="button" class="bothB" id="oneB" onclick=""> 
                  <input type="button" class="bothB" id="twoB" onclick="">
                  <input type="button" class="bothB" id="threeB" onclick="">
                       <div class="div1">
                    <div class="div2" id="div1" onclick="attandanceStart('${sessionInfo.userId}');" >
                   ●&nbsp;&nbsp;출석체크
                     </div>
                    <div class="div2" id="cAS" value="${sessionInfo.userId}" onclick="checkAttandance('${sessionInfo.userId}');">
                 ●&nbsp;&nbsp;출석조회
                      </div>
                 <div class="div2" onclick="modAttandance('${sessionInfo.userId}');">
                 ●&nbsp;&nbsp;출석수정
                      </div>
                     </div>  
                  <input type="button" class="bothB" id="fourB" onclick="">
                   <input type="button" class="bothB" id="fiveB" onclick="">
                   <input type="button" class="bothB" id="sixB" onclick="">  
                    
               </div>
            <div id="mainpage">
            	<div id="mainOne" name="mainOne"></div>
            	<div id="mainTwo" name="mainTwo"></div>
            	<div id="mainThree" name="mainThree"></div>
            </div>
         </div>
      </div>
  
	<form name='dynamicFormData'>
	<!-- The Modal BackGround -->
		<div class="container" id="container">
			<div class="mdialog">
				<div class="mcontent">
			
				<!-- The Modal header -->
					<div class="mheader">
						<h4 class="mtitle" id="mheader"></h4>
					</div>
				
				<!-- The Modal body -->
					<div class="mboby" id="mbody" value="">Modal Body</div>
				
				<!-- The Modal footer -->
					<div class="mfooter">
						<input type="button" class="mbtn" name="command" />
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
<script>
attandanceS('${sessionInfo.userId}');
startS();
function startS(){
	if(sessionStorage.getItem("ID") != ""){
		var han = sessionStorage.getItem("ID");
		var upTitle = document.getElementById("academySession");
		upTitle.setAttribute("value",han);
		wT();
	}else{
		let upTitle = document.getElementById("academySession");
		upTitle.setAttribute("value","as");
	}
}
function wT(){
	var upT = document.getElementById("academySession");
	upT.innerText = sessionStorage.getItem("ID");
}
function attandanceS(userIdData){//학원 리스트 갖고 오기
	const action = "GetASchoolList";
	const data = "userId=" + encodeURIComponent(userIdData);
	getAjax(action, data, "academyList");
}
function openModal(){
	let container = document.getElementById("container");
	container.style.filter="alpha(Opacity=50)";//반투명
	container.style.display = "block";//화면띄우기
}
function closeModal(){
	let container = document.getElementById("container");
	container.style.display = "none";
	
	var aIdx = document.getElementById("academySession");
	var sAInfo = aIdx.getAttribute("value");
	
	if(sAInfo != "as"){
		sessionStorage.getItem("ID");
	}
}
function modAttandance(userIdData){
	
	let saData = document.getElementById("mainThree");
	while(saData.hasChildNodes()){
		saData.removeChild(saData.lastChild);
	}
	
	const action = "GetASchoolList";
	const data = "userId=" + encodeURIComponent(userIdData);
	getAjax(action, data, "academyList");
	
	var aIdx = document.getElementById("academySession");
	var sAInfo = aIdx.getAttribute("value");
	
	if(sessionStorage.getItem("ID") != null){
		const action = "selectClass";
		const dataAcName = "userId=" + encodeURIComponent(userIdData) + "&acName=" + encodeURIComponent(sAInfo);
		getAjax( action, dataAcName, "modSA");
	}else{
		alert("교육기관을 선택해주세요");
		
	}
}

function modSA(data){
	let clList
	clList = JSON.parse(data);
	let upLeft = document.getElementById("mainOne");
	
	let rightData = '<div>';
		rightData += '<span>';
		rightData += '<select name="classI" id="classI" ">';
		rightData += '<option value="교육과정">교육과정';
		rightData += '</option>';
	for(let a=0;a<clList.length;a++){
		rightData += '<option value="'+ clList[a].clCode +'">'+ clList[a].clName;
		rightData += '</option>';
	}
		rightData += '</select>';
		rightData += '</span>';
		rightData += '<span>';//달력
		rightData += '<select name="" id="checkYear" value="" >';
		rightData += '</select>';
		rightData += '<select name="" id="checkMonth" value="">';
		rightData += '</select>';
		rightData += '<select name="" id="checkDay" value="">';
		rightData += '</select>';
		rightData += '</span>';
		rightData += '<span>';//버튼
		rightData += '<input type="button" value="조회" onClick="modCheckAS();"/>'
		rightData += '</span>';
		rightData += '<div>';
		
		upLeft.innerHTML = rightData;
		today();
}

function modCheckAS(){
	var cl = document.getElementById("classI").value;
	var cy = document.getElementById("checkYear").value;
	var cm = document.getElementById("checkMonth").value;
	var cd = document.getElementById("checkDay").value;
	
	if(cm < 10 && cd < 10){
		var dd = cy + '0' + cm + '0' + cd;
	}else if(cm < 10 && cd >= 10){
		var dd = cy + '0' + cm + cd;
	}else if(cm >= 10 && cd < 10){
		var dd = cy + cm + '0' + cd;
	}else{
		var dd = cy + cm + cd;
	}
	var pdd = parseInt(dd);
	let tId = document.getElementsByName("tCode")[0].value;
	
	const action = "checkStudent";
	const dataCS = "teacherId=" + encodeURIComponent(tId) + "&weedDay=" + encodeURIComponent(pdd) + "&clCode=" + encodeURIComponent(cl);
	getAjax( action, dataCS, "modCheckStudent");
}

function modCheckStudent(data){
	var csList;
	csList = JSON.parse(data);
	const csListL = csList.length;
	let centerForm = document.getElementById("mainThree");
	
	let idx=0;
	let centerD = '<div id="scroller">';
		centerD += '<div>';
		centerD += '<span>이름</span>';
		centerD += '<span>출석여부</span>';
		centerD += '</div>';
	for(idx ; idx<csList.length ; idx++){
		centerD += '<div>';
		centerD += '<span id="studentN('+idx+')" value="'+ csList[idx].studentId +'" >' + csList[idx].studentName + '</span>';
		centerD += '<span><input type="hidden" id="status('+idx+')" value="'+ csList[idx].atStatus +'" ></span>';
		centerD += '<span><input type="hidden" id="crCode('+idx+')" value="'+ csList[idx].subjectCode +'" ></span>';
		centerD += '<span><select id="attendanceStatus('+idx+')">';
		centerD += '<option value="21">출석';
		centerD += '<option value="22">지각';
		centerD += '<option value="23">결석';
		centerD += '</select></span>';
		centerD += '</div>';
	}
		centerD += '<div>';
		centerD += '<input type="button" value="수정" onClick="modDatasend('+csListL+');">';
		centerD += '</div>';
		centerD += '</div>';
		
		centerForm.innerHTML = centerD;
		
		autoSelect(csList);
}

function modDatasend(cData){
	var cy = document.getElementById("checkYear").value;
	var cm = document.getElementById("checkMonth").value;
	var cd = document.getElementById("checkDay").value;
	
	if(cm < 10 && cd < 10){
		var dd = cy + '0' + cm + '0' + cd;
	}else if(cm < 10 && cd >= 10){
		var dd = cy + '0' + cm + cd;
	}else if(cm >= 10 && cd < 10){
		var dd = cy + cm + '0' + cd;
	}else{
		var dd = cy + cm + cd;
	}
	var pdd = parseInt(dd);
	
	let sendData = [];
	for(let idx =0 ; idx<cData ; idx++){
		var si = document.getElementById("studentN("+idx+")");
		var siResult = si.getAttribute("value");
		
		sendData.push({subjectCode:document.getElementById("crCode("+idx+")").value
			,studentId:siResult
			,date:pdd
			,atStatus:document.getElementById("attendanceStatus("+idx+")").value});
	}
	getJson("modAttendance",JSON.stringify(sendData),"modAfterResult");
}
function modAfterResult(data){
	const tIDvalue = document.getElementById("cAS");
	const tID = tIDvalue.getAttribute("value");
	
	const sendData = "teacherId=" + encodeURIComponent(tID) + "&weedDay=" +	encodeURIComponent(data);
	getAjax("recheckSA", sendData, "recheckForm");
}

function recheckForm(data){
	let saData = document.getElementById("mainThree");
	while(saData.hasChildNodes()){
		saData.removeChild(saData.lastChild);
	}
	
	let reData = JSON.parse(data);
	var yD = (reData[0].dayDate).substring(0,4);
	var mD = (reData[0].dayDate).substring(4,6);
	var dD = (reData[0].dayDate).substring(6);
	
	let rightData = '<div>';
		rightData += '<div>'+ yD +"년"+ mD +"월"+ dD +"일 출석 현황"+'</div>';
		rightData += '<div></div>';
	for(let a=0;a<reData.length;a++){
		rightData += '<div>';
		rightData += '<span>'+ reData[a].studentName +'</span>';
		rightData += '<span>'+ reData[a].atStatusName +'</span>';
		rightData += '</div>';
	}
		
		rightData += '<div>';
		
		saData.innerHTML = rightData;	
}

function autoSelect(data){
	for(let idx =0 ; idx<data.length ; idx++){
		var aaa = document.getElementById("status("+idx+")").value;
		
		if(aaa == '21'){
			document.getElementById("attendanceStatus("+idx+")").selectedIndex = "0";
		}else if(aaa == '22'){
			document.getElementById("attendanceStatus("+idx+")").selectedIndex = "1";
		}else if(aaa == '23'){
			document.getElementById("attendanceStatus("+idx+")").selectedIndex = "2";
		}
	}
}

function checkAttandance(userIdData){
	
	let saData = document.getElementById("mainThree");
	while(saData.hasChildNodes()){
		saData.removeChild(saData.lastChild);
	}
	
	const action = "GetASchoolList";
	const data = "userId=" + encodeURIComponent(userIdData);
	getAjax(action, data, "academyList");
	
	var aIdx = document.getElementById("academySession");
	var sAInfo = aIdx.getAttribute("value");
	
	if(sessionStorage.getItem("ID") != null){
		const action = "selectClass";
		const dataAcName = "userId=" + encodeURIComponent(userIdData) + "&acName=" + encodeURIComponent(sAInfo);
		getAjax( action, dataAcName, "selectClassAndDate");
	}else{
		alert("교육기관을 선택해주세요");
		
	}
}

let clList;
function selectClassAndDate(ClList){
	clList = JSON.parse(ClList);
	let upLeft = document.getElementById("mainOne");
	
	let rightData = '<div>';
		rightData += '<span>';
		rightData += '<select name="classI" id="classI" ">';
		rightData += '<option value="교육과정">교육과정';
		rightData += '</option>';
	for(let a=0;a<clList.length;a++){
		rightData += '<option value="'+ clList[a].clCode +'">'+ clList[a].clName;
		rightData += '</option>';
	}
		rightData += '</select>';
		rightData += '</span>';
		rightData += '<span>';//달력
		rightData += '<select name="" id="checkYear" value="" >';
		rightData += '</select>';
		rightData += '<select name="" id="checkMonth" value="">';
		rightData += '</select>';
		rightData += '<select name="" id="checkDay" value="">';
		rightData += '</select>';
		rightData += '</span>';
		rightData += '<span>';//버튼
		rightData += '<input type="button" value="조회" onClick="checkASendD();"/>'
		rightData += '</span>';
		rightData += '<div>';
		
		upLeft.innerHTML = rightData;
		today();
}

function checkASendD(){
	var cl = document.getElementById("classI").value;
	var cy = document.getElementById("checkYear").value;
	var cm = document.getElementById("checkMonth").value;
	var cd = document.getElementById("checkDay").value;
	
	if(cm < 10 && cd < 10){
		var dd = cy + '0' + cm + '0' + cd;
	}else if(cm < 10 && cd >= 10){
		var dd = cy + '0' + cm + cd;
	}else if(cm >= 10 && cd < 10){
		var dd = cy + cm + '0' + cd;
	}else{
		var dd = cy + cm + cd;
	}
	var pdd = parseInt(dd);
	let tId = document.getElementsByName("tCode")[0].value;
	
	const action = "checkStudent";
	const dataCS = "teacherId=" + encodeURIComponent(tId) + "&weedDay=" + encodeURIComponent(pdd) + "&clCode=" + encodeURIComponent(cl);
	getAjax( action, dataCS, "checkStudent");
}

function checkStudent(data){
	var csList;
	csList = JSON.parse(data);
	let centerForm = document.getElementById("mainThree");
	
	let idx=0;
	let centerD = '<div id="scroller">';
		centerD += '<div>';
		centerD += '<span>이름</span>';
		centerD += '<span>출석여부</span>';
		centerD += '</div>';
	for(idx ; idx<csList.length ; idx++){
		centerD += '<div>';
		centerD += '<span id="studentN" value="'+ csList[idx].studentId +'" >' + csList[idx].studentName + '</span>';
		centerD += '<span id="statusN" value="'+ csList[idx].atStatusName +'" >' + csList[idx].atStatusName + '</span>';
		centerD += '</div>';
	}
		centerD += '</div>';
		
		centerForm.innerHTML = centerD;
}
//-----------------------------------------------------------------------달력
function today(){
	var d = new Date();
	return getDateStr(d);
}
function getDateStr(data){
	var Year = data.getFullYear();
	var Month = (data.getMonth()+1);
	var Day = data.getDate();
	
	Month = (Month<10)?"0" + String(Month):Month;
	Day = (Day<10)?"0" + String(Day):Day;
	
	for(var i = 2015; i < 2055; i++){
		checkYear.options[i] = new Option(i + "년", i);
	}
	checkYear.selectedIndex = Year;
	
	for (var i = 1; i < 13; i++) {
		checkMonth.options[i] = new Option(i + "월", i);
	}
	checkMonth.selectedIndex = Month;
	
	checkDay.options.length = 0;
	var year = parseInt(checkYear.options[checkYear.selectedIndex].value);
	var month = parseInt(checkMonth.options[checkMonth.selectedIndex].value);
	var lastDay = getLastDay(year, month);
	
	for (var i = 1; i <= lastDay ; i++) {
		checkDay.options[i] = new Option(i + "일", i);
	}
	checkDay.selectedIndex = Day;
}
function getLastDay(year, month) {
	var lastDay = new Date(year, month);
	lastDay.setDate(0);//0을 주면 알아서 월간 이동
	return lastDay.getDate();
}
//-----------------------------------------------------------------------달력
function attandanceStart(userIdData){//학원 리스트 갖고 오기

	const pData = document.getElementById("mainThree");
	while(pData.hasChildNodes()){
		pData.removeChild(pData.lastChild);
	}
	
	const action = "GetASchoolList";
	const data = "userId=" + encodeURIComponent(userIdData);
	getAjax(action, data, "academyList");
	
	var aIdx = document.getElementById("academySession");
	var sAInfo = aIdx.getAttribute("value");
	
	if(sessionStorage.getItem("ID") != null){
		const action = "selectClass";
		const dataAcName = "userId=" + encodeURIComponent(userIdData) + "&acName=" + encodeURIComponent(sAInfo);
		getAjax( action, dataAcName, "selectClassBar");
	}else{
		alert("교육기관을 선택해주세요");
	}
}

function getAjax(action, data, fn) {
	let ajax = new XMLHttpRequest();
	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4 && ajax.status == 200) {
			window[fn](ajax.responseText);
		}
	};
	ajax.open("POST", action, true);
	ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	ajax.send(data);	
}
let acList;
function academyList(AcList){
	acList = JSON.parse(AcList);
	
	let upRight = document.getElementById("mainTwo");
	let r=0;
	let rightData = '<select name="aInfo" id="aInfo" onchange="insertA(this)">';
		rightData += '<option value="교육기관">교육기관';
		rightData += '</option>';
	for(r;r<acList.length;r++){
		rightData += '<option name="selectACList" value="'+ acList[r].acName +'">'+ acList[r].acName;
		rightData += '</option>';
	}
		rightData += '</select>';
		
	upRight.innerHTML = rightData;
}

function insertA(e){
	const value = e.value;
	sessionStorage.setItem('ID',value);
	var aIdx = document.getElementById("academySession");
	
	aIdx.innerText = value;
	let upTitle = document.getElementById("academySession");
	upTitle.setAttribute("value",value);
	
	const userId =document.getElementsByName("tCode")[0].value;
	const action = "selectClass";
	const dataAcName = "userId=" + encodeURIComponent(userId) + "&acName=" + encodeURIComponent(value);
	getAjax( action, dataAcName, "selectClassBar");
	
	if(sessionStorage.getItem("ID") == "value"){
	}else{	
	let mheader = document.getElementById("mheader");
	let mbody = document.getElementById("mbody");
	let command = document.getElementsByName("command")[0];
	
	command.setAttribute("onClick","secondLogin('"+value+"')");
	command.setAttribute("value","로그인");
	
	mheader.innerText = "PW 입력 해주세요";
	let slf = "<div>";
		slf += "<div><input type='password' name='secondPassword' placeholder='PASSWORD'/></div>";
		slf += "<div><span name='wrongMessage' value='as'></span></div>";
		slf += "</div>";
	mbody.innerHTML = slf;
	openModal();
	}
}

function secondLogin(data){
	let pw = document.getElementsByName("secondPassword")[0].value;
	let tId = document.getElementsByName("tCode")[0].value;
	
	const action = "ssecondLogin";
	const dataAcName = "tCode=" + encodeURIComponent(tId) + "&acName=" + encodeURIComponent(data) + "&password=" + encodeURIComponent(pw);
	getAjax( action, dataAcName, "sClass");
}

function sClass(data){
	if(data == "success"){
		alert("교육기관이 선택되었습니다.");
		closeModal();
	}else{
		alert("비번이 틀렸습니다.");
		var aIdx = document.getElementById("academySession");
		aIdx.innerText = "";
		let upTitle = document.getElementById("academySession");
		upTitle.setAttribute("value","as");
		aInfo.selectedIndex = "교육기관";
		let aData = document.getElementById("mainOne");
		while(aData.hasChildNodes()){
			aData.removeChild(aData.lastChild);
		}
		sessionStorage.clear();
		closeModal();
	}
}

function selectClassBar(ClList){
	clList = JSON.parse(ClList);
	let upLeft = document.getElementById("mainOne");
	
	let rightData = '<select name="classInfo" id="classInfo" onchange="classSelect(this)">';
		rightData += '<option value="교육과정">교육과정';
		rightData += '</option>';
	for(let a=0;a<clList.length;a++){
		rightData += '<option value="'+ clList[a].clCode +'">'+ clList[a].clName;
		rightData += '</option>';
	}
		rightData += '</select>';
		
		upLeft.innerHTML = rightData;
}

function classSelect(data){
	let cc = data.value;
	let tId = document.getElementsByName("tCode")[0].value;
	
	const action = "studentList";
	const dataF = "clCode=" + encodeURIComponent(cc) + "&teacherId=" + encodeURIComponent(tId);
	getAjax( action, dataF, "studentLF");
	
}

let stList;
function studentLF(StList){
	stList = JSON.parse(StList);
	let centerForm = document.getElementById("mainThree");
	
	let idx=0;
	let centerData = '<div id="scroller">';
		centerData += '<div>';
		centerData += '<span>-</span>';
		centerData += '<span>출석</span>';
		centerData += '<span>지각</span>';
		centerData += '<span>결석</span>';
		centerData += '</div>';
	for(idx ; idx<stList.length ; idx++){
		centerData += '<div>';
		centerData += '<input type="hidden" class="stName" value="' + stList[idx].studentId + '"/>';
		centerData += '<span id="studentN" value="'+ stList[idx].crCode +'" >' + stList[idx].sname + '</span>';
		centerData += '<span><input type="radio" class="checkS" name="checkS+'+idx+'+" value="'+ "21" +'" /></span>';
		centerData += '<span><input type="radio" class="checkS" name="checkS+'+idx+'+" value="'+ "22" +'" /></span>';
		centerData += '<span><input type="radio" class="checkS" name="checkS+'+idx+'+" value="'+ "23" +'" /></span>';
		centerData += '</div>';
	}
		centerData += '<div>';	
		centerData += '<input type="button" name="insertS" value="save" onClick="saveStudentA('+ idx +')"/>';
		centerData += '</div>';
		centerData += '</div>';
		
		centerForm.innerHTML = centerData;
}

function saveStudentA(){
	const sName = document.getElementsByClassName("stName").length;
	
	const sList = document.getElementById("studentN");
	const sLValue = sList.getAttribute("value");
	
	let saveData =[];
	let idx=0;
	for(idx ; idx<sName ; idx++){
		const query = 'input[name="checkS+'+idx+'+"]:checked';
		const selectedEls = document.querySelectorAll(query);
		
		let result = "";
		selectedEls.forEach((el) => {
			result = el.value;
			saveData.push({studentId:document.getElementsByClassName("stName")[idx].value,atStatus:result,subjectCode:sLValue});
		})
	}
	getJson("studentAttendanceForm",JSON.stringify(saveData),"sendMessage");
}

function sendMessage(data){
	let aData = document.getElementById("mainThree");
	
	while(aData.hasChildNodes()){
		aData.removeChild(aData.lastChild);
	}
	if(data == "success"){
		alert("저장되었습니다.");
	}
}

function getJson(action, data, fn) {
	let ajax = new XMLHttpRequest();
	ajax.onreadystatechange = function() {			
		if (ajax.readyState == 4 && ajax.status == 200) {
			window[fn](ajax.responseText);
		}
	};
	ajax.open("post", action, true);
	ajax.setRequestHeader("Content-type","application/json; charset=utf-8");
	ajax.send(data);
}

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
</html>