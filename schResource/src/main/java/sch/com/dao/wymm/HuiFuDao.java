package sch.com.dao.wymm;

import java.util.HashMap;
import java.util.List;

public interface HuiFuDao {
	//已经下架的列表
	public List<HashMap<String,Object>> HuiFu();
	
	//删除下架表的数据
	public void HuiFuDetele(HashMap<String,Object> s);
}
