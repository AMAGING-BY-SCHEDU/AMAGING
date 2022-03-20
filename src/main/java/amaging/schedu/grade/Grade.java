package amaging.schedu.grade;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.db.GFOracleMapper;

@Service
public class Grade extends amaging.schedu.common.CommonMethod{
	@Autowired
	GFOracleMapper gfo;
	public Grade() {}
	public void backController(int jobCode, ModelAndView mav) {
		switch(jobCode) {
		case 1:
			this.teacherGradepage(mav);
			break;
		case 2:
			this.teacherClass(mav);
			break;
		case 3:
			this.teacherGrade(mav);
			break;
		case 4:
			this.getStudnet(mav);
			break;
		case 5:
			this.regClassGrade(mav);
			break;
		case 6:
			this.updGrade(mav);
			break;
		case 7:
			this.getGradePage(mav);
			break;
			
		}
	}
	
	private void teacherGradepage(ModelAndView mav) {}
	private void teacherClass(ModelAndView mav) {}
	private void teacherGrade(ModelAndView mav) {}
	private void getStudnet(ModelAndView mav) {}
	private void regClassGrade(ModelAndView mav) {}
	private void updGrade(ModelAndView mav) {}
	private void getGradePage(ModelAndView mav) {}
	
}
