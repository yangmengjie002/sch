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
	
	@RequestMapping("/myUploadQuery")
	@ResponseBody
	public List<HashMap<String,Object>> myUploadQuery(Integer a){
		List<HashMap<String,Object>> upload = new ArrayList<HashMap<String,Object>>();
		upload = myCenterService.MyUploadQuery(5);
		return upload;
	}
}









