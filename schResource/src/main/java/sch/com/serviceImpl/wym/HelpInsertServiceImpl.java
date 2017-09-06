package sch.com.serviceImpl.wym;

import java.util.Date;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sch.com.dao.wymm.HelpInsertDao;
import sch.com.service.wym.HelpInsertService;
import sch.com.utils.DateUtils;


@Service
public class HelpInsertServiceImpl implements HelpInsertService{
	@Autowired
	private HelpInsertDao helpInsertDao;
	
	//插入资源求助表
	@Override
	public void HelpInsert(String typename,
			String requestCause,String ziname,String majorname) {
		Integer typeid = helpInsertDao.typeIdQuery(typename);
		Integer majorid = helpInsertDao.marIdQuery(majorname);
		HashMap<String,Object> help = new HashMap<String,Object>();
		help.put("typeid", typeid);
		help.put("majorid", majorid);
		help.put("requestCause", requestCause);
		help.put("ziname", ziname);
		help.put("nowdate", DateUtils.dateToStrLong(new Date()));
		help.put("userid", 4); //用户ID，后期需改良
		helpInsertDao.HelpInsert(help);
	}


}
