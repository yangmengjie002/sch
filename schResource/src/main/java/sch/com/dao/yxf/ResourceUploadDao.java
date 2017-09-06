package sch.com.dao.yxf;

import java.util.List;
import java.util.Map;

import sch.com.entity.yxf.ResourceFileUpload;
import sch.com.entity.yxf.ResourceUpload;

public interface ResourceUploadDao {
	List<Map<String, Object>> queryResourceUpload(ResourceUpload  resourceUpload);
	public int getTotalNum(ResourceUpload resourceUpload);
	public int insertResourceUpload(ResourceFileUpload resourceFileUpload );
	
}
