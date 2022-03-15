package amaging.schedu.grade;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.ACPlan;
import amaging.schedu.bean.AcList;
import amaging.schedu.bean.ClassBean;
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
			this.getStudnet(mav);
			break;
		case 7:
			this.regClassGrade(mav);
			break;
		case 8:
			this.updGrade(mav);
			break;
		case 9:
			this.getGradePage(mav);
			break;
			
		}
	}
	
	private ModelAndView teacherGradepage(ModelAndView mav) {
		mav.setViewName("TGradePage");
		return mav;
	}
	@SuppressWarnings("unchecked")
	public ModelAndView teacherAcademy(ModelAndView mav) {
		Login lg = new Login();
		UserInfo uf = new UserInfo();
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
	public ModelAndView checkPwd(ModelAndView mav) {
		List<Subject> list = null;
		
		
		if(this.convertToBoolean(gfo.checkPwd((AcList)mav.getModelMap().getAttribute("ac")))) {
			System.out.println("true");
		mav.addObject("bcd",gfo.getTeacherClass((AcList)mav.getModelMap().getAttribute("ac")));
		list = (List<Subject>)mav.getModelMap().getAttribute("bcd");
		mav.addObject("clList",list);
		}else {
			System.out.println("false");
		mav.addObject("clList",list);	
		}
		//System.out.println(((List<ClassBean>)mav.getModelMap().getAttribute("abc")).get(0).getAcCode() + " 휴...");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	public ModelAndView teacherClass(ModelAndView mav) {
		List<Subject> list = null;
		mav.addObject("bcd",gfo.getTeacherClass((AcList)mav.getModelMap().getAttribute("ac")));
		list = (List<Subject>)mav.getModelMap().getAttribute("bcd");
		mav.addObject("clList",list);
		//System.out.println(((List<ClassBean>)mav.getModelMap().getAttribute("abc")).get(0).getAcCode() + " 휴...");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	private ModelAndView teacherGrade(ModelAndView mav) {

		List<Grade> list = null;
		
		mav.addObject("cde",gfo.getTGrade((Subject)mav.getModelMap().getAttribute("sj")));
		list = (List<Grade>)mav.getModelMap().getAttribute("cde");
		mav.addObject("gradeList",list);
		//System.out.println(((List<ClassBean>)mav.getModelMap().getAttribute("abc")).get(0).getAcCode() + " 휴...");
		return mav;
	}
	private void getStudnet(ModelAndView mav) {}
	private void regClassGrade(ModelAndView mav) {}
	private void updGrade(ModelAndView mav) {}
	private void getGradePage(ModelAndView mav) {}
	
}
