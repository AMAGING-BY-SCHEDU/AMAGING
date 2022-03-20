/**
 학사일정 
 */
function getAcPlanPage(formName,action){

		   const form = document.getElementsByName(formName)[0];
	      form.setAttribute("action",action);
	      form.submit();
}

	
	/*학사일정 가져오기*/
 	function getPlanList(){
 		
 		let cb = document.getElementById("sCode").value;
 		if(cb==""){cb=cc[0].userId}//sCode 입력시 살펴볼필요가있다.
 		let sDate = document.getElementById("datepicker").value;
 		const data = "userId="+ encodeURIComponent(cb)+"&sDate="+encodeURIComponent(sDate.substr(0,6));
 		
		getAjaxData("/GetPlanList", data, "displayPlan","post" );
	}
	
	/*선생님학생학사일정 가져오기*/
	 	function getTSPlanList(uId){
 	
 		let sDate = document.getElementById("datepicker").value;
 		const data = "userId="+ encodeURIComponent(uId)+"&sDate="+encodeURIComponent(sDate.substr(0,6));
 		
		getAjaxData("/GetPlanList", data, "displayPlan","post" );
	}
	
	/*관리자학사일정 가져오기*/
	 	function getAPlanList(){
 		let uId = document.getElementsByName("userId")[0].value;
		let ac = document.getElementsByName("acCode")[0].value;
 		let sDate = document.getElementById("datepicker").value;
 		const data = "userId="+ encodeURIComponent(uId)+"&acCode="+ encodeURIComponent(ac)+"&sDate="+encodeURIComponent(sDate.substr(0,6));
 		
		getAjaxData("/GetPlanList", data, "displayPlan","post" );
	}
	/*학사일정 내용표시 */
	function displayPlan(plan) {
		let ap = JSON.parse(plan);
		
		const list = document.getElementById("acPlanList");
		let idx = 0;
		let plandata = '<br><span id = acp >';
		
		for(idx;idx<ap.length;idx++){
		    
		    plandata += '■'+ap[idx].sdate.substr(-2)+'일'; 
		    if(ap[idx].sdate!=ap[idx].edate){
		    plandata += ' ~ ' + ap[idx].edate.substr(-2)+'일';
		    }
		    plandata += ' [' + ap[idx].acName+'] ' + ': ' + ap[idx].contents+'<br>';
		   
		}
		 plandata +='</span>';
			list.innerHTML=plandata;
	}
	
	/*학사일정 등록 */
	function setPlanList(ac){
		let s = document.getElementById("sd").value;
		let sd = new Date(s);
		let e = document.getElementById("ed").value;
		let ed = new Date(e);
		const sDate = s.substr(0,4)+s.substr(5,2)+s.substr(8,2);
		
		const eDate = e.substr(0,4)+e.substr(5,2)+e.substr(8,2);
		if(sd<=ed){
		let contents = document.getElementById("contents").value;
 		const data = "contents="+ encodeURIComponent(contents)+"&acCode="+ encodeURIComponent(ac)+"&sDate="+encodeURIComponent(sDate)
					 +"&eDate="+encodeURIComponent(eDate);
 		
		getAjaxData("/SetPlanList", data, "sendMessage1","post" );
		}else{
			sendMessage("종료일은 시작일보다 과거일수 없습니다.");
			document.getElementById("sd").value="";
			document.getElementById("ed").value="";
		}
	document.getElementById("acPlanList").innerHTML="";	
	document.getElementById("oneB").click();
	}
	
	/*학사일정 수정 */
	function updPlanList(ac){
		let s = document.getElementById("sd").value;
		let sd = new Date(s);
		let e = document.getElementById("ed").value;
		let ed = new Date(e);
		const sDate = s.substr(0,4)+s.substr(5,2)+s.substr(8,2);
		
		const eDate = e.substr(0,4)+e.substr(5,2)+e.substr(8,2);
		if(sd<=ed){
		let contents = document.getElementById("contents").value;
 		const data = "contents="+ encodeURIComponent(contents)+"&acCode="+ encodeURIComponent(ac)+"&sDate="+encodeURIComponent(sDate)
					 +"&eDate="+encodeURIComponent(eDate);
 		
		getAjaxData("/UpdPlanList", data, "sendMessage1","post" );
		}else{
			sendMessage("종료일은 시작일보다 과거일수 없습니다.");
			document.getElementById("sd").value="";
			document.getElementById("ed").value="";
		}
	document.getElementById("acPlanList").innerHTML="";	

	}
	
		/*학사일정 삭제  */
	function delPlanList(ac){
		let s = document.getElementById("sd").value;
		let sd = new Date(s);
		let e = document.getElementById("ed").value;
		let ed = new Date(e);
		const sDate = s.substr(0,4)+s.substr(5,2)+s.substr(8,2);
		
		const eDate = e.substr(0,4)+e.substr(5,2)+e.substr(8,2);
		if(sd<=ed){
	
 		const data ="acCode="+ encodeURIComponent(ac)+"&sDate="+encodeURIComponent(sDate)
					 +"&eDate="+encodeURIComponent(eDate);
 		
		getAjaxData("/DelPlanList", data, "sendMessage1","post" );
		}else{
			sendMessage("종료일은 시작일보다 과거일수 없습니다.");
			document.getElementById("sd").value="";
			document.getElementById("ed").value="";
		}
	document.getElementById("acPlanList").innerHTML="";	
	document.getElementById("oneB").click();
	}

function sendMessage1(message){
	let m =JSON.stringify(message);
		alert(m);
}
