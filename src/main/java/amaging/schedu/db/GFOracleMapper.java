package amaging.schedu.db;

import java.util.List;

import amaging.schedu.bean.ACPlan;
import amaging.schedu.bean.AcList;
import amaging.schedu.bean.FeeBean;
import amaging.schedu.bean.GradeBean;
import amaging.schedu.bean.Subject;
import amaging.schedu.bean.UserInfo;

public interface GFOracleMapper {
	/*Fee*/
	public List<FeeBean> getMonthFee(FeeBean fb);
	public int updFeeList(FeeBean fb);
	public int getMonthCheck(FeeBean fb);
	public List<FeeBean> getStudentList(FeeBean fb);
	public int insFeeList(FeeBean fb);
	public List<FeeBean> getMyFeeList(FeeBean fb);
	/*Grade*/
	public List<ACPlan> getTeacherAcademy(AcList ac);
	public int checkPwd(AcList ac);
	public List<Subject> getTeacherClass(AcList ac);
	public int modGrade(GradeBean grade);
	public List<GradeBean> getStudentList(Subject sj);
	public int regGrade(GradeBean grade);
	public List<GradeBean> getTGrade(Subject sj);
	public List<GradeBean> getGrade(UserInfo ui);
	public List<GradeBean> getMyChilds(UserInfo ui);
	
}
