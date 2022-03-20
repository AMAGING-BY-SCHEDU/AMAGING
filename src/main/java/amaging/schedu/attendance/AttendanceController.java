package amaging.schedu.attendance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import amaging.schedu.bean.AcList;
import amaging.schedu.bean.AttendanceBean;
import amaging.schedu.bean.ClassBean;
import amaging.schedu.bean.Subject;
import amaging.schedu.bean.UserInfo;

@RestController
public class AttendanceController {
	@Autowired
	private Attendance ad;
	@SuppressWarnings("unchecked")
	@PostMapping("/GetASchoolList")
	public List<AcList> getASchoolList(Model model, @ModelAttribute UserInfo uf) {
		ad.aBackController(2,model.addAttribute("uf",uf));
		return (List<AcList>)model.getAttribute("schoolList");
	}
	@SuppressWarnings("unchecked")
	@PostMapping("/selectClass")
	public List<ClassBean> selectClassList(Model model, @ModelAttribute AcList al) {
		ad.aBackController(3,model.addAttribute("al",al));
		return (List<ClassBean>)model.getAttribute("classList");
	}
	@PostMapping("/ssecondLogin")
	public String secondLogin(Model model, @ModelAttribute AcList al) {
		ad.aBackController(4, model.addAttribute("al",al));
		return model.getAttribute("meg").toString();
	}
	@SuppressWarnings("unchecked")
	@PostMapping("/studentList")
	public List<ClassBean> studentList(Model model, @ModelAttribute Subject sj) {
		ad.aBackController(5, model.addAttribute("sj",sj));
		return (List<ClassBean>)model.getAttribute("studentList");
	}
	@PostMapping(value ="/studentAttendanceForm", consumes="application/json" ,produces = "text/plain; charset=utf-8")
	public String studentAttendanceF(Model model, @RequestBody List<AttendanceBean> ab) {
		ad.aBackController(6, model.addAttribute("ab",ab));
		return model.getAttribute("meg").toString();
	}
	@SuppressWarnings("unchecked")
	@PostMapping("/checkStudent")
	public List<AttendanceBean> cStudent(Model model, @ModelAttribute Subject sj) {
		ad.aBackController(7, model.addAttribute("sj",sj));
		return (List<AttendanceBean>)model.getAttribute("cStudent");
	}
	@PostMapping(value ="/modAttendance", consumes="application/json" ,produces = "text/plain; charset=utf-8")
	public String modSAttendance(Model model, @RequestBody List<AttendanceBean> ab) {
		ad.aBackController(8, model.addAttribute("ab",ab));
		return model.getAttribute("meg").toString();
	}
	@SuppressWarnings("unchecked")
	@PostMapping("/recheckSA")
	public List<AttendanceBean> recheckSA(Model model, @ModelAttribute Subject sj) {
		ad.aBackController(9, model.addAttribute("sj",sj));
		return (List<AttendanceBean>)model.getAttribute("rcStudent");
	}
}
