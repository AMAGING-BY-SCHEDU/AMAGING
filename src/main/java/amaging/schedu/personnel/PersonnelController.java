package amaging.schedu.personnel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.Waiting;

@Controller
public class PersonnelController {
	private Personnel ps;
	@PostMapping("/GetWaitingS")
	public ModelAndView getWaitingS(ModelAndView mav, @ModelAttribute Waiting wi) {
		return mav;
	}
}
