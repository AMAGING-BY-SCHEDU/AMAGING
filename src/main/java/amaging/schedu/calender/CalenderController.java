package amaging.schedu.calender;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.ACPlan;
import amaging.schedu.bean.ChildCode;

@RestController
public class CalenderController {
	@Autowired
	private Calender cal;
	@SuppressWarnings("unchecked")
	@PostMapping("/GetPlanList")
	public List<ACPlan> getPlanList(ModelAndView mav, @ModelAttribute ACPlan plan) {
		cal.backController(2,mav.addObject("plan", plan));
		return (List<ACPlan>)mav.getModelMap().getAttribute("acPlan");
	}
	@PostMapping(value = "/SetPlanList", produces="text/plain; charset=utf-8")
	public String setPlanList(ModelAndView mav, @ModelAttribute ACPlan plan) {
		cal.backController(3,mav.addObject("plan", plan));
		return (String)mav.getModelMap().getAttribute("msg");
	}
	@PostMapping(value = "/UpdPlanList", produces="text/plain; charset=utf-8")
	public String updPlanList(ModelAndView mav, @ModelAttribute ACPlan plan) {
		cal.backController(4,mav.addObject("plan", plan));
		return mav.getModelMap().getAttribute("msg").toString();
	}
	@PostMapping(value = "/DelPlanList", produces="text/plain; charset=utf-8")
	public String delPlanList(ModelAndView mav, @ModelAttribute ACPlan plan) {
		cal.backController(5,mav.addObject("plan", plan));
		return mav.getModelMap().getAttribute("msg").toString();
	}
	
}
