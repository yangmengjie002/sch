package sch.com.service.yxf;

import java.io.IOException;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import sch.com.entity.yxf.DataGrid;
import sch.com.entity.yxf.ResourceFileUpload;
import sch.com.entity.yxf.ResourceUpload;

public interface ResourceUploadService {
	public DataGrid queryResourceUpload(ResourceUpload resourceUpload);
	public int insertResourceUpload(ResourceFileUpload resourceFileUpload );
	public Map SaveFile(MultipartFile myfile) throws IllegalStateException, IOException;
}
