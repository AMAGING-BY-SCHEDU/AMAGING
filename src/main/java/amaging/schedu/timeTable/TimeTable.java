package amaging.schedu.timeTable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.db.TMOracleMapper;

@Service
public class TimeTable extends amaging.schedu.common.CommonMethod{
	@Autowired
	TMOracleMapper tm;
	public TimeTable() {}
	public void backController(int jobCode, ModelAndView mav) {
		switch(jobCode) {
		case 1:
			this.psClassPage(mav);
			break;
		case 2:
			this.tClassPage(mav);
			break;
		case 3:
			this.aClassPage(mav);
			break;
		case 4:
			this.getAClassList(mav);
			break;
		case 5:
			this.searchTeacher(mav);
			break;
		case 6:
			this.regSubject(mav);
			break;
		case 7:
			this.getSubjectList(mav);
			break;
		case 8:
			this.updSubject(mav);
			break;
		case 9:
			this.getCourseList(mav);
			break;
		case 10:
			this.insertClass(mav);
			break;
		case 11:
			this.updClass(mav);
			break;
		case 12:
			this.searchStudent(mav);
			break;
		case 13:
			this.regStudent(mav);
			break;
		case 14:
			this.getBelongList(mav);
			break;
		case 15:
			this.delBelong(mav);
			break;
		case 16:
			this.getAssignSub(mav);
			break;	
		}
	}
	private void psClassPage(ModelAndView mav) {}
	private void tClassPage(ModelAndView mav) {}
	private void aClassPage(ModelAndView mav) {}
	private void getAClassList(ModelAndView mav) {}
	private void searchTeacher(ModelAndView mav) {}
	private void regSubject(ModelAndView mav) {}
	private void getSubjectList(ModelAndView mav) {}
	private void updSubject(ModelAndView mav) {}
	private void getCourseList(ModelAndView mav) {}
	private void insertClass(ModelAndView mav) {}
	private void updClass(ModelAndView mav) {}
	private void searchStudent(ModelAndView mav) {}
	private void regStudent(ModelAndView mav) {}
	private void getBelongList(ModelAndView mav) {}
	private void delBelong(ModelAndView mav) {}
	private void getAssignSub(ModelAndView mav) {}
}
