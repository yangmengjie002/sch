package sch.com.service.wym;

import java.util.HashMap;
import java.util.List;

public interface CheckQueryService {
	//��Ҫ��˵������б�
	public String checkQuery();
	
	//��������ϵ��ѯ
	public List<HashMap<String,Object>> checkMajQuery(String m);
	
	
	//������˱�͸�����Դ�ϴ���״̬
	public void checkInsert(Integer resourceId,String checkIdea,Integer checkStatuId,String major_name);
	
}
