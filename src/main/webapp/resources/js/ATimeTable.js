
let currentRecord=null;
function getCourseList(acCode){
	let aca="acCode=" + encodeURIComponent(acCode);
	
	getAjaxData("GetCourseList",aca,"regClassForm","post");

}

	function regClassForm(aca){

   		/* -----------과정-------------- */
  let namae = JSON.parse(aca);
     
         let div = document.createElement("div");
   		 
		let accode=document.createElement("input");
			 	accode.setAttribute("type","hidden")
		 		accode.setAttribute("value",namae[0].acCode);
				accode.setAttribute("id","accode");
		 		div.appendChild(accode);			
	

         let select = document.createElement("select");
         select.setAttribute("id", "sentaku");
	      
         select.style.width = "10%";
         select.style.height = "8%";
         select.style.border = "2px solid #92acbb";
         select.style.position = "absolute"
         select.style.left = "30%";
		 select.style.top="30%";
		 select.style.borderRadius="5px";
		 select.style.textAlign = "center";
		 select.style.fontSize="100%";
         
         
         let katei = document.createElement("option");
			katei.innerHTML="과정";
			select.appendChild(katei);
			
            for(let i=0; i<namae.length; i++) {
               let option = document.createElement("option");
              	
               option.setAttribute("value",namae[i].crCode);
        		option.innerHTML=namae[i].crName;        
                         
               select.appendChild(option);  
			
            }
			
		/* -----------수업명 입력-------------- */
            let input=document.createElement("input");
			input.setAttribute("type","text");
			input.setAttribute("placeholder","수업명입력");
			input.setAttribute("id","classname");
			input.style.width="10%";
			input.style.height="7.5%";
			input.style.border="2px solid #92acbb";
			input.style.position = "absolute"
         	input.style.left = "45%";
			input.style.top="30%";
			input.style.borderRadius="5px";
			input.style.textAlign = "center";
         	input.style.fontSize="100%";
			
			/* -----------수업금액 입력-------------- */
			let input2=document.createElement("input");
			input2.setAttribute("type","text");
			input2.setAttribute("placeholder","수업금액 입력");
			input2.setAttribute("id","classmoney");
			input2.style.width="10%";
			input2.style.height="7.5%";
			input2.style.border="2px solid #92acbb";
			input2.style.position = "absolute"
         	input2.style.left = "60%";
         	input2.style.top="30%";
			input2.style.borderRadius="5px";
			input2.style.textAlign = "center";
			input2.style.fontSize="100%";
			
			/* -----------개강일 달력-------------- */
			let sdiv = document.createElement("div");
			sdiv.innerHTML="개강일";
			sdiv.style.position="absolute";
			sdiv.style.top="47.5%";
			sdiv.style.left="34%";
			sdiv.style.border="2px solid #92acbb";
			sdiv.style.borderRadius="5px";
			sdiv.style.textAlign = "center";
			let dateFrom = document.createElement("input");
        	dateFrom.setAttribute("id", "startd");
			dateFrom.setAttribute("type","date");
			dateFrom.setAttribute("name","dt");
         	dateFrom.style.width = "10%";
      		dateFrom.style.height = "7.5%";
       		dateFrom.style.border = "2px solid #92acbb";
        	dateFrom.style.position = "absolute"
        	dateFrom.style.left = "38%";
			dateFrom.style.top="45%";
			dateFrom.style.borderRadius="5px";
			dateFrom.style.textAlign = "center";
			dateFrom.style.fontSize="100%";
			
        	let stday = document.createElement("option");
			stday.setAttribute("selected",stday);
			dateFrom.appendChild(stday);
			
			/* -----------종강일 달력-------------- */
			let sdiv2 = document.createElement("div");
			sdiv2.innerHTML="종강일";
			sdiv2.style.position="absolute";
			sdiv2.style.top="47.5%";
			sdiv2.style.left="50%";
			sdiv2.style.border="2px solid #92acbb";
			sdiv2.style.borderRadius="5px";
			sdiv2.style.textAlign = "center";
			
			let dateFrom2 = document.createElement("input");			
        	dateFrom2.setAttribute("id", "endd");
			dateFrom2.setAttribute("type","date");
			dateFrom2.setAttribute("name","dt");
         	dateFrom2.style.width = "10%";
         	dateFrom2.style.height = "7.5%";
        	dateFrom2.style.border = "2px solid #92acbb";
         	dateFrom2.style.position = "absolute"
         	dateFrom2.style.left = "54%";
			dateFrom2.style.top="45%";
			dateFrom2.style.borderRadius="5px";
			dateFrom2.style.textAlign = "center";
			dateFrom2.style.fontSize="100%";
         	
         
         let enday = document.createElement("option");
			
			enday.setAttribute("selected",enday);
			dateFrom2.appendChild(enday);
			
			/* -----------등록버튼-------------- */		
		let btn=document.createElement("input");
			btn.setAttribute("type","button");
			btn.setAttribute("id", "btn1");
			btn.setAttribute("value","등록");
			btn.setAttribute("onClick","insertClass()");
         	btn.style.width = "7%";
         	btn.style.height = "7.5%";
         	btn.style.border = "2px solid #92acbb";
			btn.style.borderRadius="5px";
         	btn.style.position = "absolute"
         	btn.style.left = "67%";
			btn.style.cursor="pointer";
			btn.style.top="45%";
			btn.style.borderRadius="5px";
			btn.style.textAlign = "center";
			btn.style.fontSize="100%";
			btn.style.backgroundColor="#fff";
            
   const mainpage = document.getElementById("mainpage");
   div.appendChild(select);
   div.appendChild(input);
   div.appendChild(input2);
   div.appendChild(dateFrom);
   div.appendChild(dateFrom2);
   div.appendChild(btn);
   div.appendChild(sdiv);
   div.appendChild(sdiv2);
   mainpage.appendChild(div);
  
   
  
	
   //조회 - 세션에현재 저장된 acCode Selected -> Selected 된 값으로 현재 선생코드가 갖고있는 class 조회
   // -> Class select -> 해당 Class의 성적 display
	}
	
	//수업등록 버튼//
	function insertClass(){
		alert("아롱");
		const acCode=document.getElementById("accode").value;	
		const crCode=document.getElementById("sentaku").value;		
		const clName=document.getElementById("classname").value;
		const clFee=document.getElementById("classmoney").value;
		
		const clSdate =document.getElementById("startd").value;
		var words=clSdate.split('-');
		var res=words[0].concat(words[1]+words[2]);		
	
		const clEdate =document.getElementById("endd").value;
		var words2=clEdate.split('-');
		var res2=words2[0].concat(words2[1]+words2[2]);		
		
		const data = "acCode="+acCode+"&crCode="+crCode+"&clName="+clName+"&clFee="+clFee+"&clSdate="+res+"&clEdate="+res2;
			alert(data);	
		getAjaxData("InsertClass",data,"dotClick","post");
	}
	
	function dotClick(message){
	alert(message);	 
//	let category=sessionStorage.getItem("category");
//	if(category=null){category="regClassForm";}
//	document.getElementById(category).click();
	}
		//수업수정
function getAClassList(acCode){
		let abc="acCode=" + encodeURIComponent(acCode);
	
	getAjaxData("GetAClassList",abc,"updClassForm","post");

}		

function updClassForm(abc){
	alert("updClassForm");
	 let risuto = JSON.parse(abc);
		
	  let div = document.createElement("div");
		 let accode=document.createElement("input");
			 	accode.setAttribute("type","hidden")
		 		accode.setAttribute("value",risuto[0].acCode);
				accode.setAttribute("id","accode");
		 		div.appendChild(accode);
		
			let crcode=document.createElement("input"); 
			crcode.setAttribute("type","hidden")
			crcode.setAttribute("id","crcode");
			div.appendChild(crcode);
			
			let clcode=document.createElement("input");
			clcode.setAttribute("type","hidden")
			clcode.setAttribute("id","clcode")

			div.appendChild(clcode);
			
	 let table = document.createElement("table");
 		 table.style.position="absolute";
		 table.style.top="50%";
		 table.style.left="30%";
		 table.style.width="50%";
		 table.style.borderRadius="5px";
		 table.style.borderCollapse="collapse";	
		 table.style.borderTop= "2px solid #92acbb";
			         let mtr =createTr("mtr");
						
					 let mtd1 =createTd("mtd1");
					 let mtd2 =createTd("mtd2");
					 let mtd3 =createTd("mtd3");
					 let mtd4 =createTd("mtd4");
					 let mtd5 =createTd("mtd5");
						mtd1.innerHTML="과정명";
						mtd2.innerHTML="수업명";
						mtd3.innerHTML="수업료";
						mtd4.innerHTML="개강일";
						mtd5.innerHTML="종강일"; 
					
						mtr.appendChild(mtd1);
					    mtr.appendChild(mtd2);
						mtr.appendChild(mtd3);
						mtr.appendChild(mtd4);
						mtr.appendChild(mtd5);
					
						
		
			table.appendChild(mtr);
		
		for(let i=0; i<risuto.length; i++){
		
			let tr=createTr("tr");
			
			let td1=createTd("td1");
			td1.setAttribute("value",risuto[i].crCode);
			td1.innerHTML=risuto[i].crName;
			
			let td2 =createTd("td2");
			td2.setAttribute("value",risuto[i].clCode);
			td2.innerHTML=risuto[i].clName;
	
			let td3 =createTd("td3");
		
			let td4 =createTd("td4");
			let td5 =createTd("td5");			
			
			td3.innerHTML=risuto[i].clFee;
			td4.innerHTML=risuto[i].clSdate;
			td5.innerHTML=risuto[i].clEdate;
			tr.appendChild(td1);
			tr.appendChild(td2);
			tr.appendChild(td3);
			tr.appendChild(td4);
			tr.appendChild(td5);
		
		table.appendChild(tr);
						
					}									
		
		let name = document.createElement("input")

         name.setAttribute("type","text");
         name.setAttribute("id","classname");
         name.setAttribute("selected","selected");   
         name.setAttribute("placeholder","수업명 선택");	
         name.appendChild(table);
         name.style.border="2px solid #92acbb";
         name.style.borderRadius="5px";
         name.style.position="absolute";
         name.style.top="25%";
         name.style.left="38%";
         name.style.width = "10%";
         name.style.height = "7.5%";
         name.style.fontSize="100%";
         name.style.textAlign="center";
									
		let fee = document.createElement("input")		
			fee.setAttribute("type","text");
			fee.setAttribute("id","classmoney")
			fee.setAttribute("placeholder","수정금액 입력");
			fee.setAttribute("selected","selected");
			fee.style.border="2px solid #92acbb";
			fee.style.borderRadius="5px";
			fee.style.position="absolute";
			fee.style.top="25%";
			fee.style.left="54%";
			fee.style.width = "10%";
      		fee.style.height = "7.5%";
			fee.style.fontSize="100%";
			fee.style.textAlign="center";
			
				/* -----------개강일 달력-------------- */
			let sdiv = document.createElement("div");
			sdiv.innerHTML="개강일";
			sdiv.style.position="absolute";
			sdiv.style.top="37.5%";
			sdiv.style.left="34%";
			sdiv.style.border="2px solid #92acbb";
			sdiv.style.borderRadius="5px";
			sdiv.style.textAlign = "center";
			let dateFrom = document.createElement("input");
        	dateFrom.setAttribute("id", "startd");
			dateFrom.setAttribute("type","date");
			dateFrom.setAttribute("name","dt");
         	dateFrom.style.width = "10%";
      		dateFrom.style.height = "7.5%";
       		dateFrom.style.border = "2px solid #92acbb";
        	dateFrom.style.position = "absolute"
        	dateFrom.style.left = "38%";
			dateFrom.style.top="35%";
			dateFrom.style.borderRadius="5px";
			dateFrom.style.textAlign = "center";
			dateFrom.style.fontSize="100%";
			
        	let stday = document.createElement("option");
			stday.setAttribute("selected",stday);
			dateFrom.appendChild(stday);
			
			/* -----------종강일 달력-------------- */
			let sdiv2 = document.createElement("div");
			sdiv2.innerHTML="종강일";
			sdiv2.style.position="absolute";
			sdiv2.style.top="37.5%";
			sdiv2.style.left="50%";
			sdiv2.style.border="2px solid #92acbb";
			sdiv2.style.borderRadius="5px";
			sdiv2.style.textAlign = "center";
			
			let dateFrom2 = document.createElement("input");			
        	dateFrom2.setAttribute("id", "endd");
			dateFrom2.setAttribute("type","date");
			dateFrom2.setAttribute("name","dt");
         	dateFrom2.style.width = "10%";
         	dateFrom2.style.height = "7.5%";
        	dateFrom2.style.border = "2px solid #92acbb";
         	dateFrom2.style.position = "absolute"
         	dateFrom2.style.left = "54%";
			dateFrom2.style.top="35%";
			dateFrom2.style.borderRadius="5px";
			dateFrom2.style.textAlign = "center";
			dateFrom2.style.fontSize="100%";
         	      
         let enday = document.createElement("option");	
			enday.setAttribute("selected",enday);
			dateFrom2.appendChild(enday);
			
			/*-----------------수정완료 버튼--------------------*/
			let btn= document.createElement("input");
			btn.setAttribute("type","button");
			btn.setAttribute("id", "btn2");
			btn.setAttribute("value","수정완료");
			btn.setAttribute("onClick","updClass()");
			btn.style.width = "7%";
         	btn.style.height = "7%";
         	btn.style.border = "2px solid #92acbb";	
         	btn.style.position = "absolute"
         	btn.style.left = "68%";
			btn.style.cursor="pointer";
			btn.style.top="30%";
			btn.style.borderRadius="5px";
			btn.style.textAlign = "center";
			btn.style.fontSize="100%";
			btn.style.backgroundColor="#fff";
			btn.style.color="#000";	
            
	const mainpage =document.getElementById("mainpage");
	mainpage.appendChild(table);
	div.appendChild(name);
	div.appendChild(fee);
	div.appendChild(dateFrom);
   	div.appendChild(dateFrom2);
	div.appendChild(sdiv);
   	div.appendChild(sdiv2);
	div.appendChild(btn);
	mainpage.appendChild(div);
}
	//tr 생성펑션//
function createTr(id) {
   const tr = document.createElement("tr");
   tr.setAttribute("name",id); 
   tr.style.border="2px solid #92acbb";
   tr.setAttribute("onClick","javascript:getSelectClass(this)")
	return tr;
}
// td 생성 펑션//
function createTd(id) {
   const td = document.createElement("td");
   td.setAttribute("name",id);
   td.style.width  = "500px";
   td.style.textAlign = "center";

	return td;
}
		
// table 선택시 색변환 해주는 펑션//
function getSelectClass(target) {	
 var test0=document.getElementById("crcode")
		test0.setAttribute("value",target.childNodes[0].getAttribute("value"));
 var test11=document.getElementById("clcode")
		test11.setAttribute("value",target.childNodes[1].getAttribute("value"));						 
 var test=document.getElementById("classname");                          
		test.setAttribute("value",target.childNodes[1].innerHTML);
 var test2=document.getElementById("classmoney");
 		test2.setAttribute("value",target.childNodes[2].innerHTML);		
 var test3=document.getElementById("startd");	
	var cut=target.childNodes[3].innerHTML.substring(0,4);
		var cut2=target.childNodes[3].innerHTML.substring(4,6);
		var cut3=target.childNodes[3].innerHTML.substring(6);
		var join=cut+"-"+cut2+"-"+cut3;
		test3.setAttribute("value",join);
		
 var test4=document.getElementById("endd");
	var cutt=target.childNodes[4].innerHTML.substring(0,4);
		var cutt2=target.childNodes[4].innerHTML.substring(4,6);
		var cutt3=target.childNodes[4].innerHTML.substring(6);
		var joinn=cutt+"-"+cutt2+"-"+cutt3;
		test4.setAttribute("value",joinn);		
		 
  var tbody = target.parentNode;

		
    var trs = tbody.getElementsByTagName('tr');
    var backColor = "#ffffff";
    var textColor = "black";
    var orgBColor = "#FF2E2E";
    var orgTColor = "#ffffff";
 
 
    for ( var i = 0; i < trs.length; i++ ) {
        if ( trs[i] != target ) {
            trs[i].style.backgroundColor = backColor;
            trs[i].style.color = textColor;
        } else {
            trs[i].style.backgroundColor = orgBColor;
            trs[i].style.color = orgTColor;
            var td = trs[i].getElementsByTagName('td');
            no = td[0].innerText;
            no1 = td[1].innerText;
        }
    }

}
// 수업수정완료 버튼//
 function updClass(){
	alert("띵동");
	const acCode=document.getElementById("accode").value;
		
	const crCode=document.getElementById("crcode").value;
		
	const clCode=document.getElementById("clcode").value;

	const clName=document.getElementById("classname").value;
	
	const clFee=document.getElementById("classmoney").value;
	
	const clSdate =document.getElementById("startd").value;
	
	var cut=clSdate.split('-');
	var join=cut[0].concat(cut[1]+cut[2]);
	
	const clEdate=document.getElementById("endd").value;
	
	var cut2=clEdate.split('-');
	var join2=cut2[0].concat(cut2[1]+cut2[2]);
		
	
	
	const data="acCode="+acCode+"&crCode="+crCode+"&clCode="+clCode+"&clName="+clName+"&clFee="+clFee+"&clSdate="+join+"&clEdate="+join2;
	alert(data);                 
	
	getAjaxData("UpdClass",data,"sendMessage","post");
 }

function sendMessage(message){
   if(message!="다시시도해 주세요"){
   alert(message);
   }    
}
	

function subjectFormList(acCode){
	alert("어어왓니?");
	let abc="acCode="+encodeURIComponent(acCode);
	getAjaxData("GetAClassList",abc,"subjectRegForm","post");
}

function subjectRegForm(abcd){
 let ClassNa = JSON.parse(abcd);
  let div = document.createElement("div");
  let accode=document.createElement("input");
	  accode.setAttribute("type","hidden");
	  accode.setAttribute("value",ClassNa[0].acCode);
	  accode.setAttribute("id","accode");
	  div.appendChild(accode);
			/*수업 선택 */	
  let select = document.createElement("select");
      select.setAttribute("id", "select");
      select.style.width = "10%";
      select.style.height = "8%";
      select.style.border = "2px solid #92acbb";
      select.style.position = "absolute"
      select.style.left = "30%";
	  select.style.top="30%";
	  select.style.borderRadius="5px";
	  select.style.textAlign = "center";
	  select.style.fontSize="100%";
                 
  let classname = document.createElement("option");
	  classname.innerHTML="수업명";
	  select.appendChild(classname);
           
	 for(let i=0; i<ClassNa.length; i++) {
         let option = document.createElement("option");    
             option.setAttribute("value",ClassNa[i].clCode);               	
             option.innerHTML = ClassNa[i].clName;             
               select.appendChild(option);  
            }
			/*과목 입력 */
	let subj=document.createElement("select");
	  subj.setAttribute("id", "subject");
      subj.style.width = "10%";
      subj.style.height = "8%";
      subj.style.border = "2px solid #92acbb";
      subj.style.position = "absolute"
      subj.style.left = "42%";
	  subj.style.top="30%";
	  subj.style.borderRadius="5px";
	  subj.style.textAlign = "center";
	  subj.style.fontSize="100%";
	let sbna=document.createElement("option")
	  sbna.innerHTML="과목명";
	  subj.appendChild(sbna);
	
	let sb101=document.createElement("option");
		sb101.setAttribute("value","SB101")
		sb101.innerHTML="국어"	
		subj.appendChild(sb101)
	let sb102=document.createElement("option");
		sb102.setAttribute("value","SB102")
		sb102.innerHTML="영어"	
		subj.appendChild(sb102)
	let sb103=document.createElement("option");
		sb103.setAttribute("value","SB103")
		sb103.innerHTML="수학"	
		subj.appendChild(sb103)
	let sb104=document.createElement("option");
		sb104.setAttribute("value","SB104")
		sb104.innerHTML="사회"	
		subj.appendChild(sb104)
	let sb105=document.createElement("option");
		sb105.setAttribute("value","SB105")
		sb105.innerHTML="과학"	
		subj.appendChild(sb105)
	let sb106=document.createElement("option");
		sb106.setAttribute("value","SB106")
		sb106.innerHTML="자바"	
		subj.appendChild(sb106)	
	let sb107=document.createElement("option");
		sb107.setAttribute("value","SB107")
		sb107.innerHTML="오라클"	
		subj.appendChild(sb107)	
	let sb108=document.createElement("option");
		sb108.setAttribute("value","SB108")
		sb108.innerHTML="자바스크립트"	
		subj.appendChild(sb108)	
	let sb109=document.createElement("option");
		sb109.setAttribute("value","SB109")
		sb109.innerHTML="스프링부트"	
		subj.appendChild(sb109)	
	let sb110=document.createElement("option");
		sb110.setAttribute("value","SB110")
		sb110.innerHTML="코틀린"	
		subj.appendChild(sb110)																		
			/*선생님 이름 */
  let tdiv=document.createElement("div");
	  tdiv.setAttribute("onClick","openModal(this)")						
		    /*과목시작시간 */
  let sTime =document.createElement("select");
	  sTime.setAttribute("id","stime");
	  sTime.style.width = "10%";
      sTime.style.height = "8%";
      sTime.style.border = "2px solid #92acbb";
      sTime.style.position = "absolute"
      sTime.style.left = "30%";
	  sTime.style.top="40%";
	  sTime.style.borderRadius="5px";
	  sTime.style.textAlign = "center";
	  sTime.style.fontSize="100%";
 
 let stna=document.createElement("option");
	 stna.innerHTML="시작시간";
	 sTime.appendChild(stna);
	 
let hachi=document.createElement("option");	 
	hachi.innerHTML="08:00";
	sTime.appendChild(hachi);
let ku=document.createElement("option");
	ku.innerHTML="09:00";
	sTime.appendChild(ku);
let ten=document.createElement("option");
	ten.innerHTML="10:00";
	sTime.appendChild(ten);
let ele=document.createElement("option");
	ele.innerHTML="11:00";
	sTime.appendChild(ele);
let twe=document.createElement("option");
	twe.innerHTML="12:00";
	sTime.appendChild(twe);
let one=document.createElement("option");
	one.innerHTML="13:00";
	sTime.appendChild(one);
let two=document.createElement("option");
	two.innerHTML="14:00";
	sTime.appendChild(two);
let thr=document.createElement("option");
	thr.innerHTML="15:00";
	sTime.appendChild(thr);
let four=document.createElement("option");
	four.innerHTML="16:00";
	sTime.appendChild(four);
let fiv=document.createElement("option");
	fiv.innerHTML="17:00";
	sTime.appendChild(fiv);
let six=document.createElement("option");
	six.innerHTML="18:00";
	sTime.appendChild(six);										 
		    /*과목종료시간 */
let eTime =document.createElement("select");
	  eTime.setAttribute("id","stime");
	  eTime.style.width = "10%";
      eTime.style.height = "8%";
      eTime.style.border = "2px solid #92acbb";
      eTime.style.position = "absolute"
      eTime.style.left = "42%";
	  eTime.style.top="40%";
	  eTime.style.borderRadius="5px";
	  eTime.style.textAlign = "center";
	  eTime.style.fontSize="100%";
 
 let enna=document.createElement("option");
	 enna.innerHTML="종료시간";
	 eTime.appendChild(enna);
	 
let ten1=document.createElement("option");
	ten1.innerHTML="10:00";
	eTime.appendChild(ten1);
let ele1=document.createElement("option");
	ele1.innerHTML="11:00";
	eTime.appendChild(ele1);
let twe1=document.createElement("option");
	twe1.innerHTML="12:00";
	eTime.appendChild(twe1);
let one1=document.createElement("option");
	one1.innerHTML="13:00";
	eTime.appendChild(one1);
let two1=document.createElement("option");
	two1.innerHTML="14:00";
	eTime.appendChild(two1);
let thr1=document.createElement("option");
	thr1.innerHTML="15:00";
	eTime.appendChild(thr1);
let four1=document.createElement("option");
	four1.innerHTML="16:00";
	eTime.appendChild(four1);
let fiv1=document.createElement("option");
	fiv1.innerHTML="17:00";
	eTime.appendChild(fiv1);
let six1=document.createElement("option");
	six1.innerHTML="18:00";
	eTime.appendChild(six1);
let sev1=document.createElement("option");
	sev1.innerHTML="19:00";
	eTime.appendChild(sev1);
let eig1=document.createElement("option");
	eig1.innerHTML="20:00";
	eTime.appendChild(eig1);			
			/*요일선택 */
let week=document.createElement("div");
	 week.setAttribute("id","week");
	  week.style.width = "10%";
      week.style.height = "7.5%";
      week.style.border = "2px solid #92acbb";
      week.style.position = "absolute"
      week.style.left = "53%";
	  week.style.top="40%";
	  week.style.borderRadius="5px";
	  week.style.textAlign = "center"
	  week.style.fontSize="100%";
	  week.setAttribute("type","button");
	  week.setAttribute("onClick","javascript:openModal(this)");
let weekbox=document.createElement("form");
let mon=document.createElement("input")
    mon.setAttribute("type","checkbox");
	mon.setAttribute("name","week");
	mon.setAttribute("value","월요일");
	weekbox.appendChild(mon);
let tues=document.createElement("input")
    tues.setAttribute("type","checkbox");
	tues.setAttribute("name","week");
	tues.setAttribute("value","화요일");
	weekbox.appendChild(tues);
let wedn=document.createElement("input")
    wedn.setAttribute("type","checkbox");
	wedn.setAttribute("name","week");
	wedn.setAttribute("value","수요일");
	weekbox.appendChild(wedn);
let thurs=document.createElement("input")
    thurs.setAttribute("type","checkbox");
	thurs.setAttribute("name","week");
	thurs.setAttribute("value","목요일");
	weekbox.appendChild(thurs);
let fri=document.createElement("input")
    fri.setAttribute("type","checkbox");
	fri.setAttribute("name","week");
	fri.setAttribute("value","금요일");
	weekbox.appendChild(fri);
let satur=document.createElement("input")
    satur.setAttribute("type","checkbox");
	satur.setAttribute("name","week");
	satur.setAttribute("value","토요일");
	weekbox.appendChild(satur);
let sun=document.createElement("input")
    sun.setAttribute("type","checkbox");
	sun.setAttribute("name","week");
	sun.setAttribute("value","일요일");
	weekbox.appendChild(sun);																				
	week.appendChild(weekbox);			
			/*등록버튼 */

			
	    const mainpage =document.getElementById("mainpage");
	    div.appendChild(select);
		div.appendChild(sTime);
		div.appendChild(eTime);
		div.appendChild(subj);
		mainpage.appendChild(week);
		mainpage.appendChild(div);
}
function openModal(obj){
   let container = document.getElementById("container");
   container.style.filter = "alpha(Opacity=50)";
   container.style.display = "block";	
}
function closeModal(){
   let container = document.getElementById("container");
   container.style.display = "none";
}