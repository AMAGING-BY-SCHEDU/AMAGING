package amaging.schedu.attendance;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.AcList;
import amaging.schedu.bean.AttendanceBean;
import amaging.schedu.bean.Subject;
import amaging.schedu.bean.UserInfo;
import amaging.schedu.db.ASOracleMapper;
import amaging.schedu.db.QMLOracleMapper;

@Service
public class Attendance extends amaging.schedu.common.CommonMethod{
	@Autowired
	QMLOracleMapper om;
	@Autowired
	ASOracleMapper am;
  public Attendance() {}
  public void backController(int jobCode, ModelAndView mav) {
	  switch(jobCode) {
	  case 1:
		  this.getArticleForm(mav);
		  break;	  
	  }
  }

	public void aBackController(int jobCode, Model model) {
		switch (jobCode) {
		case 2:
			this.getASchoolList(model);
			break;
		case 3:
			this.getClassList(model);
			break;
		case 4:
			this.secondLogin(model);
			break;
		case 5:
			this.studentList(model);
			break;
		case 6:
			this.studentAttendanceF(model);
			break;
		case 7:
			this.checkStudentA(model);
			break;
		case 8:
			this.modSAttendance(model);
			break;
		case 9:
			this.recheckSA(model);
			break;
		}
	}
	private void recheckSA(Model model) {
		model.addAttribute("rcStudent",am.getRcAForm((Subject)model.getAttribute("sj")));
	}
	@SuppressWarnings("unchecked")
	private void modSAttendance(Model model) {
		String message = null;
		boolean tran =false;
		List<AttendanceBean> ab = new ArrayList<>();
		ab = (List<AttendanceBean>) model.getAttribute("ab");
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		for (int idx = 0; idx < ab.size(); idx++) {
			if(this.convertToBoolean(am.upSA(ab.get(idx)))){
				message = ab.get(0).getDate();
				tran = true;
			}
		}
		this.setTransactionEnd(tran);
		model.addAttribute("meg", message);
	}
	private void checkStudentA(Model model) {
		model.addAttribute("cStudent",am.getAForm((Subject)model.getAttribute("sj")));
	}
	@SuppressWarnings("unchecked")
	private void studentAttendanceF(Model model) {
		String message = null;
		boolean tran =false;
		List<AttendanceBean> ab = new ArrayList<>();
		ab = (List<AttendanceBean>) model.getAttribute("ab");
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		for (int idx = 0; idx < ab.size(); idx++) {
			if(this.convertToBoolean(am.insSA(ab.get(idx)))){
				message = "success";
				tran = true;
			}
		}
		this.setTransactionEnd(tran);
		model.addAttribute("meg", message);
	}
	private void studentList(Model model) {
		model.addAttribute("studentList",am.getStudentList((Subject)model.getAttribute("sj")));
	}
	private void secondLogin(Model model) {
		String message = null;
		boolean tran =false;
		AcList al = new AcList();
		al = (AcList)model.getAttribute("al");
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		if(this.convertToBoolean(am.checkPwd(al))){
			am.checkSL(al);
			message = "success";
			tran =true;
		}else {
			message = "fail";
		}
		this.setTransactionEnd(tran);
		model.addAttribute("meg",message);
	}
	private void getClassList(Model model) {
		model.addAttribute("classList",am.getClassList((AcList)model.getAttribute("al")));
		
	}
	private void getASchoolList(Model model) {
		model.addAttribute("schoolList",am.getSchoolList((UserInfo)model.getAttribute("uf")));
		
	}

	private void getArticleForm(ModelAndView mav) {
		UserInfo uf = new UserInfo();
		uf = (UserInfo) mav.getModel().get("uf");
		String page = "";
		try {
			page = "TGetAttendanceList";

		} catch (Exception e) {
			e.printStackTrace();
		}

		mav.setViewName(page);
	}
}
