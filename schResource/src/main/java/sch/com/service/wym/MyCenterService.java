package sch.com.service.wym;

import java.util.HashMap;
import java.util.List;

public interface MyCenterService {
	//��ȡ�ҵ��ϴ�
	public List<HashMap<String,Object>> MyUploadQuery(int a);
	
	//��ȡ�ҵ�����
	public List<HashMap<String,Object>> MyDownQuery(int a);
	
	//��ȡ�ҵ��ղ�
	public List<HashMap<String,Object>> MyCollectQuery(int a);
}
