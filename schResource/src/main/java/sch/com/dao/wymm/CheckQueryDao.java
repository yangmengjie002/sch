package sch.com.dao.wymm;

import java.util.HashMap;
import java.util.List;

public interface CheckQueryDao {
	//需要审核的数据列表
	public List<HashMap<String,Object>> checkQuery();
	
	//级联下拉系查询
	public List<HashMap<String,Object>> checkMajQuery(String m);
	
	//通过专业名称获得其ID
	public Integer checkMajIDQuery(String m);
	
	//插入审核表
	public void checkInsert(HashMap<String,Object> m);
	
	//更新资源上传表状态
	public void tbResourceUploadUpdate(HashMap<String,Object> m);
	
	//更新资源上传表所属类型
	public void tbUploadMajUpdate(HashMap<String,Object> m);
	
}
