package amaging.schedu.db;

import java.util.List;

import amaging.schedu.bean.AcList;
import amaging.schedu.bean.ChildCode;
import amaging.schedu.bean.ClassBean;
import amaging.schedu.bean.RegParent;
import amaging.schedu.bean.Subject;
import amaging.schedu.bean.TList;
import amaging.schedu.bean.UserInfo;

public interface TMOracleMapper {
	/*TimeTable*/
	public List<Subject> getSClassList(UserInfo uf);
	public List<Subject> getTClassList(UserInfo uf);
	public String checkTier(UserInfo uf);
	public List<ClassBean> getAClassList(UserInfo uf);
	public List<TList> getTeacherList(TList tl);
	public int regSubject(Subject sb);
	public List<Subject> getSubjectList(UserInfo uf);
	public int updSubject(Subject sb);
	public List<ClassBean> getCourseList(UserInfo uf);
	public int insertClass(ClassBean cb);
	public int updClass(ClassBean cb);
	public List<ChildCode> getSList(ChildCode child);
	public int regStudent(ClassBean cb);
	public List<ClassBean> getBelongList(ClassBean cb);
	public String checkFee(ClassBean cb);
	public int delBelong(ClassBean cb);
	public List<Subject> getAssignSub(Subject sb);
	public String checkParent(RegParent regP);
	/*PrivateInfo*/
	public RegParent checkParentEmail(RegParent regP);
	public Integer checkSPStatus(RegParent regP);
	public int regParent(RegParent regP);
	public int updParent(RegParent regP);
	public int delParent(RegParent regP);
	public RegParent getSPEmail(RegParent regP);
	public List<AcList> getAcList(AcList ac);
	public int regSAcademy(UserInfo uf);
	public int regTAcademy(UserInfo uf);
}