package sch.com.dao.yang;

import java.util.List;
import java.util.Map;
/**
 * �ļ�����
 * @author yang
 *
 */
public interface FileYDao {
	/**
	 * �����ϴ�ID��ȡ�ļ��洢��Ϣ
	 * @param id
	 * @return
	 */
	public List<Map<String, Object>> getFileInfo(Integer id);
	/**
	 * ����������Դ��
	 * @param map
	 * @return
	 */
	public int insertDownload(Map<String,Object> map);
}
