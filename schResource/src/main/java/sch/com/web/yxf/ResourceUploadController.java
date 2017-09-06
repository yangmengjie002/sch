package sch.com.web.yxf;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

import sch.com.entity.yxf.DataGrid;
import sch.com.entity.yxf.ResourceUpload;
import sch.com.service.yxf.ResourceUploadService;

@Controller
@RequestMapping("/upload")
public class ResourceUploadController {
	@Autowired
	ResourceUploadService resourceUploadService;
	@RequestMapping("/data")
	public void datagrid(ResourceUpload resourceUpload,HttpServletRequest request,HttpServletResponse response){
			resourceUpload.setRows(2);
			resourceUpload.setPage(2);
			DataGrid datagrid=resourceUploadService.queryResourceUpload(resourceUpload);
			Map<String,Object> map=new HashMap<String,Object>();
			String jsonString = JSON.toJSONString(datagrid);
			try {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(jsonString);
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	
}
