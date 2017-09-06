package sch.com.web.wym;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.service.wym.ResourceInfoService;

/**
 * 信息下载详情页面相关操作
 * @author xiaoming
 *
 */
@Controller
@RequestMapping("/wym")
public class ResourceInfoController {
	@Autowired
	private ResourceInfoService resourceInfoService;
	
	@RequestMapping("/ResourceInfoQuery")
	@ResponseBody
	private List<HashMap<String,Object>> ResourceInfoQuery(){
		List<HashMap<String,Object>> info = new ArrayList<HashMap<String,Object>>();
		info = resourceInfoService.InfoQuery();
		return info;
	}
}








