package amaging.schedu.privateInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.RegParent;

@Controller
public class PrivateController {
	private PrivateInfo pi;
	@PostMapping("/ParentRegEmail")
	public ModelAndView parentRegEmail(ModelAndView mav, @ModelAttribute RegParent regp) {
		return mav;
	}
}
