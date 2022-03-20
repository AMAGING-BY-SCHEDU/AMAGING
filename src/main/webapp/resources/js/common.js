 function isEmpty(obj){
	 let check= true;
	 if(obj.value==""){
		 check=false;
	 }
	 return check;
}
function makeForm(fname, faction, fmethod){
	const form = document.createElement("form");
	if(fname != ""){form.setAttribute("name", fname);}
	form.setAttribute("action", faction);
	form.setAttribute("method", fmethod);
	return form;
}

function makeInputElement(type, name, value, placeholder){
	const input = document.createElement("input");
	input.setAttribute("type", type);
	input.setAttribute("name", name);
	if(value != ""){input.setAttribute("value", value);}
	if(placeholder != ""){input.setAttribute("placeholder", placeholder);}
	
	return input;
}
function getAjaxData(action,data,fn,method){
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
			ajax.setRequestHeader("Content-type","application/x-www-form-urlencoded; charset=utf-8");	
			ajax.send(data);
		}
		
}

function sendMessage(message){
	if(message!=""){
	alert(message);
	} 
}
function accessOut(){
      const form = makeForm("", "/Logout", "post");
      const uId = document.getElementsByName("userId")[0].value;
      const uc = document.getElementsByName("userCode")[0].value;
      
      const userId = makeInputElement("hidden", "userId", uId, "");
      const userCode = makeInputElement("hidden", "userCode", uc, "");
      
      form.appendChild(userId);
      form.appendChild(userCode);
      
      document.body.appendChild(form);
       form.submit();
    
}
function getPage(formName,action){
   const form = document.getElementsByName(formName)[0];
      form.setAttribute("action",action);
      form.submit();  
}
function accessAdminOut(){
		const form = makeForm("", "/Logout", "post");
		const uId = document.getElementsByName("userId")[0].value;
		const uc = document.getElementsByName("userCode")[0].value;
		const ac = document.getElementsByName("acCode")[0].value;
		const userId = makeInputElement("hidden", "userId", uId, "");
		const userCode = makeInputElement("hidden", "userCode", uc, "");
		const acCode = makeInputElement("hidden", "acCode", ac, "");	
		form.appendChild(userId);
		form.appendChild(userCode);
		form.appendChild(acCode);
		document.body.appendChild(form);
	    form.submit();   
}

function findPassword(formName) {
	const form = document.getElementsByName(formName)[0];
	/* input개체에 대한 값의 유효성 체크 */
	form.submit();
}
