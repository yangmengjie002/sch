package sch.com.entity;

public class Role {
	private Integer roleId;
	private String roleName;
	private String userRoleKeywords;
	private String userRoleStatus;
	private String arr;
	
	public String getArr() {
		return arr;
	}
	public void setArr(String arr) {
		this.arr = arr;
	}
	
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getUserRoleKeywords() {
		return userRoleKeywords;
	}
	public void setUserRoleKeywords(String userRoleKeywords) {
		this.userRoleKeywords = userRoleKeywords;
	}
	public String getUserRoleStatus() {
		return userRoleStatus;
	}
	public void setUserRoleStatus(String userRoleStatus) {
		this.userRoleStatus = userRoleStatus;
	}
	
}
