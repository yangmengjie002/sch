package sch.com.service.zzy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sch.com.entity.Tb_information;

public interface Tb_informationService {
	/**
	 * ��ѯ��Ѷ��
	 * @return
	 */
	public List<Tb_information> getList();
	/**
	 * ������Ѷ��Ϣ
	 * @param mm 
	 */
	public void insertInfo(HashMap<String, Object> hm);
	
}
