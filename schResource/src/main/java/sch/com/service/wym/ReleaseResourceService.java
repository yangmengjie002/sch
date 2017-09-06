package sch.com.service.wym;


public interface ReleaseResourceService {

	
	//获得项目发布列表
	public String ReleaseResourceQuery();
		
	//更新资源上传表状态
	public void UploadUpdate(String s);
		
}
