package amaging.schedu.fee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.db.GFOracleMapper;

@Service
public class Fee extends amaging.schedu.common.CommonMethod{
	@Autowired
	GFOracleMapper gfo;
	public Fee() {}
	public void backController(int jobCode, ModelAndView mav) {
		switch(jobCode) {
		case 1:
			this.aFeePage(mav);
			break;
		case 2:
			this.getMonthFee(mav);
			break;
		case 3:
			this.updFee(mav);
			break;
		case 4:
			this.getStudentList(mav);
			break;
		case 5:
			this.pFeePage(mav);
			break;
		case 6:
			this.getMyFeeList(mav);
			break;	
		}
	}
	private void aFeePage(ModelAndView mav) {}
	private void getMonthFee(ModelAndView mav) {}
	private void updFee(ModelAndView mav) {}
	private void getStudentList(ModelAndView mav) {}
	private void pFeePage(ModelAndView mav) {}
	private void getMyFeeList(ModelAndView mav) {}
}
