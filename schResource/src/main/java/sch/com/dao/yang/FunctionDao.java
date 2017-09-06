package sch.com.dao.yang;
import java.util.List;
/**
 * Ȩ���޸���
 * @author yang
 *
 */
import java.util.Map;

import sch.com.entity.Power;
public interface FunctionDao{
	/**
	 * ��ȡ���е�Ȩ��
	 * @return
	 */
	public List<Map<String , Object>> functionQuery();
	
	/**
	 * �����û�ID�����û���Ȩ��
	 * @param userId
	 * @return
	 */
	public List<Map<String , Object>> functionQueryByUserId(int userId);
	
	/**
	 * ����Ȩ��
	 * @param p
	 * @return
	 */
	public int functionInsert(Power p);
	/**
	 * ����IDɾ��Ȩ��
	 * @param powerId
	 * @return
	 */
	public int functionDelete(int powerId);
	/**
	 * ����ID����Ȩ��
	 * @param powerId
	 * @return
	 */
	public int functionUp(int powerId);
	/**
	 * �޸��û���Ȩ�� 
	 * @param p
	 * @return
	 */
	public int functionUpdate(Power p);
	/**
	 * ��ȡ����Ȩ��
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> functionQueryByUserMap(Map<String, Object> map);
	/**
	 * ����pid ��ȡȨ��
	 * @param m
	 * @return
	 */
	public List<Map<String, Object>> functionQueryByPowerId(Map<String, Object> m);
	/**
	 * ���ݽ�ɫID����Ȩ��
	 * @param roleId
	 * @return
	 */
	public List<Map<String, Object>> queryUrlByRoleId(Integer roleId);
}
