package amaging.schedu.auth;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.ChildCode;
import amaging.schedu.bean.Login;
import amaging.schedu.bean.RegMember;
import amaging.schedu.bean.UserInfo;

@Controller
public class AuthController {
	@Autowired
	private Authentication auth;
	
	@PostMapping("/Login")
	public ModelAndView login(ModelAndView mav, @ModelAttribute Login lg) {
		auth.backController(2,mav.addObject("login", lg));
		return mav;
	}
	@PostMapping("/Logout")
	public ModelAndView logout(ModelAndView mav, @ModelAttribute UserInfo uf) {
		auth.backController(3,mav.addObject("uf", uf));		
		return mav;
	}
	@PostMapping("/Join")
	public ModelAndView join(ModelAndView mav, @ModelAttribute RegMember rm) {
		auth.backController(4,mav.addObject("rm", rm));	
		return mav;
	}

	@SuppressWarnings("unchecked")
	@PostMapping(value="/GetChildList")
	public @ResponseBody List<ChildCode> getChildList(ModelAndView mav, @RequestBody@ModelAttribute ChildCode cc) {
		auth.backController(5,mav.addObject("cc", cc));
		return (List<ChildCode>)mav.getModelMap().getAttribute("ChildList");
	}
}
