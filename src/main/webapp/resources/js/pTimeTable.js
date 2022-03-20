
function makeTable(data){
	alert("1234");
	let ab="acCode="+data;
	getAjaxData("PSClassPage",ab,"tableSelect","post")
}

function tableSelect(dt){
		alert(JSON.stringify(dt));
	let data=JSON.parse(dt);
	
	const a= document.createElement("div","a1");
	a.innerHTML=data.acCode;
	const ab=document.createElement("div","a2");
	ab.innerHTML=data.studentId;
	const abc=document.createElement("div","a3");
	abc.innerHTML=data.userName;S
	

}