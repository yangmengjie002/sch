package sch.com.dao.yang;
import java.util.List;
/**
 * 权限修改类
 * @author yang
 *
 */
import java.util.Map;

import sch.com.entity.Power;
public interface FunctionDao{
	/**
	 * 获取所有的权限
	 * @return
	 */
	public List<Map<String , Object>> functionQuery();
	
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
	 * 根据ID删除权限
	 * @param powerId
	 * @return
	 */
	public int functionDelete(int powerId);
	/**
	 * 根据ID启用权限
	 * @param powerId
	 * @return
	 */
	public int functionUp(int powerId);
	/**
	 * 修改用户的权限 
	 * @param p
	 * @return
	 */
	public int functionUpdate(Power p);
	/**
	 * 获取所有权限
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> functionQueryByUserMap(Map<String, Object> map);
	/**
	 * 根据pid 获取权限
	 * @param m
	 * @return
	 */
	public List<Map<String, Object>> functionQueryByPowerId(Map<String, Object> m);
	/**
	 * 根据角色ID查找权限
	 * @param roleId
	 * @return
	 */
	public List<Map<String, Object>> queryUrlByRoleId(Integer roleId);
}
