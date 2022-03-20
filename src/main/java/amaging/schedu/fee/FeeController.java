package amaging.schedu.fee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.FeeBean;

@Controller
public class FeeController {
	private Fee fee;
	@PostMapping("/GetFeeList")
	public ModelAndView getFeeList(ModelAndView mav, @ModelAttribute FeeBean fb) {
		return mav;
	}
}
