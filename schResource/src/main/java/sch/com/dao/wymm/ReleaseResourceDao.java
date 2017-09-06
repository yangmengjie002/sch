package sch.com.dao.wymm;

import java.util.HashMap;
import java.util.List;

public interface ReleaseResourceDao {
	
	//获得项目发布列表
	public List<HashMap<String,Object>> ReleaseResourceQuery();
	
	//插入资源审核表
	public void ReleaseResourceInsert(HashMap<String,Object> m);
}
