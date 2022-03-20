package amaging.schedu.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.ChildCode;
import amaging.schedu.bean.Login;
import amaging.schedu.bean.RegMember;
import amaging.schedu.bean.UserInfo;
import amaging.schedu.db.QMLOracleMapper;
@Service
public class Authentication extends amaging.schedu.common.CommonMethod{
	@Autowired
	QMLOracleMapper om;
	public Authentication() {
		
	}

	public void backController(int jobCode, ModelAndView mav) {
		switch(jobCode) {
		case 1:
			this.moveLoginPage(mav);
			break;
		case 2:
			this.login(mav);
			break;
		case 3:
			this.logout(mav);
			break;
		case 4:
			this.join(mav);
			break;
		case 5:
			this.getChildList(mav);
			break;
		case 6:
			this.joinPage(mav);
			break;
		}
	}

	private void moveLoginPage(ModelAndView mav) {

	}

	private void login(ModelAndView mav) {
		Login lg = new Login();
		UserInfo uf = new UserInfo();
		lg = (Login) mav.getModel().get("login");
		String page = "";// 1번 page

		try {

			if (lg.getUserCode() == 3&&this.convertToBoolean(om.isTeacherEmail(lg))) {
				/*세션bean에 정보담기*/
				uf=om.getTeacherInfo(lg);
				this.om.setAccessHistory(uf);
				page = "Tmainservices";
			}else if(lg.getUserCode() == 1&&this.convertToBoolean(om.isParentsEmail(lg))){
				uf=om.getParentInfo(lg);
				this.om.setAccessHistory(uf);
				page = "Pmainservices";
			}else if(lg.getUserCode() == 2&&this.convertToBoolean(om.isStudentEmail(lg))){
				uf=om.getStudentInfo(lg);
				this.om.setAccessHistory(uf);
				page = "Smainservices";
			}else if(lg.getUserCode() == 4&&this.convertToBoolean(om.isAdminCode(lg))) {
				uf=om.getAdminInfo(lg);
				this.om.setAdminAccessHistory(uf);
				page = "Amainservices";
			}

			pu.setAttribute("sessionInfo", uf);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName(page);
	   }
	
	private void logout(ModelAndView mav) {
		
		UserInfo uf = new UserInfo();
		uf = (UserInfo) mav.getModelMap().getAttribute("uf");
		String page = "";
		try {
			if(uf.getUserCode()==4) {
				this.om.setAdminAccessOutHistory(uf);
				page="aLoginPage";
			}else if(uf.getUserCode()==1) {
				this.om.setAccessOutHistory(uf);
				page="pLoginPage";
			}else if(uf.getUserCode()==2) {
				this.om.setAccessOutHistory(uf);
				page="sLoginPage";
			}else if(uf.getUserCode()==3) {
				this.om.setAccessOutHistory(uf);
				page="tLoginPage";
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pu.removeAttribute("sessionInfo");
				mav.getModel().remove("msg");
				mav.getModel().remove("accessInfo");
			}catch (Exception e) {e.printStackTrace();}
		}
		
	mav.setViewName(page);
	}
	private void joinPage(ModelAndView mav) {
		Login lg = new Login();
		lg = (Login) mav.getModel().get("login");
	
	    try {
	    	mav.addObject("accessInfo", lg);
			pu.setAttribute("sessionInfo", mav.getModelMap().getAttribute("accessInfo"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void join(ModelAndView mav) {
		RegMember rm = new RegMember();
		rm=(RegMember)mav.getModel().get("rm");
		String page = "";
		String message ="";
		boolean tran=false;
		//PROPAGATION, ISOLATION설정
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, 
				TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		
		if(rm.getUserCode()==1) {
			// *PR 테이블에 데이터 Ins
				if(this.convertToBoolean(this.om.setParentsData(rm))) {
					page="pLoginPage";
					message="회원등록 성공";
					tran =true;
				}
		}else if(rm.getUserCode()==2) {
			// *st 테이블에 데이터 Ins
			if(this.convertToBoolean(this.om.setStudentData(rm))) {
				page="sLoginPage";
				message="회원등록 성공";
				tran =true;
			}
	}else if(rm.getUserCode()==3) {
		// *st 테이블에 데이터 Ins
		if(this.convertToBoolean(this.om.setTeacherData(rm))) {
			page="tLoginPage";
			message="회원등록 성공";
			tran =true;
		}
	}else{tran=false;}
		// Commit;
		this.setTransactionEnd(tran);
		mav.getModelMap().addAttribute("msg", message);
		mav.setViewName(page);
	}
	private void getChildList(ModelAndView mav) {
		ChildCode cc = new ChildCode();
		cc=(ChildCode)mav.getModel().get("cc");
		mav.addObject("ChildList", this.om.displayChildList(cc));
	}
	
}
