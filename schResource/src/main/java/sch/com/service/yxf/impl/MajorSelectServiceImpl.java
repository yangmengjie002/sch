package sch.com.service.yxf.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sch.com.dao.yxf.MajorSelectDao;
import sch.com.entity.yxf.ResourceRequest;
import sch.com.service.yxf.MajorSelectService;

@Service
public class MajorSelectServiceImpl implements MajorSelectService {
	@Autowired
	private MajorSelectDao msd;		
	@Override
	//查询已经存在的专业
	public List<Map<String, Object>> queryMajor() {
		// TODO Auto-generated method stub
		return msd.queryMajor();
	}
	//查询已经存在的资源类型
	@Override
	public List<Map<String, Object>> queryResouceType() {
		// TODO Auto-generated method stub
		return msd.queryResouceType();
	}
	@Override
	//向资源请求表中插入数据
	public int insertRequest(ResourceRequest resourceRequest) {
		// TODO Auto-generated method stub
		System.out.println("adda");
		return msd.insertRequest(resourceRequest);
	}

}
