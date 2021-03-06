package sch.com.dao.yang;

import java.util.List;
import java.util.Map;

public interface SchoolDao {
	/**
	 * 获取学院信息
	 * @return
	 */
	public List<Map<String, Object>> getInstitute();
	/**
	 * 根据学院ID获取专业信息
	 * @return
	 */
	public List<Map<String, Object>> getMajor(int instituteId);
	
	/**
	 * 获取专业信息
	 * @return
	 */
	public List<Map<String, Object>> getAllMajor();
}
