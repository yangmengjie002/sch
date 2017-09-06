package sch.com.service.yxf.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sch.com.dao.yxf.ResourceTypeDao;
import sch.com.service.yxf.ResourceTypeService;

@Service
public class ResourceTypeServiceImpl implements ResourceTypeService {
	@Autowired
	private ResourceTypeDao rtd;
	@Override
	public List<Map<String, Object>> queryTypeId(String typeName) {
		// TODO Auto-generated method stub
		return rtd.queryTypeId(typeName);
	}

}
