package sch.com.service.yang;

import java.util.List;
import java.util.Map;

public interface FileYService {
	/**
	 * 根据ID查询下载文件信息
	 * @param userId
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> fileDown(Integer userId, Integer id);

}
