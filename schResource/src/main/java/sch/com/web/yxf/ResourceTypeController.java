package sch.com.web.yxf;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sch.com.service.yxf.ResourceTypeService;
import sch.com.utils.BaseController;

@Controller
@RequestMapping("/type")
public class ResourceTypeController {
	@Autowired
	private ResourceTypeService rts;
	private BaseController bc;
	@RequestMapping("/select")
	private void select(HttpServletResponse response){
		List<Map<String,Object>> list=rts.queryTypeId("avi");
		String aa="";
		Object obj=list.get(0).get("RESOURCE_TYPE_ID");
		int flag= Integer.parseInt(obj.toString());
		bc.writeJson(response, list);
		
	}
}
