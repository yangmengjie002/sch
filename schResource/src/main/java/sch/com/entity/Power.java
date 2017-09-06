package sch.com.entity;

public class Power {
	private Integer powerId;//主键ID
	private String powerName;//权限名
	private String powerKey;//权限关键字
	private String powerView="1";//是否显示在菜单中1为显示，二为不显示
	private String powerStatus="1";//权限是否可用1 为可用，2为不可用
	private String powerRoad;//权限路径
	private String powerPriority;//权限优先级，用于显示排序
	private String powerPid;//父级权限
	
	public Integer getPowerId() {
		return powerId;
	}
	public void setPowerId(Integer powerId) {
		this.powerId = powerId;
	}
	public String getPowerName() {
		return powerName;
	}
	public void setPowerName(String powerName) {
		this.powerName = powerName;
	}
	public String getPowerKey() {
		return powerKey;
	}
	public void setPowerKey(String powerKey) {
		this.powerKey = powerKey;
	}
	public String getPowerView() {
		return powerView;
	}
	public void setPowerView(String powerView) {
		this.powerView = powerView;
	}
	
	public String getPowerStatus() {
		return powerStatus;
	}
	public void setPowerStatus(String powerStatus) {
		this.powerStatus = powerStatus;
	}
	public String getPowerRoad() {
		return powerRoad;
	}
	public void setPowerRoad(String powerRoad) {
		this.powerRoad = powerRoad;
	}
	public String getPowerPriority() {
		return powerPriority;
	}
	public void setPowerPriority(String powerPriority) {
		this.powerPriority = powerPriority;
	}
	public String getPowerPid() {
		return powerPid;
	}
	public void setPowerPid(String powerPid) {
		this.powerPid = powerPid;
	}
	
	
}
