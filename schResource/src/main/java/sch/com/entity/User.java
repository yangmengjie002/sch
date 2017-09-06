package sch.com.entity;

import java.io.Serializable;

/**
 * 用户实体类
 * @author yang
 *
 */
public class User implements Serializable{
	private Integer UserId;
	private String userName;
	private String userPwd;
	private String UserRealName;//用户真实姓名
	private int majorId;//专业课程ID
	private int userStatus;//用户状态
	private String arr;
	public String getArr() {
		return arr;
	}
	public void setArr(String arr) {
		this.arr = arr;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	
	public Integer getUserId() {
		return UserId;
	}
	public void setUserId(Integer userId) {
		UserId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserRealName() {
		return UserRealName;
	}
	public void setUserRealName(String userRealName) {
		UserRealName = userRealName;
	}
	public int getMajorId() {
		return majorId;
	}
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}	
}
