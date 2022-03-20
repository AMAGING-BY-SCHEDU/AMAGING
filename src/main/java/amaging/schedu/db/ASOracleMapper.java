package amaging.schedu.db;

import java.util.List;

import amaging.schedu.bean.AcList;
import amaging.schedu.bean.AttendanceBean;
import amaging.schedu.bean.ClassBean;
import amaging.schedu.bean.Subject;
import amaging.schedu.bean.UserInfo;

public interface ASOracleMapper {
	public UserInfo getTInfo(UserInfo uf);
	public List<AcList> getSchoolList(UserInfo uf);
	public List<ClassBean> getClassList(AcList al);
	public int checkPwd(AcList al);
	public int checkSL(AcList al);
	public List<ClassBean> getStudentList(Subject sj);
	public int insSA(AttendanceBean ab);
	public List<AttendanceBean> getAForm(Subject sj);
	public int upSA(AttendanceBean ab);
	public List<AttendanceBean> getRcAForm(Subject sj);
}
