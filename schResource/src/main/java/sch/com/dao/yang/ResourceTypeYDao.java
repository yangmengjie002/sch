package sch.com.dao.yang;

import java.util.List;
import java.util.Map;

import sch.com.entity.ResourceYType;
/**
 * 资源类型管理
 * @author yang
 *
 */
public interface ResourceTypeYDao {
	/**
	 * 获取资源类型信息
	 * @return
	 */
	public List<Map<String,Object>> getResourceType();
	/**
	 * 获取资源后缀信息
	 * @return
	 */
	public List<Map<String,Object>> getResourcePostfix(int id);
	/**
	 * 插入资源信息表
	 * @param r
	 * @return
	 */
	public int insertResourceType(ResourceYType r);
	/**
	 * 插入后缀表
	 * @param ss
	 * @return
	 */
	public int insertResourcePostfix(String ss);
	/**
	 * 更改类型表
	 * @param r
	 * @return
	 */
	public int updateResourceType(ResourceYType r);
	/**
	 * 删除此类型的后缀
	 * @param resourceTypeId
	 */
	public void deleteRolePostfix(Integer resourceTypeId);
	/**
	 * 删除资源类型
	 * @param parseInt
	 * @return
	 */
	public int deleteResourceType(int id);
	/**
	 * 获取资源的所有信息
	 * @return
	 */
	public List<Map<String, Object>> getResourceInfo();
}
