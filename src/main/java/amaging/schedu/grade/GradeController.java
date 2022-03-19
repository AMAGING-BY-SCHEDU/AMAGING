package amaging.schedu.grade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.ACPlan;
import amaging.schedu.bean.AcList;
import amaging.schedu.bean.ClassBean;
import amaging.schedu.bean.GradeBean;
import amaging.schedu.bean.Subject;
import amaging.schedu.bean.UserInfo;

@RestController
public class GradeController {
	
	@Autowired
	private Grade grade;
	
	@SuppressWarnings("unchecked")
	@PostMapping("/myAcademyList")
	public List<ACPlan> myAcademyList(ModelAndView mav, @ModelAttribute AcList ac) {
		mav.getModelMap().addAttribute("ac",ac);
		this.grade.backController(2, mav);
		return (List<ACPlan>)mav.getModelMap().getAttribute("acList");
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/checkPwd", produces = "application/json; charset=UTF-8")
	public List<ACPlan> checkPwd(ModelAndView mav, @ModelAttribute AcList ac) {
		
		mav.getModelMap().addAttribute("ac",ac);
		this.grade.backController(3, mav);
		return (List<ACPlan>)mav.getModelMap().getAttribute("clList");
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/myClassList", produces = "application/json; charset=UTF-8")
	public List<ACPlan> myClassList(ModelAndView mav, @ModelAttribute AcList ac) {
		
		mav.getModelMap().addAttribute("ac",ac);
		this.grade.backController(4, mav);
		return (List<ACPlan>)mav.getModelMap().getAttribute("clList");
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/getGrade", produces = "application/json; charset=UTF-8")
	public List<Grade> getGrade(ModelAndView mav, @ModelAttribute Subject sj) {
		
		mav.getModelMap().addAttribute("sj",sj);
		this.grade.backController(5, mav);
		return (List<Grade>)mav.getModelMap().getAttribute("gradeList");
	}
	
	@PostMapping(value = "/modGrade", consumes="application/json", produces = "application/json; charset=UTF-8")
	public String modGrade(ModelAndView mav, @RequestBody List<GradeBean> gr) {
		
		mav.getModelMap().addAttribute("gr",gr);
		this.grade.backController(6, mav);
		return (String)mav.getModelMap().getAttribute("msg");
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/getStudent", produces = "application/json; charset=UTF-8")
	public List<Grade> getStudentList(ModelAndView mav, @ModelAttribute Subject sj) {
		
		mav.getModelMap().addAttribute("sj",sj);
		this.grade.backController(7, mav);
		return (List<Grade>)mav.getModelMap().getAttribute("regGradeList");
	}
	
	@PostMapping(value = "/regGrade", consumes="application/json", produces = "application/json; charset=UTF-8")
	public String regGrade(ModelAndView mav, @RequestBody List<GradeBean> gr) {
		
		mav.getModelMap().addAttribute("gr",gr);
		this.grade.backController(8, mav);
		return (String)mav.getModelMap().getAttribute("msg");
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/getMyGrade", produces = "application/json; charset=UTF-8")
	public List<Grade> getMyGrade(ModelAndView mav, @ModelAttribute UserInfo ui) {
		System.out.println(" 학생/학부모 getGrade " + ui.getStudentId());
		
		mav.getModelMap().addAttribute("ui",ui);
		this.grade.backController(10, mav);
		return (List<Grade>)mav.getModelMap().getAttribute("gradeList");
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping("/myChildList")
	public List<ACPlan> myChildList(ModelAndView mav, @ModelAttribute UserInfo ui) {
		System.out.println("CONTROLLER" + ui.getUserId());
		mav.getModelMap().addAttribute("ui",ui);
		this.grade.backController(11, mav);
		return (List<ACPlan>)mav.getModelMap().getAttribute("childList");
	}
	
}
