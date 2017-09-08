package sch.com.web.yxf;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import sch.com.entity.yxf.ResourceFileUpload;
import sch.com.service.yxf.ResourceTypeService;
import sch.com.service.yxf.ResourceUploadService;
import sch.com.utils.BaseController;

@Controller
@RequestMapping("/fileUpload")
public class FileUploadController {
	@Autowired
	private ResourceUploadService rus;
	@Autowired
	private ResourceTypeService rts;
	
	public BaseController bc;
	
	
	
	//fileinput 文件上传
	@RequestMapping("/SaveFile")
	@ResponseBody
	public Map SaveFile(@RequestParam("file_data") MultipartFile myfile){
		Map<String,Object> map;
		try {
			System.out.println("ssdfsd");
			map=rus.SaveFile(myfile);
			return map;
			
		} catch (Exception e) {
			// TODO: handle exception
		
		}
		
		return null;
	}
	//文件上传页面的数据的传输
	@RequestMapping("/upload")
	public void UpataPerPro(HttpServletResponse response,String  resourceName,String resourceInfo ,String uploadSite){
		System.out.println("aaaaaaaaaaaaaaaaa"+uploadSite);
		int m = uploadSite.indexOf(".");
		
		String type= uploadSite.substring(m+1);
		System.out.println(type);
		List<Map<String,Object>> list=rts.queryTypeId(type);
		Object obj=list.get(0).get("RESOURCE_TYPE_ID");
		int flag= Integer.parseInt(obj.toString());
		
		
		
		ResourceFileUpload rfu=new ResourceFileUpload();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
		java.util.Date date=new java.util.Date();  
		
		
		String str=sdf.format(date); 
		
		rfu.setUploadDate(str);
		rfu.setResourceInfo(resourceInfo);
		rfu.setResourceName(resourceName);
		//用户id;
		rfu.setUserId(3);
		rfu.setResourceTypeId(flag);
		rfu.setUploadSite(uploadSite);
	
		int flag2=rus.insertResourceUpload(rfu);
		bc.insertResponose(flag2, response);
		
	}
}
