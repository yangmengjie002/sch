package sch.com.service.yxf;

import java.util.List;
import java.util.Map;

import sch.com.entity.yxf.ResourceCollection;

public interface ResourceCollectionService {
	public int insertCollect(ResourceCollection resourceCollection);
	List<Map<String, Object>> queryCollect(Integer id1);
	public int delCollect(Integer resourceId);
}
