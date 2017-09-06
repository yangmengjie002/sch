package sch.com.service.zzy;

import java.util.HashMap;
import java.util.List;

public interface Tb_instituteService {
	/**
	 * 查询学院
	 * @return
	 */
	public List<HashMap<String, Object>> queryInst();
	/**
	 * 添加学院
	 */
	public void insertInst(HashMap<String, Object> hm);
}
