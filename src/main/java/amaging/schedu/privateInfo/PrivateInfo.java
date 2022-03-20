package amaging.schedu.privateInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.db.TMOracleMapper;

@Service
public class PrivateInfo extends amaging.schedu.common.CommonMethod{
	@Autowired
	TMOracleMapper tm;
	public PrivateInfo() {}
	public void backController(int jobCode, ModelAndView mav) {
		switch(jobCode) {
		case 1:
			this.infoPage(mav);
			break;
		case 2:
			this.parentRegEmail(mav);
			break;
		case 3:
			this.parentUpdPage(mav);
			break;
		case 4:
			this.updParent(mav);
			break;
		
		}
	}
	private void infoPage(ModelAndView mav) {}
	private void parentRegEmail(ModelAndView mav) {}
	private void parentUpdPage(ModelAndView mav) {}
	private void updParent(ModelAndView mav) {}
	
}
