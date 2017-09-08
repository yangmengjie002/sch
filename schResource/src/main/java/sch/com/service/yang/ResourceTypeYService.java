package sch.com.service.yang;

import java.util.List;
import java.util.Map;

import sch.com.entity.ResourceYType;

public interface ResourceTypeYService {
	/**
	 * 获取资源类型信息
	 * @return
	 */
	public List<Map<String,Object>> getResourceTypeInfo();
	/**
	 * 插入资源类型
	 * @param r
	 * @return
	 */
	public int insertOrUpdateResourceType(ResourceYType r);
	/**
	 * 禁用资源类型
	 * @param arr
	 * @return
	 */
	public int DeleteResourceType(String arr);
	/**
	 * 获取资源信息
	 * @return
	 */
	public List<Map<String, Object>> getResourceInfo();
}
