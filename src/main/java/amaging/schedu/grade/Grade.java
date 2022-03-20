package amaging.schedu.grade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.ACPlan;
import amaging.schedu.bean.AcList;
import amaging.schedu.bean.GradeBean;
import amaging.schedu.bean.Login;
import amaging.schedu.bean.Subject;
import amaging.schedu.bean.UserInfo;
import amaging.schedu.db.GFOracleMapper;
import amaging.schedu.db.QMLOracleMapper;

@Service
public class Grade extends amaging.schedu.common.CommonMethod{
	@Autowired
	GFOracleMapper gfo;
	@Autowired
	QMLOracleMapper om;
	public Grade() {}
	public void backController(int jobCode, ModelAndView mav) {
		switch(jobCode) {
		case 1:
			this.teacherGradepage(mav);
			break;
		case 2:
			this.teacherAcademy(mav);
			break;
		case 3:
			this.checkPwd(mav);
			break;
		case 4:
			this.teacherClass(mav);
			break;
		case 5:
			this.teacherGrade(mav);
			break;
		case 6:
			this.updGrade(mav);
			break;
		case 7:
			this.getStudent(mav);
			break;
		case 8:
			this.regClassGrade(mav);
			break;
		case 9:
			this.getGradePage(mav);
			break;
		case 10:
			this.getGrade(mav);
			break;
		case 11:
			this.getChildList(mav);
			break;
			
		}
	}
	
	@SuppressWarnings("unchecked")
	private ModelAndView getChildList(ModelAndView mav) {
		System.out.println("service");
		List<GradeBean> list = null;
		mav.addObject("efg",gfo.getMyChilds((UserInfo)mav.getModelMap().getAttribute("ui")));
		list = (List<GradeBean>)mav.getModelMap().getAttribute("efg");
		mav.addObject("childList",list);
		return mav;
	}
	
	private ModelAndView getGradePage(ModelAndView mav) {
		UserInfo uf = (UserInfo)mav.getModelMap().getAttribute("uf");
		if(uf.getUserCode()==1) {
			mav.setViewName("PGradePage");
		} else if(uf.getUserCode()==2) {
			mav.setViewName("SGradePage");
		}
		return mav;
	}
	
	private ModelAndView teacherGradepage(ModelAndView mav) {
		mav.setViewName("TGradePage");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	private ModelAndView teacherAcademy(ModelAndView mav) {
		List<ACPlan> list = null;
		mav.addObject("abc",gfo.getTeacherAcademy((AcList)mav.getModelMap().getAttribute("ac")));
		list = (List<ACPlan>)mav.getModelMap().getAttribute("abc");
		mav.addObject("acList",list);
		
//		uf=om.getTeacherInfo(lg);
//		mav.addObject("accessInfo", uf);
//		try {
//			pu.setAttribute("sessionInfo", mav.getModel().get("accessInfo"));
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		if (lg.getUserCode() == this.convertToBoolean(om.isTeacherEmail(lg))) {
//            /*세션bean에 정보담기*/
//            uf=om.getTeacherInfo(lg);
//            this.om.setAccessHistory(uf);
//            mav.addObject("accessInfo", uf);		
//        }
//		pu.setAttribute("sessionInfo", mav.getModel().get("accessInfo"));
		
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	private ModelAndView checkPwd(ModelAndView mav) {
		List<Subject> list = null;
		
		
		if(this.convertToBoolean(gfo.checkPwd((AcList)mav.getModelMap().getAttribute("ac")))) {
		mav.addObject("bcd",gfo.getTeacherClass((AcList)mav.getModelMap().getAttribute("ac")));
		list = (List<Subject>)mav.getModelMap().getAttribute("bcd");
		mav.addObject("clList",list);
		}else {
		mav.addObject("msg","비밀번호가 일치하지 않습니다.");
		}
		//System.out.println(((List<ClassBean>)mav.getModelMap().getAttribute("abc")).get(0).getAcCode() + " 휴...");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	private ModelAndView teacherClass(ModelAndView mav) {
		List<Subject> list = null;
		mav.addObject("bcd",gfo.getTeacherClass((AcList)mav.getModelMap().getAttribute("ac")));
		list = (List<Subject>)mav.getModelMap().getAttribute("bcd");
		mav.addObject("clList",list);
		//System.out.println(((List<ClassBean>)mav.getModelMap().getAttribute("abc")).get(0).getAcCode() + " 휴...");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	private ModelAndView teacherGrade(ModelAndView mav) {

		List<GradeBean> list = null;
		
		mav.addObject("cde",gfo.getTGrade((Subject)mav.getModelMap().getAttribute("sj")));
		list = (List<GradeBean>)mav.getModelMap().getAttribute("cde");
		System.out.println(((List<GradeBean>)mav.getModelMap().getAttribute("cde")).get(0));
		mav.addObject("gradeList",list);
		//System.out.println(((List<ClassBean>)mav.getModelMap().getAttribute("abc")).get(0).getAcCode() + " 휴...");
		return mav;
	}

	@SuppressWarnings("unchecked")
	private ModelAndView getGrade(ModelAndView mav) {

		List<GradeBean> list = null;
		
		mav.addObject("def",gfo.getGrade((UserInfo)mav.getModelMap().getAttribute("ui")));
		System.out.println(gfo.getGrade((UserInfo)mav.getModelMap().getAttribute("ui")));
		list = (List<GradeBean>)mav.getModelMap().getAttribute("def");
		mav.addObject("gradeList",list);
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	private ModelAndView updGrade(ModelAndView mav) {
		boolean tran = false;
		String message = null;
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		
		List<GradeBean> gList = (List<GradeBean>)mav.getModelMap().getAttribute("gr");
		for(int i=0; i<gList.size(); i++) {
			if(this.convertToBoolean(gfo.modGrade(gList.get(i)))) {
				tran = true;
			}else {
				tran = false;
			}
		}
		
		message = (tran=true)? "gradeFirst:수정 완료" : "gradeThird:수정 실패. 다시 시도해주세요.";
		
		this.setTransactionEnd(tran);
		mav.addObject("msg",message);
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	private ModelAndView regClassGrade(ModelAndView mav) {
		boolean tran = false;
		String message = null;
		
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		
		List<GradeBean> gList = (List<GradeBean>)mav.getModelMap().getAttribute("gr");
		for(int i=0; i<gList.size(); i++) {
			if(this.convertToBoolean(gfo.regGrade(gList.get(i)))) {
				tran = true;
			}else {
				tran = false;
			}
		}
		
		message = (tran=true)? "gradeFirst:등록 완료" : "gradeSecond:등록 실패. 다시 시도해주세요.";
		
		this.setTransactionEnd(tran);
		mav.addObject("msg",message);
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	private ModelAndView getStudent(ModelAndView mav) {
		List<Grade> list = null;
		
		mav.addObject("def",gfo.getStudentList((Subject)mav.getModelMap().getAttribute("sj")));
		list = (List<Grade>)mav.getModelMap().getAttribute("def");
		System.out.println(((List<Grade>)mav.getModelMap().getAttribute("def")).get(0));
		mav.addObject("regGradeList",list);
		//System.out.println(((List<ClassBean>)mav.getModelMap().getAttribute("abc")).get(0).getAcCode() + " 휴...");
		return mav;
	}
	
}
