package sch.com.serviceImpl.zzy;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sch.com.dao.zzy.Tb_instituteDao;
import sch.com.service.zzy.Tb_instituteService;
@Service
public class Tb_instituteServiceImp implements Tb_instituteService {
	@Autowired
	Tb_instituteDao tin;
	/**
	 * ≤È—Ø
	 */
	public List<HashMap<String, Object>> queryInst() {
		return tin.queryInst();
	}
	/**
	 * ÃÌº”
	 */
	public void insertInst(HashMap<String, Object> hm) {
		tin.insertInst(hm);
	}

}
