package sch.com.dao.wymm;

import java.util.HashMap;
import java.util.List;

/**
 * ����������ز���
 * @author xiaoming
 *
 */
public interface MyCenterDao {
	//��ȡ�ҵ��ϴ�
	public List<HashMap<String,Object>> MyUploadQuery(int a);
	
	//��ȡ�ҵ�����
	public List<HashMap<String,Object>> MyDownQuery(int a);
	
	//��ȡ�ҵ��ղ�
	public List<HashMap<String,Object>> MyCollectQuery(int a);
}






