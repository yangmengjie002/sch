package sch.com.entity;

public class ResourceYInfo {
	private Integer resourceId;
	private Integer resourceTypeId;
	private Integer userId;
	private String url;
	private String uploadDate;
	private Integer statusId = 1;
	private Integer majorId = 0;
	private String resourceName;
	private String resourceInfo;
	
	public Integer getResourceId() {
		return resourceId;
	}
	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}
	public Integer getResourceTypeId() {
		return resourceTypeId;
	}
	public void setResourceTypeId(Integer resourceTypeId) {
		this.resourceTypeId = resourceTypeId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	public Integer getMajorId() {
		return majorId;
	}
	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getResourceInfo() {
		return resourceInfo;
	}
	public void setResourceInfo(String resourceInfo) {
		this.resourceInfo = resourceInfo;
	}
	@Override
	public String toString() {
		return "ResourceYInfo [resourceId=" + resourceId + ", resourceTypeId=" + resourceTypeId + ", userId=" + userId
				+ ", url=" + url + ", uploadDate=" + uploadDate + ", statusId=" + statusId + ", majorId=" + majorId
				+ ", resourceName=" + resourceName + ", resourceInfo=" + resourceInfo + "]";
	}
	
	
}
