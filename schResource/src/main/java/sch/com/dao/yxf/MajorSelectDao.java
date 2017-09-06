package sch.com.dao.yxf;

import java.util.List;
import java.util.Map;

import sch.com.entity.yxf.ResourceRequest;

public interface MajorSelectDao {
	//查询所属专业类型
	List<Map<String, Object>> queryMajor();
	//查询资源类型 ppt.txt.还是图片什么的
	List<Map<String, Object>> queryResouceType();
	//向资源请求表中插入数据
	 int insertRequest(ResourceRequest resourceRequest);
}
