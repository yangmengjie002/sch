package sch.com.service.yang;

import java.util.List;
import java.util.Map;

import sch.com.entity.ResourceYType;

public interface ResourceTypeYService {
	/**
	 * ��ȡ��Դ������Ϣ
	 * @return
	 */
	public List<Map<String,Object>> getResourceTypeInfo();
	/**
	 * ������Դ����
	 * @param r
	 * @return
	 */
	public int insertOrUpdateResourceType(ResourceYType r);
	/**
	 * ������Դ����
	 * @param arr
	 * @return
	 */
	public int DeleteResourceType(String arr);
}