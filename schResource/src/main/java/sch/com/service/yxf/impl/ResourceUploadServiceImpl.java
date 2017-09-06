package sch.com.service.yxf.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import sch.com.dao.yxf.ResourceUploadDao;
import sch.com.entity.yxf.DataGrid;
import sch.com.entity.yxf.ResourceFileUpload;
import sch.com.entity.yxf.ResourceUpload;
import sch.com.service.yxf.ResourceUploadService;

@Service
public class ResourceUploadServiceImpl implements ResourceUploadService{
	@Autowired
	private ResourceUploadDao resourceUploadDao;
	@Override
	//��Դ��ѯ��ҳ
	public DataGrid queryResourceUpload(ResourceUpload resourceUpload) {
		// TODO Auto-generated method stub
		DataGrid dataGrid =new DataGrid();
		List<Map<String, Object>> rudl=resourceUploadDao.queryResourceUpload(resourceUpload);
		dataGrid.setRows(rudl);
		dataGrid.setTotal(rudl.size());
		return dataGrid;
	}
	@Override
	public int insertResourceUpload(ResourceFileUpload resourceFileUpload) {
		// TODO Auto-generated method stub
		return resourceUploadDao.insertResourceUpload(resourceFileUpload);
	}
	
	
	
	@Override
	public Map SaveFile(MultipartFile myfile) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		String tomcaturl=System.getProperty("catalina.home");
		
		System.out.println(myfile);
		String oldFileName = myfile.getOriginalFilename(); // 获取上传文件的原名
		System.out.println(oldFileName);
		// 存储图片的虚拟本地路径（这里需要配置tomcat的web模块路径，双击猫进行配置）
	
		String saveFilePath = tomcaturl+"\\testwebapps\\schResource\\images";
		System.out.println(saveFilePath);
		// 上传文件
		if (myfile != null && oldFileName != null && oldFileName.length() > 0) {
			// 新的文件名称
			String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
			// 新文件
			
			File newFile = new File(saveFilePath + "\\" + newFileName);
			// 将内存中的数据写入磁盘
			myfile.transferTo(newFile);
		   // 将新图片名称返回到前端
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("flag", 0);
			map.put("url", newFileName);
			
			return map;
			
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("flag", 1);
			
			return map;
		}	
	}

}
