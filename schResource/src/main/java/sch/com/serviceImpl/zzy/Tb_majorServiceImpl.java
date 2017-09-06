package sch.com.serviceImpl.zzy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sch.com.dao.zzy.Tb_majorDao;
import sch.com.service.zzy.Tb_majorService;
@Service
public class Tb_majorServiceImpl implements Tb_majorService{
	@Autowired
	private Tb_majorDao md;
	public List<HashMap<String, Object>> queryMajor() {
			
			return md.queryMajor();
	}
	@Override
	public List<HashMap<String,Object>> findMj(Integer selectId) {
		System.out.println("********service:"+selectId);
		return md.findMj(selectId);
	}

}
