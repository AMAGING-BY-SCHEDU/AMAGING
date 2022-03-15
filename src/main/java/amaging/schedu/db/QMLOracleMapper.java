package amaging.schedu.db;


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
		
	/*立加扁废*/
	public int setAccessHistory(UserInfo uf);
	public int setAdminAccessHistory(UserInfo uf);
	
	/*技记沥焊*/
	public UserInfo getTeacherInfo(Login login);
	public UserInfo getParentInfo(Login login);
	public UserInfo getStudentInfo(Login login);
	public UserInfo getAdminInfo(Login login);
	
	
	
	public int setStudentData(RegMember regM);
	public int setParentsData(RegMember regM);
	public int displayChildList(ChildCode child);
	
}
