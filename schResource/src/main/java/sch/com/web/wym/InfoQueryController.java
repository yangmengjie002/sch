package sch.com.web.wym;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sch.com.service.wym.InfoQueryService;

/**
 * ²éÑ¯Í³¼Æ
 * @author xiaoming
 *
 */

@Controller
@RequestMapping("/wym")
public class InfoQueryController {
	
	@Autowired
	private InfoQueryService infoQueryService;
	
	
	@RequestMapping("/InfoListQuery")	
	@ResponseBody
	public List<HashMap<String,Object>> InfoListQuery(){
		List<HashMap<String,Object>> info = new ArrayList<HashMap<String,Object>>();
		info = infoQueryService.InfoListQuery();
		return info;
	}
}









