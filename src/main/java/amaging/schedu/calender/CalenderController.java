package amaging.schedu.calender;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalenderController {
	private Calender cal;
	
	@PostMapping("/GetPlanList")
	public ModelAndView getPlanList(ModelAndView mav) {
		return mav;
	}
	@PostMapping("/SetPlanList")
	public ModelAndView setPlanList(ModelAndView mav) {
		return mav;
	}
	@PostMapping("/UpdPlanList")
	public ModelAndView updPlanList(ModelAndView mav) {
		return mav;
	}
	@PostMapping("/DelPlanList")
	public ModelAndView delPlanList(ModelAndView mav) {
		return mav;
	}
	
}
