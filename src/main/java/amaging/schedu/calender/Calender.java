package amaging.schedu.calender;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.ACPlan;
import amaging.schedu.bean.Login;
import amaging.schedu.bean.UserInfo;
import amaging.schedu.db.QMLOracleMapper;

@Service
public class Calender extends amaging.schedu.common.CommonMethod{
	@Autowired
	QMLOracleMapper om;
	public Calender() {}
	
	public void backController(int jobCode, ModelAndView mav) {
		switch(jobCode) {
		case 1:
			this.acPlanPage(mav);
			break;
		case 2:
			this.getPlanList(mav);
			break;
		case 3:
			this.setPlanList(mav);
			break;
		case 4:
			this.updPlanList(mav);
			break;
		case 5:
			this.delPlanList(mav);
			break;
		}
	}

	private void acPlanPage(ModelAndView mav) {
		UserInfo uf = new UserInfo();
		uf = (UserInfo) mav.getModel().get("uf");
		String page = "";

		try {
			if (uf.getUserCode() == 3) {

				page = "TAcPlanPage";
			} else if (uf.getUserCode() == 1) {

				page = "PAcPlanPage";
			} else if (uf.getUserCode() == 2) {

				page = "SAcPlanPage";
			} else if (uf.getUserCode() == 4) {

				page = "AAcPlanPage";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		mav.setViewName(page);
	}

	private void getPlanList(ModelAndView mav) {
		ACPlan plan = (ACPlan)mav.getModel().get("plan");
		List<ACPlan> pl=null;
		List<ACPlan> ap=null;
		if(plan.getUserId().substring(0,1).toUpperCase().equals("P")) {
		pl =this.om.getAcList(plan);//해당자녀의 학원리스트
		ap = this.om.getPlanList(pl);//해당자녀 학원들의 학사일정
		}else if(plan.getUserId().substring(0,1).toUpperCase().equals("T")) {
			pl =this.om.getTeacherAcList(plan);//선생님의 학원리스트
			ap = this.om.getPlanList(pl);//선생님 학원들의 학사일정
		}else if(plan.getUserId().substring(0,1).toUpperCase().equals("S")) {
			System.out.println(plan);
			pl =this.om.getStudentAcList(plan);//학생의 학원리스트
			
			ap = this.om.getPlanList(pl);//학생 학원들의 학사일정
		}else {
			ap = this.om.getAPlanList(plan);//관리자 학원의 학사일정
		}
		mav.addObject("acPlan", ap);
	}
	
	private void setPlanList(ModelAndView mav) {
		ACPlan plan = (ACPlan)mav.getModel().get("plan");
		boolean tran=false;
		String message ="";
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, 
				TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		if(this.convertToBoolean(this.om.setPlanList(plan))) {
			tran=true;
			message="학사일정 등록성공";
		}
		this.setTransactionEnd(tran);
		mav.getModelMap().addAttribute("msg", message);
		
	}
	private void updPlanList(ModelAndView mav) {
		
		ACPlan plan = (ACPlan)mav.getModel().get("plan");
		boolean tran=false;
		String message ="";
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, 
				TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		if(this.convertToBoolean(this.om.updPlanList(plan))) {
			tran=true;
			message="학사일정 수정성공";
		}
		this.setTransactionEnd(tran);
		mav.getModelMap().addAttribute("msg", message);
	}
	private void delPlanList(ModelAndView mav) {
		ACPlan plan = (ACPlan)mav.getModel().get("plan");
		boolean tran=false;
		String message ="";
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, 
				TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		if(this.convertToBoolean(this.om.delPlanList(plan))) {
			tran=true;
			message="학사일정 삭제성공";
		}
		this.setTransactionEnd(tran);
		mav.getModelMap().addAttribute("msg", message);
	}
	
}
