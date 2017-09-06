package sch.com.serviceImpl.wym;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import sch.com.dao.wymm.CheckQueryDao;
import sch.com.utils.DateUtils;


@Service
public class CheckQueryServiceImpl implements sch.com.service.wym.CheckQueryService{
	
	@Autowired
	private CheckQueryDao checkQueryDao;
		
	@Override
	//需要审核的数据列表
	public String checkQuery() {
		List<HashMap<String,Object>> check = new ArrayList<HashMap<String,Object>>();
		check = checkQueryDao.checkQuery();
		String checkJSON = JSON.toJSONString(check);
		return checkJSON;
	}
	
	
	@Override
	//级联下拉系查询
	public List<HashMap<String, Object>> checkMajQuery(String m) {
		// TODO Auto-generated method stub
		return checkQueryDao.checkMajQuery(m);
	}
	
	
	

	@Override
	//插入审核表和更新资源上传表
	@Transactional
	public void checkInsert(Integer resourceId,String checkIdea,
			Integer checkStatuId,String major_name) {		
		HashMap<String,Object> m = new HashMap<String,Object>();
		m.put("resourceId", resourceId);
		m.put("checkIdea", checkIdea);
		m.put("checkStatuId",checkStatuId);
		m.put("check_data", DateUtils.dateToStrLong(new Date()));
		m.put("user_id", 5);
		checkQueryDao.checkInsert(m);
		
		Integer major_id = checkQueryDao.checkMajIDQuery(major_name);
		System.out.println("major_id============="+major_id);
		HashMap<String,Object> mmm = new HashMap<String,Object>();
		mmm.put("resourceId", resourceId);
		mmm.put("major_id", major_id);		
		checkQueryDao.tbUploadMajUpdate(mmm);
		
		HashMap<String,Object> mm = new HashMap<String,Object>();
		mm.put("resourceId", resourceId);
		mm.put("status_id", 2);
		checkQueryDao.tbResourceUploadUpdate(mm);
	}






	

}
