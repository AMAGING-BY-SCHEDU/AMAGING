package amaging.schedu.privateInfo;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import amaging.schedu.bean.AcList;
import amaging.schedu.bean.RegParent;
import amaging.schedu.bean.UserInfo;
import amaging.schedu.db.TMOracleMapper;

@Service
public class PrivateInfo extends amaging.schedu.common.CommonMethod{
	@Autowired
	TMOracleMapper tm;
	@Autowired
	JavaMailSender javaMail;
	public PrivateInfo() {}
	public void backController(int jobCode, ModelAndView mav) {
		switch(jobCode) {
		case 1:
			this.infoPage(mav);
			break;
		case 2:
			this.checkParentEmail(mav);
			break;
		case 3:
			this.parentRegEmail(mav);
			break;
		case 4:
			this.parentUpdPage(mav);
			break;
		case 5:
			this.updParent(mav);
			break;
		case 6:
			this.searchAc(mav);
			break;	
		case 7:
			this.regAcademy(mav);
			break;	
		case 8:
			this.delParent(mav);
			break;	
		}
	}
	private void checkParentEmail(ModelAndView mav) {
		mav.addObject("prInfo", tm.checkParentEmail(((RegParent)mav.getModelMap().getAttribute("regp"))));
	}
	private void infoPage(ModelAndView mav) {
		String page=null;
		int userCode=((UserInfo)mav.getModelMap().getAttribute("uf")).getUserCode();
		
		  if(userCode==1) {
		   page="PInfoPage";
		  }else if(userCode==2) {
		   page="SInfoPage";
		  }else{
		 
			page="TInfoPage";
		}
		mav.addObject("category", "regAcademy");
		mav.setViewName(page);
	}
	private void parentRegEmail(ModelAndView mav) {
		boolean isSendMail = false;
		String message=null;             
		/*???????????? ???????????? ????????? ??????*/
		RegParent regp=(RegParent)mav.getModelMap().getAttribute("regp");
		int spStatus=tm.checkSPStatus(regp);
		if(spStatus==11) {
			/* 11 >> ?????? ????????? ????????? ??????*/
			message="?????? ????????? ????????? ??????????????????.";
		}else {
			/* 0 >> ????????? insert, ????????? ??????*/
			if(spStatus==0) {
				boolean tran=false;
				this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
				/*????????? insert*/
				if(this.convertToBoolean(tm.regParent(regp))) {
					tran=true;
				}
				this.setTransactionEnd(tran);
			}
			/* 12 >> ???????????? ?????? ??????*/
			String regPrInfo=regp.getUserId()+","+regp.getPrCode();
			try {
				regPrInfo=this.enc.aesEncode(regPrInfo, "regParent");
			} catch (Exception e) {e.printStackTrace();}
			/* Email Info */
			String subject="???????????? ????????? ?????????????????????.";
			String contents="<a href='http://localhost/UpdPrPage?regPrInfo="+regPrInfo+"'>"+regp.getStudentName()+"?????? ????????? ??????????????? ???????????? ????????????! ????????? ?????? ????????? ??????????????????. </a>";
			String from="swhong_test@naver.com";
			String to=regp.getPEmail();
			/* Creation MimeMessage */
			MimeMessage mail=javaMail.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail,"UTF-8");
			try {
				helper.setFrom(from);
				helper.setTo(to);
				helper.setSubject(subject);
				helper.setText(contents,true);
				javaMail.send(mail);
				isSendMail=true;
			} catch (MessagingException e) {
				isSendMail=false;
				e.printStackTrace();
			}
			message=isSendMail?"???????????? ??????????????? ?????? ?????? ????????? ?????????????????????.":"?????? ????????? ??????????????????. ?????? ??????????????????";
		}
		mav.addObject("message", message);
	}
	private void parentUpdPage(ModelAndView mav) {
		String code=null;
		RegParent regp=(RegParent)mav.getModelMap().getAttribute("regp");
		try {
			code=this.enc.aesDecode(regp.getRegPrInfo(), "regParent");
		} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException | NoSuchPaddingException
				| InvalidAlgorithmParameterException | IllegalBlockSizeException | BadPaddingException e) {
			e.printStackTrace();
		}
		regp.setUserId(code.substring(0,code.indexOf(",")));
		regp.setPrCode(code.substring(code.indexOf(",")+1));
		RegParent spEmail=tm.getSPEmail(regp);
		regp.setSEmail(spEmail.getSEmail());
		regp.setPEmail(spEmail.getPEmail());
		mav.addObject("code", regp);
		mav.setViewName("mysonplease");
	}
	private void updParent(ModelAndView mav) {
		boolean tran=false;
		String message="?????? ??????. ?????? ??? ?????? ????????? ?????????.";
		if(tm.checkSPStatus((RegParent)mav.getModelMap().getAttribute("regp"))==11) {
			message="?????? ????????????????????????. ?????? ???????????? ???????????????.";
		}else {
			this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
			if(this.convertToBoolean(tm.updParent((RegParent)mav.getModelMap().getAttribute("regp")))) {
				tran=true;
				message="?????????????????????. ?????? ???????????? ???????????????.";
			}
			this.setTransactionEnd(tran);
		}
		
		mav.addObject("message", message);
		
	}
	private void delParent(ModelAndView mav) {
		boolean tran=false;
		String message="?????? ??????. ?????? ??? ?????? ????????? ?????????.";
		if(tm.checkSPStatus((RegParent)mav.getModelMap().getAttribute("regp"))==11) {
			message="?????? ???????????? ????????? ??? ?????? ???????????????. ????????? ???????????????. ?????? ???????????? ???????????????.";
		}else {
			this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
			if(this.convertToBoolean(tm.updParent((RegParent)mav.getModelMap().getAttribute("regp")))) {
				tran=true;
				message="?????????????????????. ?????? ???????????? ???????????????.";
			}
			this.setTransactionEnd(tran);
		}
		
		mav.addObject("message", message);
		
	}
	private void searchAc(ModelAndView mav) {
		mav.addObject("acList", tm.getAcList((AcList)mav.getModelMap().getAttribute("ac"))) ;
	}
	private void regAcademy(ModelAndView mav) {
		String message=null;
		boolean tran=false;
		int result=0;
		this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,
				TransactionDefinition.ISOLATION_READ_COMMITTED, false);
		if(((UserInfo)mav.getModelMap().getAttribute("uf")).getUserCode()==2) {
			result=tm.regSAcademy((UserInfo)mav.getModelMap().getAttribute("uf"));
		}else {
			result=tm.regTAcademy((UserInfo)mav.getModelMap().getAttribute("uf"));
		}
		if(this.convertToBoolean(result)) {
			tran=true;
			message="?????? ?????? ????????? ?????????????????????. ????????? ?????? ?????? ???????????????.";
		}else{
			message="?????? ?????? ?????? ????????? ???????????????. ?????? ?????? ???????????????.";
		}
		this.setTransactionEnd(tran);
		mav.addObject("message",message);
	}
}