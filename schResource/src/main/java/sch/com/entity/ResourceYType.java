package sch.com.entity;
/**
 * 数据类型
 * @author yang
 *
 */
public class ResourceYType {
	private Integer resourceTypeId;
	private String resourceTypeName;
	private String resourcePostfix;
	private Integer resourceTypeSize;
	public Integer getResourceTypeId() {
		return resourceTypeId;
	}
	public void setResourceTypeId(Integer resourceTypeId) {
		this.resourceTypeId = resourceTypeId;
	}

	public String getResourceTypeName() {
		return resourceTypeName;
	}
	public void setResourceTypeName(String resourceTypeName) {
		this.resourceTypeName = resourceTypeName;
	}
	public String getResourcePostfix() {
		return resourcePostfix;
	}
	public void setResourcePostfix(String resourcePostfix) {
		this.resourcePostfix = resourcePostfix;
	}
	public Integer getResourceTypeSize() {
		return resourceTypeSize;
	}
	public void setResourceTypeSize(Integer resourceTypeSize) {
		this.resourceTypeSize = resourceTypeSize;
	}
	
}
