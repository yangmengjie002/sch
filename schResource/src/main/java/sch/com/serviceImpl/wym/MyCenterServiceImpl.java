package sch.com.serviceImpl.wym;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sch.com.dao.wymm.MyCenterDao;
import sch.com.service.wym.MyCenterService;

@Service
public class MyCenterServiceImpl implements MyCenterService{
	@Autowired
	private MyCenterDao myCenterDao;

	@Override
	public List<HashMap<String, Object>> MyUploadQuery(int a) {
		List<HashMap<String, Object>> upload = new ArrayList<HashMap<String, Object>>();
		upload = myCenterDao.MyUploadQuery(a);
		for(int i=0;i<upload.size();i++){
			if((upload.get(i).get("STATUS_ID")+"").equals("2")&&(upload.get(i).get("CHECK_STATUID")+"").equals("2")){
				upload.get(i).put("STATUS_NAME", "审核未通过");
			}else if((upload.get(i).get("STATUS_ID")+"").equals("2")&&(upload.get(i).get("CHECK_STATUID")+"").equals("1")){
				upload.get(i).put("STATUS_NAME", "审核通过");
			}else if((upload.get(i).get("STATUS_ID")+"").equals("3")){
				upload.get(i).put("STATUS_NAME", "资源已发布");
			}else if((upload.get(i).get("STATUS_ID")+"").equals("4")){
				upload.get(i).put("STATUS_NAME", "资源已下架");
			}else{
				upload.get(i).put("STATUS_NAME", "正在审核");
			}
		}
		return upload;
	}

	@Override
	public List<HashMap<String, Object>> MyDownQuery(int a) {
		return myCenterDao.MyDownQuery(a);
	}

	@Override
	public List<HashMap<String, Object>> MyCollectQuery(int a) {
		// TODO Auto-generated method stub
		return myCenterDao.MyCollectQuery(a);
	}
	
	
}
