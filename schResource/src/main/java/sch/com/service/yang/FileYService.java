package sch.com.service.yang;

import java.util.List;
import java.util.Map;

public interface FileYService {
	/**
	 * ����ID��ѯ�����ļ���Ϣ
	 * @param userId
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> fileDown(Integer userId, Integer id);

}
