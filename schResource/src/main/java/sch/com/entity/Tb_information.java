package sch.com.entity;

public class Tb_information {
	/**
	 * 资讯表
	 */
	int informationID;			//资讯表编号
	String informationTitle;	//咨询标题
	String informationContent;	//咨询内容
	int user_id;				//撰写人id
	public int getInformationID() {
		return informationID;
	}
	public void setInformationID(int informationID) {
		this.informationID = informationID;
	}
	public String getInformationTitle() {
		return informationTitle;
	}
	public void setInformationTitle(String informationTitle) {
		this.informationTitle = informationTitle;
	}
	public String getInformationContent() {
		return informationContent;
	}
	public void setInformationContent(String informationContent) {
		this.informationContent = informationContent;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
}
