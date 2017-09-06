package sch.com.entity;

public class FileYDownload {
	private Integer downloadId;
	private Integer resourceId;
	private Integer userId;
	private String downloadDate;
	public Integer getDownloadId() {
		return downloadId;
	}
	public void setDownloadId(Integer downloadId) {
		this.downloadId = downloadId;
	}
	public Integer getResourceId() {
		return resourceId;
	}
	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getDownloadDate() {
		return downloadDate;
	}
	public void setDownloadDate(String downloadDate) {
		this.downloadDate = downloadDate;
	}
	
}
