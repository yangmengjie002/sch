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
import sch.com.dao.wymm.ReleaseResourceDao;
import sch.com.service.wym.ReleaseResourceService;
import sch.com.utils.DateUtils;

@Service
public class ReleaseResourceServiceImpl implements ReleaseResourceService{
	@Autowired
	private ReleaseResourceDao releaseResourceDao;
	@Autowired
	private CheckQueryDao checkQueryDao;
	
    //�����Դ�����б�
	public String ReleaseResourceQuery() {
		List<HashMap<String,Object>> mm = new ArrayList<HashMap<String,Object>>();
		mm = releaseResourceDao.ReleaseResourceQuery();
		String mmJSON = JSON.toJSONString(mm);
		return mmJSON;
	}

	@Override
	//������Դ�ϴ���Ͳ�����Դ������
	@Transactional
	public void UploadUpdate(String s) {
		String[] ss=s.split(",");
		HashMap<String,Object> m = new HashMap<String,Object>();
		HashMap<String,Object> insert = new HashMap<String,Object>();
		for(int i=0;i<ss.length;i++){
			m.put("resourceId", ss[i]);
			m.put("status_id", 3);
			checkQueryDao.tbResourceUploadUpdate(m);
			
			insert.put("resourceId",ss[i]);
			insert.put("release_date", DateUtils.dateToStrLong(new Date()));
			insert.put("user_id", 5);	//�˴�Ϊ�����ID,������Ҫ����
			releaseResourceDao.ReleaseResourceInsert(insert);
		}			
	}

}
