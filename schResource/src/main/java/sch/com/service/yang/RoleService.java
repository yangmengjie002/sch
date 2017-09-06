package sch.com.service.yang;

import java.util.List;
import java.util.Map;

import sch.com.entity.Power;
import sch.com.entity.Role;

public interface RoleService {
	/**
	 * 获取所有的角色信息
	 * @return
	 */
	public List<Map<String, Object>> getAllRole();
	/**
	 * 禁用 角色
	 * @param arr
	 * @return
	 */
	public int RoleDelete(String arr);
	/**
	 * 启用角色
	 * @param arr
	 * @return
	 */
	public int roleUp(String arr);
	/**
	 * 插入或修改权限
	 * @param p
	 * @param userId 
	 * @return
	 */
	public int roleInsertOrUpdate(Role p);
	
	/**
	 * 根据角色ID获取权限
	 * @param roleId
	 * @return
	 */
	public List<Map<String, Object>> getUrlByRoleId(int roleId);
	
	
}
