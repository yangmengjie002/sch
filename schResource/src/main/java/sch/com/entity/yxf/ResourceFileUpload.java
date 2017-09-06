package sch.com.entity.yxf;

public class ResourceFileUpload {
	private int resourceId;
	private int resourceTypeId;
	private int userId;
	private String uploadSite;
	private String uploadDate;
	private int statusId;
	private int majorId;
	private String resourceName;
	private String resourceInfo;
	public String getResourceInfo() {
		return resourceInfo;
	}
	public void setResourceInfo(String resourceInfo) {
		this.resourceInfo = resourceInfo;
	}
	public int getMajorId() {
		return majorId;
	}
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public int getResourceId() {
		return resourceId;
	}
	public void setResourceId(int resourceId) {
		this.resourceId = resourceId;
	}
	public int getResourceTypeId() {
		return resourceTypeId;
	}
	public void setResourceTypeId(int resourceTypeId) {
		this.resourceTypeId = resourceTypeId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUploadSite() {
		return uploadSite;
	}
	public void setUploadSite(String uploadSite) {
		this.uploadSite = uploadSite;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	
}
