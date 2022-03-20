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
		/*대기중인 등록요청 있는지 조회*/
		RegParent regp=(RegParent)mav.getModelMap().getAttribute("regp");
		int spStatus=tm.checkSPStatus(regp);
		if(spStatus==11) {
			/* 11 >> 이미 등록됨 메세지 전송*/
			message="이미 등록이 완료된 이메일입니다.";
		}else {
			/* 0 >> 대기중 insert, 이메일 전송*/
			if(spStatus==0) {
				boolean tran=false;
				this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
				/*대기중 insert*/
				if(this.convertToBoolean(tm.regParent(regp))) {
					tran=true;
				}
				this.setTransactionEnd(tran);
			}
			/* 12 >> 이메일만 다시 전송*/
			String regPrInfo=regp.getUserId()+","+regp.getPrCode();
			try {
				regPrInfo=this.enc.aesEncode(regPrInfo, "regParent");
			} catch (Exception e) {e.printStackTrace();}
			/* Email Info */
			String subject="부모등록 요청이 도착하였습니다.";
			String contents="<a href='http://localhost/UpdPrPage?regPrInfo="+regPrInfo+"'>"+regp.getStudentName()+"님이 당신을 부모님으로 등록하길 원합니다! 링크를 통해 요청을 수락해주세요. </a>";
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
			message=isSendMail?"요청하신 메일주소로 수락 요청 메일을 발송하였습니다.":"메일 발송에 실패했습니다. 다시 시도해주세요";
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
		String message="작업 실패. 잠시 후 다시 시도해 주세요.";
		if(tm.checkSPStatus((RegParent)mav.getModelMap().getAttribute("regp"))==11) {
			message="이미 등록되어있습니다. 창은 자동으로 종료됩니다.";
		}else {
			this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
			if(this.convertToBoolean(tm.updParent((RegParent)mav.getModelMap().getAttribute("regp")))) {
				tran=true;
				message="등록되었습니다. 창은 자동으로 종료됩니다.";
			}
			this.setTransactionEnd(tran);
		}
		
		mav.addObject("message", message);
		
	}
	private void delParent(ModelAndView mav) {
		boolean tran=false;
		String message="작업 실패. 잠시 후 다시 시도해 주세요.";
		if(tm.checkSPStatus((RegParent)mav.getModelMap().getAttribute("regp"))==11) {
			message="이미 등록되어 수행할 수 없는 작업입니다. 본사에 문의하세요. 창은 자동으로 종료됩니다.";
		}else {
			this.setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED, TransactionDefinition.ISOLATION_READ_COMMITTED, false);
			if(this.convertToBoolean(tm.updParent((RegParent)mav.getModelMap().getAttribute("regp")))) {
				tran=true;
				message="거절되었습니다. 창은 자동으로 종료됩니다.";
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
			message="학원 등록 요청에 성공하였습니다. 수락은 학원 측에 문의하세요.";
		}else{
			message="이미 등록 요청 기록이 존재합니다. 학원 측에 문의하세요.";
		}
		this.setTransactionEnd(tran);
		mav.addObject("message",message);
	}
}