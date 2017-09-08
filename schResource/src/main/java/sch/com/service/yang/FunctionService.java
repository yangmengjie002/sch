package sch.com.service.yang;

import java.util.List;
import java.util.Map;

import sch.com.entity.PageBean;
import sch.com.entity.Power;

public interface FunctionService {
	/**
	 * 获取所有的权限
	 * @param pb 
	 * @return
	 */
	public Map<String, Object> functionQuery(PageBean pb);
	/**
	 * 根据用户ID查找用户的权限
	 * @param userId
	 * @return
	 */
	public List<Map<String , Object>> functionQueryByUserId(int userId);
	
	/**
	 * 插入权限
	 * @param p
	 * @return
	 */
	public int functionInsert(Power p);
	/**
	 * 根据用户ID删除权限
	 * @param arr
	 * @return
	 */
	public int functionDelete(String arr);
	/**
	 * 修改用户的权限 
	 * @param p
	 * @return
	 */
	public int functionUpdate(Power p);
	/**
	 * 根据ID和用户ID获取权限
	 * @param userId
	 * @param id
	 * @return
	 */
	public List<Map<String, Object>> functionQueryByUserMap(int userId, Integer id);
	/**
	 * 获取权限
	 * @param m
	 * @return
	 */
	public List<Map<String, Object>> functionQueryByUserMap(Map<String, Object> m);
	/**
	 * 启用权限
	 * @param arr
	 * @return
	 */
	public int functionUp(String arr);
	/**
	 * 根据权限pID 获取权限
	 * @param id
	 * @return
	 */
	public List<Map<String, Object>> functionQueryByPowerMap(Map<String, Object> m);
}
