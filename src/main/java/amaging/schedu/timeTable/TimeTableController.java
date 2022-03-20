package amaging.schedu.timeTable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.UserInfo;

@Controller
public class TimeTableController {
	private TimeTable tt;
	@PostMapping("/GetAClassList")
	public ModelAndView getAClassLIst(ModelAndView mav, @ModelAttribute UserInfo uf) {
			return mav;
	}
}
