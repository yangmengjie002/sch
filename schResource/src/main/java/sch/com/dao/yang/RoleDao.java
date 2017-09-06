package sch.com.dao.yang;

import java.util.List;
import java.util.Map;

import sch.com.entity.Role;



public interface RoleDao {
	/**
	 * 获取所有的角色信息
	 * @return
	 */
	public List<Map<String, Object>> getAllRole();
	/**
	 * 根据用户名获取角色信息
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> getRole(int userId);
	/**
	 * 根据角色ID获取权限
	 * @param roleId
	 * @return
	 */
	public List<Map<String, Object>> getUrlByRoleId(int roleId);
	/**
	 * 插入角色
	 * @param r
	 * @return
	 */
	public int insertRole(Role r);	
	/**
	 * 修改角色
	 * @param r
	 * @return
	 */
	public int updateRole(Role r);
	/**
	 * 禁用角色
	 * @param roleId
	 * @return
	 */
	public int deleteRole(int roleId);
	/**
	 * 启用角色
	 * @param roleId
	 * @return
	 */
	public int reverseRole(int roleId);
	/**
	 * 根据角色ID
	 * @param roleId
	 */
	public void deleteRoleUrl(int roleId);
	
	/**
	 * 插入角色权限表
	 * @param m
	 * @return
	 */
	public int insertRoleUrl(int m);
	/**
	 * 根据角色ID插入权限
	 * @param map
	 * @return
	 */
	public int insertRoleUrlByMap(Map<String, Object> map);
	
}
