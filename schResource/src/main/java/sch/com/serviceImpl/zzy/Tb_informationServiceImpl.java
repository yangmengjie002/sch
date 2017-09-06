package sch.com.serviceImpl.zzy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sch.com.dao.zzy.Tb_informationDao;
import sch.com.entity.Tb_information;
import sch.com.service.zzy.Tb_informationService;
@Service
public class Tb_informationServiceImpl implements Tb_informationService{
	@Autowired
	private Tb_informationDao tb_informationDao;
	/**
	 * 获取资讯
	 */
	public List<Tb_information> getList() {
		return tb_informationDao.getList();
	}
	/**
	 * 插入资讯
	 */
	@Override
	public void insertInfo(HashMap<String, Object> hm) {
		tb_informationDao.insertInfo(hm);
		
	}
	
	
	
	

}
