package sch.com.dao.wymm;

import java.util.HashMap;

public interface HelpInsertDao {
	//插入资源求助表
	public void HelpInsert(HashMap<String,Object> m);
	
	//根据所属类型name查询id
	public Integer marIdQuery(String s);
	
	//根据资源类型name查询id
	public Integer typeIdQuery(String s);
}
