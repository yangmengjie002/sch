package sch.com.dao.yxf;

import java.util.List;
import java.util.Map;

import sch.com.entity.yxf.ResourceUpload;

public interface ResourceTypeDao {
	List<Map<String, Object>> queryTypeId(String typeName);
}
