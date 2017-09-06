package sch.com.entity.yxf;

public class ResourceRequest {
	private int resourceRequestId;//资源请求编号
	private int userId;//请求人
	private int resourceRequestTypeId;//资源请求类型编号
	private String requestCause;//请求原因
	private String requestTime;//请求时间
	private String resourceRequestName;//资源名
	private int majorId;
	public int getMajorId() {
		return majorId;
	}
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}
	public int getResourceRequestId() {
		return resourceRequestId;
	}
	public void setResourceRequestId(int resourceRequestId) {
		this.resourceRequestId = resourceRequestId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getResourceRequestTypeId() {
		return resourceRequestTypeId;
	}
	public void setResourceRequestTypeId(int resourceRequestTypeId) {
		this.resourceRequestTypeId = resourceRequestTypeId;
	}
	public String getRequestCause() {
		return requestCause;
	}
	public void setRequestCause(String requestCause) {
		this.requestCause = requestCause;
	}
	public String getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}
	public String getResourceRequestName() {
		return resourceRequestName;
	}
	public void setResourceRequestName(String resourceRequestName) {
		this.resourceRequestName = resourceRequestName;
	}
	
}
