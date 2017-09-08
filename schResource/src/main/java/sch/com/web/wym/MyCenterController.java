package sch.com.web.wym;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.service.wym.MyCenterService;

@Controller
@RequestMapping("/wym")
public class MyCenterController {
	@Autowired
	private MyCenterService myCenterService;
	
	//获取我的上传
	@RequestMapping("/myUploadQuery")
	@ResponseBody
	public List<HashMap<String,Object>> myUploadQuery(Integer a){
		List<HashMap<String,Object>> upload = new ArrayList<HashMap<String,Object>>();
		upload = myCenterService.MyUploadQuery(5);
		return upload;
	}
	
	//获取我的下载
	@RequestMapping("/myDownQuery")
	@ResponseBody
	public List<HashMap<String,Object>> myDownQuery(Integer a){
		List<HashMap<String,Object>> down = new ArrayList<HashMap<String,Object>>();
		down = myCenterService.MyDownQuery(5);
		return down;
	}
	
	//获取我的下载
	@RequestMapping("/myCollectQuery")
	@ResponseBody
	public List<HashMap<String,Object>> myCollectQuery(){
		List<HashMap<String,Object>> collect = new ArrayList<HashMap<String,Object>>();
		collect = myCenterService.MyCollectQuery(5);
		return collect;
	}
	
}









