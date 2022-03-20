package amaging.schedu.timeTable;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.UserInfo;
import amaging.schedu.bean.ClassBean;
@RestController
public class TimeTableController {
	@Autowired
	private TimeTable tt;


	@SuppressWarnings("unchecked")
	@PostMapping("/GetCourseList")
	public List<ClassBean> getCourseList(ModelAndView mav, @ModelAttribute UserInfo uf) {			
		mav.getModelMap().addAttribute("uf", uf);

		this.tt.backController(9, mav);

		return (List<ClassBean>)mav.getModelMap().getAttribute("course");

	}

	@PostMapping("/InsertClass")
	public String insertClass(ModelAndView mav, @ModelAttribute ClassBean cb) {
		//System.out.println("dddddd");
		mav.getModelMap().addAttribute("cb", cb);
		this.tt.backController(10, mav);
		return (String)mav.getModelMap().getAttribute("msg");
	}

	@SuppressWarnings("unchecked")
	@PostMapping("/GetAClassList")
	public List<ClassBean> getAClassList(ModelAndView mav, @ModelAttribute UserInfo uf) {
		System.out.println("수업수정");
		System.out.println("과목등록");	
		mav.getModelMap().addAttribute("uf",uf);

		this.tt.backController(4, mav);

		return (List<ClassBean>)mav.getModelMap().getAttribute("curs");
	}

	@PostMapping("/UpdClass")
	public String UpdClass(ModelAndView mav, @ModelAttribute ClassBean cb) {
		System.out.println("수업수정완료 버튼");

		mav.getModelMap().addAttribute("cb", cb);

		this.tt.backController(11, mav);


		return (String)mav.getModelMap().getAttribute("msg");
	}


}
