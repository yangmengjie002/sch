package sch.com.dao.yang;

import java.util.List;
import java.util.Map;

import sch.com.entity.ResourceYInfo;
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
	/**
	 * ���ݺ�׺��ȡ���׺�йص��ļ���Ϣ
	 * @param postfix
	 * @return
	 */
	public List<Map<String, Object>> getResourceInfoFix(String postfix);
	/**
	 * �ϴ��ļ�
	 * @param resourceInfo
	 * @return
	 */
	public String fileUploadAll(ResourceYInfo resourceInfo);
}
