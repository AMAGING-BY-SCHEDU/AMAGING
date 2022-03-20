let intCode = "";
let acCodeHidden = "";
function divide(menuCode) {
	intCode = menuCode;
}

function MyChildList() {
	const userId = document.getElementsByName("userId")[0].value;
	const data = "userId=" + userId;
	getAjaxData("myChildList",data,"childSelect","post")
}

function childSelect(dat) {
	let data = JSON.parse(dat);
	let sCode = document.getElementById("sCode").value;
	//let sCode = "S1067";
	const mainpage = document.getElementById("mainpage");
	const checkCode = "1133";
	
		
		
			let aSelect = document.createElement("select");
			aSelect.setAttribute("id", "aSelect");
			aSelect.setAttribute("onchange","childSelected(" + checkCode + "," + sCode +")");
			aSelect.style.width = "200px";
			aSelect.style.height = "40px";
			aSelect.style.borderRadius = "5px";
			aSelect.style.border = "2px solid #92acbb";
			aSelect.style.position = "relative";
			aSelect.style.left = "85%";
			aSelect.style.top = "1%";
			
			let firstOption = document.createElement("option");
				firstOption.innerHTML = "자녀 선택"
				//if(acCode == null) {
				firstOption.setAttribute("selected","selected");
				//}
				firstOption.setAttribute("disabled","disabled");
				aSelect.appendChild(firstOption);
				for(let i=0; i<data.length; i++) {
					let option = document.createElement("option");
					option.setAttribute("id",data[i].studentId);
					option.setAttribute("value",data[i].studentId);
					option.innerHTML = data[i].sname;
					if(sCode != "") {
						if (sCode == data[i].studentId) {
							option.setAttribute("selected", "selected")
							childSelected(data[i].studentId,sCode);
						}
					}
					aSelect.appendChild(option);
				}

	
	mainpage.appendChild(aSelect);
	
	
	const selectMom = document.createElement("div");
		selectMom.setAttribute("id","selectMom");
		selectMom.style.width = "250px";
		selectMom.style.height = "60px";
		selectMom.style.textAlign = "center";
		selectMom.style.position = "relative"
		selectMom.style.left = "0%";
		selectMom.style.top = "-5%";
	mainpage.appendChild(selectMom);
	//getAjaxData("myClassList",data,"classOnAc","post")
	//classOnAc(sel);
	
	//조회 - 세션에현재 저장된 acCode Selected -> Selected 된 값으로 현재 선생코드가 갖고있는 class 조회
	// -> Class select -> 해당 Class의 성적 display
	//const btnclose = document.getElementById("btn-close");
	//	btnclose.addEventListener("click", e => {
    //		exampleModal.style.display = "none"
	//	})
	
	

}

function childSelected(selectedCode,sessionCode) {
	//let acCode = selectedCode;
	const userId = document.getElementsByName("userId")[0].value;

	if(selectedCode != "1133") {
		if(selectedCode == sessionCode) {
			getMyGrade(selectedCode);
		}
	}else {
		// onchange로 접근. 선택된값 != 세션값 --> openModal else --> getAjaxData
		let aSelect = document.getElementById("aSelect");
		let sCode = aSelect.options[aSelect.selectedIndex].value;
		if(sCode != sessionCode) {
			let presentSCode = document.getElementById("sCode");
			presentSCode.setAttribute("id",sCode);
			getMyGrade(sCode);
		}else {
		
			getMyGrade(sCode);
		}
		
			//openModal에서 입력된 비밀번호 서버전송 --> 일치 --> 세션에 저장, 클래스목록 조회후 jsonData -> classOnAc()
			//								   불일치 --> message = 비밀번호가 일치하지 않습니다. or 접근권한이 없습니다.
	}
}

function getMyGrade(userId) {
	const data = "userId=" + userId;
	getAjaxData("getMyGrade",data,"displayMyGrade","post")
}

function displayMyGrade(dat) {
	let data = JSON.parse(dat);
	
			const tableMom = document.createElement("div");
			let table = document.createElement("table");
			let mTr = createTr("mTr1");
			let mTd1 = createTd("mTd1");
			let mTd2 = createTd("mTd2");
			let mTd3 = createTd("mTd3");
			let mTd4 = createTd("mTd4");
			let mTd5 = createTd("mTd5");
			mTd1.innerHTML = "학원";
			mTd2.innerHTML = "수업";
			mTd3.innerHTML = "과목";
			mTd4.innerHTML = "점수";
			mTd5.innerHTML = "반석차";
			
			mTr.appendChild(mTd1);
			mTr.appendChild(mTd2);
			mTr.appendChild(mTd3);
			mTr.appendChild(mTd4);
			mTr.appendChild(mTd5);
			
			table.appendChild(mTr);
			
			for(let i=0; i<data.length; i++) {
				let tr = createTr("tr1");
				
				let td1 = createTd("td1");
				let td2 = createTd("td2");
				let td3 = createTd("td3");
				let td4 = createTd("td4");
				let td5 = createTd("td5");
				
				td1.innerHTML = data[i].acName;
				td2.innerHTML = data[i].clName;
				td3.innerHTML = data[i].subjectName;
				td4.innerHTML = data[i].score;
				td5.innerHTML = data[i].rank + "/" + data[i].headCount;
				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				tr.appendChild(td4);
				tr.appendChild(td5);
			table.appendChild(tr);
			}
	
	
	tableMom.appendChild(table);
	const mainpage = document.getElementById("mainpage");
	mainpage.appendChild(tableMom);
	
	
					/*let data = JSON.parse(dat);
	
					const a = document.createElement("table");
					a.innerHTML = data.subjectCode;
					const ab = document.createElement("tr","a2");
					ab.innerHTML = data.subjectName;
					const abc = document.createElement("","a3");
					abc.innerHTML = data.studentId;
	
					const mainpage = document.getElementById("mainpage");
					mainpage.appendChild(a);
					mainpage.appendChild(ab);
					mainpage.appendChild(abc);*/
}

function myAcademyList(userId,menuCode) {
	const data = "teacherId=" + userId;
	divide(menuCode);
	getAjaxData("myAcademyList",data,"academySelect","post")
}

function academySelect(dat) {
	let data = JSON.parse(dat);
	let aCode = document.getElementById("acCode").value;
	const mainpage = document.getElementById("mainpage");
	const checkCode = "1133";
	
		if(!mainpage.hasChildNodes()) {
		
			let aSelect = document.createElement("select");
			aSelect.setAttribute("id", "aSelect");
			aSelect.setAttribute("onchange","makeSelected(" + checkCode + "," + aCode +")");
			aSelect.style.width = "200px";
			aSelect.style.height = "40px";
			aSelect.style.borderRadius = "5px";
			aSelect.style.border = "2px solid #92acbb";
			aSelect.style.position = "relative";
			aSelect.style.left = "85%";
			aSelect.style.top = "1%";
			
			let firstOption = document.createElement("option");
				firstOption.innerHTML = "학원 선택"
				//if(acCode == null) {
				firstOption.setAttribute("selected","selected");
				//}
				firstOption.setAttribute("disabled","disabled");
				aSelect.appendChild(firstOption);
				for(let i=0; i<data.length; i++) {
					let option = document.createElement("option");
					option.setAttribute("id",data[i].acCode);
					option.setAttribute("value",data[i].acCode);
					option.innerHTML = data[i].acName;
					if(aCode != "") {
						if (aCode == data[i].acCode) {
							option.setAttribute("selected", "selected")
							makeSelected(data[i].acCode,aCode);
						}
					}
					aSelect.appendChild(option);
				}

	
	mainpage.appendChild(aSelect);
	
	
	const selectMom = document.createElement("div");
		selectMom.setAttribute("id","selectMom");
		selectMom.style.width = "250px";
		selectMom.style.height = "60px";
		selectMom.style.textAlign = "center";
		selectMom.style.position = "relative"
		selectMom.style.left = "0%";
		selectMom.style.top = "-5%";
	mainpage.appendChild(selectMom);
	//getAjaxData("myClassList",data,"classOnAc","post")
	//classOnAc(sel);
	
	//조회 - 세션에현재 저장된 acCode Selected -> Selected 된 값으로 현재 선생코드가 갖고있는 class 조회
	// -> Class select -> 해당 Class의 성적 display
	const btnclose = document.getElementById("btn-close");
		btnclose.addEventListener("click", e => {
    		exampleModal.style.display = "none"
		})
	
	}else {
		while(mainpage.hasChildNodes()) {
			mainpage.removeChild(mainpage.firstChild);
		}
	
		
			let aSelect = document.createElement("select");
			aSelect.setAttribute("id", "aSelect");
			aSelect.setAttribute("onchange","makeSelected(" + checkCode + "," + aCode +")");
			aSelect.style.width = "200px";
			aSelect.style.height = "40px";
			aSelect.style.borderRadius = "5px";
			aSelect.style.border = "2px solid #92acbb";
			aSelect.style.position = "relative";
			aSelect.style.left = "85%";
			aSelect.style.top = "1%";
			
			let firstOption = document.createElement("option");
				firstOption.innerHTML = "학원 선택"
				//if(acCode == null) {
				firstOption.setAttribute("selected","selected");
				//}
				firstOption.setAttribute("disabled","disabled");
				aSelect.appendChild(firstOption);
				for(let i=0; i<data.length; i++) {
					let option = document.createElement("option");
					option.setAttribute("id",data[i].acCode);
					option.setAttribute("value",data[i].acCode);
					option.innerHTML = data[i].acName;
					if(aCode != "") {
						if (aCode == data[i].acCode) {
							option.setAttribute("selected", "selected")
							makeSelected(data[i].acCode,aCode);
						}
					}
					aSelect.appendChild(option);
				}

	
	mainpage.appendChild(aSelect);
	
	
	const selectMom = document.createElement("div");
		selectMom.setAttribute("id","selectMom");
		selectMom.style.width = "250px";
		selectMom.style.height = "60px";
		selectMom.style.textAlign = "center";
		selectMom.style.position = "relative"
		selectMom.style.left = "0%";
		selectMom.style.top = "-5%";
	mainpage.appendChild(selectMom);
	//getAjaxData("myClassList",data,"classOnAc","post")
	//classOnAc(sel);
	
	//조회 - 세션에현재 저장된 acCode Selected -> Selected 된 값으로 현재 선생코드가 갖고있는 class 조회
	// -> Class select -> 해당 Class의 성적 display
	const btnclose = document.getElementById("btn-close");
		btnclose.addEventListener("click", e => {
    		exampleModal.style.display = "none"
		})
	
	}
}

function makeSelected(selectedCode,sessionCode) {
	//let acCode = selectedCode;
	const userId = document.getElementsByName("userId")[0].value;

	if(selectedCode != "1133") {
		if(selectedCode == sessionCode) {

			const data = "teacherId=" + userId + "&acCode=" + selectedCode;
		
			getAjaxData("myClassList",data,"classOnAc","post");
		}
	}else {
		// onchange로 접근. 선택된값 != 세션값 --> openModal else --> getAjaxData
		let aCode = document.getElementById("aSelect");
		let acCode = aCode.options[aCode.selectedIndex].value;
		if(acCode != sessionCode) {
			openModal(acCode);
		}else {
			const data = "teacherId=" + userId + "&acCode=" + sessionCode;
		
			getAjaxData("myClassList",data,"classOnAc","post");
		}
		
			//openModal에서 입력된 비밀번호 서버전송 --> 일치 --> 세션에 저장, 클래스목록 조회후 jsonData -> classOnAc()
			//								   불일치 --> message = 비밀번호가 일치하지 않습니다. or 접근권한이 없습니다.
	}
}

function openModal(acCode) {
	const exampleModal = document.getElementById("exampleModal");
    	  exampleModal.style.display = "flex"
	const confirmBtn = document.getElementById("confirmBtn");
		  confirmBtn.setAttribute("onclick","checkPassword(" + acCode + ")");
}

function closeModal() {
	const exampleModal = document.getElementById("exampleModal");
    	  exampleModal.style.display = "none"
}

function checkPassword(acCode) {
	const userId = document.getElementsByName("userId")[0].value;
	const inputPwd = document.getElementById("inputPwd").value;
	const data = "teacherId=" + userId + "&acCode=" + acCode + "&password=" + inputPwd;
	acCodeHidden = acCode;
	getAjaxData("checkPwd",data,"classOnAc","post");
}

function classOnAc(dat) {
	const presentAcCode = document.getElementById("acCode");
	presentAcCode.setAttribute("value",acCodeHidden);
	let data = JSON.parse(dat);
	closeModal()
	const cSelect = document.getElementById("cSelect");
	
	if(!document.getElementById("cSelect")) {
		if(data != null) {
			let select = document.createElement("select");
			select.setAttribute("id","cSelect");
			//select.setAttribute("onclick", "classOnAc");
			select.style.width = "170px";
			select.style.height = "30px";
			select.style.border = "2px solid #92acbb";
			select.style.borderRadius = "5px";
			select.style.textAlign = "center";
			
				let firstOption = document.createElement("option");
				firstOption.innerHTML = "반 선택"
				firstOption.setAttribute("selected","selected");
				firstOption.setAttribute("disabled","disabled");
				select.appendChild(firstOption);
				for(let i=0; i<data.length; i++) {
					let option = document.createElement("option");
					option.setAttribute("value",data[i].clCode);
					option.innerHTML = data[i].clName;
					select.appendChild(option);
					option.style.textAlign = "center";
				}
				
				let selectMom = document.getElementById("selectMom");
					selectMom.style.width = "200px"
					selectMom.style.height = "30px";
					selectMom.style.textAlign = "center";
					selectMom.style.position = "relative"
					selectMom.style.left = "0%";
					selectMom.style.top = "-5%";
				selectMom.appendChild(select);
				
	const option = document.getElementById("cSelect");
	let sel = option.options[option.selectedIndex].value;
	select.setAttribute("onchange", "getGrade()");	
	const mainpage = document.getElementById("mainpage");
	
	mainpage.appendChild(selectMom);
	}
	}else if (document.getElementById("cSelect")) {
		while(cSelect.hasChildNodes()) {
		selectMom.removeChild(selectMom.firstChild);
		}
	if(data != null) {
			let select = document.createElement("select");
			select.setAttribute("id","cSelect");
			//select.setAttribute("onclick", "classOnAc");
			select.style.width = "170px";
			select.style.height = "30px";
			select.style.border = "2px solid #92acbb";
			select.style.borderRadius = "5px";
			select.style.textAlign = "center";
			
				let firstOption = document.createElement("option");
				firstOption.innerHTML = "반 선택"
				firstOption.setAttribute("selected","selected");
				firstOption.setAttribute("disabled","disabled");
				select.appendChild(firstOption);
				for(let i=0; i<data.length; i++) {
					let option = document.createElement("option");
					option.setAttribute("value",data[i].clCode);
					option.innerHTML = data[i].clName;
					select.appendChild(option);
					option.style.textAlign = "center";
				}
				
				let selectMom = document.getElementById("selectMom");
					selectMom.style.width = "200px"
					selectMom.style.height = "30px";
					selectMom.style.textAlign = "center";
					selectMom.style.position = "relative"
					selectMom.style.left = "0%";
					selectMom.style.top = "-5%";
				selectMom.appendChild(select);
				
	const option = document.getElementById("cSelect");
	let sel = option.options[option.selectedIndex].value;
	select.setAttribute("onchange", "getGrade()");	
	const mainpage = document.getElementById("mainpage");
	
	mainpage.appendChild(selectMom);	
	}
	}
}

function getGrade() {
	const option = document.getElementById("cSelect");
	const clCode = option.options[option.selectedIndex].value;
	const teacherId = document.getElementsByName("userId")[0].value;
	const acCode = document.getElementById("acCode").value;
	const action = (intCode == "reg")? "getStudent" : "getGrade" ;
	const fn = (intCode == "get")? "displayGrade": (intCode == "mod")? "modGradeForm" : "regGradeForm";
	let data = "teacherId=" + teacherId + "&clCode=" + clCode + "&acCode=" + "3568745688";
	getAjaxData(action,data,fn,"post");
}

function displayGrade(dat) {
	let data = JSON.parse(dat);
	
			const tableMom = document.createElement("div");
			let table = document.createElement("table");
			let mTr = createTr("mTr1");
			let mTd1 = createTd("mTd1");
			let mTd2 = createTd("mTd2");
			let mTd3 = createTd("mTd3");
			let mTd4 = createTd("mTd4");
			mTd1.innerHTML = "시험명";
			mTd2.innerHTML = "학생이름";
			mTd3.innerHTML = "점수";
			mTd4.innerHTML = "반석차";
			
			mTr.appendChild(mTd1);
			mTr.appendChild(mTd2);
			mTr.appendChild(mTd3);
			mTr.appendChild(mTd4);
			
			table.appendChild(mTr);
			
			for(let i=0; i<data.length; i++) {
				let tr = createTr("tr1");
				
				let td1 = createTd("td1");
				let td2 = createTd("td2");
				let td3 = createTd("td3");
				let td4 = createTd("td4");
				
				td1.innerHTML = data[i].subjectName
				td2.innerHTML = data[i].sname;
				td3.innerHTML = data[i].score;
				td4.innerHTML = data[i].rank + "/" + data[i].headCount;
				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				tr.appendChild(td4);
			table.appendChild(tr);
			}
	
	
	tableMom.appendChild(table);
	const mainpage = document.getElementById("mainpage");
	mainpage.appendChild(tableMom);
	
	
					/*let data = JSON.parse(dat);
	
					const a = document.createElement("table");
					a.innerHTML = data.subjectCode;
					const ab = document.createElement("tr","a2");
					ab.innerHTML = data.subjectName;
					const abc = document.createElement("","a3");
					abc.innerHTML = data.studentId;
	
					const mainpage = document.getElementById("mainpage");
					mainpage.appendChild(a);
					mainpage.appendChild(ab);
					mainpage.appendChild(abc);*/
}


function modGradeForm(dat) {
	let data = JSON.parse(dat);
	
			const tableMom = document.createElement("div");
			let table = document.createElement("table");
			table.setAttribute("id","theTable");
			let mTr = createTr("mTr1");

			let mTd1 = createTd("mTd1");
			let mTd2 = createTd("mTd2");
			let mTd3 = createTd("mTd3");
			let mTd4 = createTd("mTd4");
			mTd1.innerHTML = "시험명";
			mTd2.innerHTML = "학생이름";
			mTd3.innerHTML = "점수";
			mTd4.innerHTML = "반석차";
			
			mTr.appendChild(mTd1);
			mTr.appendChild(mTd2);
			mTr.appendChild(mTd3);
			mTr.appendChild(mTd4);
			
			table.appendChild(mTr);
			
			for(let i=0; i<data.length; i++) {
				let tr = createTr("tr1");
				let td1 = createTd(data[i].sbacode);
				let td2 = createTd(data[i].studentId);
				let td3 = createTd("td3");
				let td4 = createTd("td4");
				
				td1.innerHTML = data[i].subjectName;
				
				td2.innerHTML = data[i].sname;
				
				let mScore = document.createElement("input");
				mScore.setAttribute("type","text");
				mScore.setAttribute("value",data[i].score);
				mScore.style.textAlign = "center";
				mScore.style.width = "100px";
				mScore.style.height = "22px";
				td3.appendChild(mScore);
				
				let mRank = document.createElement("input");
				mRank.setAttribute("type","text");
				mRank.setAttribute("value",data[i].rank);
				mRank.style.width = "40px";
				mRank.style.textAlign = "center";
				mRank.style.width = "50px";
				mRank.style.height = "22px";
				td4.appendChild(mRank);
				
				let mhCount = document.createElement("input");
				mhCount.setAttribute("readonly",true);
				mhCount.setAttribute("value"," / " +data[i].headCount);
				mhCount.style.textAlign = "center";
				mhCount.style.width = "28px";
				mhCount.style.border = "none";
				mhCount.style.stroke = "none";
				td4.appendChild(mhCount);
				
				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				tr.appendChild(td4);
			table.appendChild(tr);
			}
	
			let hTr1 = document.createElement("tr");
			
			let hTd1 = document.createElement("td");
				hTd1.style.height  = "80px";
				hTd1.setAttribute("colspan",3);
			let hTd2 = document.createElement("td");
				hTd2.style.height  = "80px";
				hTd2.style.textAlign = "right";
			
			hTd2.innerHTML = "<input type = 'button' id='modBtn' value = '등록' onclick='modToJson(1)' style = 'cursor:pointer; text-align:center; width:60px; height:35px'/>";
			hTr1.appendChild(hTd1);
			hTr1.appendChild(hTd2);
			
			table.appendChild(hTr1);
			
	tableMom.appendChild(table);
	const mainpage = document.getElementById("mainpage");
	mainpage.appendChild(tableMom);
}
	
// 수정/등록시 등록버튼 onclick function
function modToJson(numb){
	alert("action값 = " + numb)
	let action = "";
	const theTable = document.getElementById("theTable");
	let gradeJson = [];
	
	for (let i=1; i<theTable.childNodes.length-1; i++ ) {
		let tr = theTable.childNodes[i];
		
		//subjectCode
			let subjectTd = tr.childNodes[0];
			let SBACodes = subjectTd.getAttribute("id");
	
		//studentId
			let studentTd = tr.childNodes[1];
			let studentIds = studentTd.getAttribute("id");
			
		//rank
			let rankTd = tr.childNodes[3];
			let ranks = rankTd.childNodes[0].value;
			
		//score
			let scoreTd = tr.childNodes[2];
			let scores = scoreTd.childNodes[0].value;
	
		
			
	gradeJson.push({sbacode:SBACodes,studentId:studentIds,score:scores,rank:ranks});
	
	}
	if(numb == 1) {
		action = "modGrade";
	}else {
		action = "regGrade";
	}
	modAjax(action,JSON.stringify(gradeJson),"sendMessage","post");
}

function regGradeForm(dat) {
	let data = JSON.parse(dat);
	
			const tableMom = document.createElement("div");
			let table = document.createElement("table");
			table.setAttribute("id","theTable");
			let mTr = createTr("mTr1");
			let mTd1 = createTd("mTd1");
			let mTd2 = createTd("mTd2");
			let mTd3 = createTd("mTd3");
			let mTd4 = createTd("mTd4");
			mTd1.innerHTML = "시험명";
			mTd2.innerHTML = "학생이름";
			mTd3.innerHTML = "점수";
			mTd4.innerHTML = "반석차";
			
			mTr.appendChild(mTd1);
			mTr.appendChild(mTd2);
			mTr.appendChild(mTd3);
			mTr.appendChild(mTd4);
			
			table.appendChild(mTr);
			
			for(let i=0; i<data.length; i++) {
				let tr = createTr("tr1");
				let td1 = createTd(data[i].sbacode);
				let td2 = createTd(data[i].studentId);
				let td3 = createTd("td3");
				let td4 = createTd("td4");
				
				td1.innerHTML = data[i].subjectName;
				
				td2.innerHTML = data[i].sname;
				
				let mScore = document.createElement("input");
				mScore.setAttribute("type","text");
				mScore.style.textAlign = "center";
				td3.appendChild(mScore);
				
				let mRank = document.createElement("input");
				mRank.setAttribute("type","text");
				mRank.style.width = "40px";
				mRank.style.textAlign = "center";
				td4.appendChild(mRank);
				
				let mhCount = document.createElement("input");
				mhCount.setAttribute("readonly",true);
				mhCount.setAttribute("value"," / " +data[i].headCount);
				mhCount.style.textAlign = "center";
				mhCount.style.width = "25px";
				mhCount.style.border = "none";
				mhCount.style.stroke = "none";
				td4.appendChild(mhCount);
				
				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				tr.appendChild(td4);
			table.appendChild(tr);
			}
	
	
			let hTr1 = document.createElement("tr");
			
			let hTd1 = document.createElement("td");
				hTd1.style.height  = "80px";
				hTd1.setAttribute("colspan",3);
			let hTd2 = document.createElement("td");
				hTd2.style.height  = "80px";
				hTd2.style.textAlign = "right";
			
			hTd2.innerHTML = "<input type = 'button' value = '등록' onclick='modToJson(2)' style = 'cursor:pointer; text-align:center; width:60px; height:35px'/>";
			hTr1.appendChild(hTd1);
			hTr1.appendChild(hTd2);
			
			table.appendChild(hTr1);
			
	
	
	//tableMom.appendChild(saveBtn);
	tableMom.appendChild(table);
	const mainpage = document.getElementById("mainpage");
	mainpage.appendChild(tableMom);
	
	
					/*let data = JSON.parse(dat);
	
					const a = document.createElement("table");
					a.innerHTML = data.subjectCode;
					const ab = document.createElement("tr","a2");
					ab.innerHTML = data.subjectName;
					const abc = document.createElement("","a3");
					abc.innerHTML = data.studentId;
	
					const mainpage = document.getElementById("mainpage");
					mainpage.appendChild(a);
					mainpage.appendChild(ab);
					mainpage.appendChild(abc);*/
}



function modAjax(action,data,fn,method){
	const ajax = new XMLHttpRequest();
		ajax.onreadystatechange = function() {
			if ( ajax.readyState== 4 && ajax.status == 200) {
				window[fn](ajax.responseText);				
			}
		};
		if(method=="get"){
			action=(data!="")?(action+"?"+data):action;
			ajax.open("get", action, true);	
			ajax.send();
		}else{
			ajax.open("post", action, true);
			ajax.setRequestHeader("Content-type","application/json");	
			ajax.send(data);
		}
}

function createTr(id) {
	const tr = document.createElement("tr");
	tr.setAttribute("id",id);
return tr;
}

function createTd(id) {
	if(id == "td1") {
	const td = document.createElement("td");
	td.setAttribute("id",id);
	td.setAttribute("rowspan",3);
	td.style.border = "2px solid #92acbb";
	td.style.borderRadius = "5px 5px 5px 5px";
	td.style.width  = "500px";
	td.style.textAlign = "center";
	}
	const td = document.createElement("td");
	td.setAttribute("id",id);
	td.style.border = "2px solid #92acbb";
	td.style.borderRadius = "5px 5px 5px 5px";
	td.style.width  = "500px";
	td.style.textAlign = "center";
return td;
}