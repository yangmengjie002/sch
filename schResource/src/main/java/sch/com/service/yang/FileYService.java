package sch.com.service.yang;

import java.util.List;
import java.util.Map;

import sch.com.entity.ResourceYInfo;

public interface FileYService {
	/**
	 * 根据ID查询下载文件信息
	 * @param userId
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> fileDown(Integer userId, Integer id);
	/**
	 * 根据后缀获取与后缀有关的文件信息
	 * @param postfix
	 * @return
	 */
	List<Map<String, Object>> getResourceInfoFix(String postfix);
	/**
	 * 上传文件信息
	 * @param resourceInfo
	 * @return
	 */
	String fileUploadAll(ResourceYInfo resourceInfo);

}
