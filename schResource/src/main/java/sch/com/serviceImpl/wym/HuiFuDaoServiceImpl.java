package sch.com.serviceImpl.wym;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;

import sch.com.dao.wymm.CheckQueryDao;
import sch.com.dao.wymm.HuiFuDao;
import sch.com.service.wym.HuiFuDaoService;

@Service
public class HuiFuDaoServiceImpl implements HuiFuDaoService{
	@Autowired
	private HuiFuDao huiFuDao;
	@Autowired
	private CheckQueryDao checkQueryDao;
	
	//已经下架的列表
	@Override
	public String HuiFu() {
		List<HashMap<String,Object>> m = new ArrayList<HashMap<String,Object>>();
		m = huiFuDao.HuiFu();
		String huifu = JSON.toJSONString(m);
		return huifu;
	}

	@Override
	//删除下架表的数据和更新资源上传表
	public void HuiFuUpdate(String rowArr) {	
		String[] ss=rowArr.split(",");
		HashMap<String,Object> m = new HashMap<String,Object>();
		HashMap<String,Object> mm = new HashMap<String,Object>();
		for(int i=0;i<ss.length;i++){
			m.put("resourceId", ss[i]);
			m.put("status_id", 3);
			checkQueryDao.tbResourceUploadUpdate(m);
			
			mm.put("resourceId", ss[i]);
			huiFuDao.HuiFuDetele(mm);
		}
	}

}





