package sch.com.dao.wymm;

import java.util.HashMap;
import java.util.List;

public interface ReleaseResourceDao {
	
	//�����Ŀ�����б�
	public List<HashMap<String,Object>> ReleaseResourceQuery();
	
	//������Դ��˱�
	public void ReleaseResourceInsert(HashMap<String,Object> m);
}
