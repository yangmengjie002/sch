package sch.com.dao.wymm;

import java.util.HashMap;
import java.util.List;

public interface ResourceEndDao {
	//�����Դ�����б�
	public List<HashMap<String,Object>> ResourceEnd();
	
	//������Դ�¼ܱ�
	public void ResourceEndInsert(HashMap<String,Object> m);
		
}
