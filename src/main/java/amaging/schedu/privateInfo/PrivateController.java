package amaging.schedu.privateInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.AcList;
import amaging.schedu.bean.RegParent;
import amaging.schedu.bean.UserInfo;

@RestController
public class PrivateController {
	@Autowired
	private PrivateInfo pi;
	@PostMapping(value="/ParentRegEmail", produces = "application/text; charset=UTF-8")
	public String parentRegEmail(ModelAndView mav, @ModelAttribute RegParent regp) {
		mav.addObject("regp", regp);
		pi.backController(3, mav);
		return (String)mav.getModelMap().getAttribute("message");
	}
	@PostMapping("/CheckParentEmail")
	public RegParent checkParentEmail(ModelAndView mav, @ModelAttribute RegParent regp) {
		mav.addObject("regp",regp);
		pi.backController(2, mav);
		return (RegParent)mav.getModelMap().getAttribute("prInfo");
	}
	@PostMapping(value="/UpdParent", produces = "application/text; charset=UTF-8")
	public String updParent(ModelAndView mav, @ModelAttribute RegParent regp) {
		mav.addObject("regp",regp);
		pi.backController(5, mav);
		return (String)mav.getModelMap().getAttribute("message");
	}
	@PostMapping(value="/RejectParent", produces = "application/text; charset=UTF-8")
	public String delParent(ModelAndView mav, @ModelAttribute RegParent regp) {
		mav.addObject("regp",regp);
		pi.backController(8, mav);
		return (String)mav.getModelMap().getAttribute("message");
	}
	@SuppressWarnings("unchecked")
	@PostMapping("/SearchAc")
	public List<AcList> searchAc(ModelAndView mav, @ModelAttribute AcList ac) {
		mav.addObject("ac", ac);
		pi.backController(6, mav);
		return (List<AcList>)mav.getModelMap().getAttribute("acList");
	}
	@PostMapping(value="/RegAcademy", produces = "application/text; charset=UTF-8")
	public String regAcademy(ModelAndView mav, @ModelAttribute UserInfo uf) {
		mav.addObject("uf",uf);
		pi.backController(7, mav);
		return (String)mav.getModelMap().getAttribute("message");
	}
}