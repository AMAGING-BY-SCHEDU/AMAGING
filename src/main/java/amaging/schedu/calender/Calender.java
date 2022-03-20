package amaging.schedu.calender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.db.QMLOracleMapper;

@Service
public class Calender extends amaging.schedu.common.CommonMethod{
	@Autowired
	QMLOracleMapper om;
	public Calender() {}
	
	public void backController(int jobCode, ModelAndView mav) {
		switch(jobCode) {
		case 1:
			this.acPlanPage(mav);
			break;
		case 2:
			this.getPlanList(mav);
			break;
		case 3:
			this.setPlanList(mav);
			break;
		case 4:
			this.updPlanList(mav);
			break;
		case 5:
			this.delPlanList(mav);
			break;
		}
	}
	private void acPlanPage(ModelAndView mav) {}
	private void getPlanList(ModelAndView mav) {}
	private void setPlanList(ModelAndView mav) {}
	private void updPlanList(ModelAndView mav) {}
	private void delPlanList(ModelAndView mav) {}
	
}
