package amaging.schedu.grade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.ACPlan;
import amaging.schedu.bean.AcList;
import amaging.schedu.bean.ClassBean;
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
		System.out.println(ac.getTeacherId() + " 12");
		System.out.println(ac.getAcCode() + " 22");
		
		mav.getModelMap().addAttribute("ac",ac);
		this.grade.backController(3, mav);
		return (List<ACPlan>)mav.getModelMap().getAttribute("clList");
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/myClassList", produces = "application/json; charset=UTF-8")
	public List<ACPlan> myClassList(ModelAndView mav, @ModelAttribute AcList ac) {
		System.out.println(ac.getTeacherId() + " 11");
		System.out.println(ac.getAcCode() + " 21");
		
		mav.getModelMap().addAttribute("ac",ac);
		this.grade.backController(4, mav);
		return (List<ACPlan>)mav.getModelMap().getAttribute("clList");
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/getGrade", produces = "application/json; charset=UTF-8")
	public List<Grade> getGrade(ModelAndView mav, @ModelAttribute Subject sj) {
		System.out.println(sj.getTeacherId() + " 12");
		System.out.println(sj.getClCode() + " 22");
		System.out.println(sj.getAcCode() + " 32");
		
		mav.getModelMap().addAttribute("sj",sj);
		this.grade.backController(5, mav);
		return (List<Grade>)mav.getModelMap().getAttribute("gradeList");
	}
	
	
	
}
