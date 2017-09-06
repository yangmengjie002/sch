package sch.com.service.yxf;

import java.util.List;
import java.util.Map;

public interface ResourceTypeService {
	List<Map<String, Object>> queryTypeId(String typeName);
}
