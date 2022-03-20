package amaging.schedu.grade;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.FeeBean;

@Controller
public class GradeController {
	private Grade grade;
	@PostMapping("/myClassList")
	public ModelAndView myClassList(ModelAndView mav, @ModelAttribute FeeBean fb) {
		return mav;
	}
	
}
