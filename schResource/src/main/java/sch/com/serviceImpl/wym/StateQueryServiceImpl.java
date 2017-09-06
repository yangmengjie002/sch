package sch.com.serviceImpl.wym;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sch.com.dao.wymm.StateQueryDao;
import sch.com.service.wym.StateQueryService;

@Service
public class StateQueryServiceImpl implements StateQueryService{
	
	@Autowired
	private StateQueryDao stateQueryDao;
	
	//资源(jpg?)类型查询
	@Override
	public List<HashMap<String, Object>> StateQuery() {
		return stateQueryDao.StateQuery();
	}
	
	
}
