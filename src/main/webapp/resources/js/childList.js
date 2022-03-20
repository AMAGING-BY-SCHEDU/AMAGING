/**
 * 
 */

/*리스트를 ajax로 가져옴*/
	function getChildList(uId){
		const data = "userId="+ encodeURIComponent(uId)
		getAjaxData("/GetChildList", data, "childListBox","post" );
		
		
	} 
let cc;
/*가져온 리스트를 셀렉트 박스에 출력*/
	function childListBox(cList){
		cc=JSON.parse(cList);
		let sc =  document.getElementById("sCode").value
		if(sc==""){sc=cc[0].userId;}//학사일정 불러오기위한자녀코드
		let cb = document.getElementById("childBox");
		let idx = 0;
		let cbData = '<select name="childSelect" id="childSelect" onchange="childName(this)">';
		    cbData += '<option value="자녀선택">자녀선택';
		    cbData += '</option>';
		for(idx;idx<cc.length;idx++){
			cbData += '<option value="'+cc[idx].sname+'">'+cc[idx].sname;

		    cbData += '</option>';
		}
		cbData += '</select>';
		cb.innerHTML = cbData; 
		//getPlanList();
	}
	/*셀렉트박스에서 자녀 선택할경우  
	이름과 같이 가져온 이메일,학생코드를
	  히든속성의 input테그에 삽입*/
	function childName(cName){
		let idx1 =0;
	
		const value = cName.value;
		
		var cn = document.getElementById("childName");
	
		for(idx1;idx1<cc.length;idx1++){
			
			let name1 = cc[idx1].sname;

			if(name1 == value){
			document.getElementById("sEmail").value=cc[idx1].semail;
			document.getElementById("sCode").value=cc[idx1].userId;
			
			}
		}
		
		cn.innerText = value;
		
	}
	

/*부모가 학사일정에서 자녀선택시 
자녀에 맞는 학사일정을 불러오기위해 펑션을 나눔 */

/*리스트를 ajax로 가져옴*/
	function getChildList1(uId){
		const data = "userId="+ encodeURIComponent(uId)
		getAjaxData("/GetChildList", data, "childListBox1","post" );
		
		
	} 

/*가져온 리스트를 셀렉트 박스에 출력*/
	function childListBox1(cList){
		cc=JSON.parse(cList);
		let sc =  document.getElementById("sCode").value
		if(sc==""){sc=cc[0].userId;}//학사일정 불러오기위한자녀코드
		let cb = document.getElementById("childBox");
		let idx = 0;
		let cbData = '<select name="childSelect" id="childSelect" onchange="childName1(this)">';
		    cbData += '<option value="자녀선택">자녀선택';
		    cbData += '</option>';
		for(idx;idx<cc.length;idx++){
			cbData += '<option value="'+cc[idx].sname+'">'+cc[idx].sname;
		    cbData += '</option>';
		}
		cbData += '</select>';
		cb.innerHTML = cbData; 
		getPlanList();
	}
	/*셀렉트박스에서 자녀 선택할경우  
	이름과 같이 가져온 이메일,학생코드를
	  히든속성의 input테그에 삽입*/
	function childName1(cName){
		let idx1 =0;
	
		
		const value = cName.value;
		
		var cn = document.getElementById("childName");
	
		for(idx1;idx1<cc.length;idx1++){
			
			let name1 = cc[idx1].sname;

			if(name1 == value){
			document.getElementById("sEmail").value=cc[idx1].semail;
			document.getElementById("sCode").value=cc[idx1].userId;
			
			}
		}
		document.getElementById("oneB").click();
		cn.innerText = value;
		
	}
	
	
	/*학사일정 가져오기*/
 	function getPlanList(){
 		
 		let cb = document.getElementById("sCode").value;
 		if(cb==""){cb=cc[0].userId}//sCode 입력시 살펴볼필요가있다.
 		let sDate = document.getElementById("datepicker").value;
 		const data = "userId="+ encodeURIComponent(cb)+"&sDate="+encodeURIComponent(sDate.substr(0,6))
 		
		getAjaxData("/GetPlanList", data, "displayPlan","post" );
	}
	
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

