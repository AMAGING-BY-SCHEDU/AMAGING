/*let intCode = "";

function divide(menuCode) {
	intCode = menuCode;
}*/

function myAcademyList(userId) {
	//alert(menuCode);
	const data = "teacherId=" + userId;
	//divide(menuCode);
	getAjaxData("myAcademyList",data,"academySelect","post")
}

function academySelect(data) {
	let aCode = document.getElementById("acCode").value;
	const mainpage = document.getElementById("mainpage");
	const checkCode = "1133";
	alert(aCode);
	
		if(!mainpage.hasChildNodes()) {
		
			let aSelect = document.createElement("select");
			aSelect.setAttribute("id", "aSelect");
			//let sGetOut = document.getElementById("aSelect").value;
			//alert(sGetOut);
			aSelect.setAttribute("onchange","makeSelected(" + checkCode + "," + aCode +")");
			//aSelect.options[aSelect.selectedIndex].value
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
			//let sGetOut = document.getElementById("aSelect").value;
			//alert(sGetOut);
			aSelect.setAttribute("onchange","makeSelected(" + checkCode + "," + aCode +")");
			//aSelect.options[aSelect.selectedIndex].value
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
	const userId = document.getElementById("userId").value;

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
	const userId = document.getElementById("userId").value;
	const inputPwd = document.getElementById("inputPwd").value;
	alert(inputPwd + "  :  " + userId + "  :  " + acCode);
	const data = "teacherId=" + userId + "&acCode=" + acCode + "&password=" + inputPwd;
	getAjaxData("checkPwd",data,"classOnAc","post");
}

/*function onChangeF(data) {
	
	const option = document.getElementById("cSelect");
	let select = option.options[option.selectedIndex].value = data;
	const selectMom = document.getElementById("selectMom");
	
		if(!selectMom.hasChildNodes()) {
			alert("hasNoChild");
			classOnAc(select);
		}else {
			alert("hasChild");
			while(selectMom.hasChildNodes()) {
			selectMom.removeChild(selectMom.firstChild);
			}
		classOnAc(select);
		}
	//option.setattribute("selected",select);
}*/

function classOnAc(data) {
	closeModal()
	// Parameter aCode => jsonData
	//alert(dat[0].acCode);
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
	const teacherId = document.getElementById("userId").value;
	const acCode = document.getElementById("acCode").value;
	let data = "teacherId=" + teacherId + "&clCode=" + clCode + "&acCode=" + "3568745688";
	getAjaxData("getGrade",data,"displayGrade","post");
}

function displayGrade(data) {
	alert(data[0].sname + " : " + data[0].headCount);
	
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