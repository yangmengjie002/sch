package sch.com.service.zzy;

import java.util.HashMap;
import java.util.List;

public interface Tb_majorService {
	/**
	 * ²éÑ¯×¨Òµ
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
