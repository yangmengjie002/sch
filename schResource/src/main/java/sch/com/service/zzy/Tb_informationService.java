package sch.com.service.zzy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sch.com.entity.Tb_information;

public interface Tb_informationService {
	/**
	 * 查询资讯表
	 * @return
	 */
	public List<Tb_information> getList();
	/**
	 * 插入资讯信息
	 * @param mm 
	 */
	public void insertInfo(HashMap<String, Object> hm);
	
}
