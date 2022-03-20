package amaging.schedu.db;


import java.util.List;

import amaging.schedu.bean.ACPlan;
import amaging.schedu.bean.ChildCode;
import amaging.schedu.bean.Login;
import amaging.schedu.bean.RegMember;
import amaging.schedu.bean.UserInfo;

public interface QMLOracleMapper {
	/*auth*/
	public int isUser(Login login);
	public int isStudentEmail(Login login);
	public int isParentsEmail(Login login);
	public int isTeacherEmail(Login login);
	public int isAdminCode(Login login);
	public int isStudentPassword(Login login);
	public int isParentsPassword(Login login);
	public int isTeacherPassword(Login login);
	public int isAdminPassword(Login login);
		
	/*접속기록*/
	public int setAccessHistory(UserInfo uf);
	public int setAdminAccessHistory(UserInfo uf);
	public int setAccessOutHistory(UserInfo uf);
	public int setAdminAccessOutHistory(UserInfo uf);
	
	/*세션정보*/
	public UserInfo getTeacherInfo(Login login);
	public UserInfo getParentInfo(Login login);
	public UserInfo getStudentInfo(Login login);
	public UserInfo getAdminInfo(Login login);
	
	/*회원등록*/
	public int setStudentData(RegMember regM);
	public int setParentsData(RegMember regM);
	public int setTeacherData(RegMember regM);
	
	/*자식리스트*/
	public List<ChildCode> displayChildList(ChildCode child);
	
	/*학사일정  getAcCode, getPlanList, setPlanList, updPlanList, delPlanList*/
	public List<ACPlan> getAcList(ACPlan plan);
	public List<ACPlan> getPlanList(List<ACPlan> pl);
	public List<ACPlan> getTeacherAcList(ACPlan plan);
	public List<ACPlan> getStudentAcList(ACPlan plan);
	public List<ACPlan> getAPlanList(ACPlan plan);//관리자학사일정
	public int setPlanList(ACPlan plan);
	public int updPlanList(ACPlan plan);
	public int delPlanList(ACPlan plan);
}
