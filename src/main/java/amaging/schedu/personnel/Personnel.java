package amaging.schedu.personnel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.db.ASOracleMapper;

@Service
public class Personnel extends amaging.schedu.common.CommonMethod{
	@Autowired
	ASOracleMapper om;
	public Personnel() {}
	public void backController(int jobCode, ModelAndView mav) {
		switch(jobCode) {
		case 1:
			this.moveAdminPage(mav);
			break;
		case 2:
			this.getWaitingS(mav);
			break;
		case 3:
			this.acceptWS(mav);
			break;
		case 4:
			this.rejectWS(mav);
			break;
		case 5:
			this.selectDS(mav);
			break;
		case 6:
			this.deleteS(mav);
			break;
			
		}
	}
	private void moveAdminPage(ModelAndView mav) {}
	private void getWaitingS(ModelAndView mav) {}
	private void acceptWS(ModelAndView mav) {}
	private void rejectWS(ModelAndView mav) {}
	private void selectDS(ModelAndView mav) {}
	private void deleteS(ModelAndView mav) {}
	
}
