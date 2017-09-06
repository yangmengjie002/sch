package sch.com.service.yxf;

import java.util.List;
import java.util.Map;

import sch.com.entity.yxf.ResourceRequest;

public interface MajorSelectService {
	//查询所属专业类型
	public List<Map<String, Object>> queryMajor();
	//查询资源类型 ppt.txt.还是图片什么的
	public List<Map<String, Object>> queryResouceType();
	//向资源请求表中插入数据
	public int insertRequest(ResourceRequest resourceRequest);
}
