package sch.com.service.yxf.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sch.com.dao.yxf.ResourceCollectDao;
import sch.com.entity.yxf.ResourceCollection;
import sch.com.service.yxf.ResourceCollectionService;

@Service
public class ResourceCollectionServiceImpl implements ResourceCollectionService{
	
	@Autowired
	private ResourceCollectDao resourceCollectDao;
	@Override
	public int insertCollect(ResourceCollection resourceCollection) {
		// TODO Auto-generated method stub
		return resourceCollectDao.insertCollect(resourceCollection);
	}

	@Override
	public List<Map<String, Object>> queryCollect(Integer id) {
		// TODO Auto-generated method stub
		System.out.println(id);
		return resourceCollectDao.queryCollect(id);
	}

	@Override
	public int delCollect(Integer resourceId){
		// TODO Auto-generated method stub
		System.out.println(resourceId);
		return resourceCollectDao.delCollect(resourceId);
	}

}
