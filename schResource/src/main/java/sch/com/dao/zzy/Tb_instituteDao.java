package sch.com.dao.zzy;

import java.util.HashMap;
import java.util.List;

public interface Tb_instituteDao {
	/**
	 * 查询学院
	 */
	public List<HashMap<String, Object>> queryInst();
	/**
	 * 增加学院
	 * @param hm
	 */
	public void insertInst(HashMap<String, Object> hm);
	
	
}
