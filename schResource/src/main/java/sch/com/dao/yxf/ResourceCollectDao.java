package sch.com.dao.yxf;

import java.util.List;
import java.util.Map;

import sch.com.entity.yxf.ResourceCollection;


public interface ResourceCollectDao {
	public int insertCollect(ResourceCollection resourceCollection);
	List<Map<String, Object>> queryCollect(Integer useId);
	public int delCollect(Integer resourceId);

}
