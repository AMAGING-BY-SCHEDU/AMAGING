package amaging.schedu.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.Login;
import amaging.schedu.bean.UserInfo;
import amaging.schedu.db.QMLOracleMapper;
@Service
public class Authentication extends amaging.schedu.common.CommonMethod{
   @Autowired
   QMLOracleMapper om;
   public Authentication() {
      
   }

   public void backController(int jobCode, ModelAndView mav) {
      switch(jobCode) {
      case 1:
         this.moveLoginPage(mav);
         break;
      case 2:
         this.login(mav);
         break;
      case 3:
         this.logout(mav);
         break;
      case 4:
         this.join(mav);
         break;
      case 5:
         this.getChildList(mav);
         break;
      }
   }
   private void moveLoginPage(ModelAndView mav) {

   }
   private void login(ModelAndView mav) {
      Login lg = new Login();
      UserInfo uf = new UserInfo();
      lg = (Login) mav.getModel().get("login");
      System.out.println(lg.getUserCode());
      String page = "";// 1번 page

      try {

         if (lg.getUserCode() == 3&&this.convertToBoolean(om.isTeacherEmail(lg))) {
            /*세션bean에 정보담기*/
            uf=om.getTeacherInfo(lg);
            this.om.setAccessHistory(uf);
            mav.addObject("accessInfo", uf);
            page = "Tmainservices";
         }else if(lg.getUserCode() == 1&&this.convertToBoolean(om.isParentsEmail(lg))){
        	System.out.println("Authentication Controller userCode = 1 진입");
            uf=om.getParentInfo(lg);
            this.om.setAccessHistory(uf);
            mav.addObject("accessInfo", om.getParentInfo(lg));
            page = "Pmainservices";
         }else if(lg.getUserCode() == 2&&this.convertToBoolean(om.isStudentEmail(lg))){
            uf=om.getStudentInfo(lg);
            this.om.setAccessHistory(uf);
            mav.addObject("accessInfo", om.getStudentInfo(lg));
            page = "Smainservices";
         }else if(lg.getUserCode() == 4&&this.convertToBoolean(om.isAdminCode(lg))) {
            uf=om.getAdminInfo(lg);
            this.om.setAdminAccessHistory(uf);
            mav.addObject("accessInfo", om.getAdminInfo(lg));
            page = "Amainservices";
         }

         pu.setAttribute("sessionInfo", mav.getModel().get("accessInfo"));
      } catch (Exception e) {
         e.printStackTrace();
      }

      mav.setViewName(page);
      }
   
   private void logout(ModelAndView mav) {
      
   }
   private void join(ModelAndView mav) {}
   private void getChildList(ModelAndView mav) {}
   
}