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
import sch.com.dao.wymm.ResourceEndDao;
import sch.com.service.wym.ResourceEndService;
import sch.com.utils.DateUtils;

@Service
public class ResourceEndServiceImpl implements ResourceEndService{
	@Autowired
	private ResourceEndDao resourceEndDao;
	@Autowired
	private CheckQueryDao checkQueryDao;
	
	
	//获得资源结束列表
	@Override
	public String ResourceEnd() {
		List<HashMap<String, Object>> end = new ArrayList<HashMap<String, Object>>();
		end = resourceEndDao.ResourceEnd();
		String endJSON = JSON.toJSONString(end);
		return endJSON;
	}

	@Override
	//更新资源上传表和插入资源下架表
	@Transactional
	public void ResourceEndInsert(String s) {
		String[] ss=s.split(",");
		HashMap<String,Object> m = new HashMap<String,Object>();
		HashMap<String,Object> insert = new HashMap<String,Object>();
		for(int i=0;i<ss.length;i++){
			m.put("resourceId", ss[i]);
			m.put("status_id", 4);
			checkQueryDao.tbResourceUploadUpdate(m);
			
			
			insert.put("resourceId",ss[i]);
			insert.put("soldout_date", DateUtils.dateToStrLong(new Date()));
			insert.put("user_id", 5);	//此处为审核人ID,后期需要完善
			resourceEndDao.ResourceEndInsert(insert);
			
		}
		
	}

}
