package amaging.schedu.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class QnAController {
	
	QnA qna;
	
	@PostMapping("/GetAcList")
	public ModelAndView getAcList(ModelAndView mav) {
		qna.backController(4, mav);
		return mav;
	}
	
}
