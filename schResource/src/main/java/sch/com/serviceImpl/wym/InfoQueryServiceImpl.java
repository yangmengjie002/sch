package sch.com.serviceImpl.wym;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sch.com.dao.wymm.InfoQueryDao;
import sch.com.service.wym.InfoQueryService;
/**
 *  查询统计
 * @author xiaoming
 *
 */

@Service
public class InfoQueryServiceImpl implements InfoQueryService{
	
	@Autowired
	private InfoQueryDao infoQueryDao;
	
	//查询统计
	@Override
	public List<HashMap<String, Object>> InfoListQuery() {
		List<HashMap<String,Object>> info = new ArrayList<HashMap<String,Object>>();
		info = infoQueryDao.InfoListQuery();
		for(int i=0;i<info.size();i++){
			if((info.get(i).get("STATUS_ID")+"").equals("2")){
				info.get(i).put("STATUS_NAME", "已审核");
			}else if((info.get(i).get("STATUS_ID")+"").equals("3")){
				info.get(i).put("STATUS_NAME", "已发布");
			}else if((info.get(i).get("STATUS_ID")+"").equals("4")){
				info.get(i).put("STATUS_NAME", "已下架");
			}
		}
		return info;
	}

}









