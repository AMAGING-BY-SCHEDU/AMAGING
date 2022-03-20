
/*선생님, 학생, 학부모 */
function authentication(userCode){
 
   const userData = [document.getElementsByName("email")[0],
   document.getElementsByName("password")[0]];
   
   const message = [ "email 입력해 주세요!", "퍠스워드 입력해 주세요"];
   for (let index = 0; index < userData.length; index++) {
      if (!isEmpty(userData[index])) {
         alert(message[index]);
         return;
      } 
   
   }
   getPage("login","/Login");

}

function getPage(formName,action){
	   const form = document.getElementsByName(formName)[0];
	      form.setAttribute("action",action);
	      form.submit();
	   
	}
	
function isEmpty(obj){
   let check = true;
   if(obj.value == ""){
      check = false;
   }
   return check;
}

/*관리자 */
function authentication1(userCode){

  
   const userData = [document.getElementsByName("adCode")[0],
	   document.getElementsByName("password")[0]];
   
   const message = [ "아이디 입력해 주세요!", "퍠스워드 입력해 주세요"];
   for (let index = 0; index < userData.length; index++) {
      if (!isEmpty(userData[index])) {
         alert(message[index]);
         return;
      } 
   
   }

   getPage("login","/Login");
}

/*회원가입페이지 이동*/
function getJoinPage(uc) {
   const f =  makeForm("","/JoinPage","get");	
   const hidden = makeInputElement("hidden","userCode",uc,"");
   f.appendChild(hidden);
   document.body.appendChild(f);
   f.submit();
}


