package sch.com.dao.wymm;

import java.util.HashMap;
import java.util.List;

public interface TbMajorDao {
	//获得院下的专业
	public List<HashMap<String, Object>> TbMajorDaoQuery(int a);
	
	
	//获得专业内的资源数量
	public Integer queryTbResourceUploadId(int a);
}
