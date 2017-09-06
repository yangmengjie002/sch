package sch.com.web.yxf;

import java.io.IOException;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;

import sch.com.entity.yxf.ResourceRequest;
import sch.com.service.yxf.MajorSelectService;
import sch.com.utils.BaseController;

@Controller
@RequestMapping(value="/majorSelect")
public class MajorSelectController {
	@Autowired
	private  MajorSelectService mss;

	private BaseController bc;
	//查询资源的科目类型
	@RequestMapping("/selectmajor")
	public void selectMajor(HttpServletResponse response){
		List<Map<String,Object>> list= mss.queryMajor();
		Map <String,Object> map =new HashMap<String,Object>();
		map.put("selectMajor", list);
		bc.writeJson(response, map);
		
	}
	
	//查询资源的种类类型
	@RequestMapping("/selectResourceType")
	public void selectType(HttpServletResponse response){
		List<Map<String,Object>> list= mss.queryResouceType();
		Map <String,Object> map =new HashMap<String,Object>();
		map.put("selectType", list);
		bc.writeJson(response, map);
		
	}
	//资源请求表中插入数据
	@RequestMapping("/insert")
	public void insert(Integer majorId,Integer resourceRequestTypeId,String requestCause,String resourceRequestName, HttpServletResponse response,HttpServletRequest request){
		//需要或取登陆者编号
		ResourceRequest rr=new ResourceRequest();
		rr.setMajorId(majorId);
		rr.setRequestCause(requestCause);
		rr.setResourceRequestName(resourceRequestName);
		rr.setResourceRequestTypeId(resourceRequestTypeId);
		rr.setUserId(5);
		
		//System.out.println(111);
		//获取当前日期
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
		java.util.Date date=new java.util.Date();  
		String str=sdf.format(date); 
		
        rr.setRequestTime(str);
       // System.out.println(rr.getResourceRequestName()+"sdfsdfsdfdsf");
        
		int flag=mss.insertRequest(rr);
		bc.insertResponose(flag, response);
		
	}
	
}
