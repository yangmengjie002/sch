package sch.com.dao.wymm;

import java.util.HashMap;
import java.util.List;

public interface HuiFuDao {
	//�Ѿ��¼ܵ��б�
	public List<HashMap<String,Object>> HuiFu();
	
	//ɾ���¼ܱ������
	public void HuiFuDetele(HashMap<String,Object> s);
}
