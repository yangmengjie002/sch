package sch.com.dao.zzy;

import java.util.HashMap;
import java.util.List;

public interface Tb_majorDao {
	/**
	 * ��ѯרҵ
	 * @return
	 */
	public List<HashMap<String, Object>> queryMajor();
	/**
	 * 
	 * @param selectId
	 * @return
	 */
	public List<HashMap<String, Object>> findMj(Integer selectId);
}
