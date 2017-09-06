package sch.com.service.wym;

import java.util.HashMap;
import java.util.List;

public interface CheckQueryService {
	//需要审核的数据列表
	public String checkQuery();
	
	//级联下拉系查询
	public List<HashMap<String,Object>> checkMajQuery(String m);
	
	
	//插入审核表和更新资源上传表状态
	public void checkInsert(Integer resourceId,String checkIdea,Integer checkStatuId,String major_name);
	
}
